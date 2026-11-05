package android.support.v4.app;

import android.animation.Animator;
import android.animation.AnimatorInflater;
import android.animation.AnimatorSet;
import android.animation.PropertyValuesHolder;
import android.animation.ValueAnimator;
import android.arch.lifecycle.Lifecycle;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.os.Build;
import android.os.Bundle;
import android.os.Looper;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseArray;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.AnimationSet;
import android.view.animation.AnimationUtils;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.view.animation.ScaleAnimation;
import com.autochips.carplay.common.CarplayMessage;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

/* JADX INFO: loaded from: classes.dex */
final class v extends u implements LayoutInflater.Factory2 {
    static boolean DEBUG = false;
    static Field iC = null;
    static final Interpolator iE = new DecelerateInterpolator(2.5f);
    static final Interpolator iF = new DecelerateInterpolator(1.5f);
    static final Interpolator iG = new AccelerateInterpolator(2.5f);
    static final Interpolator iH = new AccelerateInterpolator(1.5f);
    t hQ;
    Fragment iA;
    Fragment iB;
    ak iD;
    r iz;
    SparseArray mActive;
    ArrayList mAvailBackStackIndices;
    ArrayList mBackStack;
    ArrayList mBackStackChangeListeners;
    ArrayList mBackStackIndices;
    ArrayList mCreatedMenus;
    boolean mDestroyed;
    boolean mExecutingActions;
    boolean mHavePendingDeferredStart;
    boolean mNeedMenuInvalidate;
    String mNoTransactionsBecause;
    ArrayList mPendingActions;
    ArrayList mPostponedTransactions;
    boolean mStateSaved;
    boolean mStopped;
    ArrayList mTmpAddedFragments;
    ArrayList mTmpIsPop;
    ArrayList mTmpRecords;
    int mNextFragmentIndex = 0;
    final ArrayList mAdded = new ArrayList();
    private final CopyOnWriteArrayList mLifecycleCallbacks = new CopyOnWriteArrayList();
    int mCurState = 0;
    Bundle mStateBundle = null;
    SparseArray mStateArray = null;
    Runnable mExecCommit = new w(this);

    v() {
    }

    private int a(ArrayList arrayList, ArrayList arrayList2, int i, int i2, android.support.v4.c.c cVar) {
        int i3 = i2;
        for (int i4 = i2 - 1; i4 >= i; i4--) {
            c cVar2 = (c) arrayList.get(i4);
            boolean zBooleanValue = ((Boolean) arrayList2.get(i4)).booleanValue();
            if (cVar2.isPostponed() && !cVar2.interactsWith(arrayList, i4 + 1, i2)) {
                if (this.mPostponedTransactions == null) {
                    this.mPostponedTransactions = new ArrayList();
                }
                aj ajVar = new aj(cVar2, zBooleanValue);
                this.mPostponedTransactions.add(ajVar);
                cVar2.a(ajVar);
                if (zBooleanValue) {
                    cVar2.executeOps();
                } else {
                    cVar2.executePopOps(false);
                }
                i3--;
                if (i4 != i3) {
                    arrayList.remove(i4);
                    arrayList.add(i3, cVar2);
                }
                b(cVar);
            }
        }
        return i3;
    }

    private static ae a(float f, float f2) {
        AlphaAnimation alphaAnimation = new AlphaAnimation(f, f2);
        alphaAnimation.setInterpolator(iF);
        alphaAnimation.setDuration(220L);
        return new ae(alphaAnimation, (byte) 0);
    }

    private static ae a(float f, float f2, float f3, float f4) {
        AnimationSet animationSet = new AnimationSet(false);
        ScaleAnimation scaleAnimation = new ScaleAnimation(f, f2, f, f2, 1, 0.5f, 1, 0.5f);
        scaleAnimation.setInterpolator(iE);
        scaleAnimation.setDuration(220L);
        animationSet.addAnimation(scaleAnimation);
        AlphaAnimation alphaAnimation = new AlphaAnimation(f3, f4);
        alphaAnimation.setInterpolator(iF);
        alphaAnimation.setDuration(220L);
        animationSet.addAnimation(alphaAnimation);
        return new ae(animationSet, (byte) 0);
    }

    private ae a(Fragment fragment, int i, boolean z, int i2) {
        byte b;
        boolean z2;
        int nextAnim = fragment.getNextAnim();
        Fragment.ba();
        Fragment.bb();
        if (nextAnim != 0) {
            boolean zEquals = "anim".equals(this.hQ.getContext().getResources().getResourceTypeName(nextAnim));
            if (zEquals) {
                try {
                    Animation animationLoadAnimation = AnimationUtils.loadAnimation(this.hQ.getContext(), nextAnim);
                    if (animationLoadAnimation != null) {
                        return new ae(animationLoadAnimation, (byte) 0);
                    }
                    z2 = true;
                } catch (Resources.NotFoundException e) {
                    throw e;
                } catch (RuntimeException e2) {
                    z2 = false;
                }
            } else {
                z2 = false;
            }
            if (!z2) {
                try {
                    Animator animatorLoadAnimator = AnimatorInflater.loadAnimator(this.hQ.getContext(), nextAnim);
                    if (animatorLoadAnimator != null) {
                        return new ae(animatorLoadAnimator, (byte) 0);
                    }
                } catch (RuntimeException e3) {
                    if (zEquals) {
                        throw e3;
                    }
                    Animation animationLoadAnimation2 = AnimationUtils.loadAnimation(this.hQ.getContext(), nextAnim);
                    if (animationLoadAnimation2 != null) {
                        return new ae(animationLoadAnimation2, (byte) 0);
                    }
                }
            }
        }
        if (i == 0) {
            return null;
        }
        byte b2 = -1;
        if (i != 4097) {
            if (i == 4099) {
                b = z ? (byte) 5 : (byte) 6;
            } else if (i == 8194) {
                b = z ? (byte) 3 : (byte) 4;
            }
            b2 = b;
        } else {
            b2 = z ? (char) 1 : (char) 2;
        }
        if (b2 < 0) {
            return null;
        }
        switch (b2) {
            case 1:
                return a(1.125f, 1.0f, 0.0f, 1.0f);
            case 2:
                return a(1.0f, 0.975f, 1.0f, 0.0f);
            case 3:
                return a(0.975f, 1.0f, 0.0f, 1.0f);
            case 4:
                return a(1.0f, 1.075f, 1.0f, 0.0f);
            case 5:
                return a(0.0f, 1.0f);
            case 6:
                return a(1.0f, 0.0f);
            default:
                if (i2 == 0 && this.hQ.onHasWindowAnimations()) {
                    i2 = this.hQ.onGetWindowAnimations();
                }
                if (i2 == 0) {
                }
                return null;
        }
    }

    private static Animation.AnimationListener a(Animation animation) {
        String str;
        String str2;
        try {
            if (iC == null) {
                Field declaredField = Animation.class.getDeclaredField("mListener");
                iC = declaredField;
                declaredField.setAccessible(true);
            }
            return (Animation.AnimationListener) iC.get(animation);
        } catch (IllegalAccessException e) {
            e = e;
            str = "FragmentManager";
            str2 = "Cannot access Animation's mListener field";
            Log.e(str, str2, e);
            return null;
        } catch (NoSuchFieldException e2) {
            e = e2;
            str = "FragmentManager";
            str2 = "No field with the name mListener is found in Animation class";
            Log.e(str, str2, e);
            return null;
        }
    }

    private void a(int i, c cVar) {
        synchronized (this) {
            if (this.mBackStackIndices == null) {
                this.mBackStackIndices = new ArrayList();
            }
            int size = this.mBackStackIndices.size();
            if (i < size) {
                if (DEBUG) {
                    Log.v("FragmentManager", "Setting back stack index " + i + " to " + cVar);
                }
                this.mBackStackIndices.set(i, cVar);
            } else {
                while (size < i) {
                    this.mBackStackIndices.add(null);
                    if (this.mAvailBackStackIndices == null) {
                        this.mAvailBackStackIndices = new ArrayList();
                    }
                    if (DEBUG) {
                        Log.v("FragmentManager", "Adding available back stack index " + size);
                    }
                    this.mAvailBackStackIndices.add(Integer.valueOf(size));
                    size++;
                }
                if (DEBUG) {
                    Log.v("FragmentManager", "Adding back stack index " + i + " with " + cVar);
                }
                this.mBackStackIndices.add(cVar);
            }
        }
    }

    private void a(Fragment fragment, Context context) {
        if (this.iA != null) {
            v vVar = this.iA.hP;
            if (vVar instanceof v) {
                vVar.a(fragment, context);
            }
        }
        Iterator it = this.mLifecycleCallbacks.iterator();
        while (it.hasNext()) {
            it.next();
        }
    }

    private void a(Fragment fragment, Bundle bundle) {
        if (this.iA != null) {
            v vVar = this.iA.hP;
            if (vVar instanceof v) {
                vVar.a(fragment, bundle);
            }
        }
        Iterator it = this.mLifecycleCallbacks.iterator();
        while (it.hasNext()) {
            it.next();
        }
    }

    private void a(Fragment fragment, View view, Bundle bundle) {
        if (this.iA != null) {
            v vVar = this.iA.hP;
            if (vVar instanceof v) {
                vVar.a(fragment, view, bundle);
            }
        }
        Iterator it = this.mLifecycleCallbacks.iterator();
        while (it.hasNext()) {
            it.next();
        }
    }

    private static void a(ak akVar) {
        if (akVar == null) {
            return;
        }
        List fragments = akVar.getFragments();
        if (fragments != null) {
            Iterator it = fragments.iterator();
            while (it.hasNext()) {
                ((Fragment) it.next()).mRetaining = true;
            }
        }
        List childNonConfigs = akVar.getChildNonConfigs();
        if (childNonConfigs != null) {
            Iterator it2 = childNonConfigs.iterator();
            while (it2.hasNext()) {
                a((ak) it2.next());
            }
        }
    }

    static /* synthetic */ void a(v vVar, c cVar, boolean z, boolean z2, boolean z3) {
        if (z) {
            cVar.executePopOps(z3);
        } else {
            cVar.executeOps();
        }
        ArrayList arrayList = new ArrayList(1);
        ArrayList arrayList2 = new ArrayList(1);
        arrayList.add(cVar);
        arrayList2.add(Boolean.valueOf(z));
        if (z2) {
            aq.a(vVar, arrayList, arrayList2, 0, 1, true);
        }
        if (z3) {
            vVar.moveToState(vVar.mCurState, true);
        }
        if (vVar.mActive != null) {
            int size = vVar.mActive.size();
            for (int i = 0; i < size; i++) {
                Fragment fragment = (Fragment) vVar.mActive.valueAt(i);
                if (fragment != null && fragment.mView != null && fragment.mIsNewlyAdded && cVar.interactsWith(fragment.mContainerId)) {
                    if (fragment.hW > 0.0f) {
                        fragment.mView.setAlpha(fragment.hW);
                    }
                    if (z3) {
                        fragment.hW = 0.0f;
                    } else {
                        fragment.hW = -1.0f;
                        fragment.mIsNewlyAdded = false;
                    }
                }
            }
        }
    }

    private static void a(android.support.v4.c.c cVar) {
        int size = cVar.size();
        for (int i = 0; i < size; i++) {
            Fragment fragment = (Fragment) cVar.valueAt(i);
            if (!fragment.mAdded) {
                View view = fragment.mView;
                fragment.hW = view.getAlpha();
                view.setAlpha(0.0f);
            }
        }
    }

