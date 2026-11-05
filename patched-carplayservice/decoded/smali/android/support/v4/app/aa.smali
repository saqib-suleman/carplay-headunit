.class final Landroid/support/v4/app/aa;
.super Landroid/animation/AnimatorListenerAdapter;


# instance fields
.field final synthetic iI:Landroid/support/v4/app/v;

.field final synthetic iJ:Landroid/view/ViewGroup;

.field final synthetic iK:Landroid/support/v4/app/Fragment;

.field final synthetic iN:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/support/v4/app/v;Landroid/view/ViewGroup;Landroid/view/View;Landroid/support/v4/app/Fragment;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/app/aa;->iI:Landroid/support/v4/app/v;

    iput-object p2, p0, Landroid/support/v4/app/aa;->iJ:Landroid/view/ViewGroup;

    iput-object p3, p0, Landroid/support/v4/app/aa;->iN:Landroid/view/View;

    iput-object p4, p0, Landroid/support/v4/app/aa;->iK:Landroid/support/v4/app/Fragment;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/app/aa;->iJ:Landroid/view/ViewGroup;

    iget-object v1, p0, Landroid/support/v4/app/aa;->iN:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->endViewTransition(Landroid/view/View;)V

    invoke-virtual {p1, p0}, Landroid/animation/Animator;->removeListener(Landroid/animation/Animator$AnimatorListener;)V

    iget-object p1, p0, Landroid/support/v4/app/aa;->iK:Landroid/support/v4/app/Fragment;

    iget-object p1, p1, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    if-eqz p1, :cond_0

    iget-object p1, p0, Landroid/support/v4/app/aa;->iK:Landroid/support/v4/app/Fragment;

    iget-object p1, p1, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void
.end method
