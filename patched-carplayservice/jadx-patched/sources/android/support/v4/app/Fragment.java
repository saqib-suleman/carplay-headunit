package android.support.v4.app;

import android.animation.Animator;
import android.arch.lifecycle.Lifecycle;
import android.content.ComponentCallbacks;
import android.content.Context;
import android.content.res.Configuration;
import android.os.Bundle;
import android.os.Looper;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.SparseArray;
import android.view.ContextMenu;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import java.lang.reflect.InvocationTargetException;

/* JADX INFO: loaded from: classes.dex */
public class Fragment implements android.arch.lifecycle.g, android.arch.lifecycle.y, ComponentCallbacks, View.OnCreateContextMenuListener {
    private static final android.support.v4.c.s hL = new android.support.v4.c.s();
    static final Object hM = new Object();
    android.arch.lifecycle.x am;
    Boolean hN;
    Fragment hO;
    v hP;
    t hQ;
    v hR;
    ak hS;
    Fragment hT;
    View hU;
    k hV;
    float hW;
    private android.arch.lifecycle.h hY;
    android.arch.lifecycle.g hZ;
    boolean mAdded;
    Bundle mArguments;
    int mBackStackNesting;
    boolean mCalled;
    ViewGroup mContainer;
    int mContainerId;
    boolean mDeferStart;
    boolean mDetached;
    int mFragmentId;
    boolean mFromLayout;
    boolean mHasMenu;
    boolean mHidden;
    boolean mHiddenChanged;
    boolean mInLayout;
    boolean mIsCreated;
    boolean mIsNewlyAdded;
    LayoutInflater mLayoutInflater;
    boolean mPerformedCreateView;
    boolean mRemoving;
    boolean mRestored;
    boolean mRetainInstance;
    boolean mRetaining;
    Bundle mSavedFragmentState;
    SparseArray mSavedViewState;
    String mTag;
    int mTargetRequestCode;
    View mView;
    String mWho;
    int mState = 0;
    int mIndex = -1;
    int mTargetIndex = -1;
    boolean mMenuVisible = true;
    boolean mUserVisibleHint = true;
    android.arch.lifecycle.h hX = new android.arch.lifecycle.h(this);
    android.arch.lifecycle.p ia = new android.arch.lifecycle.p();

    public class InstantiationException extends RuntimeException {
        public InstantiationException(String str, Exception exc) {
            super(str, exc);
        }
    }

    public class SavedState implements Parcelable {
        public static final Parcelable.Creator CREATOR = new m();
        final Bundle mState;

        SavedState(Parcel parcel) {
            this.mState = parcel.readBundle();
        }

        @Override // android.os.Parcelable
        public int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public void writeToParcel(Parcel parcel, int i) {
            parcel.writeBundle(this.mState);
        }
    }

    public static Fragment a(Context context, String str, Bundle bundle) {
        try {
            Class<?> clsLoadClass = (Class) hL.get(str);
            if (clsLoadClass == null) {
                clsLoadClass = context.getClassLoader().loadClass(str);
                hL.put(str, clsLoadClass);
            }
            boolean zIsStateSaved = false;
            Fragment fragment = (Fragment) clsLoadClass.getConstructor(new Class[0]).newInstance(new Object[0]);
            if (bundle != null) {
                bundle.setClassLoader(fragment.getClass().getClassLoader());
                if (fragment.mIndex >= 0) {
                    if (fragment.hP != null) {
                        zIsStateSaved = fragment.hP.isStateSaved();
                    }
                    if (zIsStateSaved) {
                        throw new IllegalStateException("Fragment already active and state has been saved");
                    }
                }
                fragment.mArguments = bundle;
            }
            return fragment;
        } catch (ClassNotFoundException e) {
            throw new InstantiationException("Unable to instantiate fragment " + str + ": make sure class name exists, is public, and has an empty constructor that is public", e);
        } catch (IllegalAccessException e2) {
            throw new InstantiationException("Unable to instantiate fragment " + str + ": make sure class name exists, is public, and has an empty constructor that is public", e2);
        } catch (java.lang.InstantiationException e3) {
            throw new InstantiationException("Unable to instantiate fragment " + str + ": make sure class name exists, is public, and has an empty constructor that is public", e3);
        } catch (NoSuchMethodException e4) {
            throw new InstantiationException("Unable to instantiate fragment " + str + ": could not find Fragment constructor", e4);
        } catch (InvocationTargetException e5) {
            throw new InstantiationException("Unable to instantiate fragment " + str + ": calling Fragment constructor caused an exception", e5);
        }
    }