    private static void a(View view, ae aeVar) {
        boolean zModifiesAlpha;
        if (view == null || aeVar == null) {
            return;
        }
        boolean z = false;
        if (view != null && aeVar != null && Build.VERSION.SDK_INT >= 19 && view.getLayerType() == 0 && android.support.v4.view.n.k(view)) {
            if (aeVar.iQ instanceof AlphaAnimation) {
                zModifiesAlpha = true;
                break;
            }
            if (aeVar.iQ instanceof AnimationSet) {
                List<Animation> animations = ((AnimationSet) aeVar.iQ).getAnimations();
                int i = 0;
                while (true) {
                    if (i >= animations.size()) {
                        zModifiesAlpha = false;
                        break;
                    } else {
                        if (animations.get(i) instanceof AlphaAnimation) {
                            zModifiesAlpha = true;
                            break;
                        }
                        i++;
                    }
                }
            } else {
                zModifiesAlpha = modifiesAlpha(aeVar.animator);
            }
            if (zModifiesAlpha) {
                z = true;
            }
        }
        if (z) {
            if (aeVar.animator != null) {
                aeVar.animator.addListener(new af(view));
                return;
            }
            Animation.AnimationListener animationListenerA = a(aeVar.iQ);
            view.setLayerType(2, null);
            aeVar.iQ.setAnimationListener(new ab(view, animationListenerA));
        }
    }

    private void a(RuntimeException runtimeException) {
        Log.e("FragmentManager", runtimeException.getMessage());
        Log.e("FragmentManager", "Activity state:");
        PrintWriter printWriter = new PrintWriter(new android.support.v4.c.g("FragmentManager"));
        try {
            if (this.hQ != null) {
                this.hQ.a("  ", printWriter, new String[0]);
            } else {
                dump("  ", null, printWriter, new String[0]);
            }
            throw runtimeException;
        } catch (Exception e) {
            Log.e("FragmentManager", "Failed dumping state", e);
            throw runtimeException;
        }
    }

    /* JADX WARN: Code duplicated, block: B:16:0x0038 A[PHI: r0 r2
      0x0038: PHI (r0v9 int) = (r0v6 int), (r0v5 int) binds: [B:29:0x0077, B:15:0x0036] A[DONT_GENERATE, DONT_INLINE]
      0x0038: PHI (r2v4 int) = (r2v2 int), (r2v1 int) binds: [B:29:0x0077, B:15:0x0036] A[DONT_GENERATE, DONT_INLINE]] */
    private void a(ArrayList arrayList, ArrayList arrayList2) {
        int iIndexOf;
        int iIndexOf2;
        int size = this.mPostponedTransactions == null ? 0 : this.mPostponedTransactions.size();
        int i = 0;
        while (i < size) {
            aj ajVar = (aj) this.mPostponedTransactions.get(i);
            if (arrayList != null && !ajVar.iT && (iIndexOf2 = arrayList.indexOf(ajVar.iU)) != -1 && ((Boolean) arrayList2.get(iIndexOf2)).booleanValue()) {
                ajVar.cancelTransaction();
            } else if (ajVar.isReady() || (arrayList != null && ajVar.iU.interactsWith(arrayList, 0, arrayList.size()))) {
                this.mPostponedTransactions.remove(i);
                i--;
                size--;
                if (arrayList == null || ajVar.iT || (iIndexOf = arrayList.indexOf(ajVar.iU)) == -1 || !((Boolean) arrayList2.get(iIndexOf)).booleanValue()) {
                    ajVar.completeTransaction();
                } else {
                    ajVar.cancelTransaction();
                }
            }
            i++;
        }
    }

    private void a(ArrayList arrayList, ArrayList arrayList2, int i, int i2) {
        int i3;
        int i4 = i;
        boolean z = ((c) arrayList.get(i4)).mReorderingAllowed;
        if (this.mTmpAddedFragments == null) {
            this.mTmpAddedFragments = new ArrayList();
        } else {
            this.mTmpAddedFragments.clear();
        }
        this.mTmpAddedFragments.addAll(this.mAdded);
        Fragment fragmentA = this.iB;
        boolean z2 = false;
        for (int i5 = i4; i5 < i2; i5++) {
            c cVar = (c) arrayList.get(i5);
            fragmentA = !((Boolean) arrayList2.get(i5)).booleanValue() ? cVar.a(this.mTmpAddedFragments, fragmentA) : cVar.b(this.mTmpAddedFragments, fragmentA);
            z2 = z2 || cVar.mAddToBackStack;
        }
        this.mTmpAddedFragments.clear();
        if (!z) {
            aq.a(this, arrayList, arrayList2, i4, i2, false);
        }
        b(arrayList, arrayList2, i, i2);
        if (z) {
            android.support.v4.c.c cVar2 = new android.support.v4.c.c();
            b(cVar2);
            int iA = a(arrayList, arrayList2, i4, i2, cVar2);
            a(cVar2);
            i3 = iA;
        } else {
            i3 = i2;
        }
        if (i3 != i4 && z) {
            aq.a(this, arrayList, arrayList2, i4, i3, true);
            moveToState(this.mCurState, true);
        }
        while (i4 < i2) {
            c cVar3 = (c) arrayList.get(i4);
            if (((Boolean) arrayList2.get(i4)).booleanValue() && cVar3.mIndex >= 0) {
                int i6 = cVar3.mIndex;
                synchronized (this) {
                    this.mBackStackIndices.set(i6, null);
                    if (this.mAvailBackStackIndices == null) {
                        this.mAvailBackStackIndices = new ArrayList();
                    }
                    if (DEBUG) {
                        Log.v("FragmentManager", "Freeing back stack index " + i6);
                    }
                    this.mAvailBackStackIndices.add(Integer.valueOf(i6));
                }
                cVar3.mIndex = -1;
            }
            cVar3.runOnCommitRunnables();
            i4++;
        }
        if (z2) {
            reportBackStackChanged();
        }
    }

    private Fragment b(Bundle bundle, String str) {
        int i = bundle.getInt(str, -1);
        if (i == -1) {
            return null;
        }
        Fragment fragment = (Fragment) this.mActive.get(i);
        if (fragment == null) {
            a(new IllegalStateException("Fragment no longer exists for key " + str + ": index " + i));
        }
        return fragment;
    }

    private void b(Fragment fragment, Context context) {
        if (this.iA != null) {
            v vVar = this.iA.hP;
            if (vVar instanceof v) {
                vVar.b(fragment, context);
            }
        }
        Iterator it = this.mLifecycleCallbacks.iterator();
        while (it.hasNext()) {
            it.next();
        }
    }

    private void b(Fragment fragment, Bundle bundle) {
        if (this.iA != null) {
            v vVar = this.iA.hP;
            if (vVar instanceof v) {
                vVar.b(fragment, bundle);
            }
        }
        Iterator it = this.mLifecycleCallbacks.iterator();
        while (it.hasNext()) {
            it.next();
        }
    }

    private void b(android.support.v4.c.c cVar) {
        if (this.mCurState <= 0) {
            return;
        }
        int iMin = Math.min(this.mCurState, 4);
        int size = this.mAdded.size();
        for (int i = 0; i < size; i++) {
            Fragment fragment = (Fragment) this.mAdded.get(i);
            if (fragment.mState < iMin) {
                a(fragment, iMin, fragment.getNextAnim(), fragment.getNextTransition(), false);
                if (fragment.mView != null && !fragment.mHidden && fragment.mIsNewlyAdded) {
                    cVar.add(fragment);
                }
            }
        }
    }

    private void b(ArrayList arrayList, ArrayList arrayList2) {
        if (arrayList == null || arrayList.isEmpty()) {
            return;
        }
        if (arrayList2 == null || arrayList.size() != arrayList2.size()) {
            throw new IllegalStateException("Internal error with the back stack records");
        }
        a(arrayList, arrayList2);
        int size = arrayList.size();
        int i = 0;
        int i2 = 0;
        while (i < size) {
            if (!((c) arrayList.get(i)).mReorderingAllowed) {
                if (i2 != i) {
                    a(arrayList, arrayList2, i2, i);
                }
                i2 = i + 1;
                if (((Boolean) arrayList2.get(i)).booleanValue()) {
                    while (i2 < size && ((Boolean) arrayList2.get(i2)).booleanValue() && !((c) arrayList.get(i2)).mReorderingAllowed) {
                        i2++;
                    }
                }
                a(arrayList, arrayList2, i, i2);
                i = i2 - 1;
            }
            i++;
        }
        if (i2 != size) {
            a(arrayList, arrayList2, i2, size);
        }
    }

