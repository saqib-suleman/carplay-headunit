package android.net.apf;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

/* JADX INFO: loaded from: classes.dex */
public final class ApfGenerator {
    private final ArrayList bQ = new ArrayList();
    private final HashMap bR = new HashMap();
    private final e bS = new e(this, Opcodes.LABEL);
    private final e bT = new e(this, Opcodes.LABEL);
    private boolean bU;
    private final int mVersion;

    enum ExtendedOpcodes {
        LDM(0),
        STM(16),
        NOT(32),
        NEG(33),
        SWAP(34),
        MOVE(35);

        final int value;

        ExtendedOpcodes(int i) {
            this.value = i;
        }
    }

    public class IllegalInstructionException extends Exception {
        IllegalInstructionException(String str) {
            super(str);
        }
    }

    enum Opcodes {
        LABEL(-1),
        LDB(1),
        LDH(2),
        LDW(3),
        LDBX(4),
        LDHX(5),
        LDWX(6),
        ADD(7),
        MUL(8),
        DIV(9),
        AND(10),
        OR(11),
        SH(12),
        LI(13),
        JMP(14),
        JEQ(15),
        JNE(16),
        JGT(17),
        JLT(18),
        JSET(19),
        JNEBS(20),
        EXT(21),
        LDDW(22),
        STDW(23);

        final int value;

        Opcodes(int i) {
            this.value = i;
        }
    }

    public enum Register {
        R0(0),
        R1(1);

        final int value;

        Register(int i) {
            this.value = i;
        }
    }

    ApfGenerator(int i) throws IllegalInstructionException {
        this.mVersion = i;
        b(2);
    }

    private int D() {
        int size = 0;
        for (e eVar : this.bQ) {
            eVar.offset = size;
            size += eVar.size();
        }
        return size;
    }

    private void a(e eVar) {
        if (this.bU) {
            throw new IllegalStateException("Program already generated");
        }
        this.bQ.add(eVar);
    }

    private void b(int i) throws IllegalInstructionException {
        if (this.mVersion >= i) {
            return;
        }
        throw new IllegalInstructionException("Requires APF >= " + i);
    }

    public final ApfGenerator A() {
        e eVar = new e(this, Opcodes.ADD);
        eVar.d(1);
        a(eVar);
        return this;
    }

    public final ApfGenerator B() {
        e eVar = new e(this, Opcodes.AND);
        eVar.c(240);
        a(eVar);
        return this;
    }

    public final ApfGenerator C() {
        a(new e(this, Opcodes.ADD, Register.R1));
        return this;
    }

    public final int E() {
        return D();
    }

    public final byte[] F() {
        int iD;
        if (this.bU) {
            throw new IllegalStateException("Can only generate() once!");
        }
        this.bU = true;
        int i = 10;
        while (true) {
            iD = D();
            this.bS.offset = iD + 1;
            this.bT.offset = iD;
            int i2 = i - 1;
            if (i == 0) {
                break;
            }
            boolean z = false;
            Iterator it = this.bQ.iterator();
            while (it.hasNext()) {
                if (((e) it.next()).G()) {
                    z = true;
                }
            }
            if (!z) {
                break;
            }
            i = i2;
        }
        byte[] bArr = new byte[iD];
        Iterator it2 = this.bQ.iterator();
        while (it2.hasNext()) {
            ((e) it2.next()).d(bArr);
        }
        return bArr;
    }

    public final ApfGenerator a(int i, String str) {
        e eVar = new e(this, Opcodes.JEQ);
        eVar.c(i);
        eVar.f(str);
        a(eVar);
        return this;
    }

    public final ApfGenerator a(Register register) {
        e eVar = new e(this, Opcodes.LDHX, register);
        eVar.c(16);
        a(eVar);
        return this;
    }

    public final ApfGenerator a(Register register, int i) {
        e eVar = new e(this, Opcodes.LDB, register);
        eVar.c(i);
        a(eVar);
        return this;
    }

    public final ApfGenerator a(Register register, byte[] bArr, String str) throws IllegalInstructionException {
        if (register == Register.R1) {
            throw new IllegalInstructionException("JNEBS fails with R1");
        }
        e eVar = new e(this, Opcodes.JNEBS, register);
        eVar.c(bArr.length);
        eVar.f(str);
        eVar.c(bArr);
        a(eVar);
        return this;
    }

    public final ApfGenerator b(int i, String str) {
        e eVar = new e(this, Opcodes.JNE);
        eVar.c(i);
        eVar.f(str);
        a(eVar);
        return this;
    }

    public final ApfGenerator b(Register register) throws IllegalInstructionException {
        b(3);
        e eVar = new e(this, Opcodes.LDDW, register);
        eVar.d(0);
        a(eVar);
        return this;
    }

    public final ApfGenerator b(Register register, int i) {
        e eVar = new e(this, Opcodes.LDH, register);
        eVar.c(i);
        a(eVar);
        return this;
    }

    public final ApfGenerator c(int i, String str) {
        e eVar = new e(this, Opcodes.JGT);
        eVar.c(i);
        eVar.f(str);
        a(eVar);
        return this;
    }

    public final ApfGenerator c(Register register) throws IllegalInstructionException {
        b(3);
        e eVar = new e(this, Opcodes.STDW, register);
        eVar.d(0);
        a(eVar);
        return this;
    }

    public final ApfGenerator c(Register register, int i) {
        e eVar = new e(this, Opcodes.LDW, register);
        eVar.c(i);
        a(eVar);
        return this;
    }

    public final ApfGenerator c(String str) {
        e eVar = new e(this, Opcodes.LABEL);
        eVar.setLabel(str);
        a(eVar);
        return this;
    }

    public final ApfGenerator d(int i, String str) {
        e eVar = new e(this, Opcodes.JLT);
        eVar.c(i);
        eVar.f(str);
        a(eVar);
        return this;
    }

    public final ApfGenerator d(Register register, int i) {
        e eVar = new e(this, Opcodes.LI, register);
        eVar.d(i);
        a(eVar);
        return this;
    }

    public final ApfGenerator d(String str) {
        e eVar = new e(this, Opcodes.JMP);
        eVar.f(str);
        a(eVar);
        return this;
    }

    public final ApfGenerator e(Register register, int i) throws IllegalInstructionException {
        if (i < 0 || i > 15) {
            throw new IllegalInstructionException("illegal memory slot number: " + i);
        }
        e eVar = new e(this, Opcodes.EXT, register);
        eVar.c(ExtendedOpcodes.LDM.value + i);
        a(eVar);
        return this;
    }

    public final ApfGenerator e(String str) {
        e eVar = new e(this, Opcodes.JSET);
        eVar.c(8191);
        eVar.f(str);
        a(eVar);
        return this;
    }
}
