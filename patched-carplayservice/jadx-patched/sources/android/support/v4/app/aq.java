package android.support.v4.app;

import android.graphics.Rect;
import android.os.Build;
import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
final class aq {
    private static final int[] jk = {0, 3, 0, 1, 5, 4, 7, 6, 9, 8};
    private static final bb jl;
    private static final bb jm;

    static {
        jl = Build.VERSION.SDK_INT >= 21 ? new aw() : null;
        jm = bH();
    }

    private static av a(av avVar, SparseArray sparseArray, int i) {
        if (avVar != null) {
            return avVar;
        }
        av avVar2 = new av();
        sparseArray.put(i, avVar2);
        return avVar2;
    }

    private static bb a(Fragment fragment, Fragment fragment2) {
        ArrayList arrayList = new ArrayList();
        if (fragment != null) {
            Object objBf = fragment.bf();
            if (objBf != null) {
                arrayList.add(objBf);
            }
            Object objBe = fragment.be();
            if (objBe != null) {
                arrayList.add(objBe);
            }
            Object objBi = fragment.bi();
            if (objBi != null) {
                arrayList.add(objBi);
            }
        }
        if (fragment2 != null) {
            Object objBd = fragment2.bd();
            if (objBd != null) {
                arrayList.add(objBd);
            }
            Object objBg = fragment2.bg();
            if (objBg != null) {
                arrayList.add(objBg);
            }
            Object objBh = fragment2.bh();
            if (objBh != null) {
                arrayList.add(objBh);
            }
        }
        if (arrayList.isEmpty()) {
            return null;
        }
        if (jl != null && a(jl, arrayList)) {
            return jl;
        }
        if (jm != null && a(jm, arrayList)) {
            return jm;
        }
        if (jl == null && jm == null) {
            return null;
        }
        throw new IllegalArgumentException("Invalid Transition types");
    }

    private static android.support.v4.c.a a(int i, ArrayList arrayList, ArrayList arrayList2, int i2, int i3) {
        ArrayList arrayList3;
        ArrayList arrayList4;
        android.support.v4.c.a aVar = new android.support.v4.c.a();
        for (int i4 = i3 - 1; i4 >= i2; i4--) {
            c cVar = (c) arrayList.get(i4);
            if (cVar.interactsWith(i)) {
                boolean zBooleanValue = ((Boolean) arrayList2.get(i4)).booleanValue();
                if (cVar.mSharedElementSourceNames != null) {
                    int size = cVar.mSharedElementSourceNames.size();
                    if (zBooleanValue) {
                        arrayList3 = cVar.mSharedElementSourceNames;
                        arrayList4 = cVar.mSharedElementTargetNames;
                    } else {
                        ArrayList arrayList5 = cVar.mSharedElementSourceNames;
                        arrayList3 = cVar.mSharedElementTargetNames;
                        arrayList4 = arrayList5;
                    }
                    for (int i5 = 0; i5 < size; i5++) {
                        String str = (String) arrayList4.get(i5);
                        String str2 = (String) arrayList3.get(i5);
                        String str3 = (String) aVar.remove(str2);
                        if (str3 != null) {
                            aVar.put(str, str3);
                        } else {
                            aVar.put(str, str2);
                        }
                    }
                }
            }
        }
        return aVar;
    }

