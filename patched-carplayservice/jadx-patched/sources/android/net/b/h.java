package android.net.b;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

/* JADX INFO: loaded from: classes.dex */
public final class h {
    public short gb;
    public short gc;
    public byte[] gd;
    private ByteOrder ge;

    public h() {
        this.gb = (short) 4;
        this.ge = ByteOrder.nativeOrder();
    }

    private h(ByteOrder byteOrder) {
        this.gb = (short) 4;
        this.ge = ByteOrder.nativeOrder();
        this.ge = byteOrder;
    }

    public static h h(ByteBuffer byteBuffer) {
        if (byteBuffer == null || byteBuffer.remaining() < 4) {
            return null;
        }
        int iPosition = byteBuffer.position();
        h hVar = new h(byteBuffer.order());
        ByteOrder byteOrderOrder = byteBuffer.order();
        byteBuffer.order(ByteOrder.nativeOrder());
        try {
            hVar.gb = byteBuffer.getShort();
            hVar.gc = byteBuffer.getShort();
            byteBuffer.order(byteOrderOrder);
            byteBuffer.position(iPosition);
            if (hVar.gb < 4) {
                return null;
            }
            return hVar;
        } catch (Throwable th) {
            byteBuffer.order(byteOrderOrder);
            throw th;
        }
    }

    public final int av() {
        return a.h(this.gb & 65535);
    }

    public final ByteBuffer aw() {
        if (this.gd == null) {
            return null;
        }
        ByteBuffer byteBufferWrap = ByteBuffer.wrap(this.gd);
        byteBufferWrap.order(this.ge);
        return byteBufferWrap;
    }

    public final InetAddress ax() {
        if (this.gd == null) {
            return null;
        }
        try {
            return InetAddress.getByAddress(this.gd);
        } catch (UnknownHostException e) {
            return null;
        }
    }

    public final String toString() {
        return "StructNlAttr{ nla_len{" + ((int) this.gb) + "}, nla_type{" + ((int) this.gc) + "}, nla_value{" + a.g(this.gd) + "}, }";
    }
}
