package android.arch.lifecycle;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
final class b {
    final Map v = new HashMap();
    final Map w;

    b(Map map) {
        this.w = map;
        for (Map.Entry entry : map.entrySet()) {
            Lifecycle.Event event = (Lifecycle.Event) entry.getValue();
            List arrayList = (List) this.v.get(event);
            if (arrayList == null) {
                arrayList = new ArrayList();
                this.v.put(event, arrayList);
            }
            arrayList.add(entry.getKey());
        }
    }

    private static void a(List list, g gVar, Lifecycle.Event event, Object obj) {
        Method method;
        Object[] objArr;
        if (list != null) {
            for (int size = list.size() - 1; size >= 0; size--) {
                c cVar = (c) list.get(size);
                try {
                    switch (cVar.mCallType) {
                        case 0:
                            method = cVar.z;
                            objArr = new Object[0];
                            break;
                        case 1:
                            method = cVar.z;
                            objArr = new Object[]{gVar};
                            break;
                        case 2:
                            method = cVar.z;
                            objArr = new Object[]{gVar, event};
                            break;
                        default:
                            continue;
                            break;
                    }
                    method.invoke(obj, objArr);
                } catch (IllegalAccessException e) {
                    throw new RuntimeException(e);
                } catch (InvocationTargetException e2) {
                    throw new RuntimeException("Failed to call observer method", e2.getCause());
                }
            }
        }
    }

    final void a(g gVar, Lifecycle.Event event, Object obj) {
        a((List) this.v.get(event), gVar, event, obj);
        a((List) this.v.get(Lifecycle.Event.ON_ANY), gVar, event, obj);
    }
}
