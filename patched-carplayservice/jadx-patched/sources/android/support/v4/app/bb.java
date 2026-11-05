package android.support.v4.app;

import android.graphics.Rect;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public abstract class bb {
    protected static void a(View view, Rect rect) {
        int[] iArr = new int[2];
        view.getLocationOnScreen(iArr);
        rect.set(iArr[0], iArr[1], iArr[0] + view.getWidth(), iArr[1] + view.getHeight());
    }

    protected static void a(List list, View view) {
        int size = list.size();
        if (a(list, view, size)) {
            return;
        }
        list.add(view);
        for (int i = size; i < list.size(); i++) {
            View view2 = (View) list.get(i);
            if (view2 instanceof ViewGroup) {
                ViewGroup viewGroup = (ViewGroup) view2;
                int childCount = viewGroup.getChildCount();
                for (int i2 = 0; i2 < childCount; i2++) {
                    View childAt = viewGroup.getChildAt(i2);
                    if (!a(list, childAt, size)) {
                        list.add(childAt);
                    }
                }
            }
        }
    }

    protected static boolean a(List list) {
        return list == null || list.isEmpty();
    }

    private static boolean a(List list, View view, int i) {
        for (int i2 = 0; i2 < i; i2++) {
            if (list.get(i2) == view) {
                return true;
            }
        }
        return false;
    }

    static ArrayList b(ArrayList arrayList) {
        ArrayList arrayList2 = new ArrayList();
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            View view = (View) arrayList.get(i);
            arrayList2.add(android.support.v4.view.n.h(view));
            android.support.v4.view.n.a(view, (String) null);
        }
        return arrayList2;
    }

    public abstract Object a(Object obj, Object obj2, Object obj3);

    final void a(View view, ArrayList arrayList, ArrayList arrayList2, ArrayList arrayList3, Map map) {
        int size = arrayList2.size();
        ArrayList arrayList4 = new ArrayList();
        for (int i = 0; i < size; i++) {
            View view2 = (View) arrayList.get(i);
            String strH = android.support.v4.view.n.h(view2);
            arrayList4.add(strH);
            if (strH != null) {
                android.support.v4.view.n.a(view2, (String) null);
                String str = (String) map.get(strH);
                for (int i2 = 0; i2 < size; i2++) {
                    if (str.equals(arrayList3.get(i2))) {
                        android.support.v4.view.n.a((View) arrayList2.get(i2), strH);
                        break;
                    }
                }
            }
        }
        bk.a(view, new bc(this, size, arrayList2, arrayList3, arrayList, arrayList4));
    }

    public abstract void a(ViewGroup viewGroup, Object obj);

    public abstract void a(Object obj, Rect rect);

    public abstract void a(Object obj, View view);

    public abstract void a(Object obj, View view, ArrayList arrayList);

    public abstract void a(Object obj, Object obj2, ArrayList arrayList, Object obj3, ArrayList arrayList2, Object obj4, ArrayList arrayList3);

    public abstract void a(Object obj, ArrayList arrayList);

    public abstract void a(Object obj, ArrayList arrayList, ArrayList arrayList2);

    final void a(ArrayList arrayList, View view) {
        boolean zIsTransitionGroup;
        if (view.getVisibility() == 0) {
            if (!(view instanceof ViewGroup)) {
                arrayList.add(view);
                return;
            }
            ViewGroup viewGroup = (ViewGroup) view;
            if (Build.VERSION.SDK_INT >= 21) {
                zIsTransitionGroup = viewGroup.isTransitionGroup();
            } else {
                Boolean bool = (Boolean) viewGroup.getTag(android.support.a.b.gH);
                zIsTransitionGroup = ((bool == null || !bool.booleanValue()) && viewGroup.getBackground() == null && android.support.v4.view.n.h(viewGroup) == null) ? false : true;
            }
            if (zIsTransitionGroup) {
                arrayList.add(viewGroup);
                return;
            }
            int childCount = viewGroup.getChildCount();
            for (int i = 0; i < childCount; i++) {
                a(arrayList, viewGroup.getChildAt(i));
            }
        }
    }

    final void a(Map map, View view) {
        if (view.getVisibility() == 0) {
            String strH = android.support.v4.view.n.h(view);
            if (strH != null) {
                map.put(strH, view);
            }
            if (view instanceof ViewGroup) {
                ViewGroup viewGroup = (ViewGroup) view;
                int childCount = viewGroup.getChildCount();
                for (int i = 0; i < childCount; i++) {
                    a(map, viewGroup.getChildAt(i));
                }
            }
        }
    }

    public abstract Object b(Object obj, Object obj2, Object obj3);

    public abstract void b(Object obj, View view);

    public abstract void b(Object obj, View view, ArrayList arrayList);

    public abstract void b(Object obj, ArrayList arrayList, ArrayList arrayList2);

    public abstract void c(Object obj, View view);

    public abstract boolean e(Object obj);

    public abstract Object f(Object obj);

    public abstract Object g(Object obj);
}
