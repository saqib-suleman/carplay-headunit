package android.support.v4.app;

import android.content.Context;
import android.os.Parcel;
import android.os.Parcelable;
import android.view.View;
import android.widget.TabHost;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
public final class FragmentTabHost extends TabHost implements TabHost.OnTabChangeListener {
    private final ArrayList jc;
    private u jd;
    private TabHost.OnTabChangeListener je;
    private ao jf;
    private boolean jg;
    private int mContainerId;
    private Context mContext;

    class SavedState extends View.BaseSavedState {
        public static final Parcelable.Creator CREATOR = new an();
        String jh;

        SavedState(Parcel parcel) {
            super(parcel);
            this.jh = parcel.readString();
        }

        SavedState(Parcelable parcelable) {
            super(parcelable);
        }

        public String toString() {
            return "FragmentTabHost.SavedState{" + Integer.toHexString(System.identityHashCode(this)) + " curTab=" + this.jh + "}";
        }

        @Override // android.view.View.BaseSavedState, android.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(Parcel parcel, int i) {
            super.writeToParcel(parcel, i);
            parcel.writeString(this.jh);
        }
    }

    private ap a(String str, ap apVar) {
        ao aoVar;
        int size = this.jc.size();
        int i = 0;
        while (true) {
            if (i >= size) {
                aoVar = null;
                break;
            }
            aoVar = (ao) this.jc.get(i);
            if (aoVar.tag.equals(str)) {
                break;
            }
            i++;
        }
        if (this.jf != aoVar) {
            if (apVar == null) {
                apVar = this.jd.bx();
            }
            if (this.jf != null && this.jf.hG != null) {
                apVar.a(this.jf.hG);
            }
            if (aoVar != null) {
                if (aoVar.hG == null) {
                    aoVar.hG = Fragment.a(this.mContext, aoVar.ji.getName(), aoVar.jj);
                    apVar.a(this.mContainerId, aoVar.hG, aoVar.tag);
                } else {
                    apVar.b(aoVar.hG);
                }
            }
            this.jf = aoVar;
        }
        return apVar;
    }

    @Override // android.view.ViewGroup, android.view.View
    protected final void onAttachedToWindow() {
        super.onAttachedToWindow();
        String currentTabTag = getCurrentTabTag();
        int size = this.jc.size();
        ap apVarBx = null;
        for (int i = 0; i < size; i++) {
            ao aoVar = (ao) this.jc.get(i);
            aoVar.hG = this.jd.s(aoVar.tag);
            if (aoVar.hG != null && !aoVar.hG.mDetached) {
                if (aoVar.tag.equals(currentTabTag)) {
                    this.jf = aoVar;
                } else {
                    if (apVarBx == null) {
                        apVarBx = this.jd.bx();
                    }
                    apVarBx.a(aoVar.hG);
                }
            }
        }
        this.jg = true;
        ap apVarA = a(currentTabTag, apVarBx);
        if (apVarA != null) {
            apVarA.commit();
            this.jd.executePendingTransactions();
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.jg = false;
    }

    @Override // android.view.View
    protected final void onRestoreInstanceState(Parcelable parcelable) {
        if (!(parcelable instanceof SavedState)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        SavedState savedState = (SavedState) parcelable;
        super.onRestoreInstanceState(savedState.getSuperState());
        setCurrentTabByTag(savedState.jh);
    }

    @Override // android.view.View
    protected final Parcelable onSaveInstanceState() {
        SavedState savedState = new SavedState(super.onSaveInstanceState());
        savedState.jh = getCurrentTabTag();
        return savedState;
    }

    @Override // android.widget.TabHost.OnTabChangeListener
    public final void onTabChanged(String str) {
        ap apVarA;
        if (this.jg && (apVarA = a(str, null)) != null) {
            apVarA.commit();
        }
        if (this.je != null) {
            this.je.onTabChanged(str);
        }
    }

    @Override // android.widget.TabHost
    public final void setOnTabChangedListener(TabHost.OnTabChangeListener onTabChangeListener) {
        this.je = onTabChangeListener;
    }

    @Override // android.widget.TabHost
    @Deprecated
    public final void setup() {
        throw new IllegalStateException("Must call setup() that takes a Context and FragmentManager");
    }
}
