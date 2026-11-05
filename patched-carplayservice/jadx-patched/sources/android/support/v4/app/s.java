package android.support.v4.app;

import android.content.Context;
import android.content.res.Configuration;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;

/* JADX INFO: loaded from: classes.dex */
public final class s {
    private final t hQ;

    private s(t tVar) {
        this.hQ = tVar;
    }

    public static s a(t tVar) {
        return new s(tVar);
    }

    public final void a(Parcelable parcelable, ak akVar) {
        this.hQ.hP.a(parcelable, akVar);
    }

    public final u bt() {
        return this.hQ.hP;
    }

    public final void bu() {
        this.hQ.hP.a(this.hQ, this.hQ, (Fragment) null);
    }

    public final ak bv() {
        return this.hQ.hP.bE();
    }

    public final void bw() {
        this.hQ.hP.bw();
    }

    public final void dispatchActivityCreated() {
        this.hQ.hP.dispatchActivityCreated();
    }

    public final void dispatchConfigurationChanged(Configuration configuration) {
        this.hQ.hP.dispatchConfigurationChanged(configuration);
    }

    public final boolean dispatchContextItemSelected(MenuItem menuItem) {
        return this.hQ.hP.dispatchContextItemSelected(menuItem);
    }

    public final void dispatchCreate() {
        this.hQ.hP.dispatchCreate();
    }

    public final boolean dispatchCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        return this.hQ.hP.dispatchCreateOptionsMenu(menu, menuInflater);
    }

    public final void dispatchDestroy() {
        this.hQ.hP.dispatchDestroy();
    }

    public final void dispatchLowMemory() {
        this.hQ.hP.dispatchLowMemory();
    }

    public final void dispatchMultiWindowModeChanged(boolean z) {
        this.hQ.hP.dispatchMultiWindowModeChanged(z);
    }

    public final boolean dispatchOptionsItemSelected(MenuItem menuItem) {
        return this.hQ.hP.dispatchOptionsItemSelected(menuItem);
    }

    public final void dispatchOptionsMenuClosed(Menu menu) {
        this.hQ.hP.dispatchOptionsMenuClosed(menu);
    }

    public final void dispatchPause() {
        this.hQ.hP.dispatchPause();
    }

    public final void dispatchPictureInPictureModeChanged(boolean z) {
        this.hQ.hP.dispatchPictureInPictureModeChanged(z);
    }

    public final boolean dispatchPrepareOptionsMenu(Menu menu) {
        return this.hQ.hP.dispatchPrepareOptionsMenu(menu);
    }

    public final void dispatchResume() {
        this.hQ.hP.dispatchResume();
    }

    public final void dispatchStart() {
        this.hQ.hP.dispatchStart();
    }

    public final void dispatchStop() {
        this.hQ.hP.dispatchStop();
    }

    public final boolean execPendingActions() {
        return this.hQ.hP.execPendingActions();
    }

    public final void noteStateNotSaved() {
        this.hQ.hP.noteStateNotSaved();
    }

    public final View onCreateView(View view, String str, Context context, AttributeSet attributeSet) {
        return this.hQ.hP.onCreateView(view, str, context, attributeSet);
    }

    public final Fragment r(String str) {
        return this.hQ.hP.r(str);
    }

    public final Parcelable saveAllState() {
        return this.hQ.hP.saveAllState();
    }
}