    static boolean a(Context context, String str) {
        try {
            Class<?> clsLoadClass = (Class) hL.get(str);
            if (clsLoadClass == null) {
                clsLoadClass = context.getClassLoader().loadClass(str);
                hL.put(str, clsLoadClass);
            }
            return Fragment.class.isAssignableFrom(clsLoadClass);
        } catch (ClassNotFoundException e) {
            return false;
        }
    }

    public static void aU() {
    }

    public static void aV() {
    }

    public static void aW() {
    }

    public static void aZ() {
    }

    public static Animation ba() {
        return null;
    }

    public static Animator bb() {
        return null;
    }

    public static void bc() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void bj() {
        l lVar;
        if (this.hV == null) {
            lVar = null;
        } else {
            this.hV.mEnterTransitionPostponed = false;
            lVar = this.hV.io;
            this.hV.io = null;
        }
        if (lVar != null) {
            lVar.onStartEnterTransition();
        }
    }

    private k bm() {
        if (this.hV == null) {
            this.hV = new k();
        }
        return this.hV;
    }

    private void instantiateChildFragmentManager() {
        if (this.hQ == null) {
            throw new IllegalStateException("Fragment has not been attached yet.");
        }
        this.hR = new v();
        this.hR.a(this.hQ, new i(this), this);
    }

    public static void onDestroyOptionsMenu() {
    }

    final void a(int i, Fragment fragment) {
        StringBuilder sb;
        this.mIndex = i;
        if (fragment != null) {
            sb = new StringBuilder();
            sb.append(fragment.mWho);
            sb.append(":");
        } else {
            sb = new StringBuilder("android:fragment:");
        }
        sb.append(this.mIndex);
        this.mWho = sb.toString();
    }

    final void a(Animator animator) {
        bm().mAnimator = animator;
    }

    final void a(Bundle bundle) {
        Parcelable parcelable;
        if (bundle == null || (parcelable = bundle.getParcelable("android:support:fragments")) == null) {
            return;
        }
        if (this.hR == null) {
            instantiateChildFragmentManager();
        }
        this.hR.a(parcelable, this.hS);
        this.hS = null;
        this.hR.dispatchCreate();
    }

    final void aT() {
        if (this.mSavedViewState != null) {
            this.hU.restoreHierarchyState(this.mSavedViewState);
            this.mSavedViewState = null;
        }
        this.mCalled = false;
        this.mCalled = true;
        if (this.mView != null) {
            this.hY.a(Lifecycle.Event.ON_CREATE);
        }
        if (this.mCalled) {
            return;
        }
        throw new SuperNotCalledException("Fragment " + this + " did not call through to super.onViewStateRestored()");
    }

    final LayoutInflater aX() {
        if (this.hQ == null) {
            throw new IllegalStateException("onGetLayoutInflater() cannot be executed until the Fragment is attached to the FragmentManager.");
        }
        LayoutInflater layoutInflaterOnGetLayoutInflater = this.hQ.onGetLayoutInflater();
        if (this.hR == null) {
            instantiateChildFragmentManager();
            if (this.mState >= 5) {
                this.hR.dispatchResume();
            } else if (this.mState >= 4) {
                this.hR.dispatchStart();
            } else if (this.mState >= 2) {
                this.hR.dispatchActivityCreated();
            } else if (this.mState > 0) {
                this.hR.dispatchCreate();
            }
        }
        android.support.v4.view.e.b(layoutInflaterOnGetLayoutInflater, this.hR);
        this.mLayoutInflater = layoutInflaterOnGetLayoutInflater;
        return this.mLayoutInflater;
    }

    public final void aY() {
        this.mCalled = true;
        if ((this.hQ == null ? null : this.hQ.getActivity()) != null) {
            this.mCalled = false;
            this.mCalled = true;
        }
    }

    final void b(l lVar) {
        bm();
        if (lVar == this.hV.io) {
            return;
        }
        if (lVar != null && this.hV.io != null) {
            throw new IllegalStateException("Trying to set a replacement startPostponedEnterTransition on " + this);
        }
        if (this.hV.mEnterTransitionPostponed) {
            this.hV.io = lVar;
        }
        if (lVar != null) {
            lVar.startListening();
        }
    }

