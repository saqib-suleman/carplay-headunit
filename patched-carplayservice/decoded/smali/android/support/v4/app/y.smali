.class final Landroid/support/v4/app/y;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic iL:Landroid/support/v4/app/x;


# direct methods
.method constructor <init>(Landroid/support/v4/app/x;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/app/y;->iL:Landroid/support/v4/app/x;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    iget-object v0, p0, Landroid/support/v4/app/y;->iL:Landroid/support/v4/app/x;

    iget-object v0, v0, Landroid/support/v4/app/x;->iK:Landroid/support/v4/app/Fragment;

    invoke-virtual {v0}, Landroid/support/v4/app/Fragment;->bp()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/app/y;->iL:Landroid/support/v4/app/x;

    iget-object v0, v0, Landroid/support/v4/app/x;->iK:Landroid/support/v4/app/Fragment;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/app/Fragment;->b(Landroid/view/View;)V

    iget-object v0, p0, Landroid/support/v4/app/y;->iL:Landroid/support/v4/app/x;

    iget-object v1, v0, Landroid/support/v4/app/x;->iI:Landroid/support/v4/app/v;

    iget-object v0, p0, Landroid/support/v4/app/y;->iL:Landroid/support/v4/app/x;

    iget-object v2, v0, Landroid/support/v4/app/x;->iK:Landroid/support/v4/app/Fragment;

    iget-object v0, p0, Landroid/support/v4/app/y;->iL:Landroid/support/v4/app/x;

    iget-object v0, v0, Landroid/support/v4/app/x;->iK:Landroid/support/v4/app/Fragment;

    invoke-virtual {v0}, Landroid/support/v4/app/Fragment;->getStateAfterAnimating()I

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/support/v4/app/v;->a(Landroid/support/v4/app/Fragment;IIIZ)V

    :cond_0
    return-void
.end method
