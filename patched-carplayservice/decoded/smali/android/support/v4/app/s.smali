.class public final Landroid/support/v4/app/s;
.super Ljava/lang/Object;


# instance fields
.field private final hQ:Landroid/support/v4/app/t;


# direct methods
.method private constructor <init>(Landroid/support/v4/app/t;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/support/v4/app/s;->hQ:Landroid/support/v4/app/t;

    return-void
.end method

.method public static a(Landroid/support/v4/app/t;)Landroid/support/v4/app/s;
    .locals 1

    new-instance v0, Landroid/support/v4/app/s;

    invoke-direct {v0, p0}, Landroid/support/v4/app/s;-><init>(Landroid/support/v4/app/t;)V

    return-object v0
.end method


# virtual methods
.method public final a(Landroid/os/Parcelable;Landroid/support/v4/app/ak;)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/s;->hQ:Landroid/support/v4/app/t;

    iget-object v0, v0, Landroid/support/v4/app/t;->hP:Landroid/support/v4/app/v;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/app/v;->a(Landroid/os/Parcelable;Landroid/support/v4/app/ak;)V

    return-void
.end method

.method public final bt()Landroid/support/v4/app/u;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/s;->hQ:Landroid/support/v4/app/t;

    iget-object v0, v0, Landroid/support/v4/app/t;->hP:Landroid/support/v4/app/v;

    return-object v0
.end method

.method public final bu()V
    .locals 4

    iget-object v0, p0, Landroid/support/v4/app/s;->hQ:Landroid/support/v4/app/t;

    iget-object v0, v0, Landroid/support/v4/app/t;->hP:Landroid/support/v4/app/v;

    iget-object v1, p0, Landroid/support/v4/app/s;->hQ:Landroid/support/v4/app/t;

    iget-object v2, p0, Landroid/support/v4/app/s;->hQ:Landroid/support/v4/app/t;

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/support/v4/app/v;->a(Landroid/support/v4/app/t;Landroid/support/v4/app/r;Landroid/support/v4/app/Fragment;)V

    return-void
.end method

.method public final bv()Landroid/support/v4/app/ak;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/s;->hQ:Landroid/support/v4/app/t;

    iget-object v0, v0, Landroid/support/v4/app/t;->hP:Landroid/support/v4/app/v;

    invoke-virtual {v0}, Landroid/support/v4/app/v;->bE()Landroid/support/v4/app/ak;

    move-result-object v0

    return-object v0
.end method

.method public final bw()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/s;->hQ:Landroid/support/v4/app/t;

    iget-object v0, v0, Landroid/support/v4/app/t;->hP:Landroid/support/v4/app/v;

    invoke-virtual {v0}, Landroid/support/v4/app/v;->bw()V

    return-void
.end method

.method public final dispatchActivityCreated()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/s;->hQ:Landroid/support/v4/app/t;

    iget-object v0, v0, Landroid/support/v4/app/t;->hP:Landroid/support/v4/app/v;

    invoke-virtual {v0}, Landroid/support/v4/app/v;->dispatchActivityCreated()V

    return-void
.end method

.method public final dispatchConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/s;->hQ:Landroid/support/v4/app/t;

    iget-object v0, v0, Landroid/support/v4/app/t;->hP:Landroid/support/v4/app/v;

    invoke-virtual {v0, p1}, Landroid/support/v4/app/v;->dispatchConfigurationChanged(Landroid/content/res/Configuration;)V

    return-void
.end method

.method public final dispatchContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/s;->hQ:Landroid/support/v4/app/t;

    iget-object v0, v0, Landroid/support/v4/app/t;->hP:Landroid/support/v4/app/v;

    invoke-virtual {v0, p1}, Landroid/support/v4/app/v;->dispatchContextItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public final dispatchCreate()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/s;->hQ:Landroid/support/v4/app/t;

    iget-object v0, v0, Landroid/support/v4/app/t;->hP:Landroid/support/v4/app/v;

    invoke-virtual {v0}, Landroid/support/v4/app/v;->dispatchCreate()V

    return-void
.end method

.method public final dispatchCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)Z
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/s;->hQ:Landroid/support/v4/app/t;

    iget-object v0, v0, Landroid/support/v4/app/t;->hP:Landroid/support/v4/app/v;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/app/v;->dispatchCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)Z

    move-result p1

    return p1
.end method

.method public final dispatchDestroy()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/s;->hQ:Landroid/support/v4/app/t;

    iget-object v0, v0, Landroid/support/v4/app/t;->hP:Landroid/support/v4/app/v;

    invoke-virtual {v0}, Landroid/support/v4/app/v;->dispatchDestroy()V

    return-void
.end method

.method public final dispatchLowMemory()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/s;->hQ:Landroid/support/v4/app/t;

    iget-object v0, v0, Landroid/support/v4/app/t;->hP:Landroid/support/v4/app/v;

    invoke-virtual {v0}, Landroid/support/v4/app/v;->dispatchLowMemory()V

    return-void
