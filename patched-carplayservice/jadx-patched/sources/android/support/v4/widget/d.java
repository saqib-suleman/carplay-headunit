package android.support.v4.widget;

import android.view.View;

/* JADX INFO: loaded from: classes.dex */
final class d extends l {
    private final int oR;
    private j oS;
    private final Runnable oT;
    final /* synthetic */ DrawerLayout oU;

    @Override // android.support.v4.widget.l
    public final void A(View view) {
        ((DrawerLayout.LayoutParams) view.getLayoutParams()).oK = false;
        View viewH = this.oU.H(this.oR == 3 ? 5 : 3);
        if (viewH != null) {
            this.oU.x(viewH);
        }
    }

    @Override // android.support.v4.widget.l
    public final int B(View view) {
        if (DrawerLayout.v(view)) {
            return view.getWidth();
        }
        return 0;
    }

    @Override // android.support.v4.widget.l
    public final int C(View view) {
        return view.getTop();
    }

    @Override // android.support.v4.widget.l
    public final void I(int i) {
        this.oU.a(i, this.oS.cI());
    }

    @Override // android.support.v4.widget.l
    public final void c(View view, float f) {
        int i;
        float fS = DrawerLayout.s(view);
        int width = view.getWidth();
        if (this.oU.h(view, 3)) {
            i = (f > 0.0f || (f == 0.0f && fS > 0.5f)) ? 0 : -width;
        } else {
            int width2 = this.oU.getWidth();
            if (f < 0.0f || (f == 0.0f && fS > 0.5f)) {
                width2 -= width;
            }
            i = width2;
        }
        this.oS.f(i, view.getTop());
        this.oU.invalidate();
    }

    public final void cx() {
        this.oU.removeCallbacks(this.oT);
    }

    @Override // android.support.v4.widget.l
    public final void cy() {
        this.oU.postDelayed(this.oT, 160L);
    }

    @Override // android.support.v4.widget.l
    public final void e(int i, int i2) {
        DrawerLayout drawerLayout;
        int i3;
        if ((i & 1) == 1) {
            drawerLayout = this.oU;
            i3 = 3;
        } else {
            drawerLayout = this.oU;
            i3 = 5;
        }
        View viewH = drawerLayout.H(i3);
        if (viewH == null || this.oU.r(viewH) != 0) {
            return;
        }
        this.oS.k(viewH, i2);
    }

    @Override // android.support.v4.widget.l
    public final void i(View view, int i) {
        int width = view.getWidth();
        float width2 = (this.oU.h(view, 3) ? i + width : this.oU.getWidth() - i) / width;
        this.oU.b(view, width2);
        view.setVisibility(width2 == 0.0f ? 4 : 0);
        this.oU.invalidate();
    }

    @Override // android.support.v4.widget.l
    public final int j(View view, int i) {
        int width;
        int width2;
        if (this.oU.h(view, 3)) {
            width2 = -view.getWidth();
            width = 0;
        } else {
            width = this.oU.getWidth();
            width2 = width - view.getWidth();
        }
        return Math.max(width2, Math.min(i, width));
    }

    @Override // android.support.v4.widget.l
    public final boolean z(View view) {
        return DrawerLayout.v(view) && this.oU.h(view, this.oR) && this.oU.r(view) == 0;
    }
}
