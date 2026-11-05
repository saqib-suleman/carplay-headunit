.class public final Landroid/support/v4/app/n;
.super Landroid/support/v4/app/bm;

# interfaces
.implements Landroid/arch/lifecycle/y;


# instance fields
.field private am:Landroid/arch/lifecycle/x;

.field final ip:Landroid/support/v4/app/s;

.field iq:Z

.field ir:Z

.field is:Z

.field it:I

.field iu:Landroid/support/v4/c/t;

.field mCreated:Z

.field final mHandler:Landroid/os/Handler;

.field mResumed:Z

.field mRetaining:Z

.field mStopped:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/support/v4/app/bm;-><init>()V

    new-instance v0, Landroid/support/v4/app/o;

    invoke-direct {v0, p0}, Landroid/support/v4/app/o;-><init>(Landroid/support/v4/app/n;)V

    iput-object v0, p0, Landroid/support/v4/app/n;->mHandler:Landroid/os/Handler;

    new-instance v0, Landroid/support/v4/app/p;

    invoke-direct {v0, p0}, Landroid/support/v4/app/p;-><init>(Landroid/support/v4/app/n;)V

    invoke-static {v0}, Landroid/support/v4/app/s;->a(Landroid/support/v4/app/t;)Landroid/support/v4/app/s;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/app/n;->mStopped:Z

    iput-boolean v0, p0, Landroid/support/v4/app/n;->iq:Z

    return-void
.end method

.method private a(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/support/v4/app/s;->onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method private static a(Landroid/support/v4/app/u;Landroid/arch/lifecycle/Lifecycle$State;)Z
    .locals 4

    invoke-virtual {p0}, Landroid/support/v4/app/u;->getFragments()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v0, 0x0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/app/Fragment;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/support/v4/app/Fragment;->g()Landroid/arch/lifecycle/Lifecycle;

    move-result-object v2

    invoke-virtual {v2}, Landroid/arch/lifecycle/Lifecycle;->f()Landroid/arch/lifecycle/Lifecycle$State;

    move-result-object v2

    sget-object v3, Landroid/arch/lifecycle/Lifecycle$State;->G:Landroid/arch/lifecycle/Lifecycle$State;

    invoke-virtual {v2, v3}, Landroid/arch/lifecycle/Lifecycle$State;->a(Landroid/arch/lifecycle/Lifecycle$State;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v0, v1, Landroid/support/v4/app/Fragment;->hX:Landroid/arch/lifecycle/h;

    invoke-virtual {v0, p1}, Landroid/arch/lifecycle/h;->b(Landroid/arch/lifecycle/Lifecycle$State;)V

    const/4 v0, 0x1

    :cond_1
    iget-object v1, v1, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    if-eqz v1, :cond_0

    invoke-static {v1, p1}, Landroid/support/v4/app/n;->a(Landroid/support/v4/app/u;Landroid/arch/lifecycle/Lifecycle$State;)Z

    move-result v1

    or-int/2addr v0, v1

    goto :goto_0

    :cond_2
    return v0
.end method

.method private bq()V
    .locals 2

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {v0}, Landroid/support/v4/app/s;->bt()Landroid/support/v4/app/u;

    move-result-object v0

    sget-object v1, Landroid/arch/lifecycle/Lifecycle$State;->F:Landroid/arch/lifecycle/Lifecycle$State;

    invoke-static {v0, v1}, Landroid/support/v4/app/n;->a(Landroid/support/v4/app/u;Landroid/arch/lifecycle/Lifecycle$State;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void
.end method

.method private static r(I)V
    .locals 1

    const/high16 v0, -0x10000

    and-int/2addr p0, v0

    if-nez p0, :cond_0

    return-void

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Can only use lower 16 bits for requestCode"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public final dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 2

    invoke-super {p0, p1, p2, p3, p4}, Landroid/support/v4/app/bm;->dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "Local FragmentActivity "

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, " State:"

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "  "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v1, "mCreated="

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v1, p0, Landroid/support/v4/app/n;->mCreated:Z

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Z)V

    const-string v1, " mResumed="

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v1, p0, Landroid/support/v4/app/n;->mResumed:Z

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Z)V

    const-string v1, " mStopped="

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v1, p0, Landroid/support/v4/app/n;->mStopped:Z

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Z)V

    const-string v1, " mReallyStopped="

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v1, p0, Landroid/support/v4/app/n;->iq:Z

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->println(Z)V

    invoke-static {p0}, Landroid/support/v4/app/bf;->c(Landroid/arch/lifecycle/g;)Landroid/support/v4/app/bf;

    move-result-object v1

    invoke-virtual {v1, v0, p3}, Landroid/support/v4/app/bf;->a(Ljava/lang/String;Ljava/io/PrintWriter;)V

    iget-object v0, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {v0}, Landroid/support/v4/app/s;->bt()Landroid/support/v4/app/u;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/support/v4/app/u;->dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    return-void
