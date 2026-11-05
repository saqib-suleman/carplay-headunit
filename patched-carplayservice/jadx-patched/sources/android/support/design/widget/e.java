package android.support.design.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;

/* JADX INFO: loaded from: classes.dex */
public final class e extends ViewGroup.MarginLayoutParams {
    public int gravity;
    private boolean hA;
    final Rect hB;
    Object hC;
    c hm;
    boolean hn;
    public int ho;
    public int hp;
    int hq;
    public int hr;
    public int hs;
    int ht;
    int hu;
    View hv;
    View hw;
    private boolean hx;
    private boolean hy;
    private boolean hz;

    public e() {
        super(-2, -2);
        this.hn = false;
        this.gravity = 0;
        this.ho = 0;
        this.hp = -1;
        this.hq = -1;
        this.hr = 0;
        this.hs = 0;
        this.hB = new Rect();
    }

    e(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.hn = false;
        this.gravity = 0;
        this.ho = 0;
        this.hp = -1;
        this.hq = -1;
        this.hr = 0;
        this.hs = 0;
        this.hB = new Rect();
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, android.support.b.b.gJ);
        this.gravity = typedArrayObtainStyledAttributes.getInteger(android.support.b.b.gK, 0);
        this.hq = typedArrayObtainStyledAttributes.getResourceId(android.support.b.b.gL, -1);
        this.ho = typedArrayObtainStyledAttributes.getInteger(android.support.b.b.gM, 0);
        this.hp = typedArrayObtainStyledAttributes.getInteger(android.support.b.b.gQ, -1);
        this.hr = typedArrayObtainStyledAttributes.getInt(android.support.b.b.gP, 0);
        this.hs = typedArrayObtainStyledAttributes.getInt(android.support.b.b.gO, 0);
        this.hn = typedArrayObtainStyledAttributes.hasValue(android.support.b.b.gN);
        if (this.hn) {
            this.hm = CoordinatorLayout.a(context, attributeSet, typedArrayObtainStyledAttributes.getString(android.support.b.b.gN));
        }
        typedArrayObtainStyledAttributes.recycle();
    }

    public e(e eVar) {
        super((ViewGroup.MarginLayoutParams) eVar);
        this.hn = false;
        this.gravity = 0;
        this.ho = 0;
        this.hp = -1;
        this.hq = -1;
        this.hr = 0;
        this.hs = 0;
        this.hB = new Rect();
    }

    public e(ViewGroup.LayoutParams layoutParams) {
        super(layoutParams);
        this.hn = false;
        this.gravity = 0;
        this.ho = 0;
        this.hp = -1;
        this.hq = -1;
        this.hr = 0;
        this.hs = 0;
        this.hB = new Rect();
    }

    public e(ViewGroup.MarginLayoutParams marginLayoutParams) {
        super(marginLayoutParams);
        this.hn = false;
        this.gravity = 0;
        this.ho = 0;
        this.hp = -1;
        this.hq = -1;
        this.hr = 0;
        this.hs = 0;
        this.hB = new Rect();
    }

    public final void a(c cVar) {
        if (this.hm != cVar) {
            this.hm = cVar;
            this.hC = null;
            this.hn = true;
        }
    }

    final boolean aN() {
        if (this.hm == null) {
            this.hx = false;
        }
        return this.hx;
    }

    final boolean aO() {
        if (this.hx) {
            return true;
        }
        boolean z = this.hx | false;
        this.hx = z;
        return z;
    }

    final void aP() {
        this.hx = false;
    }

    final void aQ() {
        this.hA = false;
    }

    final void p(int i) {
        switch (i) {
            case 0:
                this.hy = false;
                break;
            case 1:
                this.hz = false;
                break;
        }
    }

    final boolean q(int i) {
        switch (i) {
            case 0:
                return this.hy;
            case 1:
                return this.hz;
            default:
                return false;
        }
    }
}
