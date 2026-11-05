package android.support.v4.app;

import android.arch.lifecycle.Lifecycle;
import android.content.Context;
import android.content.Intent;
import android.content.IntentSender;
import android.content.res.Configuration;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import java.io.FileDescriptor;
import java.io.PrintWriter;

/* JADX INFO: loaded from: classes.dex */
public final class n extends bm implements android.arch.lifecycle.y {
    private android.arch.lifecycle.x am;
    boolean ir;
    boolean is;
    int it;
    android.support.v4.c.t iu;
    boolean mCreated;
    boolean mResumed;
    boolean mRetaining;
    final Handler mHandler = new o(this);
    final s ip = s.a(new p(this));
    boolean mStopped = true;
    boolean iq = true;

    private View a(View view, String str, Context context, AttributeSet attributeSet) {
        return this.ip.onCreateView(view, str, context, attributeSet);
    }

    private static boolean a(u uVar, Lifecycle.State state) {
        boolean zA = false;
        for (Fragment fragment : uVar.getFragments()) {
            if (fragment != null) {
                if (fragment.g().f().a(Lifecycle.State.STARTED)) {
                    fragment.hX.b(state);
                    zA = true;
                }
                v vVar = fragment.hR;
                if (vVar != null) {
                    zA |= a(vVar, state);
                }
            }
        }
        return zA;
    }

    private void bq() {
        while (a(this.ip.bt(), Lifecycle.State.CREATED)) {
        }
    }

    private static void r(int i) {
        if ((i & (-65536)) != 0) {
            throw new IllegalArgumentException("Can only use lower 16 bits for requestCode");
        }
    }

    @Override // android.app.Activity
    public final void dump(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        super.dump(str, fileDescriptor, printWriter, strArr);
        printWriter.print(str);
        printWriter.print("Local FragmentActivity ");
        printWriter.print(Integer.toHexString(System.identityHashCode(this)));
        printWriter.println(" State:");
        String str2 = str + "  ";
        printWriter.print(str2);
        printWriter.print("mCreated=");
        printWriter.print(this.mCreated);
        printWriter.print(" mResumed=");
        printWriter.print(this.mResumed);
        printWriter.print(" mStopped=");
        printWriter.print(this.mStopped);
        printWriter.print(" mReallyStopped=");
        printWriter.println(this.iq);
        bf.c(this).a(str2, printWriter);
        this.ip.bt().dump(str, fileDescriptor, printWriter, strArr);
    }

    final void e(boolean z) {
        if (this.iq) {
            return;
        }
        this.iq = true;
        this.mRetaining = z;
        this.mHandler.removeMessages(1);
        this.ip.bw();
    }

    @Override // android.support.v4.app.bm, android.arch.lifecycle.g
    public final Lifecycle g() {
        return super.g();
    }

    @Override // android.app.Activity
    protected final void onActivityResult(int i, int i2, Intent intent) {
        this.ip.noteStateNotSaved();
        int i3 = i >> 16;
        if (i3 == 0) {
            b bVarAR = a.aR();
            if (bVarAR == null || !bVarAR.aS()) {
                super.onActivityResult(i, i2, intent);
                return;
            }
            return;
        }
        int i4 = i3 - 1;
        String str = (String) this.iu.get(i4);
        this.iu.remove(i4);
        if (str == null) {
            Log.w("FragmentActivity", "Activity result delivered for unknown Fragment.");
        } else {
            if (this.ip.r(str) != null) {
                Fragment.aV();
                return;
            }
            Log.w("FragmentActivity", "Activity result no fragment exists for who: " + str);
        }
    }

    @Override // android.app.Activity
    public final void onBackPressed() {
        u uVarBt = this.ip.bt();
        boolean zIsStateSaved = uVarBt.isStateSaved();
        if (!zIsStateSaved || Build.VERSION.SDK_INT > 25) {
            if (zIsStateSaved || !uVarBt.popBackStackImmediate()) {
                super.onBackPressed();
            }
        }
    }

