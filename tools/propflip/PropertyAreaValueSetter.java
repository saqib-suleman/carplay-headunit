import java.io.RandomAccessFile;
import java.nio.ByteOrder;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.charset.StandardCharsets;

/**
 * Changes the value of an already-set system property in place, in a bionic property area file
 * (/dev/__properties__/<context>), until the next reboot. Used to flip read-only flags such as
 * ro.atc.carplay.wireless for testing. Run as root with app_process:
 *
 *   app_process -Djava.class.path=propflip.dex /system/bin PropertyAreaValueSetter <area file> <name> <expected value> <new value>
 *
 * Only same-length values are supported, so the record layout never changes.
 */
public final class PropertyAreaValueSetter {

    // bionic prop_info: uint32 serial; char value[PROP_VALUE_MAX = 92]; char name[]
    private static final int PROP_VALUE_MAX = 92;
    private static final int SERIAL_SIZE = 4;
    private static final int AREA_MAGIC_OFFSET = 8;
    private static final int PROP_AREA_MAGIC = 0x504f5250;

    public static void main(String[] args) throws Exception {
        if (args.length != 4) {
            System.err.println("usage: <area file> <name> <expected value> <new value>");
            System.exit(2);
        }
        String areaPath = args[0];
        byte[] nameBytes = (args[1] + "\0").getBytes(StandardCharsets.UTF_8);
        byte[] expectedValue = args[2].getBytes(StandardCharsets.UTF_8);
        byte[] newValue = args[3].getBytes(StandardCharsets.UTF_8);
        if (expectedValue.length != newValue.length) {
            fail("new value must be the same length as the current value");
        }

        try (RandomAccessFile areaFile = new RandomAccessFile(areaPath, "rw");
             FileChannel channel = areaFile.getChannel()) {
            MappedByteBuffer area = channel.map(FileChannel.MapMode.READ_WRITE, 0, channel.size());
            area.order(ByteOrder.LITTLE_ENDIAN);
            if (area.getInt(AREA_MAGIC_OFFSET) != PROP_AREA_MAGIC) {
                fail("not a property area file (bad magic)");
            }

            int nameOffset = findUniqueNameOffset(area, nameBytes);
            int valueOffset = nameOffset - PROP_VALUE_MAX;
            int serialOffset = valueOffset - SERIAL_SIZE;
            int serial = area.getInt(serialOffset);
            int currentValueLength = serial >>> 24;
            String currentValue = readCString(area, valueOffset, PROP_VALUE_MAX);
            System.out.println("found " + args[1] + " = '" + currentValue + "' (serial length " + currentValueLength + ")");
            if (currentValueLength != expectedValue.length || !currentValue.equals(args[2])) {
                fail("current value does not match the expected value; nothing changed");
            }

            for (int index = 0; index < newValue.length; index++) {
                area.put(valueOffset + index, newValue[index]);
            }
            // Keep the length in the top byte and the counter even (not mid-update).
            int counter = (serial & 0x00ffffff) + 2;
            area.putInt(serialOffset, (newValue.length << 24) | (counter & 0x00ffffff));
            area.force();
            System.out.println("set " + args[1] + " = '" + readCString(area, valueOffset, PROP_VALUE_MAX) + "'");
        }
    }

    private static int findUniqueNameOffset(MappedByteBuffer area, byte[] nameBytes) {
        int foundOffset = -1;
        int lastStart = area.limit() - nameBytes.length;
        for (int offset = PROP_VALUE_MAX + SERIAL_SIZE; offset <= lastStart; offset++) {
            if (!matchesAt(area, offset, nameBytes)) {
                continue;
            }
            if (foundOffset != -1) {
                fail("property name found more than once; refusing to guess");
            }
            foundOffset = offset;
        }
        if (foundOffset == -1) {
            fail("property name not found in this area");
        }
        return foundOffset;
    }

    private static boolean matchesAt(MappedByteBuffer area, int offset, byte[] bytes) {
        for (int index = 0; index < bytes.length; index++) {
            if (area.get(offset + index) != bytes[index]) {
                return false;
            }
        }
        return true;
    }

    private static String readCString(MappedByteBuffer area, int offset, int maxLength) {
        StringBuilder text = new StringBuilder();
        for (int index = 0; index < maxLength; index++) {
            byte value = area.get(offset + index);
            if (value == 0) {
                break;
            }
            text.append((char) value);
        }
        return text.toString();
    }

    private static void fail(String message) {
        System.err.println("error: " + message);
        System.exit(1);
    }
}