.end method

.method final e(Z)V
    .locals 1

    iget-boolean v0, p0, Landroid/support/v4/app/n;->iq:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/app/n;->iq:Z

    iput-boolean p1, p0, Landroid/support/v4/app/n;->mRetaining:Z

    iget-object p1, p0, Landroid/support/v4/app/n;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeMessages(I)V

    iget-object p1, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {p1}, Landroid/support/v4/app/s;->bw()V

    :cond_0
    return-void
.end method

.method public final g()Landroid/arch/lifecycle/Lifecycle;
    .locals 1

    invoke-super {p0}, Landroid/support/v4/app/bm;->g()Landroid/arch/lifecycle/Lifecycle;

    move-result-object v0

    return-object v0
.end method

.method protected final onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {v0}, Landroid/support/v4/app/s;->noteStateNotSaved()V

    shr-int/lit8 v0, p1, 0x10

    if-eqz v0, :cond_2

    add-int/lit8 v0, v0, -0x1

    iget-object p1, p0, Landroid/support/v4/app/n;->iu:Landroid/support/v4/c/t;

    invoke-virtual {p1, v0}, Landroid/support/v4/c/t;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iget-object p2, p0, Landroid/support/v4/app/n;->iu:Landroid/support/v4/c/t;

    invoke-virtual {p2, v0}, Landroid/support/v4/c/t;->remove(I)V

    if-nez p1, :cond_0

    const-string p1, "FragmentActivity"

    const-string p2, "Activity result delivered for unknown Fragment."

    invoke-static {p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iget-object p2, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {p2, p1}, Landroid/support/v4/app/s;->r(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object p2

    if-nez p2, :cond_1

    const-string p2, "FragmentActivity"

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "Activity result no fragment exists for who: "

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_1
    invoke-static {}, Landroid/support/v4/app/Fragment;->aV()V

    return-void

    :cond_2
    invoke-static {}, Landroid/support/v4/app/a;->aR()Landroid/support/v4/app/b;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-interface {v0}, Landroid/support/v4/app/b;->aS()Z

    move-result v0

    if-eqz v0, :cond_3

    return-void

    :cond_3
    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/app/bm;->onActivityResult(IILandroid/content/Intent;)V

    return-void
.end method

.method public final onBackPressed()V
    .locals 4

    iget-object v0, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {v0}, Landroid/support/v4/app/s;->bt()Landroid/support/v4/app/u;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/u;->isStateSaved()Z

    move-result v1

    if-eqz v1, :cond_0

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x19

    if-gt v2, v3, :cond_0

    return-void

    :cond_0
    if-nez v1, :cond_1

    invoke-virtual {v0}, Landroid/support/v4/app/u;->popBackStackImmediate()Z

    move-result v0

    if-nez v0, :cond_2

    :cond_1
    invoke-super {p0}, Landroid/support/v4/app/bm;->onBackPressed()V

    :cond_2
    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/support/v4/app/bm;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object v0, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {v0}, Landroid/support/v4/app/s;->noteStateNotSaved()V

    iget-object v0, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {v0, p1}, Landroid/support/v4/app/s;->dispatchConfigurationChanged(Landroid/content/res/Configuration;)V

    return-void
.end method

.method protected final onCreate(Landroid/os/Bundle;)V
    .locals 6

    iget-object v0, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {v0}, Landroid/support/v4/app/s;->bu()V

    invoke-super {p0, p1}, Landroid/support/v4/app/bm;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroid/support/v4/app/n;->getLastNonConfigurationInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/app/q;

    if-eqz v0, :cond_0

    iget-object v1, v0, Landroid/support/v4/app/q;->ix:Landroid/arch/lifecycle/x;

    iput-object v1, p0, Landroid/support/v4/app/n;->am:Landroid/arch/lifecycle/x;

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_4

    const-string v2, "android:support:fragments"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    iget-object v3, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    if-eqz v0, :cond_1

    iget-object v0, v0, Landroid/support/v4/app/q;->iy:Landroid/support/v4/app/ak;

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v3, v2, v0}, Landroid/support/v4/app/s;->a(Landroid/os/Parcelable;Landroid/support/v4/app/ak;)V

    const-string v0, "android:support:next_request_index"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "android:support:next_request_index"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Landroid/support/v4/app/n;->it:I

    const-string v0, "android:support:request_indicies"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    move-result-object v0

    const-string v2, "android:support:request_fragment_who"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    if-eqz v0, :cond_3

    if-eqz p1, :cond_3

    array-length v2, v0

    array-length v3, p1

    if-eq v2, v3, :cond_2

    goto :goto_2

    :cond_2
    new-instance v2, Landroid/support/v4/c/t;

    array-length v3, v0

    invoke-direct {v2, v3}, Landroid/support/v4/c/t;-><init>(I)V

    iput-object v2, p0, Landroid/support/v4/app/n;->iu:Landroid/support/v4/c/t;

    move v2, v1

    :goto_1
    array-length v3, v0

    if-ge v2, v3, :cond_4

    iget-object v3, p0, Landroid/support/v4/app/n;->iu:Landroid/support/v4/c/t;

    aget v4, v0, v2

    aget-object v5, p1, v2

    invoke-virtual {v3, v4, v5}, Landroid/support/v4/c/t;->put(ILjava/lang/Object;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_3
    :goto_2
    const-string p1, "FragmentActivity"

    const-string v0, "Invalid requestCode mapping in savedInstanceState."

    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4
    iget-object p1, p0, Landroid/support/v4/app/n;->iu:Landroid/support/v4/c/t;

    if-nez p1, :cond_5

    new-instance p1, Landroid/support/v4/c/t;

    invoke-direct {p1}, Landroid/support/v4/c/t;-><init>()V

    iput-object p1, p0, Landroid/support/v4/app/n;->iu:Landroid/support/v4/c/t;

    iput v1, p0, Landroid/support/v4/app/n;->it:I

    :cond_5
    iget-object p1, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {p1}, Landroid/support/v4/app/s;->dispatchCreate()V

    return-void
.end method

.method public final onCreatePanelMenu(ILandroid/view/Menu;)Z
    .locals 2

    if-nez p1, :cond_0

    invoke-super {p0, p1, p2}, Landroid/support/v4/app/bm;->onCreatePanelMenu(ILandroid/view/Menu;)Z

    move-result p1

    iget-object v0, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {p0}, Landroid/support/v4/app/n;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Landroid/support/v4/app/s;->dispatchCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)Z

    move-result p2

    or-int/2addr p1, p2

    return p1

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/bm;->onCreatePanelMenu(ILandroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public final onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .locals 1

    invoke-direct {p0, p1, p2, p3, p4}, Landroid/support/v4/app/n;->a(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/support/v4/app/bm;->onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object p1

    return-object p1

    :cond_0
    return-object v0
.end method

.method public final onCreateView(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2, p3}, Landroid/support/v4/app/n;->a(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/app/bm;->onCreateView(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object p1

    return-object p1

    :cond_0
    return-object v0
.end method

.method protected final onDestroy()V
    .locals 1

    invoke-super {p0}, Landroid/support/v4/app/bm;->onDestroy()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v4/app/n;->e(Z)V

    iget-object v0, p0, Landroid/support/v4/app/n;->am:Landroid/arch/lifecycle/x;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Landroid/support/v4/app/n;->mRetaining:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/app/n;->am:Landroid/arch/lifecycle/x;

    invoke-virtual {v0}, Landroid/arch/lifecycle/x;->clear()V

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {v0}, Landroid/support/v4/app/s;->dispatchDestroy()V

    return-void
.end method

.method public final onLowMemory()V
    .locals 1

    invoke-super {p0}, Landroid/support/v4/app/bm;->onLowMemory()V

    iget-object v0, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {v0}, Landroid/support/v4/app/s;->dispatchLowMemory()V

    return-void
.end method

.method public final onMenuItemSelected(ILandroid/view/MenuItem;)Z
    .locals 1

    invoke-super {p0, p1, p2}, Landroid/support/v4/app/bm;->onMenuItemSelected(ILandroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    if-eqz p1, :cond_2

    const/4 v0, 0x6

    if-eq p1, v0, :cond_1

    const/4 p1, 0x0

    return p1

    :cond_1
    iget-object p1, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {p1, p2}, Landroid/support/v4/app/s;->dispatchContextItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1

    :cond_2
    iget-object p1, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {p1, p2}, Landroid/support/v4/app/s;->dispatchOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public final onMultiWindowModeChanged(Z)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {v0, p1}, Landroid/support/v4/app/s;->dispatchMultiWindowModeChanged(Z)V

    return-void
.end method

.method protected final onNewIntent(Landroid/content/Intent;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/support/v4/app/bm;->onNewIntent(Landroid/content/Intent;)V

    iget-object p1, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {p1}, Landroid/support/v4/app/s;->noteStateNotSaved()V

    return-void
.end method

.method public final onPanelClosed(ILandroid/view/Menu;)V
    .locals 1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {v0, p2}, Landroid/support/v4/app/s;->dispatchOptionsMenuClosed(Landroid/view/Menu;)V

    :goto_0
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/bm;->onPanelClosed(ILandroid/view/Menu;)V

    return-void
.end method

.method protected final onPause()V
    .locals 2

    invoke-super {p0}, Landroid/support/v4/app/bm;->onPause()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/app/n;->mResumed:Z

    iget-object v0, p0, Landroid/support/v4/app/n;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/app/n;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v0, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {v0}, Landroid/support/v4/app/s;->dispatchResume()V

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {v0}, Landroid/support/v4/app/s;->dispatchPause()V

    return-void
.end method

.method public final onPictureInPictureModeChanged(Z)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {v0, p1}, Landroid/support/v4/app/s;->dispatchPictureInPictureModeChanged(Z)V

    return-void
.end method

.method protected final onPostResume()V
    .locals 2

    invoke-super {p0}, Landroid/support/v4/app/bm;->onPostResume()V

    iget-object v0, p0, Landroid/support/v4/app/n;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v0, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {v0}, Landroid/support/v4/app/s;->dispatchResume()V

    iget-object v0, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {v0}, Landroid/support/v4/app/s;->execPendingActions()Z

    return-void
.end method

.method public final onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z
    .locals 0

    if-nez p1, :cond_0

    if-eqz p3, :cond_0

    const/4 p1, 0x0

    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/app/bm;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    move-result p1

    iget-object p2, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {p2, p3}, Landroid/support/v4/app/s;->dispatchPrepareOptionsMenu(Landroid/view/Menu;)Z

    move-result p2

    or-int/2addr p1, p2

    return p1

    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/app/bm;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public final onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 1

    iget-object p2, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {p2}, Landroid/support/v4/app/s;->noteStateNotSaved()V

    shr-int/lit8 p1, p1, 0x10

    const p2, 0xffff

    and-int/2addr p1, p2

    if-eqz p1, :cond_2

    add-int/lit8 p1, p1, -0x1

    iget-object p2, p0, Landroid/support/v4/app/n;->iu:Landroid/support/v4/c/t;

    invoke-virtual {p2, p1}, Landroid/support/v4/c/t;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    iget-object p3, p0, Landroid/support/v4/app/n;->iu:Landroid/support/v4/c/t;

    invoke-virtual {p3, p1}, Landroid/support/v4/c/t;->remove(I)V

    if-nez p2, :cond_0

    const-string p1, "FragmentActivity"

    const-string p2, "Activity result delivered for unknown Fragment."

    :goto_0
    invoke-static {p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iget-object p1, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {p1, p2}, Landroid/support/v4/app/s;->r(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object p1

    if-nez p1, :cond_1

    const-string p1, "FragmentActivity"

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "Activity result no fragment exists for who: "

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_1
    invoke-static {}, Landroid/support/v4/app/Fragment;->aW()V

    :cond_2
    return-void
.end method

.method protected final onResume()V
    .locals 2

    invoke-super {p0}, Landroid/support/v4/app/bm;->onResume()V

    iget-object v0, p0, Landroid/support/v4/app/n;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/app/n;->mResumed:Z

    iget-object v0, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {v0}, Landroid/support/v4/app/s;->execPendingActions()Z

    return-void
.end method

.method public final onRetainNonConfigurationInstance()Ljava/lang/Object;
    .locals 3

    iget-boolean v0, p0, Landroid/support/v4/app/n;->mStopped:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/support/v4/app/n;->e(Z)V

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {v0}, Landroid/support/v4/app/s;->bv()Landroid/support/v4/app/ak;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    iget-object v2, p0, Landroid/support/v4/app/n;->am:Landroid/arch/lifecycle/x;

    if-nez v2, :cond_1

    return-object v1

    :cond_1
    new-instance v2, Landroid/support/v4/app/q;

    invoke-direct {v2}, Landroid/support/v4/app/q;-><init>()V

    iput-object v1, v2, Landroid/support/v4/app/q;->iw:Ljava/lang/Object;

    iget-object v1, p0, Landroid/support/v4/app/n;->am:Landroid/arch/lifecycle/x;

    iput-object v1, v2, Landroid/support/v4/app/q;->ix:Landroid/arch/lifecycle/x;

    iput-object v0, v2, Landroid/support/v4/app/q;->iy:Landroid/support/v4/app/ak;

    return-object v2
.end method

.method protected final onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 4

    invoke-super {p0, p1}, Landroid/support/v4/app/bm;->onSaveInstanceState(Landroid/os/Bundle;)V

    invoke-direct {p0}, Landroid/support/v4/app/n;->bq()V

    iget-object v0, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {v0}, Landroid/support/v4/app/s;->saveAllState()Landroid/os/Parcelable;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "android:support:fragments"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/n;->iu:Landroid/support/v4/c/t;

    invoke-virtual {v0}, Landroid/support/v4/c/t;->size()I

    move-result v0

    if-lez v0, :cond_2

    const-string v0, "android:support:next_request_index"

    iget v1, p0, Landroid/support/v4/app/n;->it:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    iget-object v0, p0, Landroid/support/v4/app/n;->iu:Landroid/support/v4/c/t;

    invoke-virtual {v0}, Landroid/support/v4/c/t;->size()I

    move-result v0

    new-array v0, v0, [I

    iget-object v1, p0, Landroid/support/v4/app/n;->iu:Landroid/support/v4/c/t;

    invoke-virtual {v1}, Landroid/support/v4/c/t;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    :goto_0
    iget-object v3, p0, Landroid/support/v4/app/n;->iu:Landroid/support/v4/c/t;

    invoke-virtual {v3}, Landroid/support/v4/c/t;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    iget-object v3, p0, Landroid/support/v4/app/n;->iu:Landroid/support/v4/c/t;

    invoke-virtual {v3, v2}, Landroid/support/v4/c/t;->keyAt(I)I

    move-result v3

    aput v3, v0, v2

    iget-object v3, p0, Landroid/support/v4/app/n;->iu:Landroid/support/v4/c/t;

    invoke-virtual {v3, v2}, Landroid/support/v4/c/t;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const-string v2, "android:support:request_indicies"

    invoke-virtual {p1, v2, v0}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    const-string v0, "android:support:request_fragment_who"

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    :cond_2
    return-void
.end method

.method protected final onStart()V
    .locals 2

    invoke-super {p0}, Landroid/support/v4/app/bm;->onStart()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/app/n;->mStopped:Z

    iput-boolean v0, p0, Landroid/support/v4/app/n;->iq:Z

    iget-object v0, p0, Landroid/support/v4/app/n;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    iget-boolean v0, p0, Landroid/support/v4/app/n;->mCreated:Z

    if-nez v0, :cond_0

    iput-boolean v1, p0, Landroid/support/v4/app/n;->mCreated:Z

    iget-object v0, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {v0}, Landroid/support/v4/app/s;->dispatchActivityCreated()V

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {v0}, Landroid/support/v4/app/s;->noteStateNotSaved()V

    iget-object v0, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {v0}, Landroid/support/v4/app/s;->execPendingActions()Z

    iget-object v0, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {v0}, Landroid/support/v4/app/s;->dispatchStart()V

    return-void
.end method

.method public final onStateNotSaved()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {v0}, Landroid/support/v4/app/s;->noteStateNotSaved()V

    return-void
.end method

.method protected final onStop()V
    .locals 2

    invoke-super {p0}, Landroid/support/v4/app/bm;->onStop()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/app/n;->mStopped:Z

    invoke-direct {p0}, Landroid/support/v4/app/n;->bq()V

    iget-object v1, p0, Landroid/support/v4/app/n;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    iget-object v0, p0, Landroid/support/v4/app/n;->ip:Landroid/support/v4/app/s;

    invoke-virtual {v0}, Landroid/support/v4/app/s;->dispatchStop()V

    return-void
.end method

.method public final r()Landroid/arch/lifecycle/x;
    .locals 2

    invoke-virtual {p0}, Landroid/support/v4/app/n;->getApplication()Landroid/app/Application;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v4/app/n;->am:Landroid/arch/lifecycle/x;

    if-nez v0, :cond_0

    new-instance v0, Landroid/arch/lifecycle/x;

    invoke-direct {v0}, Landroid/arch/lifecycle/x;-><init>()V

    iput-object v0, p0, Landroid/support/v4/app/n;->am:Landroid/arch/lifecycle/x;

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/n;->am:Landroid/arch/lifecycle/x;

    return-object v0

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Your activity is not yet attached to the Application instance. You can\'t request ViewModel before onCreate call."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final startActivityForResult(Landroid/content/Intent;I)V
    .locals 1

    iget-boolean v0, p0, Landroid/support/v4/app/n;->is:Z

    if-nez v0, :cond_0

    const/4 v0, -0x1

    if-eq p2, v0, :cond_0

    invoke-static {p2}, Landroid/support/v4/app/n;->r(I)V

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/bm;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method public final startActivityForResult(Landroid/content/Intent;ILandroid/os/Bundle;)V
    .locals 1

    iget-boolean v0, p0, Landroid/support/v4/app/n;->is:Z

    if-nez v0, :cond_0

    const/4 v0, -0x1

    if-eq p2, v0, :cond_0

    invoke-static {p2}, Landroid/support/v4/app/n;->r(I)V

    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/app/bm;->startActivityForResult(Landroid/content/Intent;ILandroid/os/Bundle;)V

    return-void
.end method

.method public final startIntentSenderForResult(Landroid/content/IntentSender;ILandroid/content/Intent;III)V
    .locals 1

    iget-boolean v0, p0, Landroid/support/v4/app/n;->ir:Z

    if-nez v0, :cond_0

    const/4 v0, -0x1

    if-eq p2, v0, :cond_0

    invoke-static {p2}, Landroid/support/v4/app/n;->r(I)V

    :cond_0
    invoke-super/range {p0 .. p6}, Landroid/support/v4/app/bm;->startIntentSenderForResult(Landroid/content/IntentSender;ILandroid/content/Intent;III)V

    return-void
.end method

.method public final startIntentSenderForResult(Landroid/content/IntentSender;ILandroid/content/Intent;IIILandroid/os/Bundle;)V
    .locals 1

    iget-boolean v0, p0, Landroid/support/v4/app/n;->ir:Z

    if-nez v0, :cond_0

    const/4 v0, -0x1

    if-eq p2, v0, :cond_0

    invoke-static {p2}, Landroid/support/v4/app/n;->r(I)V

    :cond_0
    invoke-super/range {p0 .. p7}, Landroid/support/v4/app/bm;->startIntentSenderForResult(Landroid/content/IntentSender;ILandroid/content/Intent;IIILandroid/os/Bundle;)V

    return-void
.end method