    @Override // android.app.Activity, android.content.ComponentCallbacks
    public final void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        this.ip.noteStateNotSaved();
        this.ip.dispatchConfigurationChanged(configuration);
    }

    @Override // android.support.v4.app.bm, android.app.Activity
    protected final void onCreate(Bundle bundle) {
        this.ip.bu();
        super.onCreate(bundle);
        q qVar = (q) getLastNonConfigurationInstance();
        if (qVar != null) {
            this.am = qVar.ix;
        }
        if (bundle != null) {
            this.ip.a(bundle.getParcelable("android:support:fragments"), qVar != null ? qVar.iy : null);
            if (bundle.containsKey("android:support:next_request_index")) {
                this.it = bundle.getInt("android:support:next_request_index");
                int[] intArray = bundle.getIntArray("android:support:request_indicies");
                String[] stringArray = bundle.getStringArray("android:support:request_fragment_who");
                if (intArray == null || stringArray == null || intArray.length != stringArray.length) {
                    Log.w("FragmentActivity", "Invalid requestCode mapping in savedInstanceState.");
                } else {
                    this.iu = new android.support.v4.c.t(intArray.length);
                    for (int i = 0; i < intArray.length; i++) {
                        this.iu.put(intArray[i], stringArray[i]);
                    }
                }
            }
        }
        if (this.iu == null) {
            this.iu = new android.support.v4.c.t();
            this.it = 0;
        }
        this.ip.dispatchCreate();
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public final boolean onCreatePanelMenu(int i, Menu menu) {
        return i == 0 ? super.onCreatePanelMenu(i, menu) | this.ip.dispatchCreateOptionsMenu(menu, getMenuInflater()) : super.onCreatePanelMenu(i, menu);
    }

    @Override // android.app.Activity, android.view.LayoutInflater.Factory2
    public final View onCreateView(View view, String str, Context context, AttributeSet attributeSet) {
        View viewA = a(view, str, context, attributeSet);
        return viewA == null ? super.onCreateView(view, str, context, attributeSet) : viewA;
    }

    @Override // android.app.Activity, android.view.LayoutInflater.Factory
    public final View onCreateView(String str, Context context, AttributeSet attributeSet) {
        View viewA = a(null, str, context, attributeSet);
        return viewA == null ? super.onCreateView(str, context, attributeSet) : viewA;
    }

    @Override // android.app.Activity
    protected final void onDestroy() {
        super.onDestroy();
        e(false);
        if (this.am != null && !this.mRetaining) {
            this.am.clear();
        }
        this.ip.dispatchDestroy();
    }

    @Override // android.app.Activity, android.content.ComponentCallbacks
    public final void onLowMemory() {
        super.onLowMemory();
        this.ip.dispatchLowMemory();
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public final boolean onMenuItemSelected(int i, MenuItem menuItem) {
        if (super.onMenuItemSelected(i, menuItem)) {
            return true;
        }
        if (i == 0) {
            return this.ip.dispatchOptionsItemSelected(menuItem);
        }
        if (i != 6) {
            return false;
        }
        return this.ip.dispatchContextItemSelected(menuItem);
    }

    @Override // android.app.Activity
    public final void onMultiWindowModeChanged(boolean z) {
        this.ip.dispatchMultiWindowModeChanged(z);
    }

    @Override // android.app.Activity
    protected final void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        this.ip.noteStateNotSaved();
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public final void onPanelClosed(int i, Menu menu) {
        if (i == 0) {
            this.ip.dispatchOptionsMenuClosed(menu);
        }
        super.onPanelClosed(i, menu);
    }

    @Override // android.app.Activity
    protected final void onPause() {
        super.onPause();
        this.mResumed = false;
        if (this.mHandler.hasMessages(2)) {
            this.mHandler.removeMessages(2);
            this.ip.dispatchResume();
        }
        this.ip.dispatchPause();
    }

    @Override // android.app.Activity
    public final void onPictureInPictureModeChanged(boolean z) {
        this.ip.dispatchPictureInPictureModeChanged(z);
    }

    @Override // android.app.Activity
    protected final void onPostResume() {
        super.onPostResume();
        this.mHandler.removeMessages(2);
        this.ip.dispatchResume();
        this.ip.execPendingActions();
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public final boolean onPreparePanel(int i, View view, Menu menu) {
        return (i != 0 || menu == null) ? super.onPreparePanel(i, view, menu) : super.onPreparePanel(0, view, menu) | this.ip.dispatchPrepareOptionsMenu(menu);
    }

    @Override // android.app.Activity
    public final void onRequestPermissionsResult(int i, String[] strArr, int[] iArr) {
        String str;
        String str2;
        this.ip.noteStateNotSaved();
        int i2 = (i >> 16) & 65535;
        if (i2 != 0) {
            int i3 = i2 - 1;
            String str3 = (String) this.iu.get(i3);
            this.iu.remove(i3);
            if (str3 == null) {
                str = "FragmentActivity";
                str2 = "Activity result delivered for unknown Fragment.";
            } else {
                if (this.ip.r(str3) != null) {
                    Fragment.aW();
                    return;
                }
                str = "FragmentActivity";
                str2 = "Activity result no fragment exists for who: " + str3;
            }
            Log.w(str, str2);
        }
    }

    @Override // android.app.Activity
    protected final void onResume() {
        super.onResume();
        this.mHandler.sendEmptyMessage(2);
        this.mResumed = true;
        this.ip.execPendingActions();
    }

    @Override // android.app.Activity
    public final Object onRetainNonConfigurationInstance() {
        if (this.mStopped) {
            e(true);
        }
        ak akVarBv = this.ip.bv();
        if (akVarBv == null && this.am == null) {
            return null;
        }
        q qVar = new q();
        qVar.iw = null;
        qVar.ix = this.am;
        qVar.iy = akVarBv;
        return qVar;
    }

    @Override // android.support.v4.app.bm, android.app.Activity
    protected final void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bq();
        Parcelable parcelableSaveAllState = this.ip.saveAllState();
        if (parcelableSaveAllState != null) {
            bundle.putParcelable("android:support:fragments", parcelableSaveAllState);
        }
        if (this.iu.size() > 0) {
            bundle.putInt("android:support:next_request_index", this.it);
            int[] iArr = new int[this.iu.size()];
            String[] strArr = new String[this.iu.size()];
            for (int i = 0; i < this.iu.size(); i++) {
                iArr[i] = this.iu.keyAt(i);
                strArr[i] = (String) this.iu.valueAt(i);
            }
            bundle.putIntArray("android:support:request_indicies", iArr);
            bundle.putStringArray("android:support:request_fragment_who", strArr);
        }
    }

    @Override // android.app.Activity
    protected final void onStart() {
        super.onStart();
        this.mStopped = false;
        this.iq = false;
        this.mHandler.removeMessages(1);
        if (!this.mCreated) {
            this.mCreated = true;
            this.ip.dispatchActivityCreated();
        }
        this.ip.noteStateNotSaved();
        this.ip.execPendingActions();
        this.ip.dispatchStart();
    }

    @Override // android.app.Activity
    public final void onStateNotSaved() {
        this.ip.noteStateNotSaved();
    }

    @Override // android.app.Activity
    protected final void onStop() {
        super.onStop();
        this.mStopped = true;
        bq();
        this.mHandler.sendEmptyMessage(1);
        this.ip.dispatchStop();
    }

    @Override // android.arch.lifecycle.y
    public final android.arch.lifecycle.x r() {
        if (getApplication() == null) {
            throw new IllegalStateException("Your activity is not yet attached to the Application instance. You can't request ViewModel before onCreate call.");
        }
        if (this.am == null) {
            this.am = new android.arch.lifecycle.x();
        }
        return this.am;
    }

    @Override // android.app.Activity
    public final void startActivityForResult(Intent intent, int i) {
        if (!this.is && i != -1) {
            r(i);
        }
        super.startActivityForResult(intent, i);
    }

    @Override // android.app.Activity
    public final void startActivityForResult(Intent intent, int i, Bundle bundle) {
        if (!this.is && i != -1) {
            r(i);
        }
        super.startActivityForResult(intent, i, bundle);
    }

    @Override // android.app.Activity
    public final void startIntentSenderForResult(IntentSender intentSender, int i, Intent intent, int i2, int i3, int i4) {
        if (!this.ir && i != -1) {
            r(i);
        }
        super.startIntentSenderForResult(intentSender, i, intent, i2, i3, i4);
    }

    @Override // android.app.Activity
    public final void startIntentSenderForResult(IntentSender intentSender, int i, Intent intent, int i2, int i3, int i4, Bundle bundle) {
        if (!this.ir && i != -1) {
            r(i);
        }
        super.startIntentSenderForResult(intentSender, i, intent, i2, i3, i4, bundle);
    }
}
