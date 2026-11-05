.class final Landroid/support/v4/app/x;
.super Landroid/support/v4/app/ad;


# instance fields
.field final synthetic iI:Landroid/support/v4/app/v;

.field final synthetic iJ:Landroid/view/ViewGroup;

.field final synthetic iK:Landroid/support/v4/app/Fragment;


# direct methods
.method constructor <init>(Landroid/support/v4/app/v;Landroid/view/animation/Animation$AnimationListener;Landroid/view/ViewGroup;Landroid/support/v4/app/Fragment;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/app/x;->iI:Landroid/support/v4/app/v;

    iput-object p3, p0, Landroid/support/v4/app/x;->iJ:Landroid/view/ViewGroup;

    iput-object p4, p0, Landroid/support/v4/app/x;->iK:Landroid/support/v4/app/Fragment;

    const/4 p1, 0x0

    invoke-direct {p0, p2, p1}, Landroid/support/v4/app/ad;-><init>(Landroid/view/animation/Animation$AnimationListener;B)V

    return-void
.end method


# virtual methods
.method public final onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/support/v4/app/ad;->onAnimationEnd(Landroid/view/animation/Animation;)V

    iget-object p1, p0, Landroid/support/v4/app/x;->iJ:Landroid/view/ViewGroup;

    new-instance v0, Landroid/support/v4/app/y;

    invoke-direct {v0, p0}, Landroid/support/v4/app/y;-><init>(Landroid/support/v4/app/x;)V

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