    private static android.support.v4.c.a a(bb bbVar, android.support.v4.c.a aVar, Object obj, av avVar) {
        bl blVarBo;
        ArrayList arrayList;
        if (aVar.isEmpty() || obj == null) {
            aVar.clear();
            return null;
        }
        Fragment fragment = avVar.jH;
        android.support.v4.c.a aVar2 = new android.support.v4.c.a();
        bbVar.a((Map) aVar2, fragment.mView);
        c cVar = avVar.jI;
        if (avVar.firstOutIsPop) {
            blVarBo = fragment.bn();
            arrayList = cVar.mSharedElementTargetNames;
        } else {
            blVarBo = fragment.bo();
            arrayList = cVar.mSharedElementSourceNames;
        }
        aVar2.retainAll(arrayList);
        if (blVarBo != null) {
            for (int size = arrayList.size() - 1; size >= 0; size--) {
                String str = (String) arrayList.get(size);
                View view = (View) aVar2.get(str);
                if (view == null) {
                    aVar.remove(str);
                } else if (!str.equals(android.support.v4.view.n.h(view))) {
                    aVar.put(android.support.v4.view.n.h(view), (String) aVar.remove(str));
                }
            }
        } else {
            aVar.retainAll(aVar2.keySet());
        }
        return aVar2;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static View a(android.support.v4.c.a aVar, av avVar, Object obj, boolean z) {
        c cVar = avVar.jG;
        if (obj == null || aVar == null || cVar.mSharedElementSourceNames == null || cVar.mSharedElementSourceNames.isEmpty()) {
            return null;
        }
        return (View) aVar.get((String) (z ? cVar.mSharedElementSourceNames : cVar.mSharedElementTargetNames).get(0));
    }

    private static Object a(bb bbVar, Fragment fragment, Fragment fragment2, boolean z) {
        if (fragment == null || fragment2 == null) {
            return null;
        }
        return bbVar.g(bbVar.f(z ? fragment2.bi() : fragment.bh()));
    }

    private static Object a(bb bbVar, Fragment fragment, boolean z) {
        if (fragment == null) {
            return null;
        }
        return bbVar.f(z ? fragment.bg() : fragment.bd());
    }

    private static Object a(bb bbVar, Object obj, Object obj2, Object obj3, Fragment fragment, boolean z) {
        Boolean bool;
        boolean zBooleanValue = true;
        if (obj != null && obj2 != null && fragment != null) {
            if (z) {
                if (fragment.hV != null && fragment.hV.ik != null) {
                    bool = fragment.hV.ik;
                    zBooleanValue = bool.booleanValue();
                }
            } else if (fragment.hV != null && fragment.hV.il != null) {
                bool = fragment.hV.il;
                zBooleanValue = bool.booleanValue();
            }
        }
        return zBooleanValue ? bbVar.a(obj2, obj, obj3) : bbVar.b(obj2, obj, obj3);
    }

    private static String a(android.support.v4.c.a aVar, String str) {
        int size = aVar.size();
        for (int i = 0; i < size; i++) {
            if (str.equals(aVar.valueAt(i))) {
                return (String) aVar.keyAt(i);
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static ArrayList a(bb bbVar, Object obj, Fragment fragment, ArrayList arrayList, View view) {
        if (obj == null) {
            return null;
        }
        ArrayList arrayList2 = new ArrayList();
        View view2 = fragment.mView;
        if (view2 != null) {
            bbVar.a(arrayList2, view2);
        }
        if (arrayList != null) {
            arrayList2.removeAll(arrayList);
        }
        if (arrayList2.isEmpty()) {
            return arrayList2;
        }
        arrayList2.add(view);
        bbVar.a(obj, arrayList2);
        return arrayList2;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void a(Fragment fragment, Fragment fragment2, boolean z, android.support.v4.c.a aVar) {
        if ((z ? fragment2.bn() : fragment.bn()) != null) {
            ArrayList arrayList = new ArrayList();
            ArrayList arrayList2 = new ArrayList();
            int size = aVar == null ? 0 : aVar.size();
            for (int i = 0; i < size; i++) {
                arrayList2.add(aVar.keyAt(i));
                arrayList.add(aVar.valueAt(i));
            }
        }
    }

    private static void a(bb bbVar, Object obj, Object obj2, android.support.v4.c.a aVar, boolean z, c cVar) {
        if (cVar.mSharedElementSourceNames == null || cVar.mSharedElementSourceNames.isEmpty()) {
            return;
        }
        View view = (View) aVar.get((String) (z ? cVar.mSharedElementTargetNames : cVar.mSharedElementSourceNames).get(0));
        bbVar.a(obj, view);
        if (obj2 != null) {
            bbVar.a(obj2, view);
        }
    }

    /* JADX WARN: Code duplicated, block: B:46:0x0065  */
    /* JADX WARN: Code duplicated, block: B:47:0x0067  */
    /* JADX WARN: Code duplicated, block: B:54:0x0076 A[DONT_INVERT] */
    /* JADX WARN: Code duplicated, block: B:55:0x0078  */
    /* JADX WARN: Code duplicated, block: B:56:0x007b  */
    /* JADX WARN: Code duplicated, block: B:60:0x0083  */
    /* JADX WARN: Code duplicated, block: B:61:0x0085  */
    private static void a(c cVar, d dVar, SparseArray sparseArray, boolean z, boolean z2) {
        int i;
        boolean z3;
        boolean z4;
        boolean z5;
        boolean z6;
        Fragment fragment = dVar.hG;
        if (fragment == null || (i = fragment.mContainerId) == 0) {
            return;
        }
        int i2 = z ? jk[dVar.cmd] : dVar.cmd;
        boolean z7 = false;
        boolean z8 = true;
        if (i2 != 1) {
            switch (i2) {
                case 3:
                case 6:
                    if (!z2 ? !(!fragment.mAdded || fragment.mHidden) : !(fragment.mAdded || fragment.mView == null || fragment.mView.getVisibility() != 0 || fragment.hW < 0.0f)) {
                        z6 = false;
                    } else {
                        z6 = true;
                    }
                    z4 = z6;
                    z5 = true;
                    z8 = false;
                    break;
                case 4:
                    if (!z2 ? !(!fragment.mAdded || fragment.mHidden) : fragment.mHiddenChanged && fragment.mAdded && fragment.mHidden) {
                        z6 = false;
                    } else {
                        z6 = true;
                    }
                    z4 = z6;
                    z5 = true;
                    z8 = false;
                    break;
                case 5:
                    if (!z2) {
                        z3 = fragment.mHidden;
                    } else if (fragment.mHiddenChanged && !fragment.mHidden && fragment.mAdded) {
                        z3 = true;
                    } else {
                        z3 = false;
                    }
                    z4 = false;
                    z7 = z3;
                    z5 = false;
                    break;
                case 7:
                    if (z2) {
                        z3 = fragment.mIsNewlyAdded;
                    } else if (!fragment.mAdded || fragment.mHidden) {
                        z3 = false;
                    } else {
                        z3 = true;
                    }
                    z4 = false;
                    z7 = z3;
                    z5 = false;
                    break;
                default:
                    z5 = false;
                    z8 = false;
                    z4 = false;
                    break;
            }
        } else {
            if (z2) {
                z3 = fragment.mIsNewlyAdded;
            } else {
                if (fragment.mAdded) {
                }
                z3 = false;
            }
            z4 = false;
            z7 = z3;
            z5 = false;
        }
        av avVarA = (av) sparseArray.get(i);
        if (z7) {
            avVarA = a(avVarA, sparseArray, i);
            avVarA.jF = fragment;
            avVarA.lastInIsPop = z;
            avVarA.jG = cVar;
        }
        av avVarA2 = avVarA;
        if (!z2 && z8) {
            if (avVarA2 != null && avVarA2.jH == fragment) {
                avVarA2.jH = null;
            }
            v vVar = cVar.hF;
            if (fragment.mState <= 0 && vVar.mCurState > 0 && !cVar.mReorderingAllowed) {
                vVar.g(fragment);
                vVar.a(fragment, 1, 0, 0, false);
            }
        }
        if (z4 && (avVarA2 == null || avVarA2.jH == null)) {
            avVarA2 = a(avVarA2, sparseArray, i);
            avVarA2.jH = fragment;
            avVarA2.firstOutIsPop = z;
            avVarA2.jI = cVar;
        }
        if (z2 || !z5 || avVarA2 == null || avVarA2.jF != fragment) {
            return;
        }
        avVarA2.jF = null;
    }

    private static void a(c cVar, SparseArray sparseArray, boolean z) {
        int size = cVar.mOps.size();
        for (int i = 0; i < size; i++) {
            a(cVar, (d) cVar.mOps.get(i), sparseArray, false, z);
        }
    }

    /* JADX WARN: Code duplicated, block: B:111:0x0305  */
    /* JADX WARN: Code duplicated, block: B:113:0x030f  */
    /* JADX WARN: Code duplicated, block: B:115:0x0315  */
    /* JADX WARN: Code duplicated, block: B:118:0x032b  */
    /* JADX WARN: Code duplicated, block: B:128:0x036f A[SYNTHETIC] */
    /* JADX WARN: Code duplicated, block: B:62:0x015f  */
    /* JADX WARN: Code duplicated, block: B:64:0x0181  */
    /* JADX WARN: Code duplicated, block: B:65:0x0183 A[ADDED_TO_REGION] */
    static void a(v vVar, ArrayList arrayList, ArrayList arrayList2, int i, int i2, boolean z) {
        SparseArray sparseArray;
        int i3;
        boolean z2;
        Fragment fragment;
        Fragment fragment2;
        bb bbVarA;
        Fragment fragment3;
        Fragment fragment4;
        ArrayList arrayList3;
        Object obj;
        Object obj2;
        av avVar;
        ArrayList arrayList4;
        android.support.v4.c.a aVar;
        Object obj3;
        Object obj4;
        ArrayList arrayListA;
        Object objA;
        Object obj5;
        ArrayList arrayList5;
        android.support.v4.c.a aVar2;
        boolean z3;
        Fragment fragment5;
        Fragment fragment6;
        ArrayList arrayList6;
        Rect rect;
        Fragment fragment7;
        Fragment fragment8;
        bb bbVarA2;
        Fragment fragment9;
        Object obj6;
        ArrayList arrayListA2;
        ArrayList arrayListA3;
        Object objA2;
        View view;
        Rect rect2;
        v vVar2 = vVar;
        ArrayList arrayList7 = arrayList;
        ArrayList arrayList8 = arrayList2;
        int i4 = i2;
        boolean z4 = z;
        if (vVar2.mCurState <= 0) {
            return;
        }
        SparseArray sparseArray2 = new SparseArray();
        for (int i5 = i; i5 < i4; i5++) {
            c cVar = (c) arrayList7.get(i5);
            if (((Boolean) arrayList8.get(i5)).booleanValue()) {
                b(cVar, sparseArray2, z4);
            } else {
                a(cVar, sparseArray2, z4);
            }
        }
        if (sparseArray2.size() != 0) {
            View view2 = new View(vVar2.hQ.getContext());
            int size = sparseArray2.size();
            int i6 = 0;
            while (i6 < size) {
                int iKeyAt = sparseArray2.keyAt(i6);
                android.support.v4.c.a aVarA = a(iKeyAt, arrayList7, arrayList8, i, i4);
                av avVar2 = (av) sparseArray2.valueAt(i6);
                if (z4) {
                    ViewGroup viewGroup = vVar2.iz.onHasView() ? (ViewGroup) vVar2.iz.onFindViewById(iKeyAt) : null;
                    if (viewGroup == null || (bbVarA2 = a((fragment8 = avVar2.jH), (fragment7 = avVar2.jF))) == null) {
                        sparseArray = sparseArray2;
                        i3 = i6;
                        size = size;
                    } else {
                        boolean z5 = avVar2.lastInIsPop;
                        boolean z6 = avVar2.firstOutIsPop;
                        ArrayList arrayList9 = new ArrayList();
                        ArrayList arrayList10 = new ArrayList();
                        sparseArray = sparseArray2;
                        Object objA3 = a(bbVarA2, fragment7, z5);
                        Object objB = b(bbVarA2, fragment8, z6);
                        Fragment fragment10 = avVar2.jF;
                        i3 = i6;
                        Fragment fragment11 = avVar2.jH;
                        if (fragment10 != null) {
                            fragment10.mView.setVisibility(0);
                        }
                        if (fragment10 == null || fragment11 == null) {
                            z5 = z5;
                            fragment9 = fragment7;
                        } else {
                            boolean z7 = avVar2.lastInIsPop;
                            Object objA4 = aVarA.isEmpty() ? null : a(bbVarA2, fragment10, fragment11, z7);
                            android.support.v4.c.a aVarA2 = a(bbVarA2, aVarA, objA4, avVar2);
                            fragment9 = fragment7;
                            android.support.v4.c.a aVarB = b(bbVarA2, aVarA, objA4, avVar2);
                            if (aVarA.isEmpty()) {
                                if (aVarA2 != null) {
                                    aVarA2.clear();
                                }
                                if (aVarB != null) {
                                    aVarB.clear();
                                }
                                obj6 = null;
                            } else {
                                a(arrayList10, aVarA2, aVarA.keySet());
                                a(arrayList9, aVarB, aVarA.values());
                                obj6 = objA4;
                            }
                            if (objA3 != null || objB != null || obj6 != null) {
                                a(fragment10, fragment11, z7, aVarA2);
                                if (obj6 != null) {
                                    arrayList9.add(view2);
                                    bbVarA2.a(obj6, view2, arrayList10);
                                    a(bbVarA2, obj6, objB, aVarA2, avVar2.firstOutIsPop, avVar2.jI);
                                    Rect rect3 = new Rect();
                                    View viewA = a(aVarB, avVar2, objA3, z7);
                                    if (viewA != null) {
                                        bbVarA2.a(objA3, rect3);
                                    }
                                    rect2 = rect3;
                                    view = viewA;
                                } else {
                                    view = null;
                                    rect2 = null;
                                }
                                bk.a(viewGroup, new at(fragment10, fragment11, z7, aVarB, view, bbVarA2, rect2));
                            }
                            if (objA3 == null || obj6 != null || objB != null) {
                                arrayListA2 = a(bbVarA2, objB, fragment8, arrayList10, view2);
                                Fragment fragment12 = fragment9;
                                arrayListA3 = a(bbVarA2, objA3, fragment12, arrayList9, view2);
                                a(arrayListA3, 4);
                                objA2 = a(bbVarA2, objA3, objB, obj6, fragment12, z5);
                                if (objA2 != null) {
                                    if (fragment8 != null && objB != null && fragment8.mAdded && fragment8.mHidden && fragment8.mHiddenChanged) {
                                        fragment8.setHideReplaced(true);
                                        bbVarA2.b(objB, fragment8.mView, arrayListA2);
                                        bk.a(fragment8.mContainer, new ar(arrayListA2));
                                    }
                                    ArrayList arrayListB = bb.b(arrayList9);
                                    bbVarA2.a(objA2, objA3, arrayListA3, objB, arrayListA2, obj6, arrayList9);
                                    bbVarA2.a(viewGroup, objA2);
                                    bbVarA2.a(viewGroup, arrayList10, arrayList9, arrayListB, aVarA);
                                    z2 = false;
                                    a(arrayListA3, 0);
                                    bbVarA2.a(obj6, arrayList10, arrayList9);
                                }
                            }
                        }
                        aVarA = aVarA;
                        obj6 = null;
                        if (objA3 == null) {
                            arrayListA2 = a(bbVarA2, objB, fragment8, arrayList10, view2);
                            Fragment fragment13 = fragment9;
                            arrayListA3 = a(bbVarA2, objA3, fragment13, arrayList9, view2);
                            a(arrayListA3, 4);
                            objA2 = a(bbVarA2, objA3, objB, obj6, fragment13, z5);
                            if (objA2 != null) {
                                if (fragment8 != null) {
                                    fragment8.setHideReplaced(true);
                                    bbVarA2.b(objB, fragment8.mView, arrayListA2);
                                    bk.a(fragment8.mContainer, new ar(arrayListA2));
                                }
                                ArrayList arrayListB2 = bb.b(arrayList9);
                                bbVarA2.a(objA2, objA3, arrayListA3, objB, arrayListA2, obj6, arrayList9);
                                bbVarA2.a(viewGroup, objA2);
                                bbVarA2.a(viewGroup, arrayList10, arrayList9, arrayListB2, aVarA);
                                z2 = false;
                                a(arrayListA3, 0);
                                bbVarA2.a(obj6, arrayList10, arrayList9);
                            }
                        } else {
                            arrayListA2 = a(bbVarA2, objB, fragment8, arrayList10, view2);
                            Fragment fragment14 = fragment9;
                            arrayListA3 = a(bbVarA2, objA3, fragment14, arrayList9, view2);
                            a(arrayListA3, 4);
                            objA2 = a(bbVarA2, objA3, objB, obj6, fragment14, z5);
                            if (objA2 != null) {
                                if (fragment8 != null) {
                                    fragment8.setHideReplaced(true);
                                    bbVarA2.b(objB, fragment8.mView, arrayListA2);
                                    bk.a(fragment8.mContainer, new ar(arrayListA2));
                                }
                                ArrayList arrayListB3 = bb.b(arrayList9);
                                bbVarA2.a(objA2, objA3, arrayListA3, objB, arrayListA2, obj6, arrayList9);
                                bbVarA2.a(viewGroup, objA2);
                                bbVarA2.a(viewGroup, arrayList10, arrayList9, arrayListB3, aVarA);
                                z2 = false;
                                a(arrayListA3, 0);
                                bbVarA2.a(obj6, arrayList10, arrayList9);
                            }
                        }
                    }
                    z2 = false;
                } else {
                    v vVar3 = vVar2;
                    sparseArray = sparseArray2;
                    i3 = i6;
                    size = size;
                    z2 = false;
                    ViewGroup viewGroup2 = vVar3.iz.onHasView() ? (ViewGroup) vVar3.iz.onFindViewById(iKeyAt) : null;
                    if (viewGroup2 != null && (bbVarA = a((fragment2 = avVar2.jH), (fragment = avVar2.jF))) != null) {
                        boolean z8 = avVar2.lastInIsPop;
                        boolean z9 = avVar2.firstOutIsPop;
                        Object objA5 = a(bbVarA, fragment, z8);
                        Object objB2 = b(bbVarA, fragment2, z9);
                        ArrayList arrayList11 = new ArrayList();
                        ArrayList arrayList12 = new ArrayList();
                        Fragment fragment15 = avVar2.jF;
                        Fragment fragment16 = avVar2.jH;
                        if (fragment15 == null || fragment16 == null) {
                            fragment3 = fragment;
                            fragment4 = fragment2;
                            arrayList3 = arrayList11;
                            obj = objB2;
                            obj2 = objA5;
                            avVar = avVar2;
                            arrayList4 = arrayList12;
                            aVar = aVarA;
                            obj3 = null;
                        } else {
                            boolean z10 = avVar2.lastInIsPop;
                            Object objA6 = aVarA.isEmpty() ? null : a(bbVarA, fragment15, fragment16, z10);
                            android.support.v4.c.a aVarA3 = a(bbVarA, aVarA, objA6, avVar2);
                            if (aVarA.isEmpty()) {
                                obj5 = null;
                            } else {
                                arrayList11.addAll(aVarA3.values());
                                obj5 = objA6;
                            }
                            if (objA5 == null && objB2 == null && obj5 == null) {
                                fragment3 = fragment;
                                fragment4 = fragment2;
                                arrayList3 = arrayList11;
                                obj = objB2;
                                obj4 = objA5;
                                avVar = avVar2;
                                aVar = aVarA;
                                arrayList4 = arrayList12;
                                obj3 = null;
                                i3 = i3;
                                size = size;
                            } else {
                                a(fragment15, fragment16, z10, aVarA3);
                                if (obj5 != null) {
                                    fragment3 = fragment;
                                    rect = new Rect();
                                    bbVarA.a(obj5, view2, arrayList11);
                                    arrayList5 = arrayList11;
                                    fragment4 = fragment2;
                                    aVar2 = aVarA;
                                    z3 = z10;
                                    fragment5 = fragment16;
                                    fragment6 = fragment15;
                                    arrayList6 = arrayList12;
                                    a(bbVarA, obj5, objB2, aVarA3, avVar2.firstOutIsPop, avVar2.jI);
                                    if (objA5 != null) {
                                        bbVarA.a(objA5, rect);
                                    }
                                } else {
                                    fragment3 = fragment;
                                    fragment4 = fragment2;
                                    arrayList5 = arrayList11;
                                    aVar2 = aVarA;
                                    z3 = z10;
                                    fragment5 = fragment16;
                                    fragment6 = fragment15;
                                    arrayList6 = arrayList12;
                                    rect = null;
                                }
                                Object obj7 = obj5;
                                Object obj8 = obj5;
                                aVar = aVar2;
                                avVar = avVar2;
                                ArrayList arrayList13 = arrayList6;
                                obj2 = objA5;
                                arrayList4 = arrayList6;
                                obj = objB2;
                                arrayList3 = arrayList5;
                                bk.a(viewGroup2, new au(bbVarA, aVar2, obj7, avVar2, arrayList13, view2, fragment6, fragment5, z3, arrayList3, obj2, rect));
                                obj3 = obj8;
                            }
                            if (obj4 == null || obj3 != null || obj != null) {
                                arrayListA = a(bbVarA, obj, fragment4, arrayList3, view2);
                                if (arrayListA != null || arrayListA.isEmpty()) {
                                    obj = null;
                                }
                                bbVarA.b(obj4, view2);
                                objA = a(bbVarA, obj4, obj, obj3, fragment3, avVar.lastInIsPop);
                                if (objA != null) {
                                    ArrayList arrayList14 = new ArrayList();
                                    bbVarA.a(objA, obj4, arrayList14, obj, arrayListA, obj3, arrayList4);
                                    bk.a(viewGroup2, new as(obj4, bbVarA, view2, fragment3, arrayList4, arrayList14, arrayListA, obj));
                                    android.support.v4.c.a aVar3 = aVar;
                                    ArrayList arrayList15 = arrayList4;
                                    bk.a(viewGroup2, new bd(bbVarA, arrayList15, aVar3));
                                    bbVarA.a(viewGroup2, objA);
                                    bk.a(viewGroup2, new be(bbVarA, arrayList15, aVar3));
                                }
                            }
                        }
                        obj4 = obj2;
                        if (obj4 == null) {
                            arrayListA = a(bbVarA, obj, fragment4, arrayList3, view2);
                            if (arrayListA != null) {
                                obj = null;
                            } else {
                                obj = null;
                            }
                            bbVarA.b(obj4, view2);
                            objA = a(bbVarA, obj4, obj, obj3, fragment3, avVar.lastInIsPop);
                            if (objA != null) {
                                ArrayList arrayList16 = new ArrayList();
                                bbVarA.a(objA, obj4, arrayList16, obj, arrayListA, obj3, arrayList4);
                                bk.a(viewGroup2, new as(obj4, bbVarA, view2, fragment3, arrayList4, arrayList16, arrayListA, obj));
                                android.support.v4.c.a aVar4 = aVar;
                                ArrayList arrayList17 = arrayList4;
                                bk.a(viewGroup2, new bd(bbVarA, arrayList17, aVar4));
                                bbVarA.a(viewGroup2, objA);
                                bk.a(viewGroup2, new be(bbVarA, arrayList17, aVar4));
                            }
                        } else {
                            arrayListA = a(bbVarA, obj, fragment4, arrayList3, view2);
                            if (arrayListA != null) {
                                obj = null;
                            } else {
                                obj = null;
                            }
                            bbVarA.b(obj4, view2);
                            objA = a(bbVarA, obj4, obj, obj3, fragment3, avVar.lastInIsPop);
                            if (objA != null) {
                                ArrayList arrayList18 = new ArrayList();
                                bbVarA.a(objA, obj4, arrayList18, obj, arrayListA, obj3, arrayList4);
                                bk.a(viewGroup2, new as(obj4, bbVarA, view2, fragment3, arrayList4, arrayList18, arrayListA, obj));
                                android.support.v4.c.a aVar5 = aVar;
                                ArrayList arrayList19 = arrayList4;
                                bk.a(viewGroup2, new bd(bbVarA, arrayList19, aVar5));
                                bbVarA.a(viewGroup2, objA);
                                bk.a(viewGroup2, new be(bbVarA, arrayList19, aVar5));
                            }
                        }
                    }
                    i6 = i3 + 1;
                    size = size;
                    sparseArray2 = sparseArray;
                    vVar2 = vVar;
                    arrayList7 = arrayList;
                    arrayList8 = arrayList2;
                    i4 = i2;
                    z4 = z;
                }
                i3 = i3;
                size = size;
                i6 = i3 + 1;
                size = size;
                sparseArray2 = sparseArray;
                vVar2 = vVar;
                arrayList7 = arrayList;
                arrayList8 = arrayList2;
                i4 = i2;
                z4 = z;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void a(ArrayList arrayList, int i) {
        if (arrayList == null) {
            return;
        }
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            ((View) arrayList.get(size)).setVisibility(i);
        }
    }

    private static void a(ArrayList arrayList, android.support.v4.c.a aVar, Collection collection) {
        for (int size = aVar.size() - 1; size >= 0; size--) {
            View view = (View) aVar.valueAt(size);
            if (collection.contains(android.support.v4.view.n.h(view))) {
                arrayList.add(view);
            }
        }
    }

    private static boolean a(bb bbVar, List list) {
        int size = list.size();
        for (int i = 0; i < size; i++) {
            if (!bbVar.e(list.get(i))) {
                return false;
            }
        }
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static android.support.v4.c.a b(bb bbVar, android.support.v4.c.a aVar, Object obj, av avVar) {
        bl blVarBn;
        ArrayList arrayList;
        String strA;
        Fragment fragment = avVar.jF;
        View view = fragment.mView;
        if (aVar.isEmpty() || obj == null || view == null) {
            aVar.clear();
            return null;
        }
        android.support.v4.c.a aVar2 = new android.support.v4.c.a();
        bbVar.a((Map) aVar2, view);
        c cVar = avVar.jG;
        if (avVar.lastInIsPop) {
            blVarBn = fragment.bo();
            arrayList = cVar.mSharedElementSourceNames;
        } else {
            blVarBn = fragment.bn();
            arrayList = cVar.mSharedElementTargetNames;
        }
        if (arrayList != null) {
            aVar2.retainAll(arrayList);
            aVar2.retainAll(aVar.values());
        }
        if (blVarBn != null) {
            for (int size = arrayList.size() - 1; size >= 0; size--) {
                String str = (String) arrayList.get(size);
                View view2 = (View) aVar2.get(str);
                if (view2 == null) {
                    String strA2 = a(aVar, str);
                    if (strA2 != null) {
                        aVar.remove(strA2);
                    }
                } else if (!str.equals(android.support.v4.view.n.h(view2)) && (strA = a(aVar, str)) != null) {
                    aVar.put(strA, android.support.v4.view.n.h(view2));
                }
            }
        } else {
            for (int size2 = aVar.size() - 1; size2 >= 0; size2--) {
                if (!aVar2.containsKey((String) aVar.valueAt(size2))) {
                    aVar.removeAt(size2);
                }
            }
        }
        return aVar2;
    }

    private static Object b(bb bbVar, Fragment fragment, boolean z) {
        if (fragment == null) {
            return null;
        }
        return bbVar.f(z ? fragment.be() : fragment.bf());
    }

    private static void b(c cVar, SparseArray sparseArray, boolean z) {
        if (cVar.hF.iz.onHasView()) {
            for (int size = cVar.mOps.size() - 1; size >= 0; size--) {
                a(cVar, (d) cVar.mOps.get(size), sparseArray, true, z);
            }
        }
    }

    private static bb bH() {
        try {
            return (bb) Class.forName("android.support.transition.FragmentTransitionSupport").getDeclaredConstructor(new Class[0]).newInstance(new Object[0]);
        } catch (Exception e) {
            return null;
        }
    }
}
