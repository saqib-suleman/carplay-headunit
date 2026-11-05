package android.arch.lifecycle;

import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentManager;
import android.content.ComponentCallbacks2;
import android.os.Bundle;

/* JADX INFO: loaded from: classes.dex */
public final class s extends Fragment {
    private t aj;

    public static void a(Activity activity) {
        FragmentManager fragmentManager = activity.getFragmentManager();
        if (fragmentManager.findFragmentByTag("android.arch.lifecycle.LifecycleDispatcher.report_fragment_tag") == null) {
            fragmentManager.beginTransaction().add(new s(), "android.arch.lifecycle.LifecycleDispatcher.report_fragment_tag").commit();
            fragmentManager.executePendingTransactions();
        }
    }

    private void c(Lifecycle.Event event) {
        ComponentCallbacks2 activity = getActivity();
        if (activity instanceof k) {
            ((k) activity).i().a(event);
        } else if (activity instanceof g) {
            Lifecycle lifecycleG = ((g) activity).g();
            if (lifecycleG instanceof h) {
                ((h) lifecycleG).a(event);
            }
        }
    }

    @Override // android.app.Fragment
    public final void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        c(Lifecycle.Event.ON_CREATE);
    }

    @Override // android.app.Fragment
    public final void onDestroy() {
        super.onDestroy();
        c(Lifecycle.Event.ON_DESTROY);
        this.aj = null;
    }

    @Override // android.app.Fragment
    public final void onPause() {
        super.onPause();
        c(Lifecycle.Event.ON_PAUSE);
    }

    @Override // android.app.Fragment
    public final void onResume() {
        super.onResume();
        c(Lifecycle.Event.ON_RESUME);
    }

    @Override // android.app.Fragment
    public final void onStart() {
        super.onStart();
        c(Lifecycle.Event.ON_START);
    }

    @Override // android.app.Fragment
    public final void onStop() {
        super.onStop();
        c(Lifecycle.Event.ON_STOP);
    }
}
