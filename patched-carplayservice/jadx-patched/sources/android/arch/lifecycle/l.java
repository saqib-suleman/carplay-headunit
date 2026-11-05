package android.arch.lifecycle;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public final class l {
    private static Map S = new HashMap();
    private static Map T = new HashMap();

    private static e a(Constructor constructor, Object obj) {
        try {
            return (e) constructor.newInstance(obj);
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (InstantiationException e2) {
            throw new RuntimeException(e2);
        } catch (InvocationTargetException e3) {
            throw new RuntimeException(e3);
        }
    }

    static GenericLifecycleObserver c(Object obj) {
        if (obj instanceof FullLifecycleObserver) {
            return new FullLifecycleObserverAdapter((FullLifecycleObserver) obj);
        }
        if (obj instanceof GenericLifecycleObserver) {
            return (GenericLifecycleObserver) obj;
        }
        Class<?> cls = obj.getClass();
        if (e(cls) != 2) {
            return new ReflectiveGenericLifecycleObserver(obj);
        }
        List list = (List) T.get(cls);
        if (list.size() == 1) {
            return new SingleGeneratedAdapterObserver(a((Constructor) list.get(0), obj));
        }
        e[] eVarArr = new e[list.size()];
        for (int i = 0; i < list.size(); i++) {
            eVarArr[i] = a((Constructor) list.get(i), obj);
        }
        return new CompositeGeneratedAdaptersObserver(eVarArr);
    }

    /* JADX WARN: Multi-variable type inference failed */
    private static Constructor d(Class cls) {
        try {
            Package r0 = cls.getPackage();
            String canonicalName = cls.getCanonicalName();
            String name = r0 != null ? r0.getName() : "";
            if (!name.isEmpty()) {
                canonicalName = canonicalName.substring(name.length() + 1);
            }
            String str = canonicalName.replace(".", "_") + "_LifecycleAdapter";
            if (!name.isEmpty()) {
                str = name + "." + str;
            }
            Constructor declaredConstructor = Class.forName(str).getDeclaredConstructor(cls);
            if (!declaredConstructor.isAccessible()) {
                declaredConstructor.setAccessible(true);
            }
            return declaredConstructor;
        } catch (ClassNotFoundException e) {
            return null;
        } catch (NoSuchMethodException e2) {
            throw new RuntimeException(e2);
        }
    }

    /* JADX WARN: Code duplicated, block: B:20:0x005b  */
    /* JADX WARN: Code duplicated, block: B:22:0x0063  */
    /* JADX WARN: Code duplicated, block: B:24:0x0069 A[DONT_INVERT] */
    /* JADX WARN: Code duplicated, block: B:25:0x006b  */
    /* JADX WARN: Code duplicated, block: B:29:0x0080 A[EDGE_INSN: B:29:0x0080->B:31:0x0087 BREAK  A[LOOP:0: B:19:0x0059->B:27:0x007b]] */
    /* JADX WARN: Code duplicated, block: B:30:0x0086 A[EDGE_INSN: B:30:0x0086->B:31:0x0087 BREAK  A[LOOP:0: B:19:0x0059->B:27:0x007b]] */
    /* JADX WARN: Code duplicated, block: B:33:0x007e A[SYNTHETIC] */
    /* JADX WARN: Code duplicated, block: B:34:0x0086 A[SYNTHETIC] */
    /* JADX WARN: Code duplicated, block: B:36:0x007b A[SYNTHETIC] */
    private static int e(Class cls) {
        Class<?>[] interfaces;
        int length;
        int i;
        Class<?> cls2;
        if (S.containsKey(cls)) {
            return ((Integer) S.get(cls)).intValue();
        }
        int i2 = 2;
        if (cls.getCanonicalName() != null) {
            Constructor constructorD = d(cls);
            if (constructorD == null) {
                if (!a.s.a(cls)) {
                    Class superclass = cls.getSuperclass();
                    ArrayList arrayList = null;
                    if (!f(superclass)) {
                        interfaces = cls.getInterfaces();
                        length = interfaces.length;
                        i = 0;
                        while (true) {
                            if (i < length) {
                                if (arrayList != null) {
                                    T.put(cls, arrayList);
                                    break;
                                }
                            } else {
                                cls2 = interfaces[i];
                                if (!f(cls2)) {
                                    if (e(cls2) != 1) {
                                        if (arrayList == null) {
                                            arrayList = new ArrayList();
                                        }
                                        arrayList.addAll((Collection) T.get(cls2));
                                    }
                                }
                                i++;
                            }
                            i2 = 1;
                            break;
                        }
                    } else {
                        if (e(superclass) == 1) {
                            i2 = 1;
                            break;
                        }
                        arrayList = new ArrayList((Collection) T.get(superclass));
                        interfaces = cls.getInterfaces();
                        length = interfaces.length;
                        i = 0;
                        while (true) {
                            if (i < length) {
                                if (arrayList != null) {
                                    T.put(cls, arrayList);
                                    break;
                                }
                            } else {
                                cls2 = interfaces[i];
                                if (!f(cls2)) {
                                    if (e(cls2) != 1) {
                                        if (arrayList == null) {
                                            arrayList = new ArrayList();
                                        }
                                        arrayList.addAll((Collection) T.get(cls2));
                                    }
                                }
                                i++;
                            }
                            i2 = 1;
                            break;
                        }
                    }
                } else {
                    i2 = 1;
                    break;
                }
            } else {
                T.put(cls, Collections.singletonList(constructorD));
            }
        } else {
            i2 = 1;
            break;
        }
        S.put(cls, Integer.valueOf(i2));
        return i2;
    }

    private static boolean f(Class cls) {
        return cls != null && f.class.isAssignableFrom(cls);
    }
}
