.class final Landroid/support/v4/app/p;
.super Landroid/support/v4/app/t;


# instance fields
.field final synthetic iv:Landroid/support/v4/app/n;


# direct methods
.method public constructor <init>(Landroid/support/v4/app/n;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/app/p;->iv:Landroid/support/v4/app/n;

    invoke-direct {p0, p1}, Landroid/support/v4/app/t;-><init>(Landroid/support/v4/app/n;)V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/app/p;->iv:Landroid/support/v4/app/n;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1, p2, p3}, Landroid/support/v4/app/n;->dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    return-void
.end method

.method public final br()Z
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/p;->iv:Landroid/support/v4/app/n;

    invoke-virtual {v0}, Landroid/support/v4/app/n;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final bs()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/p;->iv:Landroid/support/v4/app/n;

    invoke-virtual {v0}, Landroid/support/v4/app/n;->invalidateOptionsMenu()V

    return-void
.end method

.method public final onFindViewById(I)Landroid/view/View;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/p;->iv:Landroid/support/v4/app/n;

    invoke-virtual {v0, p1}, Landroid/support/v4/app/n;->findViewById(I)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public final onGetLayoutInflater()Landroid/view/LayoutInflater;
    .locals 2

    iget-object v0, p0, Landroid/support/v4/app/p;->iv:Landroid/support/v4/app/n;

    invoke-virtual {v0}, Landroid/support/v4/app/n;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v4/app/p;->iv:Landroid/support/v4/app/n;

    invoke-virtual {v0, v1}, Landroid/view/LayoutInflater;->cloneInContext(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    return-object v0
.end method

.method public final onGetWindowAnimations()I
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/p;->iv:Landroid/support/v4/app/n;

    invoke-virtual {v0}, Landroid/support/v4/app/n;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->windowAnimations:I

    return v0
.end method

.method public final onHasView()Z
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/p;->iv:Landroid/support/v4/app/n;

    invoke-virtual {v0}, Landroid/support/v4/app/n;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/Window;->peekDecorView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final onHasWindowAnimations()Z
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/p;->iv:Landroid/support/v4/app/n;

    invoke-virtual {v0}, Landroid/support/v4/app/n;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method
