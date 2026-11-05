package android.support.v4.view;

import android.animation.ValueAnimator;
import android.graphics.Paint;
import android.graphics.Rect;
import android.os.Build;
import android.view.View;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicInteger;

/* JADX INFO: loaded from: classes.dex */
public final class n {
    private static WeakHashMap mU;
    private static ThreadLocal mX;
    private static final AtomicInteger mT = new AtomicInteger(1);
    private static WeakHashMap mV = null;
    private static boolean mW = false;

    public static void a(View view, float f) {
        if (Build.VERSION.SDK_INT >= 21) {
            view.setElevation(f);
        }
    }

    public static void a(View view, int i, int i2, int i3, int i4) {
        if (Build.VERSION.SDK_INT >= 16) {
            view.postInvalidateOnAnimation(i, i2, i3, i4);
        } else {
            view.postInvalidate(i, i2, i3, i4);
        }
    }

    public static void a(View view, Paint paint) {
        if (Build.VERSION.SDK_INT >= 17) {
            view.setLayerPaint(paint);
        } else {
            view.setLayerType(view.getLayerType(), paint);
            view.invalidate();
        }
    }

    public static void a(View view, b bVar) {
        view.setAccessibilityDelegate(bVar == null ? null : bVar.cc());
    }

    public static void a(View view, l lVar) {
        if (Build.VERSION.SDK_INT >= 21) {
            if (lVar == null) {
                view.setOnApplyWindowInsetsListener(null);
            } else {
                view.setOnApplyWindowInsetsListener(new o(lVar));
            }
        }
    }

    public static void a(View view, String str) {
        if (Build.VERSION.SDK_INT >= 21) {
            view.setTransitionName(str);
            return;
        }
        if (mU == null) {
            mU = new WeakHashMap();
        }
        mU.put(view, str);
    }

    public static void b(View view, Runnable runnable) {
        if (Build.VERSION.SDK_INT >= 16) {
            view.postOnAnimation(runnable);
        } else {
            view.postDelayed(runnable, ValueAnimator.getFrameDelay());
        }
    }

    public static void c(View view, int i) {
        if (Build.VERSION.SDK_INT < 19) {
            if (Build.VERSION.SDK_INT < 16) {
                return;
            }
            if (i == 4) {
                i = 2;
            }
        }
        view.setImportantForAccessibility(i);
    }

    private static Rect cg() {
        if (mX == null) {
            mX = new ThreadLocal();
        }
        Rect rect = (Rect) mX.get();
        if (rect == null) {
            rect = new Rect();
            mX.set(rect);
        }
        rect.setEmpty();
        return rect;
    }

    public static void d(View view) {
        if (Build.VERSION.SDK_INT >= 16) {
            view.postInvalidateOnAnimation();
        } else {
            view.postInvalidate();
        }
    }

    public static void d(View view, int i) {
        if (Build.VERSION.SDK_INT >= 23) {
            view.offsetTopAndBottom(i);
            return;
        }
        if (Build.VERSION.SDK_INT < 21) {
            e(view, i);
            return;
        }
        Rect rectCg = cg();
        boolean z = false;
        Object parent = view.getParent();
        if (parent instanceof View) {
            View view2 = (View) parent;
            rectCg.set(view2.getLeft(), view2.getTop(), view2.getRight(), view2.getBottom());
            z = !rectCg.intersects(view.getLeft(), view.getTop(), view.getRight(), view.getBottom());
        }
        e(view, i);
        if (z && rectCg.intersect(view.getLeft(), view.getTop(), view.getRight(), view.getBottom())) {
            ((View) parent).invalidate(rectCg);
        }
    }

    public static int e(View view) {
        if (Build.VERSION.SDK_INT >= 16) {
            return view.getImportantForAccessibility();
        }
        return 0;
    }

    private static void e(View view, int i) {
        view.offsetTopAndBottom(i);
        if (view.getVisibility() == 0) {
            o(view);
            Object parent = view.getParent();
            if (parent instanceof View) {
                o((View) parent);
            }
        }
    }

    public static int f(View view) {
        if (Build.VERSION.SDK_INT >= 17) {
            return view.getLayoutDirection();
        }
        return 0;
    }

    public static void f(View view, int i) {
        if (Build.VERSION.SDK_INT >= 23) {
            view.offsetLeftAndRight(i);
            return;
        }
        if (Build.VERSION.SDK_INT < 21) {
            g(view, i);
            return;
        }
        Rect rectCg = cg();
        boolean z = false;
        Object parent = view.getParent();
        if (parent instanceof View) {
            View view2 = (View) parent;
            rectCg.set(view2.getLeft(), view2.getTop(), view2.getRight(), view2.getBottom());
            z = !rectCg.intersects(view.getLeft(), view.getTop(), view.getRight(), view.getBottom());
        }
        g(view, i);
        if (z && rectCg.intersect(view.getLeft(), view.getTop(), view.getRight(), view.getBottom())) {
            ((View) parent).invalidate(rectCg);
        }
    }

    public static float g(View view) {
        if (Build.VERSION.SDK_INT >= 21) {
            return view.getElevation();
        }
        return 0.0f;
    }

    private static void g(View view, int i) {
        view.offsetLeftAndRight(i);
        if (view.getVisibility() == 0) {
            o(view);
            Object parent = view.getParent();
            if (parent instanceof View) {
                o((View) parent);
            }
        }
    }

    public static String h(View view) {
        if (Build.VERSION.SDK_INT >= 21) {
            return view.getTransitionName();
        }
        if (mU == null) {
            return null;
        }
        return (String) mU.get(view);
    }

    public static void i(View view) {
        if (Build.VERSION.SDK_INT >= 20) {
            view.requestApplyInsets();
        } else if (Build.VERSION.SDK_INT >= 16) {
            view.requestFitSystemWindows();
        }
    }

    public static boolean j(View view) {
        if (Build.VERSION.SDK_INT >= 16) {
            return view.getFitsSystemWindows();
        }
        return false;
    }

    public static boolean k(View view) {
        if (Build.VERSION.SDK_INT >= 16) {
            return view.hasOverlappingRendering();
        }
        return true;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static void l(View view) {
        if (Build.VERSION.SDK_INT >= 21) {
            view.stopNestedScroll();
        } else if (view instanceof f) {
            ((f) view).stopNestedScroll();
        }
    }

    public static boolean m(View view) {
        if (Build.VERSION.SDK_INT >= 19) {
            return view.isLaidOut();
        }
        return view.getWidth() > 0 && view.getHeight() > 0;
    }

    public static float n(View view) {
        if (Build.VERSION.SDK_INT >= 21) {
            return view.getZ();
        }
        return 0.0f;
    }

    private static void o(View view) {
        float translationY = view.getTranslationY();
        view.setTranslationY(1.0f + translationY);
        view.setTranslationY(translationY);
    }

    public static boolean p(View view) {
        if (Build.VERSION.SDK_INT >= 19) {
            return view.isAttachedToWindow();
        }
        return view.getWindowToken() != null;
    }
}
