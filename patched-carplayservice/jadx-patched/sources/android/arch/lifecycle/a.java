package android.arch.lifecycle;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
final class a {
    static a s = new a();
    private final Map t = new HashMap();
    private final Map u = new HashMap();

    a() {
    }

    private b a(Class cls, Method[] methodArr) {
        int i;
        b bVarC;
        Class superclass = cls.getSuperclass();
        HashMap map = new HashMap();
        if (superclass != null && (bVarC = c(superclass)) != null) {
            map.putAll(bVarC.w);
        }
        for (Class<?> cls2 : cls.getInterfaces()) {
            for (Map.Entry entry : c(cls2).w.entrySet()) {
                a(map, (c) entry.getKey(), (Lifecycle.Event) entry.getValue(), cls);
            }
        }
        if (methodArr == null) {
            methodArr = b(cls);
        }
        boolean z = false;
        for (Method method : methodArr) {
            r rVar = (r) method.getAnnotation(r.class);
            if (rVar != null) {
                Class<?>[] parameterTypes = method.getParameterTypes();
                if (parameterTypes.length <= 0) {
                    i = 0;
                } else {
                    if (!parameterTypes[0].isAssignableFrom(g.class)) {
                        throw new IllegalArgumentException("invalid parameter type. Must be one and instanceof LifecycleOwner");
                    }
                    i = 1;
                }
                Lifecycle.Event eventO = rVar.o();
                if (parameterTypes.length > 1) {
                    if (!parameterTypes[1].isAssignableFrom(Lifecycle.Event.class)) {
                        throw new IllegalArgumentException("invalid parameter type. second arg must be an event");
                    }
                    if (eventO != Lifecycle.Event.ON_ANY) {
                        throw new IllegalArgumentException("Second arg is supported only for ON_ANY value");
                    }
                    i = 2;
                }
                if (parameterTypes.length > 2) {
                    throw new IllegalArgumentException("cannot have more than 2 params");
                }
                a(map, new c(i, method), eventO, cls);
                z = true;
            }
        }
        b bVar = new b(map);
        this.t.put(cls, bVar);
        this.u.put(cls, Boolean.valueOf(z));
        return bVar;
    }

    private static void a(Map map, c cVar, Lifecycle.Event event, Class cls) {
        Lifecycle.Event event2 = (Lifecycle.Event) map.get(cVar);
        if (event2 == null || event == event2) {
            if (event2 == null) {
                map.put(cVar, event);
                return;
            }
            return;
        }
        throw new IllegalArgumentException("Method " + cVar.z.getName() + " in " + cls.getName() + " already declared with different @OnLifecycleEvent value: previous value " + event2 + ", new value " + event);
    }

    private static Method[] b(Class cls) {
        try {
            return cls.getDeclaredMethods();
        } catch (NoClassDefFoundError e) {
            throw new IllegalArgumentException("The observer class has some methods that use newer APIs which are not available in the current OS version. Lifecycles cannot access even other methods so you should make sure that your observer classes only access framework classes that are available in your min API level OR use lifecycle:compiler annotation processor.", e);
        }
    }

    final boolean a(Class cls) {
        if (this.u.containsKey(cls)) {
            return ((Boolean) this.u.get(cls)).booleanValue();
        }
        Method[] methodArrB = b(cls);
        for (Method method : methodArrB) {
            if (((r) method.getAnnotation(r.class)) != null) {
                a(cls, methodArrB);
                return true;
            }
        }
        this.u.put(cls, false);
        return false;
    }

    final b c(Class cls) {
        b bVar = (b) this.t.get(cls);
        return bVar != null ? bVar : a(cls, null);
    }
}