    final void b(View view) {
        bm().ic = view;
    }

    public final Object bd() {
        if (this.hV == null) {
            return null;
        }
        return this.hV.ie;
    }

    public final Object be() {
        if (this.hV == null) {
            return null;
        }
        return this.hV.f1if == hM ? bd() : this.hV.f1if;
    }

    public final Object bf() {
        if (this.hV == null) {
            return null;
        }
        return this.hV.ig;
    }

    public final Object bg() {
        if (this.hV == null) {
            return null;
        }
        return this.hV.ih == hM ? bf() : this.hV.ih;
    }

    public final Object bh() {
        if (this.hV == null) {
            return null;
        }
        return this.hV.ii;
    }

    public final Object bi() {
        if (this.hV == null) {
            return null;
        }
        return this.hV.ij == hM ? bh() : this.hV.ij;
    }

    final void bk() {
        if (this.hR != null) {
            this.hR.noteStateNotSaved();
        }
        this.mPerformedCreateView = true;
        this.hZ = new j(this);
        this.hY = null;
        this.mView = null;
        if (this.mView != null) {
            this.hZ.g();
            this.ia.setValue(this.hZ);
        } else {
            if (this.hY != null) {
                throw new IllegalStateException("Called getViewLifecycleOwner() but onCreateView() returned null");
            }
            this.hZ = null;
        }
    }

    final void bl() {
        if (this.hR != null) {
            this.hR.noteStateNotSaved();
        }
        this.mState = 2;
        this.mCalled = false;
        this.mCalled = true;
        if (this.mCalled) {
            if (this.hR != null) {
                this.hR.dispatchActivityCreated();
            }
        } else {
            throw new SuperNotCalledException("Fragment " + this + " did not call through to super.onActivityCreated()");
        }
    }

    final bl bn() {
        if (this.hV == null) {
            return null;
        }
        return this.hV.im;
    }

    final bl bo() {
        if (this.hV == null) {
            return null;
        }
        return this.hV.in;
    }

    final View bp() {
        if (this.hV == null) {
            return null;
        }
        return this.hV.ic;
    }

    public final boolean equals(Object obj) {
        return super.equals(obj);
    }

    @Override // android.arch.lifecycle.g
    public final Lifecycle g() {
        return this.hX;
    }

    final Animator getAnimator() {
        if (this.hV == null) {
            return null;
        }
        return this.hV.mAnimator;
    }

    public final Context getContext() {
        if (this.hQ == null) {
            return null;
        }
        return this.hQ.getContext();
    }

    final int getNextAnim() {
        if (this.hV == null) {
            return 0;
        }
        return this.hV.mNextAnim;
    }

    final int getNextTransition() {
        if (this.hV == null) {
            return 0;
        }
        return this.hV.mNextTransition;
    }

    final int getNextTransitionStyle() {
        if (this.hV == null) {
            return 0;
        }
        return this.hV.mNextTransitionStyle;
    }

    final int getStateAfterAnimating() {
        if (this.hV == null) {
            return 0;
        }
        return this.hV.mStateAfterAnimating;
    }

    public final int hashCode() {
        return super.hashCode();
    }

    final boolean isHideReplaced() {
        if (this.hV == null) {
            return false;
        }
        return this.hV.mIsHideReplaced;
    }

    final boolean isInBackStack() {
        return this.mBackStackNesting > 0;
    }

    final boolean isPostponed() {
        if (this.hV == null) {
            return false;
        }
        return this.hV.mEnterTransitionPostponed;
    }

