package android.net.apf;

/* JADX INFO: loaded from: classes.dex */
final class e {
    private final byte cc;
    private final byte cd;
    private boolean ce;
    private byte cf;
    private boolean cg;
    private int ch;
    private byte ci;
    private String cj;
    private byte[] ck;
    final /* synthetic */ ApfGenerator cl;
    private String mLabel;
    int offset;

    e(ApfGenerator apfGenerator, ApfGenerator.Opcodes opcodes) {
        this(apfGenerator, opcodes, ApfGenerator.Register.R0);
    }

    e(ApfGenerator apfGenerator, ApfGenerator.Opcodes opcodes, ApfGenerator.Register register) {
        this.cl = apfGenerator;
        this.cc = (byte) opcodes.value;
        this.cd = (byte) register.value;
    }

    private byte H() {
        return this.cf > this.ci ? this.cf : this.ci;
    }

    private int I() throws ApfGenerator.IllegalInstructionException {
        e eVar;
        if (this.cj == "__DROP__") {
            eVar = this.cl.bS;
        } else {
            eVar = this.cj == "__PASS__" ? this.cl.bT : (e) this.cl.bR.get(this.cj);
        }
        if (eVar == null) {
            throw new ApfGenerator.IllegalInstructionException("label not found: " + this.cj);
        }
        int size = eVar.offset - (this.offset + size());
        if (size >= 0) {
            return size;
        }
        throw new ApfGenerator.IllegalInstructionException("backward branches disallowed; label: " + this.cj);
    }

    private int a(int i, byte[] bArr, int i2) {
        int iH = H() - 1;
        while (iH >= 0) {
            bArr[i2] = (byte) ((i >> (iH * 8)) & 255);
            iH--;
            i2++;
        }
        return i2;
    }

    private void a(int i, boolean z) {
        this.ce = true;
        this.ch = i;
        this.cg = z;
        this.cf = b(i, z);
    }

    private static byte b(int i, boolean z) {
        if (i == 0) {
            return (byte) 0;
        }
        if (z && i >= -128 && i <= 127) {
            return (byte) 1;
        }
        if (!z && i >= 0 && i <= 255) {
            return (byte) 1;
        }
        if (!z || i < -32768 || i > 32767) {
            return (z || i < 0 || i > 65535) ? (byte) 4 : (byte) 2;
        }
        return (byte) 2;
    }

    final boolean G() {
        if (this.cj == null) {
            return false;
        }
        int size = size();
        byte b = this.ci;
        this.ci = b(I(), false);
        if (this.ci <= b) {
            return size() < size;
        }
        throw new IllegalStateException("instruction grew");
    }

    final void c(int i) {
        a(i, false);
    }

    final void c(byte[] bArr) {
        if (this.cc != ApfGenerator.Opcodes.JNEBS.value) {
            throw new IllegalStateException("adding compare bytes to non-JNEBS instruction");
        }
        this.ck = bArr;
    }

    final void d(int i) {
        a(i, true);
    }

    final void d(byte[] bArr) {
        if (this.cc == ApfGenerator.Opcodes.LABEL.value) {
            return;
        }
        int i = this.offset;
        int length = i + 1;
        byte bH = H();
        if (bH == 4) {
            bH = 3;
        }
        bArr[i] = (byte) ((bH << 1) | (this.cc << 3) | this.cd);
        if (this.cj != null) {
            length = a(I(), bArr, length);
        }
        if (this.ce) {
            length = a(this.ch, bArr, length);
        }
        if (this.ck != null) {
            System.arraycopy(this.ck, 0, bArr, length, this.ck.length);
            length += this.ck.length;
        }
        if (length - this.offset == size()) {
            return;
        }
        throw new IllegalStateException("wrote " + (length - this.offset) + " but should have written " + size());
    }

    final void f(String str) {
        this.cj = str;
        this.ci = (byte) 4;
    }

    final void setLabel(String str) {
        if (this.cl.bR.containsKey(str)) {
            throw new ApfGenerator.IllegalInstructionException("duplicate label " + str);
        }
        if (this.cc != ApfGenerator.Opcodes.LABEL.value) {
            throw new IllegalStateException("adding label to non-label instruction");
        }
        this.mLabel = str;
        this.cl.bR.put(str, this);
    }

    final int size() {
        if (this.cc == ApfGenerator.Opcodes.LABEL.value) {
            return 0;
        }
        int iH = this.ce ? 1 + H() : 1;
        if (this.cj != null) {
            iH += H();
        }
        return this.ck != null ? iH + this.ck.length : iH;
    }
}
