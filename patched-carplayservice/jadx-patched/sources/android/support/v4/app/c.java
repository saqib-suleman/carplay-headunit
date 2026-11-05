package android.support.v4.app;

import android.util.Log;
import java.io.PrintWriter;
import java.lang.reflect.Modifier;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
final class c extends ap implements ai {
    final v hF;
    boolean mAddToBackStack;
    int mBreadCrumbShortTitleRes;
    CharSequence mBreadCrumbShortTitleText;
    int mBreadCrumbTitleRes;
    CharSequence mBreadCrumbTitleText;
    ArrayList mCommitRunnables;
    boolean mCommitted;
    int mEnterAnim;
    int mExitAnim;
    String mName;
    int mPopEnterAnim;
    int mPopExitAnim;
    ArrayList mSharedElementSourceNames;
    ArrayList mSharedElementTargetNames;
    int mTransition;
    int mTransitionStyle;
    ArrayList mOps = new ArrayList();
    boolean mAllowAddToBackStack = true;
    int mIndex = -1;
    boolean mReorderingAllowed = false;

    public c(v vVar) {
        this.hF = vVar;
    }

    private static boolean b(d dVar) {
        Fragment fragment = dVar.hG;
        return (fragment == null || !fragment.mAdded || fragment.mView == null || fragment.mDetached || fragment.mHidden || !fragment.isPostponed()) ? false : true;
    }

    final Fragment a(ArrayList arrayList, Fragment fragment) {
        Fragment fragment2 = fragment;
        int i = 0;
        while (i < this.mOps.size()) {
            d dVar = (d) this.mOps.get(i);
            switch (dVar.cmd) {
                case 1:
                case 7:
                    arrayList.add(dVar.hG);
                    break;
                case 2:
                    Fragment fragment3 = dVar.hG;
                    int i2 = fragment3.mContainerId;
                    Fragment fragment4 = fragment2;
                    int i3 = i;
                    boolean z = false;
                    for (int size = arrayList.size() - 1; size >= 0; size--) {
                        Fragment fragment5 = (Fragment) arrayList.get(size);
                        if (fragment5.mContainerId == i2) {
                            if (fragment5 == fragment3) {
                                z = true;
                            } else {
                                if (fragment5 == fragment4) {
                                    this.mOps.add(i3, new d(9, fragment5));
                                    i3++;
                                    fragment4 = null;
                                }
                                d dVar2 = new d(3, fragment5);
                                dVar2.enterAnim = dVar.enterAnim;
                                dVar2.popEnterAnim = dVar.popEnterAnim;
                                dVar2.exitAnim = dVar.exitAnim;
                                dVar2.popExitAnim = dVar.popExitAnim;
                                this.mOps.add(i3, dVar2);
                                arrayList.remove(fragment5);
                                i3++;
                            }
                        }
                    }
                    if (z) {
                        this.mOps.remove(i3);
                        i = i3 - 1;
                    } else {
                        dVar.cmd = 1;
                        arrayList.add(fragment3);
                        i = i3;
                    }
                    fragment2 = fragment4;
                    break;
                case 3:
                case 6:
                    arrayList.remove(dVar.hG);
                    if (dVar.hG == fragment2) {
                        this.mOps.add(i, new d(9, dVar.hG));
                        i++;
                        fragment2 = null;
                    }
                    break;
                case 8:
                    this.mOps.add(i, new d(9, fragment2));
                    i++;
                    fragment2 = dVar.hG;
                    break;
            }
            i++;
        }
        return fragment2;
    }

    @Override // android.support.v4.app.ap
    public final ap a(int i, Fragment fragment, String str) {
        Class<?> cls = fragment.getClass();
        int modifiers = cls.getModifiers();
        if (cls.isAnonymousClass() || !Modifier.isPublic(modifiers) || (cls.isMemberClass() && !Modifier.isStatic(modifiers))) {
            throw new IllegalStateException("Fragment " + cls.getCanonicalName() + " must be a public static class to be  properly recreated from instance state.");
        }
        fragment.hP = this.hF;
        if (str != null) {
            if (fragment.mTag != null && !str.equals(fragment.mTag)) {
                throw new IllegalStateException("Can't change tag of fragment " + fragment + ": was " + fragment.mTag + " now " + str);
            }
            fragment.mTag = str;
        }
        if (i != 0) {
            if (i == -1) {
                throw new IllegalArgumentException("Can't add fragment " + fragment + " with tag " + str + " to container view with no id");
            }
            if (fragment.mFragmentId != 0 && fragment.mFragmentId != i) {
                throw new IllegalStateException("Can't change container ID of fragment " + fragment + ": was " + fragment.mFragmentId + " now " + i);
            }
            fragment.mFragmentId = i;
            fragment.mContainerId = i;
        }
        a(new d(1, fragment));
        return this;
    }