.end method

.method public final dispatchMultiWindowModeChanged(Z)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/s;->hQ:Landroid/support/v4/app/t;

    iget-object v0, v0, Landroid/support/v4/app/t;->hP:Landroid/support/v4/app/v;

    invoke-virtual {v0, p1}, Landroid/support/v4/app/v;->dispatchMultiWindowModeChanged(Z)V

    return-void
.end method

.method public final dispatchOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/s;->hQ:Landroid/support/v4/app/t;

    iget-object v0, v0, Landroid/support/v4/app/t;->hP:Landroid/support/v4/app/v;

    invoke-virtual {v0, p1}, Landroid/support/v4/app/v;->dispatchOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public final dispatchOptionsMenuClosed(Landroid/view/Menu;)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/s;->hQ:Landroid/support/v4/app/t;

    iget-object v0, v0, Landroid/support/v4/app/t;->hP:Landroid/support/v4/app/v;

    invoke-virtual {v0, p1}, Landroid/support/v4/app/v;->dispatchOptionsMenuClosed(Landroid/view/Menu;)V

    return-void
.end method

.method public final dispatchPause()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/s;->hQ:Landroid/support/v4/app/t;

    iget-object v0, v0, Landroid/support/v4/app/t;->hP:Landroid/support/v4/app/v;

    invoke-virtual {v0}, Landroid/support/v4/app/v;->dispatchPause()V

    return-void
.end method

.method public final dispatchPictureInPictureModeChanged(Z)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/s;->hQ:Landroid/support/v4/app/t;

    iget-object v0, v0, Landroid/support/v4/app/t;->hP:Landroid/support/v4/app/v;

    invoke-virtual {v0, p1}, Landroid/support/v4/app/v;->dispatchPictureInPictureModeChanged(Z)V

    return-void
.end method

.method public final dispatchPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/s;->hQ:Landroid/support/v4/app/t;

    iget-object v0, v0, Landroid/support/v4/app/t;->hP:Landroid/support/v4/app/v;

    invoke-virtual {v0, p1}, Landroid/support/v4/app/v;->dispatchPrepareOptionsMenu(Landroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public final dispatchResume()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/s;->hQ:Landroid/support/v4/app/t;

    iget-object v0, v0, Landroid/support/v4/app/t;->hP:Landroid/support/v4/app/v;

    invoke-virtual {v0}, Landroid/support/v4/app/v;->dispatchResume()V

    return-void
.end method

.method public final dispatchStart()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/s;->hQ:Landroid/support/v4/app/t;

    iget-object v0, v0, Landroid/support/v4/app/t;->hP:Landroid/support/v4/app/v;

    invoke-virtual {v0}, Landroid/support/v4/app/v;->dispatchStart()V

    return-void
.end method

.method public final dispatchStop()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/s;->hQ:Landroid/support/v4/app/t;

    iget-object v0, v0, Landroid/support/v4/app/t;->hP:Landroid/support/v4/app/v;

    invoke-virtual {v0}, Landroid/support/v4/app/v;->dispatchStop()V

    return-void
.end method

.method public final execPendingActions()Z
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/s;->hQ:Landroid/support/v4/app/t;

    iget-object v0, v0, Landroid/support/v4/app/t;->hP:Landroid/support/v4/app/v;

    invoke-virtual {v0}, Landroid/support/v4/app/v;->execPendingActions()Z

    move-result v0

    return v0
.end method

.method public final noteStateNotSaved()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/s;->hQ:Landroid/support/v4/app/t;

    iget-object v0, v0, Landroid/support/v4/app/t;->hP:Landroid/support/v4/app/v;

    invoke-virtual {v0}, Landroid/support/v4/app/v;->noteStateNotSaved()V

    return-void
.end method

.method public final onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/s;->hQ:Landroid/support/v4/app/t;

    iget-object v0, v0, Landroid/support/v4/app/t;->hP:Landroid/support/v4/app/v;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/support/v4/app/v;->onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public final r(Ljava/lang/String;)Landroid/support/v4/app/Fragment;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/s;->hQ:Landroid/support/v4/app/t;

    iget-object v0, v0, Landroid/support/v4/app/t;->hP:Landroid/support/v4/app/v;

    invoke-virtual {v0, p1}, Landroid/support/v4/app/v;->r(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object p1

    return-object p1
.end method

.method public final saveAllState()Landroid/os/Parcelable;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/s;->hQ:Landroid/support/v4/app/t;

    iget-object v0, v0, Landroid/support/v4/app/t;->hP:Landroid/support/v4/app/v;

    invoke-virtual {v0}, Landroid/support/v4/app/v;->saveAllState()Landroid/os/Parcelable;

    move-result-object v0

    return-object v0
.end method
