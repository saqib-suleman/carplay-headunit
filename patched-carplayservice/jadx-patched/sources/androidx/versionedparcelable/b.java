package androidx.versionedparcelable;

import java.lang.reflect.InvocationTargetException;

/* JADX INFO: loaded from: classes.dex */
public abstract class b {
    private static d a(String str, b bVar) {
        try {
            return (d) Class.forName(str, true, b.class.getClassLoader()).getDeclaredMethod("read", b.class).invoke(null, bVar);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("VersionedParcel encountered ClassNotFoundException", e);
        } catch (IllegalAccessException e2) {
            throw new RuntimeException("VersionedParcel encountered IllegalAccessException", e2);
        } catch (NoSuchMethodException e3) {
            throw new RuntimeException("VersionedParcel encountered NoSuchMethodException", e3);
        } catch (InvocationTargetException e4) {
            if (e4.getCause() instanceof RuntimeException) {
                throw ((RuntimeException) e4.getCause());
            }
            throw new RuntimeException("VersionedParcel encountered InvocationTargetException", e4);
        }
    }

    private static Class h(Class cls) {
        return Class.forName(String.format("%s.%sParcelizer", cls.getPackage().getName(), cls.getSimpleName()), false, cls.getClassLoader());
    }

    protected final void a(d dVar) {
        if (dVar == null) {
            writeString(null);
            return;
        }
        try {
            writeString(h(dVar.getClass()).getName());
            b bVarCN = cN();
            try {
                h(dVar.getClass()).getDeclaredMethod("write", dVar.getClass(), b.class).invoke(null, dVar, bVarCN);
                bVarCN.cM();
            } catch (ClassNotFoundException e) {
                throw new RuntimeException("VersionedParcel encountered ClassNotFoundException", e);
            } catch (IllegalAccessException e2) {
                throw new RuntimeException("VersionedParcel encountered IllegalAccessException", e2);
            } catch (NoSuchMethodException e3) {
                throw new RuntimeException("VersionedParcel encountered NoSuchMethodException", e3);
            } catch (InvocationTargetException e4) {
                if (!(e4.getCause() instanceof RuntimeException)) {
                    throw new RuntimeException("VersionedParcel encountered InvocationTargetException", e4);
                }
                throw ((RuntimeException) e4.getCause());
            }
        } catch (ClassNotFoundException e5) {
            throw new RuntimeException(dVar.getClass().getSimpleName() + " does not have a Parcelizer", e5);
        }
    }

    protected abstract void cM();

    protected abstract b cN();

    protected final d cO() {
        String string = readString();
        if (string == null) {
            return null;
        }
        return a(string, cN());
    }

    protected abstract String readString();

    protected abstract void writeString(String str);
}