    @Override // android.support.v4.app.ap
    public final ap a(Fragment fragment) {
        a(new d(6, fragment));
        return this;
    }

    final void a(d dVar) {
        this.mOps.add(dVar);
        dVar.enterAnim = this.mEnterAnim;
        dVar.exitAnim = this.mExitAnim;
        dVar.popEnterAnim = this.mPopEnterAnim;
        dVar.popExitAnim = this.mPopExitAnim;
    }

    final void a(l lVar) {
        for (int i = 0; i < this.mOps.size(); i++) {
            d dVar = (d) this.mOps.get(i);
            if (b(dVar)) {
                dVar.hG.b(lVar);
            }
        }
    }

    public final void a(String str, PrintWriter printWriter) {
        dump(str, printWriter, true);
    }

    /* JADX WARN: Code duplicated, block: B:13:0x0022  */
    /* JADX WARN: Code duplicated, block: B:14:0x0028  */
    final Fragment b(ArrayList arrayList, Fragment fragment) {
        for (int i = 0; i < this.mOps.size(); i++) {
            d dVar = (d) this.mOps.get(i);
            int i2 = dVar.cmd;
            if (i2 == 1) {
                arrayList.remove(dVar.hG);
            } else if (i2 != 3) {
                switch (i2) {
                    case 6:
                        arrayList.add(dVar.hG);
                        break;
                    case 7:
                        arrayList.remove(dVar.hG);
                        break;
                    case 8:
                        fragment = null;
                        break;
                    case 9:
                        fragment = dVar.hG;
                        break;
                }
            } else {
                arrayList.add(dVar.hG);
            }
        }
        return fragment;
    }

    @Override // android.support.v4.app.ap
    public final ap b(Fragment fragment) {
        a(new d(7, fragment));
        return this;
    }

    final void bumpBackStackNesting(int i) {
        if (this.mAddToBackStack) {
            if (v.DEBUG) {
                Log.v("FragmentManager", "Bump nesting in " + this + " by " + i);
            }
            int size = this.mOps.size();
            for (int i2 = 0; i2 < size; i2++) {
                d dVar = (d) this.mOps.get(i2);
                if (dVar.hG != null) {
                    dVar.hG.mBackStackNesting += i;
                    if (v.DEBUG) {
                        Log.v("FragmentManager", "Bump nesting of " + dVar.hG + " to " + dVar.hG.mBackStackNesting);
                    }
                }
            }
        }
    }

    @Override // android.support.v4.app.ap
    public final int commit() {
        if (this.mCommitted) {
            throw new IllegalStateException("commit already called");
        }
        if (v.DEBUG) {
            Log.v("FragmentManager", "Commit: " + this);
            PrintWriter printWriter = new PrintWriter(new android.support.v4.c.g("FragmentManager"));
            a("  ", printWriter);
            printWriter.close();
        }
        this.mCommitted = true;
        this.mIndex = this.mAddToBackStack ? this.hF.a(this) : -1;
        this.hF.a((ai) this);
        return this.mIndex;
    }