    @Override // android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration configuration) {
        this.mCalled = true;
    }

    @Override // android.view.View.OnCreateContextMenuListener
    public void onCreateContextMenu(ContextMenu contextMenu, View view, ContextMenu.ContextMenuInfo contextMenuInfo) {
        (this.hQ == null ? null : (n) this.hQ.getActivity()).onCreateContextMenu(contextMenu, view, contextMenuInfo);
    }

    @Override // android.content.ComponentCallbacks
    public void onLowMemory() {
        this.mCalled = true;
    }

    final void performCreate(Bundle bundle) {
        if (this.hR != null) {
            this.hR.noteStateNotSaved();
        }
        this.mState = 1;
        this.mCalled = false;
        this.mCalled = true;
        a(bundle);
        if (this.hR != null) {
            if (!(this.hR.mCurState > 0)) {
                this.hR.dispatchCreate();
            }
        }
        this.mIsCreated = true;
        if (this.mCalled) {
            this.hX.a(Lifecycle.Event.ON_CREATE);
            return;
        }
        throw new SuperNotCalledException("Fragment " + this + " did not call through to super.onCreate()");
    }

    final void performDestroyView() {
        if (this.hR != null) {
            this.hR.dispatchDestroyView();
        }
        this.mState = 1;
        this.mCalled = false;
        this.mCalled = true;
        if (this.mView != null) {
            this.hY.a(Lifecycle.Event.ON_DESTROY);
        }
        if (this.mCalled) {
            bf.c(this).bI();
            this.mPerformedCreateView = false;
        } else {
            throw new SuperNotCalledException("Fragment " + this + " did not call through to super.onDestroyView()");
        }
    }

    final void performPause() {
        if (this.mView != null) {
            this.hY.a(Lifecycle.Event.ON_PAUSE);
        }
        this.hX.a(Lifecycle.Event.ON_PAUSE);
        if (this.hR != null) {
            this.hR.dispatchPause();
        }
        this.mState = 4;
        this.mCalled = false;
        this.mCalled = true;
        if (this.mCalled) {
            return;
        }
        throw new SuperNotCalledException("Fragment " + this + " did not call through to super.onPause()");
    }

    final void performResume() {
        if (this.hR != null) {
            this.hR.noteStateNotSaved();
            this.hR.execPendingActions();
        }
        this.mState = 5;
        this.mCalled = false;
        this.mCalled = true;
        if (!this.mCalled) {
            throw new SuperNotCalledException("Fragment " + this + " did not call through to super.onResume()");
        }
        if (this.hR != null) {
            this.hR.dispatchResume();
            this.hR.execPendingActions();
        }
        this.hX.a(Lifecycle.Event.ON_RESUME);
        if (this.mView != null) {
            this.hY.a(Lifecycle.Event.ON_RESUME);
        }
    }

    final void performStart() {
        if (this.hR != null) {
            this.hR.noteStateNotSaved();
            this.hR.execPendingActions();
        }
        this.mState = 4;
        this.mCalled = false;
        this.mCalled = true;
        if (!this.mCalled) {
            throw new SuperNotCalledException("Fragment " + this + " did not call through to super.onStart()");
        }
        if (this.hR != null) {
            this.hR.dispatchStart();
        }
        this.hX.a(Lifecycle.Event.ON_START);
        if (this.mView != null) {
            this.hY.a(Lifecycle.Event.ON_START);
        }
    }

    @Override // android.arch.lifecycle.y
    public final android.arch.lifecycle.x r() {
        if (getContext() == null) {
            throw new IllegalStateException("Can't access ViewModels from detached fragment");
        }
        if (this.am == null) {
            this.am = new android.arch.lifecycle.x();
        }
        return this.am;
    }

    final void setHideReplaced(boolean z) {
        bm().mIsHideReplaced = z;
    }

    final void setNextAnim(int i) {
        if (this.hV == null && i == 0) {
            return;
        }
        bm().mNextAnim = i;
    }

    final void setNextTransition(int i, int i2) {
        if (this.hV == null && i == 0 && i2 == 0) {
            return;
        }
        bm();
        this.hV.mNextTransition = i;
        this.hV.mNextTransitionStyle = i2;
    }

    final void setStateAfterAnimating(int i) {
        bm().mStateAfterAnimating = i;
    }

    public final void startPostponedEnterTransition() {
        if (this.hP == null || this.hP.hQ == null) {
            bm().mEnterTransitionPostponed = false;
        } else if (Looper.myLooper() != this.hP.hQ.getHandler().getLooper()) {
            this.hP.hQ.getHandler().postAtFrontOfQueue(new h(this));
        } else {
            bj();
        }
    }

    public String toString() {
        StringBuilder sb = new StringBuilder(128);
        android.support.v4.c.f.buildShortClassTag(this, sb);
        if (this.mIndex >= 0) {
            sb.append(" #");
            sb.append(this.mIndex);
        }
        if (this.mFragmentId != 0) {
            sb.append(" id=0x");
            sb.append(Integer.toHexString(this.mFragmentId));
        }
        if (this.mTag != null) {
            sb.append(" ");
            sb.append(this.mTag);
        }
        sb.append('}');
        return sb.toString();
    }
}
