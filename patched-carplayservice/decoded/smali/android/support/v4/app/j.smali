.class final Landroid/support/v4/app/j;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/arch/lifecycle/g;


# instance fields
.field final synthetic ib:Landroid/support/v4/app/Fragment;


# direct methods
.method constructor <init>(Landroid/support/v4/app/Fragment;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/app/j;->ib:Landroid/support/v4/app/Fragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final g()Landroid/arch/lifecycle/Lifecycle;
    .locals 3

    iget-object v0, p0, Landroid/support/v4/app/j;->ib:Landroid/support/v4/app/Fragment;

    invoke-static {v0}, Landroid/support/v4/app/Fragment;->d(Landroid/support/v4/app/Fragment;)Landroid/arch/lifecycle/h;

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/app/j;->ib:Landroid/support/v4/app/Fragment;

    new-instance v1, Landroid/arch/lifecycle/h;

    iget-object v2, p0, Landroid/support/v4/app/j;->ib:Landroid/support/v4/app/Fragment;

    iget-object v2, v2, Landroid/support/v4/app/Fragment;->hZ:Landroid/arch/lifecycle/g;

    invoke-direct {v1, v2}, Landroid/arch/lifecycle/h;-><init>(Landroid/arch/lifecycle/g;)V

    invoke-static {v0, v1}, Landroid/support/v4/app/Fragment;->a(Landroid/support/v4/app/Fragment;Landroid/arch/lifecycle/h;)Landroid/arch/lifecycle/h;

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/j;->ib:Landroid/support/v4/app/Fragment;

    invoke-static {v0}, Landroid/support/v4/app/Fragment;->d(Landroid/support/v4/app/Fragment;)Landroid/arch/lifecycle/h;

    move-result-object v0

    return-object v0
.end method