    private static void b(ArrayList arrayList, ArrayList arrayList2, int i, int i2) {
        while (i < i2) {
            c cVar = (c) arrayList.get(i);
            if (((Boolean) arrayList2.get(i)).booleanValue()) {
                cVar.bumpBackStackNesting(-1);
                cVar.executePopOps(i == i2 + (-1));
            } else {
                cVar.bumpBackStackNesting(1);
                cVar.executeOps();
            }
            i++;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void bA() {
        synchronized (this) {
            boolean z = false;
            boolean z2 = (this.mPostponedTransactions == null || this.mPostponedTransactions.isEmpty()) ? false : true;
            if (this.mPendingActions != null && this.mPendingActions.size() == 1) {
                z = true;
            }
            if (z2 || z) {
                this.hQ.getHandler().removeCallbacks(this.mExecCommit);
                this.hQ.getHandler().post(this.mExecCommit);
            }
        }
    }

    private void bB() {
        if (this.mExecutingActions) {
            throw new IllegalStateException("FragmentManager is already executing transactions");
        }
        if (this.hQ == null) {
            throw new IllegalStateException("Fragment host has been destroyed");
        }
        if (Looper.myLooper() != this.hQ.getHandler().getLooper()) {
            throw new IllegalStateException("Must be called from main thread of fragment host");
        }
        if (this.mTmpRecords == null) {
            this.mTmpRecords = new ArrayList();
            this.mTmpIsPop = new ArrayList();
        }
        this.mExecutingActions = true;
        try {
            a((ArrayList) null, (ArrayList) null);
        } finally {
            this.mExecutingActions = false;
        }
    }

    private void bC() {
        this.mExecutingActions = false;
        this.mTmpIsPop.clear();
        this.mTmpRecords.clear();
    }

    private void bD() {
        if (this.mPostponedTransactions != null) {
            while (!this.mPostponedTransactions.isEmpty()) {
                ((aj) this.mPostponedTransactions.remove(0)).completeTransaction();
            }
        }
    }

    private void bF() {
        if (this.mActive != null) {
            for (int size = this.mActive.size() - 1; size >= 0; size--) {
                if (this.mActive.valueAt(size) == null) {
                    this.mActive.delete(this.mActive.keyAt(size));
                }
            }
        }
    }

    private boolean by() {
        int size;
        v vVar;
        execPendingActions();
        bB();
        if (this.iB != null && (vVar = this.iB.hR) != null && vVar.popBackStackImmediate()) {
            return true;
        }
        ArrayList arrayList = this.mTmpRecords;
        ArrayList arrayList2 = this.mTmpIsPop;
        boolean z = false;
        if (this.mBackStack != null && (size = this.mBackStack.size() - 1) >= 0) {
            arrayList.add(this.mBackStack.remove(size));
            arrayList2.add(true);
            z = true;
        }
        if (z) {
            this.mExecutingActions = true;
            try {
                b(this.mTmpRecords, this.mTmpIsPop);
                bC();
            } catch (Throwable th) {
                bC();
                throw th;
            }
        }
        doPendingDeferredStart();
        bF();
        return z;
    }

    private void bz() {
        if (isStateSaved()) {
            throw new IllegalStateException("Can not perform this action after onSaveInstanceState");
        }
        if (this.mNoTransactionsBecause == null) {
            return;
        }
        throw new IllegalStateException("Can not perform this action inside of " + this.mNoTransactionsBecause);
    }

    private void c(Fragment fragment, Bundle bundle) {
        if (this.iA != null) {
            v vVar = this.iA.hP;
            if (vVar instanceof v) {
                vVar.c(fragment, bundle);
            }
        }
        Iterator it = this.mLifecycleCallbacks.iterator();
        while (it.hasNext()) {
            it.next();
        }
    }

    private boolean c(ArrayList arrayList, ArrayList arrayList2) {
        synchronized (this) {
            if (this.mPendingActions != null && this.mPendingActions.size() != 0) {
                int size = this.mPendingActions.size();
                boolean zGenerateOps = false;
                for (int i = 0; i < size; i++) {
                    zGenerateOps |= ((ai) this.mPendingActions.get(i)).generateOps(arrayList, arrayList2);
                }
                this.mPendingActions.clear();
                this.hQ.getHandler().removeCallbacks(this.mExecCommit);
                return zGenerateOps;
            }
            return false;
        }
    }

    private void d(Fragment fragment, Bundle bundle) {
        if (this.iA != null) {
            v vVar = this.iA.hP;
            if (vVar instanceof v) {
                vVar.d(fragment, bundle);
            }
        }
        Iterator it = this.mLifecycleCallbacks.iterator();
        while (it.hasNext()) {
            it.next();
        }
    }

    private void doPendingDeferredStart() {
        if (this.mHavePendingDeferredStart) {
            this.mHavePendingDeferredStart = false;
            startPendingDeferredFragments();
        }
    }

    private void e(Fragment fragment) {
        a(fragment, this.mCurState, 0, 0, false);
    }

    public static void i(Fragment fragment) {
        if (DEBUG) {
            Log.v("FragmentManager", "hide: " + fragment);
        }
        if (fragment.mHidden) {
            return;
        }
        fragment.mHidden = true;
        fragment.mHiddenChanged = true ^ fragment.mHiddenChanged;
    }

    public static void j(Fragment fragment) {
        if (DEBUG) {
            Log.v("FragmentManager", "show: " + fragment);
        }
        if (fragment.mHidden) {
            fragment.mHidden = false;
            fragment.mHiddenChanged = !fragment.mHiddenChanged;
        }
    }

    private void m(Fragment fragment) {
        if (fragment.hU == null) {
            return;
        }
        if (this.mStateArray == null) {
            this.mStateArray = new SparseArray();
        } else {
            this.mStateArray.clear();
        }
        fragment.hU.saveHierarchyState(this.mStateArray);
        if (this.mStateArray.size() > 0) {
            fragment.mSavedViewState = this.mStateArray;
            this.mStateArray = null;
        }
    }

    private static boolean modifiesAlpha(Animator animator) {
        if (animator == null) {
            return false;
        }
        if (animator instanceof ValueAnimator) {
            for (PropertyValuesHolder propertyValuesHolder : ((ValueAnimator) animator).getValues()) {
                if ("alpha".equals(propertyValuesHolder.getPropertyName())) {
                    return true;
                }
            }
        } else if (animator instanceof AnimatorSet) {
            ArrayList<Animator> childAnimations = ((AnimatorSet) animator).getChildAnimations();
            for (int i = 0; i < childAnimations.size(); i++) {
                if (modifiesAlpha(childAnimations.get(i))) {
                    return true;
                }
            }
        }
        return false;
    }

    private void o(Fragment fragment) {
        if (this.iA != null) {
            v vVar = this.iA.hP;
            if (vVar instanceof v) {
                vVar.o(fragment);
            }
        }
        Iterator it = this.mLifecycleCallbacks.iterator();
        while (it.hasNext()) {
            it.next();
        }
    }

    private void p(Fragment fragment) {
        if (this.iA != null) {
            v vVar = this.iA.hP;
            if (vVar instanceof v) {
                vVar.p(fragment);
            }
        }
        Iterator it = this.mLifecycleCallbacks.iterator();
        while (it.hasNext()) {
            it.next();
        }
    }

    private void q(Fragment fragment) {
        if (this.iA != null) {
            v vVar = this.iA.hP;
            if (vVar instanceof v) {
                vVar.q(fragment);
            }
        }
        Iterator it = this.mLifecycleCallbacks.iterator();
        while (it.hasNext()) {
            it.next();
        }
    }

    private void r(Fragment fragment) {
        if (this.iA != null) {
            v vVar = this.iA.hP;
            if (vVar instanceof v) {
                vVar.r(fragment);
            }
        }
        Iterator it = this.mLifecycleCallbacks.iterator();
        while (it.hasNext()) {
            it.next();
        }
    }

    private void reportBackStackChanged() {
        if (this.mBackStackChangeListeners != null) {
            for (int i = 0; i < this.mBackStackChangeListeners.size(); i++) {
                this.mBackStackChangeListeners.get(i);
            }
        }
    }

    public static int reverseTransit(int i) {
        if (i == 4097) {
            return 8194;
        }
        if (i == 4099) {
            return CarplayMessage.BACKCAR_EVENT_ARM2_EXIT;
        }
        if (i != 8194) {
            return 0;
        }
        return CarplayMessage.BACKCAR_EVENT_START;
    }

    private Fragment s(int i) {
        for (int size = this.mAdded.size() - 1; size >= 0; size--) {
            Fragment fragment = (Fragment) this.mAdded.get(size);
            if (fragment != null && fragment.mFragmentId == i) {
                return fragment;
            }
        }
        if (this.mActive == null) {
            return null;
        }
        for (int size2 = this.mActive.size() - 1; size2 >= 0; size2--) {
            Fragment fragment2 = (Fragment) this.mActive.valueAt(size2);
            if (fragment2 != null && fragment2.mFragmentId == i) {
                return fragment2;
            }
        }
        return null;
    }

    private void s(Fragment fragment) {
        if (this.iA != null) {
            v vVar = this.iA.hP;
            if (vVar instanceof v) {
                vVar.s(fragment);
            }
        }
        Iterator it = this.mLifecycleCallbacks.iterator();
        while (it.hasNext()) {
            it.next();
        }
    }

    private void saveNonConfig() {
        ArrayList arrayList;
        ArrayList arrayList2;
        ArrayList arrayList3;
        ak akVar;
        if (this.mActive != null) {
            arrayList = null;
            arrayList2 = null;
            arrayList3 = null;
            for (int i = 0; i < this.mActive.size(); i++) {
                Fragment fragment = (Fragment) this.mActive.valueAt(i);
                if (fragment != null) {
                    if (fragment.mRetainInstance) {
                        if (arrayList == null) {
                            arrayList = new ArrayList();
                        }
                        arrayList.add(fragment);
                        fragment.mTargetIndex = fragment.hO != null ? fragment.hO.mIndex : -1;
                        if (DEBUG) {
                            Log.v("FragmentManager", "retainNonConfig: keeping retained " + fragment);
                        }
                    }
                    if (fragment.hR != null) {
                        fragment.hR.saveNonConfig();
                        akVar = fragment.hR.iD;
                    } else {
                        akVar = fragment.hS;
                    }
                    if (arrayList2 == null && akVar != null) {
                        arrayList2 = new ArrayList(this.mActive.size());
                        for (int i2 = 0; i2 < i; i2++) {
                            arrayList2.add(null);
                        }
                    }
                    if (arrayList2 != null) {
                        arrayList2.add(akVar);
                    }
                    if (arrayList3 == null && fragment.am != null) {
                        arrayList3 = new ArrayList(this.mActive.size());
                        for (int i3 = 0; i3 < i; i3++) {
                            arrayList3.add(null);
                        }
                    }
                    if (arrayList3 != null) {
                        arrayList3.add(fragment.am);
                    }
                }
            }
        } else {
            arrayList = null;
            arrayList2 = null;
            arrayList3 = null;
        }
        if (arrayList == null && arrayList2 == null && arrayList3 == null) {
            this.iD = null;
        } else {
            this.iD = new ak(arrayList, arrayList2, arrayList3);
        }
    }

    private void startPendingDeferredFragments() {
        if (this.mActive == null) {
            return;
        }
        for (int i = 0; i < this.mActive.size(); i++) {
            Fragment fragment = (Fragment) this.mActive.valueAt(i);
            if (fragment != null && fragment.mDeferStart) {
                if (this.mExecutingActions) {
                    this.mHavePendingDeferredStart = true;
                } else {
                    fragment.mDeferStart = false;
                    a(fragment, this.mCurState, 0, 0, false);
                }
            }
        }
    }

    private void t(int i) {
        try {
            this.mExecutingActions = true;
            moveToState(i, false);
            this.mExecutingActions = false;
            execPendingActions();
        } catch (Throwable th) {
            this.mExecutingActions = false;
            throw th;
        }
    }

    private void t(Fragment fragment) {
        if (this.iA != null) {
            v vVar = this.iA.hP;
            if (vVar instanceof v) {
                vVar.t(fragment);
            }
        }
        Iterator it = this.mLifecycleCallbacks.iterator();
        while (it.hasNext()) {
            it.next();
        }
    }

    private void u(Fragment fragment) {
        if (this.iA != null) {
            v vVar = this.iA.hP;
            if (vVar instanceof v) {
                vVar.u(fragment);
            }
        }
        Iterator it = this.mLifecycleCallbacks.iterator();
        while (it.hasNext()) {
            it.next();
        }
    }

    public final int a(c cVar) {
        synchronized (this) {
            if (this.mAvailBackStackIndices != null && this.mAvailBackStackIndices.size() > 0) {
                int iIntValue = ((Integer) this.mAvailBackStackIndices.remove(this.mAvailBackStackIndices.size() - 1)).intValue();
                if (DEBUG) {
                    Log.v("FragmentManager", "Adding back stack index " + iIntValue + " with " + cVar);
                }
                this.mBackStackIndices.set(iIntValue, cVar);
                return iIntValue;
            }
            if (this.mBackStackIndices == null) {
                this.mBackStackIndices = new ArrayList();
            }
            int size = this.mBackStackIndices.size();
            if (DEBUG) {
                Log.v("FragmentManager", "Setting back stack index " + size + " to " + cVar);
            }
            this.mBackStackIndices.add(cVar);
            return size;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    final void a(Parcelable parcelable, ak akVar) {
        List childNonConfigs;
        List listBG;
        if (parcelable == null) {
            return;
        }
        FragmentManagerState fragmentManagerState = (FragmentManagerState) parcelable;
        if (fragmentManagerState.iZ == null) {
            return;
        }
        ak akVar2 = null;
        if (akVar != null) {
            List fragments = akVar.getFragments();
            childNonConfigs = akVar.getChildNonConfigs();
            listBG = akVar.bG();
            int size = fragments != null ? fragments.size() : 0;
            for (int i = 0; i < size; i++) {
                Fragment fragment = (Fragment) fragments.get(i);
                if (DEBUG) {
                    Log.v("FragmentManager", "restoreAllState: re-attaching retained " + fragment);
                }
                int i2 = 0;
                while (i2 < fragmentManagerState.iZ.length && fragmentManagerState.iZ[i2].mIndex != fragment.mIndex) {
                    i2++;
                }
                if (i2 == fragmentManagerState.iZ.length) {
                    a(new IllegalStateException("Could not find active fragment with index " + fragment.mIndex));
                }
                FragmentState fragmentState = fragmentManagerState.iZ[i2];
                fragmentState.jb = fragment;
                fragment.mSavedViewState = null;
                fragment.mBackStackNesting = 0;
                fragment.mInLayout = false;
                fragment.mAdded = false;
                fragment.hO = null;
                if (fragmentState.mSavedFragmentState != null) {
                    fragmentState.mSavedFragmentState.setClassLoader(this.hQ.getContext().getClassLoader());
                    fragment.mSavedViewState = fragmentState.mSavedFragmentState.getSparseParcelableArray("android:view_state");
                    fragment.mSavedFragmentState = fragmentState.mSavedFragmentState;
                }
            }
        } else {
            childNonConfigs = null;
            listBG = null;
        }
        this.mActive = new SparseArray(fragmentManagerState.iZ.length);
        int i3 = 0;
        while (i3 < fragmentManagerState.iZ.length) {
            FragmentState fragmentState2 = fragmentManagerState.iZ[i3];
            if (fragmentState2 != null) {
                ak akVar3 = (childNonConfigs == null || i3 >= childNonConfigs.size()) ? akVar2 : (ak) childNonConfigs.get(i3);
                android.arch.lifecycle.x xVar = (listBG == null || i3 >= listBG.size()) ? akVar2 : (android.arch.lifecycle.x) listBG.get(i3);
                t tVar = this.hQ;
                r rVar = this.iz;
                Fragment fragment2 = this.iA;
                if (fragmentState2.jb == null) {
                    Context context = tVar.getContext();
                    if (fragmentState2.mArguments != null) {
                        fragmentState2.mArguments.setClassLoader(context.getClassLoader());
                    }
                    fragmentState2.jb = rVar != null ? rVar.a(context, fragmentState2.mClassName, fragmentState2.mArguments) : Fragment.a(context, fragmentState2.mClassName, fragmentState2.mArguments);
                    if (fragmentState2.mSavedFragmentState != null) {
                        fragmentState2.mSavedFragmentState.setClassLoader(context.getClassLoader());
                        fragmentState2.jb.mSavedFragmentState = fragmentState2.mSavedFragmentState;
                    }
                    fragmentState2.jb.a(fragmentState2.mIndex, fragment2);
                    fragmentState2.jb.mFromLayout = fragmentState2.mFromLayout;
                    fragmentState2.jb.mRestored = true;
                    fragmentState2.jb.mFragmentId = fragmentState2.mFragmentId;
                    fragmentState2.jb.mContainerId = fragmentState2.mContainerId;
                    fragmentState2.jb.mTag = fragmentState2.mTag;
                    fragmentState2.jb.mRetainInstance = fragmentState2.mRetainInstance;
                    fragmentState2.jb.mDetached = fragmentState2.mDetached;
                    fragmentState2.jb.mHidden = fragmentState2.mHidden;
                    fragmentState2.jb.hP = tVar.hP;
                    if (DEBUG) {
                        Log.v("FragmentManager", "Instantiated fragment " + fragmentState2.jb);
                    }
                }
                fragmentState2.jb.hS = akVar3;
                fragmentState2.jb.am = xVar;
                Fragment fragment3 = fragmentState2.jb;
                if (DEBUG) {
                    Log.v("FragmentManager", "restoreAllState: active #" + i3 + ": " + fragment3);
                }
                this.mActive.put(fragment3.mIndex, fragment3);
                fragmentState2.jb = null;
            }
            i3++;
            akVar2 = null;
        }
        if (akVar != null) {
            List fragments2 = akVar.getFragments();
            int size2 = fragments2 != null ? fragments2.size() : 0;
            for (int i4 = 0; i4 < size2; i4++) {
                Fragment fragment4 = (Fragment) fragments2.get(i4);
                if (fragment4.mTargetIndex >= 0) {
                    fragment4.hO = (Fragment) this.mActive.get(fragment4.mTargetIndex);
                    if (fragment4.hO == null) {
                        Log.w("FragmentManager", "Re-attaching retained fragment " + fragment4 + " target no longer exists: " + fragment4.mTargetIndex);
                    }
                }
            }
        }
        this.mAdded.clear();
        if (fragmentManagerState.mAdded != null) {
            for (int i5 = 0; i5 < fragmentManagerState.mAdded.length; i5++) {
                Fragment fragment5 = (Fragment) this.mActive.get(fragmentManagerState.mAdded[i5]);
                if (fragment5 == null) {
                    a(new IllegalStateException("No instantiated fragment for index #" + fragmentManagerState.mAdded[i5]));
                }
                fragment5.mAdded = true;
                if (DEBUG) {
                    Log.v("FragmentManager", "restoreAllState: added #" + i5 + ": " + fragment5);
                }
                if (this.mAdded.contains(fragment5)) {
                    throw new IllegalStateException("Already added!");
                }
                synchronized (this.mAdded) {
                    this.mAdded.add(fragment5);
                }
            }
        }
        if (fragmentManagerState.ja != null) {
            this.mBackStack = new ArrayList(fragmentManagerState.ja.length);
            for (int i6 = 0; i6 < fragmentManagerState.ja.length; i6++) {
                c cVarA = fragmentManagerState.ja[i6].a(this);
                if (DEBUG) {
                    Log.v("FragmentManager", "restoreAllState: back stack #" + i6 + " (index " + cVarA.mIndex + "): " + cVarA);
                    PrintWriter printWriter = new PrintWriter(new android.support.v4.c.g("FragmentManager"));
                    cVarA.dump("  ", printWriter, false);
                    printWriter.close();
                }
                this.mBackStack.add(cVarA);
                if (cVarA.mIndex >= 0) {
                    a(cVarA.mIndex, cVarA);
                }
            }
        } else {
            this.mBackStack = null;
        }
        if (fragmentManagerState.mPrimaryNavActiveIndex >= 0) {
            this.iB = (Fragment) this.mActive.get(fragmentManagerState.mPrimaryNavActiveIndex);
        }
        this.mNextFragmentIndex = fragmentManagerState.mNextFragmentIndex;
    }

    /* JADX WARN: Code duplicated, block: B:279:0x05e6 A[FALL_THROUGH, PHI: r0
      0x05e6: PHI (r0v12 int) = 
      (r0v5 int)
      (r0v5 int)
      (r0v5 int)
      (r0v5 int)
      (r0v5 int)
      (r0v5 int)
      (r0v5 int)
      (r0v5 int)
      (r0v13 int)
      (r0v13 int)
     binds: [B:160:0x033a, B:162:0x033e, B:223:0x04a3, B:266:0x0577, B:275:0x05c2, B:270:0x057f, B:274:0x0598, B:40:0x006a, B:154:0x0313, B:158:0x032c] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Code duplicated, block: B:282:0x05eb  */
    /* JADX WARN: Code duplicated, block: B:285:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Instruction removed from duplicated block: B:282:0x05eb, please report this as an issue */
    final void a(Fragment fragment, int i, int i2, int i3, boolean z) {
        int i4;
        ViewGroup viewGroup;
        String resourceName;
        int i5 = 1;
        if (!fragment.mAdded || fragment.mDetached) {
            i4 = i;
            if (i4 > 1) {
                i4 = 1;
            }
        } else {
            i4 = i;
        }
        if (fragment.mRemoving && i4 > fragment.mState) {
            i4 = (fragment.mState == 0 && fragment.isInBackStack()) ? 1 : fragment.mState;
        }
        if (fragment.mDeferStart && fragment.mState < 4 && i4 > 3) {
            i4 = 3;
        }
        if (fragment.mState > i4) {
            if (fragment.mState > i4) {
                switch (fragment.mState) {
                    case 5:
                        if (i4 < 5) {
                            if (DEBUG) {
                                Log.v("FragmentManager", "movefrom RESUMED: " + fragment);
                            }
                            fragment.performPause();
                            q(fragment);
                            break;
                        }
                    case 4:
                        if (i4 < 4) {
                            if (DEBUG) {
                                Log.v("FragmentManager", "movefrom STARTED: " + fragment);
                            }
                            fragment.hX.a(Lifecycle.Event.ON_STOP);
                            if (fragment.hR != null) {
                                fragment.hR.dispatchStop();
                            }
                            fragment.mState = 3;
                            fragment.mCalled = false;
                            fragment.mCalled = true;
                            if (!fragment.mCalled) {
                                throw new SuperNotCalledException("Fragment " + fragment + " did not call through to super.onStop()");
                            }
                            r(fragment);
                            break;
                        }
                    case 3:
                        if (i4 < 3) {
                            if (DEBUG) {
                                Log.v("FragmentManager", "movefrom STOPPED: " + fragment);
                            }
                            if (fragment.hR != null) {
                                fragment.hR.t(2);
                            }
                            fragment.mState = 2;
                            break;
                        }
                    case 2:
                        if (i4 < 2) {
                            if (DEBUG) {
                                Log.v("FragmentManager", "movefrom ACTIVITY_CREATED: " + fragment);
                            }
                            if (fragment.mView != null && this.hQ.br() && fragment.mSavedViewState == null) {
                                m(fragment);
                            }
                            fragment.performDestroyView();
                            s(fragment);
                            if (fragment.mView != null && fragment.mContainer != null) {
                                fragment.mContainer.endViewTransition(fragment.mView);
                                fragment.mView.clearAnimation();
                                ae aeVarA = (this.mCurState <= 0 || this.mDestroyed || fragment.mView.getVisibility() != 0 || fragment.hW < 0.0f) ? null : a(fragment, i2, false, i3);
                                fragment.hW = 0.0f;
                                if (aeVarA != null) {
                                    View view = fragment.mView;
                                    ViewGroup viewGroup2 = fragment.mContainer;
                                    viewGroup2.startViewTransition(view);
                                    fragment.setStateAfterAnimating(i4);
                                    if (aeVarA.iQ != null) {
                                        ag agVar = new ag(aeVarA.iQ, viewGroup2, view);
                                        fragment.b(fragment.mView);
                                        agVar.setAnimationListener(new x(this, a(agVar), viewGroup2, fragment));
                                        a(view, aeVarA);
                                        fragment.mView.startAnimation(agVar);
                                    } else {
                                        Animator animator = aeVarA.animator;
                                        fragment.a(aeVarA.animator);
                                        animator.addListener(new z(this, viewGroup2, view, fragment));
                                        animator.setTarget(fragment.mView);
                                        a(fragment.mView, aeVarA);
                                        animator.start();
                                    }
                                }
                                fragment.mContainer.removeView(fragment.mView);
                            }
                            fragment.mContainer = null;
                            fragment.mView = null;
                            fragment.hZ = null;
                            fragment.ia.setValue(null);
                            fragment.hU = null;
                            fragment.mInLayout = false;
                            break;
                        }
                    case 1:
                        if (i4 <= 0) {
                            if (this.mDestroyed) {
                                if (fragment.bp() != null) {
                                    View viewBp = fragment.bp();
                                    fragment.b((View) null);
                                    viewBp.clearAnimation();
                                } else if (fragment.getAnimator() != null) {
                                    Animator animator2 = fragment.getAnimator();
                                    fragment.a((Animator) null);
                                    animator2.cancel();
                                }
                            }
                            if (fragment.bp() == null && fragment.getAnimator() == null) {
                                if (DEBUG) {
                                    Log.v("FragmentManager", "movefrom CREATED: " + fragment);
                                }
                                if (fragment.mRetaining) {
                                    fragment.mState = 0;
                                } else {
                                    fragment.hX.a(Lifecycle.Event.ON_DESTROY);
                                    if (fragment.hR != null) {
                                        fragment.hR.dispatchDestroy();
                                    }
                                    fragment.mState = 0;
                                    fragment.mCalled = false;
                                    fragment.mIsCreated = false;
                                    fragment.mCalled = true;
                                    if (fragment.am != null && !fragment.hQ.hP.mStateSaved) {
                                        fragment.am.clear();
                                    }
                                    if (!fragment.mCalled) {
                                        throw new SuperNotCalledException("Fragment " + fragment + " did not call through to super.onDestroy()");
                                    }
                                    fragment.hR = null;
                                    t(fragment);
                                }
                                fragment.mCalled = false;
                                fragment.mCalled = true;
                                fragment.mLayoutInflater = null;
                                if (!fragment.mCalled) {
                                    throw new SuperNotCalledException("Fragment " + fragment + " did not call through to super.onDetach()");
                                }
                                if (fragment.hR != null) {
                                    if (!fragment.mRetaining) {
                                        throw new IllegalStateException("Child FragmentManager of " + fragment + " was not  destroyed and this fragment is not retaining instance");
                                    }
                                    fragment.hR.dispatchDestroy();
                                    fragment.hR = null;
                                }
                                u(fragment);
                                if (!z) {
                                    if (fragment.mRetaining) {
                                        fragment.hQ = null;
                                        fragment.hT = null;
                                        fragment.hP = null;
                                    } else if (fragment.mIndex >= 0) {
                                        if (DEBUG) {
                                            Log.v("FragmentManager", "Freeing fragment index " + fragment);
                                        }
                                        this.mActive.put(fragment.mIndex, null);
                                        fragment.mIndex = -1;
                                        fragment.mWho = null;
                                        fragment.mAdded = false;
                                        fragment.mRemoving = false;
                                        fragment.mFromLayout = false;
                                        fragment.mInLayout = false;
                                        fragment.mRestored = false;
                                        fragment.mBackStackNesting = 0;
                                        fragment.hP = null;
                                        fragment.hR = null;
                                        fragment.hQ = null;
                                        fragment.mFragmentId = 0;
                                        fragment.mContainerId = 0;
                                        fragment.mTag = null;
                                        fragment.mHidden = false;
                                        fragment.mDetached = false;
                                        fragment.mRetaining = false;
                                    }
                                }
                            } else {
                                fragment.setStateAfterAnimating(i4);
                            }
                            break;
                        }
                    default:
                        i5 = i4;
                        break;
                }
            }
            if (fragment.mState != i5) {
                Log.w("FragmentManager", "moveToState: Fragment state for " + fragment + " not updated inline; expected state " + i5 + " found " + fragment.mState);
                fragment.mState = i5;
            }
        }
        if (fragment.mFromLayout && !fragment.mInLayout) {
            return;
        }
        if (fragment.bp() != null || fragment.getAnimator() != null) {
            fragment.b((View) null);
            fragment.a((Animator) null);
            a(fragment, fragment.getStateAfterAnimating(), 0, 0, true);
        }
        switch (fragment.mState) {
            case 0:
                if (i4 > 0) {
                    if (DEBUG) {
                        Log.v("FragmentManager", "moveto CREATED: " + fragment);
                    }
                    if (fragment.mSavedFragmentState != null) {
                        fragment.mSavedFragmentState.setClassLoader(this.hQ.getContext().getClassLoader());
                        fragment.mSavedViewState = fragment.mSavedFragmentState.getSparseParcelableArray("android:view_state");
                        fragment.hO = b(fragment.mSavedFragmentState, "android:target_state");
                        if (fragment.hO != null) {
                            fragment.mTargetRequestCode = fragment.mSavedFragmentState.getInt("android:target_req_state", 0);
                        }
                        if (fragment.hN != null) {
                            fragment.mUserVisibleHint = fragment.hN.booleanValue();
                            fragment.hN = null;
                        } else {
                            fragment.mUserVisibleHint = fragment.mSavedFragmentState.getBoolean("android:user_visible_hint", true);
                        }
                        if (!fragment.mUserVisibleHint) {
                            fragment.mDeferStart = true;
                            if (i4 > 3) {
                                i4 = 3;
                            }
                        }
                    }
                    fragment.hQ = this.hQ;
                    fragment.hT = this.iA;
                    fragment.hP = this.iA != null ? this.iA.hR : this.hQ.hP;
                    if (fragment.hO != null) {
                        if (this.mActive.get(fragment.hO.mIndex) != fragment.hO) {
                            throw new IllegalStateException("Fragment " + fragment + " declared target fragment " + fragment.hO + " that does not belong to this FragmentManager!");
                        }
                        if (fragment.hO.mState <= 0) {
                            a(fragment.hO, 1, 0, 0, true);
                        }
                    }
                    a(fragment, this.hQ.getContext());
                    fragment.mCalled = false;
                    fragment.mCalled = true;
                    if ((fragment.hQ == null ? null : fragment.hQ.getActivity()) != null) {
                        fragment.mCalled = false;
                        fragment.mCalled = true;
                    }
                    if (!fragment.mCalled) {
                        throw new SuperNotCalledException("Fragment " + fragment + " did not call through to super.onAttach()");
                    }
                    if (fragment.hT != null) {
                        Fragment fragment2 = fragment.hT;
                        Fragment.aZ();
                    }
                    b(fragment, this.hQ.getContext());
                    if (fragment.mIsCreated) {
                        fragment.a(fragment.mSavedFragmentState);
                        fragment.mState = 1;
                    } else {
                        a(fragment, fragment.mSavedFragmentState);
                        fragment.performCreate(fragment.mSavedFragmentState);
                        b(fragment, fragment.mSavedFragmentState);
                    }
                    fragment.mRetaining = false;
                    break;
                }
            case 1:
                int i6 = i4;
                if (fragment.mFromLayout && !fragment.mPerformedCreateView) {
                    Bundle bundle = fragment.mSavedFragmentState;
                    fragment.aX();
                    Bundle bundle2 = fragment.mSavedFragmentState;
                    fragment.bk();
                    if (fragment.mView != null) {
                        fragment.hU = fragment.mView;
                        fragment.mView.setSaveFromParentEnabled(false);
                        if (fragment.mHidden) {
                            fragment.mView.setVisibility(8);
                        }
                        View view2 = fragment.mView;
                        Bundle bundle3 = fragment.mSavedFragmentState;
                        Fragment.bc();
                        a(fragment, fragment.mView, fragment.mSavedFragmentState);
                    } else {
                        fragment.hU = null;
                    }
                }
                if (i6 > 1) {
                    if (DEBUG) {
                        Log.v("FragmentManager", "moveto ACTIVITY_CREATED: " + fragment);
                    }
                    if (!fragment.mFromLayout) {
                        if (fragment.mContainerId != 0) {
                            if (fragment.mContainerId == -1) {
                                a(new IllegalArgumentException("Cannot create fragment " + fragment + " for a container view with no id"));
                            }
                            viewGroup = (ViewGroup) this.iz.onFindViewById(fragment.mContainerId);
                            if (viewGroup == null && !fragment.mRestored) {
                                try {
                                    Context context = fragment.getContext();
                                    if (context == null) {
                                        throw new IllegalStateException("Fragment " + fragment + " not attached to a context.");
                                    }
                                    resourceName = context.getResources().getResourceName(fragment.mContainerId);
                                    a(new IllegalArgumentException("No view found for id 0x" + Integer.toHexString(fragment.mContainerId) + " (" + resourceName + ") for fragment " + fragment));
                                } catch (Resources.NotFoundException e) {
                                    resourceName = "unknown";
                                }
                            }
                        } else {
                            viewGroup = null;
                        }
                        fragment.mContainer = viewGroup;
                        Bundle bundle4 = fragment.mSavedFragmentState;
                        fragment.aX();
                        Bundle bundle5 = fragment.mSavedFragmentState;
                        fragment.bk();
                        if (fragment.mView != null) {
                            fragment.hU = fragment.mView;
                            fragment.mView.setSaveFromParentEnabled(false);
                            if (viewGroup != null) {
                                viewGroup.addView(fragment.mView);
                            }
                            if (fragment.mHidden) {
                                fragment.mView.setVisibility(8);
                            }
                            View view3 = fragment.mView;
                            Bundle bundle6 = fragment.mSavedFragmentState;
                            Fragment.bc();
                            a(fragment, fragment.mView, fragment.mSavedFragmentState);
                            fragment.mIsNewlyAdded = fragment.mView.getVisibility() == 0 && fragment.mContainer != null;
                        } else {
                            fragment.hU = null;
                        }
                    }
                    Bundle bundle7 = fragment.mSavedFragmentState;
                    fragment.bl();
                    c(fragment, fragment.mSavedFragmentState);
                    if (fragment.mView != null) {
                        Bundle bundle8 = fragment.mSavedFragmentState;
                        fragment.aT();
                    }
                    fragment.mSavedFragmentState = null;
                }
                i4 = i6;
            case 2:
                if (i4 > 2) {
                    fragment.mState = 3;
                    break;
                }
            case 3:
                if (i4 > 3) {
                    if (DEBUG) {
                        Log.v("FragmentManager", "moveto STARTED: " + fragment);
                    }
                    fragment.performStart();
                    o(fragment);
                    break;
                }
            case 4:
                if (i4 > 4) {
                    if (DEBUG) {
                        Log.v("FragmentManager", "moveto RESUMED: " + fragment);
                    }
                    fragment.performResume();
                    p(fragment);
                    fragment.mSavedFragmentState = null;
                    fragment.mSavedViewState = null;
                    break;
                }
            default:
                i5 = i4;
                if (fragment.mState != i5) {
                    Log.w("FragmentManager", "moveToState: Fragment state for " + fragment + " not updated inline; expected state " + i5 + " found " + fragment.mState);
                    fragment.mState = i5;
                }
        }
        i5 = i4;
        if (fragment.mState != i5) {
            Log.w("FragmentManager", "moveToState: Fragment state for " + fragment + " not updated inline; expected state " + i5 + " found " + fragment.mState);
            fragment.mState = i5;
        }
    }

    public final void a(Fragment fragment, boolean z) {
        if (DEBUG) {
            Log.v("FragmentManager", "add: " + fragment);
        }
        g(fragment);
        if (fragment.mDetached) {
            return;
        }
        if (this.mAdded.contains(fragment)) {
            throw new IllegalStateException("Fragment already added: " + fragment);
        }
        synchronized (this.mAdded) {
            this.mAdded.add(fragment);
        }
        fragment.mAdded = true;
        fragment.mRemoving = false;
        if (fragment.mView == null) {
            fragment.mHiddenChanged = false;
        }
        if (fragment.mHasMenu && fragment.mMenuVisible) {
            this.mNeedMenuInvalidate = true;
        }
        if (z) {
            e(fragment);
        }
    }

    public final void a(ai aiVar) {
        bz();
        synchronized (this) {
            if (this.mDestroyed || this.hQ == null) {
                throw new IllegalStateException("Activity has been destroyed");
            }
            if (this.mPendingActions == null) {
                this.mPendingActions = new ArrayList();
            }
            this.mPendingActions.add(aiVar);
            bA();
        }
    }

    public final void a(t tVar, r rVar, Fragment fragment) {
        if (this.hQ != null) {
            throw new IllegalStateException("Already attached");
        }
        this.hQ = tVar;
        this.iz = rVar;
        this.iA = fragment;
    }

    final ak bE() {
        a(this.iD);
        return this.iD;
    }

    public final void bw() {
        t(2);
    }

    @Override // android.support.v4.app.u
    public final ap bx() {
        return new c(this);
    }

    public final void dispatchActivityCreated() {
        this.mStateSaved = false;
        this.mStopped = false;
        t(2);
    }

    public final void dispatchConfigurationChanged(Configuration configuration) {
        for (int i = 0; i < this.mAdded.size(); i++) {
            Fragment fragment = (Fragment) this.mAdded.get(i);
            if (fragment != null) {
                fragment.onConfigurationChanged(configuration);
                if (fragment.hR != null) {
                    fragment.hR.dispatchConfigurationChanged(configuration);
                }
            }
        }
    }

    public final boolean dispatchContextItemSelected(MenuItem menuItem) {
        if (this.mCurState <= 0) {
            return false;
        }
        for (int i = 0; i < this.mAdded.size(); i++) {
            Fragment fragment = (Fragment) this.mAdded.get(i);
            if (fragment != null) {
                if ((fragment.mHidden || fragment.hR == null || !fragment.hR.dispatchContextItemSelected(menuItem)) ? false : true) {
                    return true;
                }
            }
        }
        return false;
    }

    public final void dispatchCreate() {
        this.mStateSaved = false;
        this.mStopped = false;
        t(1);
    }

    public final boolean dispatchCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        boolean zDispatchCreateOptionsMenu;
        if (this.mCurState <= 0) {
            return false;
        }
        ArrayList arrayList = null;
        boolean z = false;
        for (int i = 0; i < this.mAdded.size(); i++) {
            Fragment fragment = (Fragment) this.mAdded.get(i);
            if (fragment != null) {
                if (fragment.mHidden) {
                    zDispatchCreateOptionsMenu = false;
                } else {
                    zDispatchCreateOptionsMenu = fragment.mHasMenu && fragment.mMenuVisible;
                    if (fragment.hR != null) {
                        zDispatchCreateOptionsMenu |= fragment.hR.dispatchCreateOptionsMenu(menu, menuInflater);
                    }
                }
                if (zDispatchCreateOptionsMenu) {
                    if (arrayList == null) {
                        arrayList = new ArrayList();
                    }
                    arrayList.add(fragment);
                    z = true;
                }
            }
        }
        if (this.mCreatedMenus != null) {
            for (int i2 = 0; i2 < this.mCreatedMenus.size(); i2++) {
                Fragment fragment2 = (Fragment) this.mCreatedMenus.get(i2);
                if (arrayList == null || !arrayList.contains(fragment2)) {
                    Fragment.onDestroyOptionsMenu();
                }
            }
        }
        this.mCreatedMenus = arrayList;
        return z;
    }

    public final void dispatchDestroy() {
        this.mDestroyed = true;
        execPendingActions();
        t(0);
        this.hQ = null;
        this.iz = null;
        this.iA = null;
    }

    public final void dispatchDestroyView() {
        t(1);
    }

    public final void dispatchLowMemory() {
        for (int i = 0; i < this.mAdded.size(); i++) {
            Fragment fragment = (Fragment) this.mAdded.get(i);
            if (fragment != null) {
                fragment.onLowMemory();
                if (fragment.hR != null) {
                    fragment.hR.dispatchLowMemory();
                }
            }
        }
    }

    public final void dispatchMultiWindowModeChanged(boolean z) {
        for (int size = this.mAdded.size() - 1; size >= 0; size--) {
            Fragment fragment = (Fragment) this.mAdded.get(size);
            if (fragment != null && fragment.hR != null) {
                fragment.hR.dispatchMultiWindowModeChanged(z);
            }
        }
    }

    public final boolean dispatchOptionsItemSelected(MenuItem menuItem) {
        if (this.mCurState <= 0) {
            return false;
        }
        for (int i = 0; i < this.mAdded.size(); i++) {
            Fragment fragment = (Fragment) this.mAdded.get(i);
            if (fragment != null) {
                if ((fragment.mHidden || fragment.hR == null || !fragment.hR.dispatchOptionsItemSelected(menuItem)) ? false : true) {
                    return true;
                }
            }
        }
        return false;
    }

    public final void dispatchOptionsMenuClosed(Menu menu) {
        if (this.mCurState <= 0) {
            return;
        }
        for (int i = 0; i < this.mAdded.size(); i++) {
            Fragment fragment = (Fragment) this.mAdded.get(i);
            if (fragment != null && !fragment.mHidden && fragment.hR != null) {
                fragment.hR.dispatchOptionsMenuClosed(menu);
            }
        }
    }

    public final void dispatchPause() {
        t(4);
    }

    public final void dispatchPictureInPictureModeChanged(boolean z) {
        for (int size = this.mAdded.size() - 1; size >= 0; size--) {
            Fragment fragment = (Fragment) this.mAdded.get(size);
            if (fragment != null && fragment.hR != null) {
                fragment.hR.dispatchPictureInPictureModeChanged(z);
            }
        }
    }

    public final boolean dispatchPrepareOptionsMenu(Menu menu) {
        boolean zDispatchPrepareOptionsMenu;
        if (this.mCurState <= 0) {
            return false;
        }
        boolean z = false;
        for (int i = 0; i < this.mAdded.size(); i++) {
            Fragment fragment = (Fragment) this.mAdded.get(i);
            if (fragment != null) {
                if (fragment.mHidden) {
                    zDispatchPrepareOptionsMenu = false;
                } else {
                    boolean z2 = fragment.mHasMenu && fragment.mMenuVisible;
                    zDispatchPrepareOptionsMenu = fragment.hR != null ? fragment.hR.dispatchPrepareOptionsMenu(menu) | z2 : z2;
                }
                if (zDispatchPrepareOptionsMenu) {
                    z = true;
                }
            }
        }
        return z;
    }

    public final void dispatchResume() {
        this.mStateSaved = false;
        this.mStopped = false;
        t(5);
    }

    public final void dispatchStart() {
        this.mStateSaved = false;
        this.mStopped = false;
        t(4);
    }

    public final void dispatchStop() {
        this.mStopped = true;
        t(3);
    }

    @Override // android.support.v4.app.u
    public final void dump(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        int size;
        int size2;
        int size3;
        int size4;
        int size5;
        String str2 = str + "    ";
        if (this.mActive != null && (size5 = this.mActive.size()) > 0) {
            printWriter.print(str);
            printWriter.print("Active Fragments in ");
            printWriter.print(Integer.toHexString(System.identityHashCode(this)));
            printWriter.println(":");
            for (int i = 0; i < size5; i++) {
                Fragment fragment = (Fragment) this.mActive.valueAt(i);
                printWriter.print(str);
                printWriter.print("  #");
                printWriter.print(i);
                printWriter.print(": ");
                printWriter.println(fragment);
                if (fragment != null) {
                    printWriter.print(str2);
                    printWriter.print("mFragmentId=#");
                    printWriter.print(Integer.toHexString(fragment.mFragmentId));
                    printWriter.print(" mContainerId=#");
                    printWriter.print(Integer.toHexString(fragment.mContainerId));
                    printWriter.print(" mTag=");
                    printWriter.println(fragment.mTag);
                    printWriter.print(str2);
                    printWriter.print("mState=");
                    printWriter.print(fragment.mState);
                    printWriter.print(" mIndex=");
                    printWriter.print(fragment.mIndex);
                    printWriter.print(" mWho=");
                    printWriter.print(fragment.mWho);
                    printWriter.print(" mBackStackNesting=");
                    printWriter.println(fragment.mBackStackNesting);
                    printWriter.print(str2);
                    printWriter.print("mAdded=");
                    printWriter.print(fragment.mAdded);
                    printWriter.print(" mRemoving=");
                    printWriter.print(fragment.mRemoving);
                    printWriter.print(" mFromLayout=");
                    printWriter.print(fragment.mFromLayout);
                    printWriter.print(" mInLayout=");
                    printWriter.println(fragment.mInLayout);
                    printWriter.print(str2);
                    printWriter.print("mHidden=");
                    printWriter.print(fragment.mHidden);
                    printWriter.print(" mDetached=");
                    printWriter.print(fragment.mDetached);
                    printWriter.print(" mMenuVisible=");
                    printWriter.print(fragment.mMenuVisible);
                    printWriter.print(" mHasMenu=");
                    printWriter.println(fragment.mHasMenu);
                    printWriter.print(str2);
                    printWriter.print("mRetainInstance=");
                    printWriter.print(fragment.mRetainInstance);
                    printWriter.print(" mRetaining=");
                    printWriter.print(fragment.mRetaining);
                    printWriter.print(" mUserVisibleHint=");
                    printWriter.println(fragment.mUserVisibleHint);
                    if (fragment.hP != null) {
                        printWriter.print(str2);
                        printWriter.print("mFragmentManager=");
                        printWriter.println(fragment.hP);
                    }
                    if (fragment.hQ != null) {
                        printWriter.print(str2);
                        printWriter.print("mHost=");
                        printWriter.println(fragment.hQ);
                    }
                    if (fragment.hT != null) {
                        printWriter.print(str2);
                        printWriter.print("mParentFragment=");
                        printWriter.println(fragment.hT);
                    }
                    if (fragment.mArguments != null) {
                        printWriter.print(str2);
                        printWriter.print("mArguments=");
                        printWriter.println(fragment.mArguments);
                    }
                    if (fragment.mSavedFragmentState != null) {
                        printWriter.print(str2);
                        printWriter.print("mSavedFragmentState=");
                        printWriter.println(fragment.mSavedFragmentState);
                    }
                    if (fragment.mSavedViewState != null) {
                        printWriter.print(str2);
                        printWriter.print("mSavedViewState=");
                        printWriter.println(fragment.mSavedViewState);
                    }
                    if (fragment.hO != null) {
                        printWriter.print(str2);
                        printWriter.print("mTarget=");
                        printWriter.print(fragment.hO);
                        printWriter.print(" mTargetRequestCode=");
                        printWriter.println(fragment.mTargetRequestCode);
                    }
                    if (fragment.getNextAnim() != 0) {
                        printWriter.print(str2);
                        printWriter.print("mNextAnim=");
                        printWriter.println(fragment.getNextAnim());
                    }
                    if (fragment.mContainer != null) {
                        printWriter.print(str2);
                        printWriter.print("mContainer=");
                        printWriter.println(fragment.mContainer);
                    }
                    if (fragment.mView != null) {
                        printWriter.print(str2);
                        printWriter.print("mView=");
                        printWriter.println(fragment.mView);
                    }
                    if (fragment.hU != null) {
                        printWriter.print(str2);
                        printWriter.print("mInnerView=");
                        printWriter.println(fragment.mView);
                    }
                    if (fragment.bp() != null) {
                        printWriter.print(str2);
                        printWriter.print("mAnimatingAway=");
                        printWriter.println(fragment.bp());
                        printWriter.print(str2);
                        printWriter.print("mStateAfterAnimating=");
                        printWriter.println(fragment.getStateAfterAnimating());
                    }
                    bf.c(fragment).a(str2, printWriter);
                    if (fragment.hR != null) {
                        printWriter.print(str2);
                        printWriter.println("Child " + fragment.hR + ":");
                        fragment.hR.dump(str2 + "  ", fileDescriptor, printWriter, strArr);
                    }
                }
            }
        }
        int size6 = this.mAdded.size();
        if (size6 > 0) {
            printWriter.print(str);
            printWriter.println("Added Fragments:");
            for (int i2 = 0; i2 < size6; i2++) {
                Fragment fragment2 = (Fragment) this.mAdded.get(i2);
                printWriter.print(str);
                printWriter.print("  #");
                printWriter.print(i2);
                printWriter.print(": ");
                printWriter.println(fragment2.toString());
            }
        }
        if (this.mCreatedMenus != null && (size4 = this.mCreatedMenus.size()) > 0) {
            printWriter.print(str);
            printWriter.println("Fragments Created Menus:");
            for (int i3 = 0; i3 < size4; i3++) {
                Fragment fragment3 = (Fragment) this.mCreatedMenus.get(i3);
                printWriter.print(str);
                printWriter.print("  #");
                printWriter.print(i3);
                printWriter.print(": ");
                printWriter.println(fragment3.toString());
            }
        }
        if (this.mBackStack != null && (size3 = this.mBackStack.size()) > 0) {
            printWriter.print(str);
            printWriter.println("Back Stack:");
            for (int i4 = 0; i4 < size3; i4++) {
                c cVar = (c) this.mBackStack.get(i4);
                printWriter.print(str);
                printWriter.print("  #");
                printWriter.print(i4);
                printWriter.print(": ");
                printWriter.println(cVar.toString());
                cVar.a(str2, printWriter);
            }
        }
        synchronized (this) {
            if (this.mBackStackIndices != null && (size2 = this.mBackStackIndices.size()) > 0) {
                printWriter.print(str);
                printWriter.println("Back Stack Indices:");
                for (int i5 = 0; i5 < size2; i5++) {
                    Object obj = (c) this.mBackStackIndices.get(i5);
                    printWriter.print(str);
                    printWriter.print("  #");
                    printWriter.print(i5);
                    printWriter.print(": ");
                    printWriter.println(obj);
                }
            }
            if (this.mAvailBackStackIndices != null && this.mAvailBackStackIndices.size() > 0) {
                printWriter.print(str);
                printWriter.print("mAvailBackStackIndices: ");
                printWriter.println(Arrays.toString(this.mAvailBackStackIndices.toArray()));
            }
        }
        if (this.mPendingActions != null && (size = this.mPendingActions.size()) > 0) {
            printWriter.print(str);
            printWriter.println("Pending Actions:");
            for (int i6 = 0; i6 < size; i6++) {
                Object obj2 = (ai) this.mPendingActions.get(i6);
                printWriter.print(str);
                printWriter.print("  #");
                printWriter.print(i6);
                printWriter.print(": ");
                printWriter.println(obj2);
            }
        }
        printWriter.print(str);
        printWriter.println("FragmentManager misc state:");
        printWriter.print(str);
        printWriter.print("  mHost=");
        printWriter.println(this.hQ);
        printWriter.print(str);
        printWriter.print("  mContainer=");
        printWriter.println(this.iz);
        if (this.iA != null) {
            printWriter.print(str);
            printWriter.print("  mParent=");
            printWriter.println(this.iA);
        }
        printWriter.print(str);
        printWriter.print("  mCurState=");
        printWriter.print(this.mCurState);
        printWriter.print(" mStateSaved=");
        printWriter.print(this.mStateSaved);
        printWriter.print(" mStopped=");
        printWriter.print(this.mStopped);
        printWriter.print(" mDestroyed=");
        printWriter.println(this.mDestroyed);
        if (this.mNeedMenuInvalidate) {
            printWriter.print(str);
            printWriter.print("  mNeedMenuInvalidate=");
            printWriter.println(this.mNeedMenuInvalidate);
        }
        if (this.mNoTransactionsBecause != null) {
            printWriter.print(str);
            printWriter.print("  mNoTransactionsBecause=");
            printWriter.println(this.mNoTransactionsBecause);
        }
    }

    public final boolean execPendingActions() {
        bB();
        boolean z = false;
        while (c(this.mTmpRecords, this.mTmpIsPop)) {
            this.mExecutingActions = true;
            try {
                b(this.mTmpRecords, this.mTmpIsPop);
                bC();
                z = true;
            } catch (Throwable th) {
                bC();
                throw th;
            }
        }
        doPendingDeferredStart();
        bF();
        return z;
    }

    @Override // android.support.v4.app.u
    public final boolean executePendingTransactions() {
        boolean zExecPendingActions = execPendingActions();
        bD();
        return zExecPendingActions;
    }

    final void f(Fragment fragment) {
        if (fragment == null) {
            return;
        }
        int iMin = this.mCurState;
        if (fragment.mRemoving) {
            iMin = fragment.isInBackStack() ? Math.min(iMin, 1) : Math.min(iMin, 0);
        }
        a(fragment, iMin, fragment.getNextTransition(), fragment.getNextTransitionStyle(), false);
        if (fragment.mView != null) {
            ViewGroup viewGroup = fragment.mContainer;
            View view = fragment.mView;
            Fragment fragment2 = null;
            if (viewGroup != null && view != null) {
                for (int iIndexOf = this.mAdded.indexOf(fragment) - 1; iIndexOf >= 0; iIndexOf--) {
                    Fragment fragment3 = (Fragment) this.mAdded.get(iIndexOf);
                    if (fragment3.mContainer == viewGroup && fragment3.mView != null) {
                        fragment2 = fragment3;
                        break;
                    }
                }
            }
            if (fragment2 != null) {
                View view2 = fragment2.mView;
                ViewGroup viewGroup2 = fragment.mContainer;
                int iIndexOfChild = viewGroup2.indexOfChild(view2);
                int iIndexOfChild2 = viewGroup2.indexOfChild(fragment.mView);
                if (iIndexOfChild2 < iIndexOfChild) {
                    viewGroup2.removeViewAt(iIndexOfChild2);
                    viewGroup2.addView(fragment.mView, iIndexOfChild);
                }
            }
            if (fragment.mIsNewlyAdded && fragment.mContainer != null) {
                if (fragment.hW > 0.0f) {
                    fragment.mView.setAlpha(fragment.hW);
                }
                fragment.hW = 0.0f;
                fragment.mIsNewlyAdded = false;
                ae aeVarA = a(fragment, fragment.getNextTransition(), true, fragment.getNextTransitionStyle());
                if (aeVarA != null) {
                    a(fragment.mView, aeVarA);
                    if (aeVarA.iQ != null) {
                        fragment.mView.startAnimation(aeVarA.iQ);
                    } else {
                        aeVarA.animator.setTarget(fragment.mView);
                        aeVarA.animator.start();
                    }
                }
            }
        }
        if (fragment.mHiddenChanged) {
            if (fragment.mView != null) {
                ae aeVarA2 = a(fragment, fragment.getNextTransition(), !fragment.mHidden, fragment.getNextTransitionStyle());
                if (aeVarA2 == null || aeVarA2.animator == null) {
                    if (aeVarA2 != null) {
                        a(fragment.mView, aeVarA2);
                        fragment.mView.startAnimation(aeVarA2.iQ);
                        aeVarA2.iQ.start();
                    }
                    fragment.mView.setVisibility((!fragment.mHidden || fragment.isHideReplaced()) ? 0 : 8);
                    if (fragment.isHideReplaced()) {
                        fragment.setHideReplaced(false);
                    }
                } else {
                    aeVarA2.animator.setTarget(fragment.mView);
                    if (!fragment.mHidden) {
                        fragment.mView.setVisibility(0);
                    } else if (fragment.isHideReplaced()) {
                        fragment.setHideReplaced(false);
                    } else {
                        ViewGroup viewGroup3 = fragment.mContainer;
                        View view3 = fragment.mView;
                        viewGroup3.startViewTransition(view3);
                        aeVarA2.animator.addListener(new aa(this, viewGroup3, view3, fragment));
                    }
                    a(fragment.mView, aeVarA2);
                    aeVarA2.animator.start();
                }
            }
            if (fragment.mAdded && fragment.mHasMenu && fragment.mMenuVisible) {
                this.mNeedMenuInvalidate = true;
            }
            fragment.mHiddenChanged = false;
            boolean z = fragment.mHidden;
            Fragment.aU();
        }
    }

    final void g(Fragment fragment) {
        if (fragment.mIndex >= 0) {
            return;
        }
        int i = this.mNextFragmentIndex;
        this.mNextFragmentIndex = i + 1;
        fragment.a(i, this.iA);
        if (this.mActive == null) {
            this.mActive = new SparseArray();
        }
        this.mActive.put(fragment.mIndex, fragment);
        if (DEBUG) {
            Log.v("FragmentManager", "Allocated fragment index " + fragment);
        }
    }

    @Override // android.support.v4.app.u
    public final List getFragments() {
        List list;
        if (this.mAdded.isEmpty()) {
            return Collections.EMPTY_LIST;
        }
        synchronized (this.mAdded) {
            list = (List) this.mAdded.clone();
        }
        return list;
    }

    public final void h(Fragment fragment) {
        if (DEBUG) {
            Log.v("FragmentManager", "remove: " + fragment + " nesting=" + fragment.mBackStackNesting);
        }
        boolean z = !fragment.isInBackStack();
        if (!fragment.mDetached || z) {
            synchronized (this.mAdded) {
                this.mAdded.remove(fragment);
            }
            if (fragment.mHasMenu && fragment.mMenuVisible) {
                this.mNeedMenuInvalidate = true;
            }
            fragment.mAdded = false;
            fragment.mRemoving = true;
        }
    }

    @Override // android.support.v4.app.u
    public final boolean isStateSaved() {
        return this.mStateSaved || this.mStopped;
    }

    public final void k(Fragment fragment) {
        if (DEBUG) {
            Log.v("FragmentManager", "detach: " + fragment);
        }
        if (fragment.mDetached) {
            return;
        }
        fragment.mDetached = true;
        if (fragment.mAdded) {
            if (DEBUG) {
                Log.v("FragmentManager", "remove from detach: " + fragment);
            }
            synchronized (this.mAdded) {
                this.mAdded.remove(fragment);
            }
            if (fragment.mHasMenu && fragment.mMenuVisible) {
                this.mNeedMenuInvalidate = true;
            }
            fragment.mAdded = false;
        }
    }

    public final void l(Fragment fragment) {
        if (DEBUG) {
            Log.v("FragmentManager", "attach: " + fragment);
        }
        if (fragment.mDetached) {
            fragment.mDetached = false;
            if (fragment.mAdded) {
                return;
            }
            if (this.mAdded.contains(fragment)) {
                throw new IllegalStateException("Fragment already added: " + fragment);
            }
            if (DEBUG) {
                Log.v("FragmentManager", "add from attach: " + fragment);
            }
            synchronized (this.mAdded) {
                this.mAdded.add(fragment);
            }
            fragment.mAdded = true;
            if (fragment.mHasMenu && fragment.mMenuVisible) {
                this.mNeedMenuInvalidate = true;
            }
        }
    }

    final void moveToState(int i, boolean z) {
        if (this.hQ == null && i != 0) {
            throw new IllegalStateException("No activity");
        }
        if (z || i != this.mCurState) {
            this.mCurState = i;
            if (this.mActive != null) {
                int size = this.mAdded.size();
                for (int i2 = 0; i2 < size; i2++) {
                    f((Fragment) this.mAdded.get(i2));
                }
                int size2 = this.mActive.size();
                for (int i3 = 0; i3 < size2; i3++) {
                    Fragment fragment = (Fragment) this.mActive.valueAt(i3);
                    if (fragment != null && ((fragment.mRemoving || fragment.mDetached) && !fragment.mIsNewlyAdded)) {
                        f(fragment);
                    }
                }
                startPendingDeferredFragments();
                if (this.mNeedMenuInvalidate && this.hQ != null && this.mCurState == 5) {
                    this.hQ.bs();
                    this.mNeedMenuInvalidate = false;
                }
            }
        }
    }

    public final void n(Fragment fragment) {
        if (fragment == null || (this.mActive.get(fragment.mIndex) == fragment && (fragment.hQ == null || fragment.hP == this))) {
            this.iB = fragment;
            return;
        }
        throw new IllegalArgumentException("Fragment " + fragment + " is not an active fragment of FragmentManager " + this);
    }

    public final void noteStateNotSaved() {
        this.iD = null;
        this.mStateSaved = false;
        this.mStopped = false;
        int size = this.mAdded.size();
        for (int i = 0; i < size; i++) {
            Fragment fragment = (Fragment) this.mAdded.get(i);
            if (fragment != null && fragment.hR != null) {
                fragment.hR.noteStateNotSaved();
            }
        }
    }

    @Override // android.view.LayoutInflater.Factory2
    public final View onCreateView(View view, String str, Context context, AttributeSet attributeSet) {
        Fragment fragment;
        if (!"fragment".equals(str)) {
            return null;
        }
        String attributeValue = attributeSet.getAttributeValue(null, "class");
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, ah.Fragment);
        if (attributeValue == null) {
            attributeValue = typedArrayObtainStyledAttributes.getString(0);
        }
        String str2 = attributeValue;
        int resourceId = typedArrayObtainStyledAttributes.getResourceId(1, -1);
        String string = typedArrayObtainStyledAttributes.getString(2);
        typedArrayObtainStyledAttributes.recycle();
        if (!Fragment.a(this.hQ.getContext(), str2)) {
            return null;
        }
        int id = view != null ? view.getId() : 0;
        if (id == -1 && resourceId == -1 && string == null) {
            throw new IllegalArgumentException(attributeSet.getPositionDescription() + ": Must specify unique android:id, android:tag, or have a parent with an id for " + str2);
        }
        Fragment fragmentS = resourceId != -1 ? s(resourceId) : null;
        if (fragmentS == null && string != null) {
            fragmentS = s(string);
        }
        if (fragmentS == null && id != -1) {
            fragmentS = s(id);
        }
        if (DEBUG) {
            Log.v("FragmentManager", "onCreateView: id=0x" + Integer.toHexString(resourceId) + " fname=" + str2 + " existing=" + fragmentS);
        }
        if (fragmentS == null) {
            Fragment fragmentA = this.iz.a(context, str2, null);
            fragmentA.mFromLayout = true;
            fragmentA.mFragmentId = resourceId != 0 ? resourceId : id;
            fragmentA.mContainerId = id;
            fragmentA.mTag = string;
            fragmentA.mInLayout = true;
            fragmentA.hP = this;
            fragmentA.hQ = this.hQ;
            Bundle bundle = fragmentA.mSavedFragmentState;
            fragmentA.aY();
            a(fragmentA, true);
            fragment = fragmentA;
        } else {
            if (fragmentS.mInLayout) {
                throw new IllegalArgumentException(attributeSet.getPositionDescription() + ": Duplicate id 0x" + Integer.toHexString(resourceId) + ", tag " + string + ", or parent id 0x" + Integer.toHexString(id) + " with another fragment for " + str2);
            }
            fragmentS.mInLayout = true;
            fragmentS.hQ = this.hQ;
            if (!fragmentS.mRetaining) {
                Bundle bundle2 = fragmentS.mSavedFragmentState;
                fragmentS.aY();
            }
            fragment = fragmentS;
        }
        if (this.mCurState > 0 || !fragment.mFromLayout) {
            e(fragment);
        } else {
            a(fragment, 1, 0, 0, false);
        }
        if (fragment.mView == null) {
            throw new IllegalStateException("Fragment " + str2 + " did not create a view.");
        }
        if (resourceId != 0) {
            fragment.mView.setId(resourceId);
        }
        if (fragment.mView.getTag() == null) {
            fragment.mView.setTag(string);
        }
        return fragment.mView;
    }

    @Override // android.view.LayoutInflater.Factory
    public final View onCreateView(String str, Context context, AttributeSet attributeSet) {
        return onCreateView(null, str, context, attributeSet);
    }

    @Override // android.support.v4.app.u
    public final boolean popBackStackImmediate() {
        bz();
        return by();
    }

    public final Fragment r(String str) {
        if (this.mActive != null && str != null) {
            for (int size = this.mActive.size() - 1; size >= 0; size--) {
                Fragment fragmentR = (Fragment) this.mActive.valueAt(size);
                if (fragmentR != null) {
                    if (!str.equals(fragmentR.mWho)) {
                        fragmentR = fragmentR.hR != null ? fragmentR.hR.r(str) : null;
                    }
                    if (fragmentR != null) {
                        return fragmentR;
                    }
                }
            }
        }
        return null;
    }

    @Override // android.support.v4.app.u
    public final Fragment s(String str) {
        if (str != null) {
            for (int size = this.mAdded.size() - 1; size >= 0; size--) {
                Fragment fragment = (Fragment) this.mAdded.get(size);
                if (fragment != null && str.equals(fragment.mTag)) {
                    return fragment;
                }
            }
        }
        if (this.mActive == null || str == null) {
            return null;
        }
        for (int size2 = this.mActive.size() - 1; size2 >= 0; size2--) {
            Fragment fragment2 = (Fragment) this.mActive.valueAt(size2);
            if (fragment2 != null && str.equals(fragment2.mTag)) {
                return fragment2;
            }
        }
        return null;
    }

    final Parcelable saveAllState() {
        BackStackState[] backStackStateArr;
        int[] iArr;
        int size;
        Bundle bundle;
        Parcelable parcelableSaveAllState;
        bD();
        int size2 = this.mActive == null ? 0 : this.mActive.size();
        int i = 0;
        while (true) {
            backStackStateArr = null;
            if (i >= size2) {
                break;
            }
            Fragment fragment = (Fragment) this.mActive.valueAt(i);
            if (fragment != null) {
                if (fragment.bp() != null) {
                    int stateAfterAnimating = fragment.getStateAfterAnimating();
                    View viewBp = fragment.bp();
                    Animation animation = viewBp.getAnimation();
                    if (animation != null) {
                        animation.cancel();
                        viewBp.clearAnimation();
                    }
                    fragment.b((View) null);
                    a(fragment, stateAfterAnimating, 0, 0, false);
                } else if (fragment.getAnimator() != null) {
                    fragment.getAnimator().end();
                }
            }
            i++;
        }
        execPendingActions();
        this.mStateSaved = true;
        this.iD = null;
        if (this.mActive == null || this.mActive.size() <= 0) {
            return null;
        }
        int size3 = this.mActive.size();
        FragmentState[] fragmentStateArr = new FragmentState[size3];
        boolean z = false;
        for (int i2 = 0; i2 < size3; i2++) {
            Fragment fragment2 = (Fragment) this.mActive.valueAt(i2);
            if (fragment2 != null) {
                if (fragment2.mIndex < 0) {
                    a(new IllegalStateException("Failure saving state: active " + fragment2 + " has cleared index: " + fragment2.mIndex));
                }
                FragmentState fragmentState = new FragmentState(fragment2);
                fragmentStateArr[i2] = fragmentState;
                if (fragment2.mState <= 0 || fragmentState.mSavedFragmentState != null) {
                    fragmentState.mSavedFragmentState = fragment2.mSavedFragmentState;
                } else {
                    if (this.mStateBundle == null) {
                        this.mStateBundle = new Bundle();
                    }
                    Bundle bundle2 = this.mStateBundle;
                    if (fragment2.hR != null && (parcelableSaveAllState = fragment2.hR.saveAllState()) != null) {
                        bundle2.putParcelable("android:support:fragments", parcelableSaveAllState);
                    }
                    d(fragment2, this.mStateBundle);
                    if (this.mStateBundle.isEmpty()) {
                        bundle = null;
                    } else {
                        bundle = this.mStateBundle;
                        this.mStateBundle = null;
                    }
                    if (fragment2.mView != null) {
                        m(fragment2);
                    }
                    if (fragment2.mSavedViewState != null) {
                        if (bundle == null) {
                            bundle = new Bundle();
                        }
                        bundle.putSparseParcelableArray("android:view_state", fragment2.mSavedViewState);
                    }
                    if (!fragment2.mUserVisibleHint) {
                        if (bundle == null) {
                            bundle = new Bundle();
                        }
                        bundle.putBoolean("android:user_visible_hint", fragment2.mUserVisibleHint);
                    }
                    fragmentState.mSavedFragmentState = bundle;
                    if (fragment2.hO != null) {
                        if (fragment2.hO.mIndex < 0) {
                            a(new IllegalStateException("Failure saving state: " + fragment2 + " has target not in fragment manager: " + fragment2.hO));
                        }
                        if (fragmentState.mSavedFragmentState == null) {
                            fragmentState.mSavedFragmentState = new Bundle();
                        }
                        Bundle bundle3 = fragmentState.mSavedFragmentState;
                        Fragment fragment3 = fragment2.hO;
                        if (fragment3.mIndex < 0) {
                            a(new IllegalStateException("Fragment " + fragment3 + " is not currently in the FragmentManager"));
                        }
                        bundle3.putInt("android:target_state", fragment3.mIndex);
                        if (fragment2.mTargetRequestCode != 0) {
                            fragmentState.mSavedFragmentState.putInt("android:target_req_state", fragment2.mTargetRequestCode);
                        }
                    }
                }
                if (DEBUG) {
                    Log.v("FragmentManager", "Saved state of " + fragment2 + ": " + fragmentState.mSavedFragmentState);
                }
                z = true;
            }
        }
        if (!z) {
            if (DEBUG) {
                Log.v("FragmentManager", "saveAllState: no fragments!");
            }
            return null;
        }
        int size4 = this.mAdded.size();
        if (size4 > 0) {
            iArr = new int[size4];
            for (int i3 = 0; i3 < size4; i3++) {
                iArr[i3] = ((Fragment) this.mAdded.get(i3)).mIndex;
                if (iArr[i3] < 0) {
                    a(new IllegalStateException("Failure saving state: active " + this.mAdded.get(i3) + " has cleared index: " + iArr[i3]));
                }
                if (DEBUG) {
                    Log.v("FragmentManager", "saveAllState: adding fragment #" + i3 + ": " + this.mAdded.get(i3));
                }
            }
        } else {
            iArr = null;
        }
        if (this.mBackStack != null && (size = this.mBackStack.size()) > 0) {
            backStackStateArr = new BackStackState[size];
            for (int i4 = 0; i4 < size; i4++) {
                backStackStateArr[i4] = new BackStackState((c) this.mBackStack.get(i4));
                if (DEBUG) {
                    Log.v("FragmentManager", "saveAllState: adding back stack #" + i4 + ": " + this.mBackStack.get(i4));
                }
            }
        }
        FragmentManagerState fragmentManagerState = new FragmentManagerState();
        fragmentManagerState.iZ = fragmentStateArr;
        fragmentManagerState.mAdded = iArr;
        fragmentManagerState.ja = backStackStateArr;
        if (this.iB != null) {
            fragmentManagerState.mPrimaryNavActiveIndex = this.iB.mIndex;
        }
        fragmentManagerState.mNextFragmentIndex = this.mNextFragmentIndex;
        saveNonConfig();
        return fragmentManagerState;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder(128);
        sb.append("FragmentManager{");
        sb.append(Integer.toHexString(System.identityHashCode(this)));
        sb.append(" in ");
        android.support.v4.c.f.buildShortClassTag(this.iA != null ? this.iA : this.hQ, sb);
        sb.append("}}");
        return sb.toString();
    }
}
