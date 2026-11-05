package android.support.v4.c;

import java.lang.reflect.Array;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/* JADX INFO: loaded from: classes.dex */
abstract class h {
    j mx;
    k my;
    m mz;

    h() {
    }

    public static boolean equalsSetHelper(Set set, Object obj) {
        if (set == obj) {
            return true;
        }
        if (obj instanceof Set) {
            Set set2 = (Set) obj;
            try {
                return set.size() == set2.size() && set.containsAll(set2);
            } catch (ClassCastException e) {
                return false;
            } catch (NullPointerException e2) {
            }
        }
        return false;
    }

    public static boolean retainAllHelper(Map map, Collection collection) {
        int size = map.size();
        Iterator it = map.keySet().iterator();
        while (it.hasNext()) {
            if (!collection.contains(it.next())) {
                it.remove();
            }
        }
        return size != map.size();
    }

    protected abstract void colClear();

    protected abstract Object colGetEntry(int i, int i2);

    protected abstract Map colGetMap();

    protected abstract int colGetSize();

    protected abstract int colIndexOfKey(Object obj);

    protected abstract int colIndexOfValue(Object obj);

    protected abstract void colPut(Object obj, Object obj2);

    protected abstract void colRemoveAt(int i);

    protected abstract Object colSetValue(int i, Object obj);

    public final Set getKeySet() {
        if (this.my == null) {
            this.my = new k(this);
        }
        return this.my;
    }

    public final Object[] toArrayHelper(int i) {
        int iColGetSize = colGetSize();
        Object[] objArr = new Object[iColGetSize];
        for (int i2 = 0; i2 < iColGetSize; i2++) {
            objArr[i2] = colGetEntry(i2, i);
        }
        return objArr;
    }

    public final Object[] toArrayHelper(Object[] objArr, int i) {
        int iColGetSize = colGetSize();
        if (objArr.length < iColGetSize) {
            objArr = (Object[]) Array.newInstance(objArr.getClass().getComponentType(), iColGetSize);
        }
        for (int i2 = 0; i2 < iColGetSize; i2++) {
            objArr[i2] = colGetEntry(i2, i);
        }
        if (objArr.length > iColGetSize) {
            objArr[iColGetSize] = null;
        }
        return objArr;
    }
}