    public final void dump(String str, PrintWriter printWriter, boolean z) {
        String str2;
        if (z) {
            printWriter.print(str);
            printWriter.print("mName=");
            printWriter.print(this.mName);
            printWriter.print(" mIndex=");
            printWriter.print(this.mIndex);
            printWriter.print(" mCommitted=");
            printWriter.println(this.mCommitted);
            if (this.mTransition != 0) {
                printWriter.print(str);
                printWriter.print("mTransition=#");
                printWriter.print(Integer.toHexString(this.mTransition));
                printWriter.print(" mTransitionStyle=#");
                printWriter.println(Integer.toHexString(this.mTransitionStyle));
            }
            if (this.mEnterAnim != 0 || this.mExitAnim != 0) {
                printWriter.print(str);
                printWriter.print("mEnterAnim=#");
                printWriter.print(Integer.toHexString(this.mEnterAnim));
                printWriter.print(" mExitAnim=#");
                printWriter.println(Integer.toHexString(this.mExitAnim));
            }
            if (this.mPopEnterAnim != 0 || this.mPopExitAnim != 0) {
                printWriter.print(str);
                printWriter.print("mPopEnterAnim=#");
                printWriter.print(Integer.toHexString(this.mPopEnterAnim));
                printWriter.print(" mPopExitAnim=#");
                printWriter.println(Integer.toHexString(this.mPopExitAnim));
            }
            if (this.mBreadCrumbTitleRes != 0 || this.mBreadCrumbTitleText != null) {
                printWriter.print(str);
                printWriter.print("mBreadCrumbTitleRes=#");
                printWriter.print(Integer.toHexString(this.mBreadCrumbTitleRes));
                printWriter.print(" mBreadCrumbTitleText=");
                printWriter.println(this.mBreadCrumbTitleText);
            }
            if (this.mBreadCrumbShortTitleRes != 0 || this.mBreadCrumbShortTitleText != null) {
                printWriter.print(str);
                printWriter.print("mBreadCrumbShortTitleRes=#");
                printWriter.print(Integer.toHexString(this.mBreadCrumbShortTitleRes));
                printWriter.print(" mBreadCrumbShortTitleText=");
                printWriter.println(this.mBreadCrumbShortTitleText);
            }
        }
        if (this.mOps.isEmpty()) {
            return;
        }
        printWriter.print(str);
        printWriter.println("Operations:");
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append("    ");
        int size = this.mOps.size();
        for (int i = 0; i < size; i++) {
            d dVar = (d) this.mOps.get(i);
            switch (dVar.cmd) {
                case 0:
                    str2 = "NULL";
                    break;
                case 1:
                    str2 = "ADD";
                    break;
                case 2:
                    str2 = "REPLACE";
                    break;
                case 3:
                    str2 = "REMOVE";
                    break;
                case 4:
                    str2 = "HIDE";
                    break;
                case 5:
                    str2 = "SHOW";
                    break;
                case 6:
                    str2 = "DETACH";
                    break;
                case 7:
                    str2 = "ATTACH";
                    break;
                case 8:
                    str2 = "SET_PRIMARY_NAV";
                    break;
                case 9:
                    str2 = "UNSET_PRIMARY_NAV";
                    break;
                default:
                    str2 = "cmd=" + dVar.cmd;
                    break;
            }
            printWriter.print(str);
            printWriter.print("  Op #");
            printWriter.print(i);
            printWriter.print(": ");
            printWriter.print(str2);
            printWriter.print(" ");
            printWriter.println(dVar.hG);
            if (z) {
                if (dVar.enterAnim != 0 || dVar.exitAnim != 0) {
                    printWriter.print(str);
                    printWriter.print("enterAnim=#");
                    printWriter.print(Integer.toHexString(dVar.enterAnim));
                    printWriter.print(" exitAnim=#");
                    printWriter.println(Integer.toHexString(dVar.exitAnim));
                }
                if (dVar.popEnterAnim != 0 || dVar.popExitAnim != 0) {
                    printWriter.print(str);
                    printWriter.print("popEnterAnim=#");
                    printWriter.print(Integer.toHexString(dVar.popEnterAnim));
                    printWriter.print(" popExitAnim=#");
                    printWriter.println(Integer.toHexString(dVar.popExitAnim));
                }
            }
        }
    }

    final void executeOps() {
        int size = this.mOps.size();
        for (int i = 0; i < size; i++) {
            d dVar = (d) this.mOps.get(i);
            Fragment fragment = dVar.hG;
            if (fragment != null) {
                fragment.setNextTransition(this.mTransition, this.mTransitionStyle);
            }
            int i2 = dVar.cmd;
            if (i2 != 1) {
                switch (i2) {
                    case 3:
                        fragment.setNextAnim(dVar.exitAnim);
                        this.hF.h(fragment);
                        break;
                    case 4:
                        fragment.setNextAnim(dVar.exitAnim);
                        v.i(fragment);
                        break;
                    case 5:
                        fragment.setNextAnim(dVar.enterAnim);
                        v.j(fragment);
                        break;
                    case 6:
                        fragment.setNextAnim(dVar.exitAnim);
                        this.hF.k(fragment);
                        break;
                    case 7:
                        fragment.setNextAnim(dVar.enterAnim);
                        this.hF.l(fragment);
                        break;
                    case 8:
                        this.hF.n(fragment);
                        break;
                    case 9:
                        this.hF.n(null);
                        break;
                    default:
                        throw new IllegalArgumentException("Unknown cmd: " + dVar.cmd);
                }
            } else {
                fragment.setNextAnim(dVar.enterAnim);
                this.hF.a(fragment, false);
            }
            if (!this.mReorderingAllowed && dVar.cmd != 1 && fragment != null) {
                this.hF.f(fragment);
            }
        }
        if (this.mReorderingAllowed) {
            return;
        }
        this.hF.moveToState(this.hF.mCurState, true);
    }

