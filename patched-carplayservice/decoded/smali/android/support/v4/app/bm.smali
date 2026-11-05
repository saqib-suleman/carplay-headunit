.class public Landroid/support/v4/app/bm;
.super Landroid/app/Activity;

# interfaces
.implements Landroid/arch/lifecycle/g;


# instance fields
.field private hX:Landroid/arch/lifecycle/h;

.field private jZ:Landroid/support/v4/c/s;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    new-instance v0, Landroid/support/v4/c/s;

    invoke-direct {v0}, Landroid/support/v4/c/s;-><init>()V

    iput-object v0, p0, Landroid/support/v4/app/bm;->jZ:Landroid/support/v4/c/s;

    new-instance v0, Landroid/arch/lifecycle/h;

    invoke-direct {v0, p0}, Landroid/arch/lifecycle/h;-><init>(Landroid/arch/lifecycle/g;)V

    iput-object v0, p0, Landroid/support/v4/app/bm;->hX:Landroid/arch/lifecycle/h;

    return-void
.end method


# virtual methods
.method public g()Landroid/arch/lifecycle/Lifecycle;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/bm;->hX:Landroid/arch/lifecycle/h;

    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-static {p0}, Landroid/arch/lifecycle/s;->a(Landroid/app/Activity;)V

    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/app/bm;->hX:Landroid/arch/lifecycle/h;

    sget-object v1, Landroid/arch/lifecycle/Lifecycle$State;->F:Landroid/arch/lifecycle/Lifecycle$State;

    invoke-virtual {v0, v1}, Landroid/arch/lifecycle/h;->b(Landroid/arch/lifecycle/Lifecycle$State;)V

    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    return-void
.end method
