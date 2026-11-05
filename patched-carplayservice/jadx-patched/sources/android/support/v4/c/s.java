package android.support.v4.c;

import java.util.ConcurrentModificationException;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public class s {
    static Object[] mBaseCache;
    static int mBaseCacheSize;
    static Object[] mTwiceBaseCache;
    static int mTwiceBaseCacheSize;
    int[] mHashes = e.mu;
    Object[] mArray = e.mw;
    int mSize = 0;

    private static int a(int[] iArr, int i, int i2) {
        try {
            return e.binarySearch(iArr, i, i2);
        } catch (ArrayIndexOutOfBoundsException e) {
            throw new ConcurrentModificationException();
        }
    }

    private static void a(int[] iArr, Object[] objArr, int i) {
        if (iArr.length == 8) {
            synchronized (a.class) {
                if (mTwiceBaseCacheSize < 10) {
                    objArr[0] = mTwiceBaseCache;
                    objArr[1] = iArr;
                    for (int i2 = (i << 1) - 1; i2 >= 2; i2--) {
                        objArr[i2] = null;
                    }
                    mTwiceBaseCache = objArr;
                    mTwiceBaseCacheSize++;
                }
            }
            return;
        }
        if (iArr.length == 4) {
            synchronized (a.class) {
                if (mBaseCacheSize < 10) {
                    objArr[0] = mBaseCache;
                    objArr[1] = iArr;
                    for (int i3 = (i << 1) - 1; i3 >= 2; i3--) {
                        objArr[i3] = null;
                    }
                    mBaseCache = objArr;
                    mBaseCacheSize++;
                }
            }
        }
    }

    private int indexOf(Object obj, int i) {
        int i2 = this.mSize;
        if (i2 == 0) {
            return -1;
        }
        int iA = a(this.mHashes, i2, i);
        if (iA < 0 || obj.equals(this.mArray[iA << 1])) {
            return iA;
        }
        int i3 = iA + 1;
        while (i3 < i2 && this.mHashes[i3] == i) {
            if (obj.equals(this.mArray[i3 << 1])) {
                return i3;
            }
            i3++;
        }
        for (int i4 = iA - 1; i4 >= 0 && this.mHashes[i4] == i; i4--) {
            if (obj.equals(this.mArray[i4 << 1])) {
                return i4;
            }
        }
        return ~i3;
    }

    private int indexOfNull() {
        int i = this.mSize;
        if (i == 0) {
            return -1;
        }
        int iA = a(this.mHashes, i, 0);
        if (iA < 0 || this.mArray[iA << 1] == null) {
            return iA;
        }
        int i2 = iA + 1;
        while (i2 < i && this.mHashes[i2] == 0) {
            if (this.mArray[i2 << 1] == null) {
                return i2;
            }
            i2++;
        }
        for (int i3 = iA - 1; i3 >= 0 && this.mHashes[i3] == 0; i3--) {
            if (this.mArray[i3 << 1] == null) {
                return i3;
            }
        }
        return ~i2;
    }

    private void y(int i) {
        if (i == 8) {
            synchronized (a.class) {
                if (mTwiceBaseCache != null) {
                    Object[] objArr = mTwiceBaseCache;
                    this.mArray = objArr;
                    mTwiceBaseCache = (Object[]) objArr[0];
                    this.mHashes = (int[]) objArr[1];
                    objArr[1] = null;
                    objArr[0] = null;
                    mTwiceBaseCacheSize--;
                    return;
                }
            }
        } else if (i == 4) {
            synchronized (a.class) {
                if (mBaseCache != null) {
                    Object[] objArr2 = mBaseCache;
                    this.mArray = objArr2;
                    mBaseCache = (Object[]) objArr2[0];
                    this.mHashes = (int[]) objArr2[1];
                    objArr2[1] = null;
                    objArr2[0] = null;
                    mBaseCacheSize--;
                    return;
                }
            }
        }
        this.mHashes = new int[i];
        this.mArray = new Object[i << 1];
    }

    public void clear() {
        if (this.mSize > 0) {
            int[] iArr = this.mHashes;
            Object[] objArr = this.mArray;
            int i = this.mSize;
            this.mHashes = e.mu;
            this.mArray = e.mw;
            this.mSize = 0;
            a(iArr, objArr, i);
        }
        if (this.mSize > 0) {
            throw new ConcurrentModificationException();
        }
    }

    public boolean containsKey(Object obj) {
        return indexOfKey(obj) >= 0;
    }

    public boolean containsValue(Object obj) {
        return indexOfValue(obj) >= 0;
    }

    public final void ensureCapacity(int i) {
        int i2 = this.mSize;
        if (this.mHashes.length < i) {
            int[] iArr = this.mHashes;
            Object[] objArr = this.mArray;
            y(i);
            if (this.mSize > 0) {
                System.arraycopy(iArr, 0, this.mHashes, 0, i2);
                System.arraycopy(objArr, 0, this.mArray, 0, i2 << 1);
            }
            a(iArr, objArr, i2);
        }
        if (this.mSize != i2) {
            throw new ConcurrentModificationException();
        }
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof s) {
            s sVar = (s) obj;
            if (size() != sVar.size()) {
                return false;
            }
            for (int i = 0; i < this.mSize; i++) {
                try {
                    Object objKeyAt = keyAt(i);
                    Object objValueAt = valueAt(i);
                    Object obj2 = sVar.get(objKeyAt);
                    if (objValueAt == null) {
                        if (obj2 != null || !sVar.containsKey(objKeyAt)) {
                            return false;
                        }
                    } else if (!objValueAt.equals(obj2)) {
                        return false;
                    }
                } catch (ClassCastException e) {
                    return false;
                } catch (NullPointerException e2) {
                    return false;
                }
            }
            return true;
        }
        if (obj instanceof Map) {
            Map map = (Map) obj;
            if (size() != map.size()) {
                return false;
            }
            for (int i2 = 0; i2 < this.mSize; i2++) {
                try {
                    Object objKeyAt2 = keyAt(i2);
                    Object objValueAt2 = valueAt(i2);
                    Object obj3 = map.get(objKeyAt2);
                    if (objValueAt2 == null) {
                        if (obj3 != null || !map.containsKey(objKeyAt2)) {
                            return false;
                        }
                    } else if (!objValueAt2.equals(obj3)) {
                        return false;
                    }
                } catch (ClassCastException e3) {
                    return false;
                } catch (NullPointerException e4) {
                }
            }
            return true;
        }
        return false;
    }

    public Object get(Object obj) {
        int iIndexOfKey = indexOfKey(obj);
        if (iIndexOfKey >= 0) {
            return this.mArray[(iIndexOfKey << 1) + 1];
        }
        return null;
    }

    public int hashCode() {
        int[] iArr = this.mHashes;
        Object[] objArr = this.mArray;
        int i = this.mSize;
        int i2 = 1;
        int i3 = 0;
        int iHashCode = 0;
        while (i3 < i) {
            Object obj = objArr[i2];
            iHashCode += (obj == null ? 0 : obj.hashCode()) ^ iArr[i3];
            i3++;
            i2 += 2;
        }
        return iHashCode;
    }

    public final int indexOfKey(Object obj) {
        return obj == null ? indexOfNull() : indexOf(obj, obj.hashCode());
    }

    final int indexOfValue(Object obj) {
        int i = this.mSize * 2;
        Object[] objArr = this.mArray;
        if (obj == null) {
            for (int i2 = 1; i2 < i; i2 += 2) {
                if (objArr[i2] == null) {
                    return i2 >> 1;
                }
            }
            return -1;
        }
        for (int i3 = 1; i3 < i; i3 += 2) {
            if (obj.equals(objArr[i3])) {
                return i3 >> 1;
            }
        }
        return -1;
    }

    public boolean isEmpty() {
        return this.mSize <= 0;
    }

    public final Object keyAt(int i) {
        return this.mArray[i << 1];
    }

    public Object put(Object obj, Object obj2) {
        int i;
        int iIndexOf;
        int i2 = this.mSize;
        if (obj == null) {
            iIndexOf = indexOfNull();
            i = 0;
        } else {
            int iHashCode = obj.hashCode();
            i = iHashCode;
            iIndexOf = indexOf(obj, iHashCode);
        }
        if (iIndexOf >= 0) {
            int i3 = (iIndexOf << 1) + 1;
            Object obj3 = this.mArray[i3];
            this.mArray[i3] = obj2;
            return obj3;
        }
        int i4 = ~iIndexOf;
        if (i2 >= this.mHashes.length) {
            int i5 = 4;
            if (i2 >= 8) {
                i5 = (i2 >> 1) + i2;
            } else if (i2 >= 4) {
                i5 = 8;
            }
            int[] iArr = this.mHashes;
            Object[] objArr = this.mArray;
            y(i5);
            if (i2 != this.mSize) {
                throw new ConcurrentModificationException();
            }
            if (this.mHashes.length > 0) {
                System.arraycopy(iArr, 0, this.mHashes, 0, iArr.length);
                System.arraycopy(objArr, 0, this.mArray, 0, objArr.length);
            }
            a(iArr, objArr, i2);
        }
        if (i4 < i2) {
            int i6 = i4 + 1;
            System.arraycopy(this.mHashes, i4, this.mHashes, i6, i2 - i4);
            System.arraycopy(this.mArray, i4 << 1, this.mArray, i6 << 1, (this.mSize - i4) << 1);
        }
        if (i2 != this.mSize || i4 >= this.mHashes.length) {
            throw new ConcurrentModificationException();
        }
        this.mHashes[i4] = i;
        int i7 = i4 << 1;
        this.mArray[i7] = obj;
        this.mArray[i7 + 1] = obj2;
        this.mSize++;
        return null;
    }

    public Object remove(Object obj) {
        int iIndexOfKey = indexOfKey(obj);
        if (iIndexOfKey >= 0) {
            return removeAt(iIndexOfKey);
        }
        return null;
    }

    public final Object removeAt(int i) {
        int i2 = i << 1;
        Object obj = this.mArray[i2 + 1];
        int i3 = this.mSize;
        int i4 = 0;
        if (i3 <= 1) {
            a(this.mHashes, this.mArray, i3);
            this.mHashes = e.mu;
            this.mArray = e.mw;
        } else {
            int i5 = i3 - 1;
            if (this.mHashes.length <= 8 || this.mSize >= this.mHashes.length / 3) {
                if (i < i5) {
                    int i6 = i + 1;
                    int i7 = i5 - i;
                    System.arraycopy(this.mHashes, i6, this.mHashes, i, i7);
                    System.arraycopy(this.mArray, i6 << 1, this.mArray, i2, i7 << 1);
                }
                int i8 = i5 << 1;
                this.mArray[i8] = null;
                this.mArray[i8 + 1] = null;
            } else {
                int i9 = i3 > 8 ? i3 + (i3 >> 1) : 8;
                int[] iArr = this.mHashes;
                Object[] objArr = this.mArray;
                y(i9);
                if (i3 != this.mSize) {
                    throw new ConcurrentModificationException();
                }
                if (i > 0) {
                    System.arraycopy(iArr, 0, this.mHashes, 0, i);
                    System.arraycopy(objArr, 0, this.mArray, 0, i2);
                }
                if (i < i5) {
                    int i10 = i + 1;
                    int i11 = i5 - i;
                    System.arraycopy(iArr, i10, this.mHashes, i, i11);
                    System.arraycopy(objArr, i10 << 1, this.mArray, i2, i11 << 1);
                }
            }
            i4 = i5;
        }
        if (i3 != this.mSize) {
            throw new ConcurrentModificationException();
        }
        this.mSize = i4;
        return obj;
    }

    public int size() {
        return this.mSize;
    }

    public String toString() {
        if (isEmpty()) {
            return "{}";
        }
        StringBuilder sb = new StringBuilder(this.mSize * 28);
        sb.append('{');
        for (int i = 0; i < this.mSize; i++) {
            if (i > 0) {
                sb.append(", ");
            }
            Object objKeyAt = keyAt(i);
            if (objKeyAt != this) {
                sb.append(objKeyAt);
            } else {
                sb.append("(this Map)");
            }
            sb.append('=');
            Object objValueAt = valueAt(i);
            if (objValueAt != this) {
                sb.append(objValueAt);
            } else {
                sb.append("(this Map)");
            }
        }
        sb.append('}');
        return sb.toString();
    }

    public final Object valueAt(int i) {
        return this.mArray[(i << 1) + 1];
    }
}