    final void executePopOps(boolean z) {
        for (int size = this.mOps.size() - 1; size >= 0; size--) {
            d dVar = (d) this.mOps.get(size);
            Fragment fragment = dVar.hG;
            if (fragment != null) {
                fragment.setNextTransition(v.reverseTransit(this.mTransition), this.mTransitionStyle);
            }
            int i = dVar.cmd;
            if (i != 1) {
                switch (i) {
                    case 3:
                        fragment.setNextAnim(dVar.popEnterAnim);
                        this.hF.a(fragment, false);
                        break;
                    case 4:
                        fragment.setNextAnim(dVar.popEnterAnim);
                        v.j(fragment);
                        break;
                    case 5:
                        fragment.setNextAnim(dVar.popExitAnim);
                        v.i(fragment);
                        break;
                    case 6:
                        fragment.setNextAnim(dVar.popEnterAnim);
                        this.hF.l(fragment);
                        break;
                    case 7:
                        fragment.setNextAnim(dVar.popExitAnim);
                        this.hF.k(fragment);
                        break;
                    case 8:
                        this.hF.n(null);
                        break;
                    case 9:
                        this.hF.n(fragment);
                        break;
                    default:
                        throw new IllegalArgumentException("Unknown cmd: " + dVar.cmd);
                }
            } else {
                fragment.setNextAnim(dVar.popExitAnim);
                this.hF.h(fragment);
            }
            if (!this.mReorderingAllowed && dVar.cmd != 3 && fragment != null) {
                this.hF.f(fragment);
            }
        }
        if (this.mReorderingAllowed || !z) {
            return;
        }
        this.hF.moveToState(this.hF.mCurState, true);
    }

    @Override // android.support.v4.app.ai
    public final boolean generateOps(ArrayList arrayList, ArrayList arrayList2) {
        if (v.DEBUG) {
            Log.v("FragmentManager", "Run: " + this);
        }
        arrayList.add(this);
        arrayList2.add(false);
        if (!this.mAddToBackStack) {
            return true;
        }
        v vVar = this.hF;
        if (vVar.mBackStack == null) {
            vVar.mBackStack = new ArrayList();
        }
        vVar.mBackStack.add(this);
        return true;
    }

    final boolean interactsWith(int i) {
        int size = this.mOps.size();
        for (int i2 = 0; i2 < size; i2++) {
            d dVar = (d) this.mOps.get(i2);
            int i3 = dVar.hG != null ? dVar.hG.mContainerId : 0;
            if (i3 != 0 && i3 == i) {
                return true;
            }
        }
        return false;
    }

    final boolean interactsWith(ArrayList arrayList, int i, int i2) {
        if (i2 == i) {
            return false;
        }
        int size = this.mOps.size();
        int i3 = -1;
        for (int i4 = 0; i4 < size; i4++) {
            d dVar = (d) this.mOps.get(i4);
            int i5 = dVar.hG != null ? dVar.hG.mContainerId : 0;
            if (i5 != 0 && i5 != i3) {
                for (int i6 = i; i6 < i2; i6++) {
                    c cVar = (c) arrayList.get(i6);
                    int size2 = cVar.mOps.size();
                    for (int i7 = 0; i7 < size2; i7++) {
                        d dVar2 = (d) cVar.mOps.get(i7);
                        if ((dVar2.hG != null ? dVar2.hG.mContainerId : 0) == i5) {
                            return true;
                        }
                    }
                }
                i3 = i5;
            }
        }
        return false;
    }

    final boolean isPostponed() {
        for (int i = 0; i < this.mOps.size(); i++) {
            if (b((d) this.mOps.get(i))) {
                return true;
            }
        }
        return false;
    }

    public final void runOnCommitRunnables() {
        if (this.mCommitRunnables != null) {
            int size = this.mCommitRunnables.size();
            for (int i = 0; i < size; i++) {
                ((Runnable) this.mCommitRunnables.get(i)).run();
            }
            this.mCommitRunnables = null;
        }
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder(128);
        sb.append("BackStackEntry{");
        sb.append(Integer.toHexString(System.identityHashCode(this)));
        if (this.mIndex >= 0) {
            sb.append(" #");
            sb.append(this.mIndex);
        }
        if (this.mName != null) {
            sb.append(" ");
            sb.append(this.mName);
        }
        sb.append("}");
        return sb.toString();
    }
}
