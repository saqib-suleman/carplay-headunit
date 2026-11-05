.class final Landroid/support/v4/app/z;
.super Landroid/animation/AnimatorListenerAdapter;


# instance fields
.field final synthetic iI:Landroid/support/v4/app/v;

.field final synthetic iJ:Landroid/view/ViewGroup;

.field final synthetic iK:Landroid/support/v4/app/Fragment;

.field final synthetic iM:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/support/v4/app/v;Landroid/view/ViewGroup;Landroid/view/View;Landroid/support/v4/app/Fragment;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/app/z;->iI:Landroid/support/v4/app/v;

    iput-object p2, p0, Landroid/support/v4/app/z;->iJ:Landroid/view/ViewGroup;

    iput-object p3, p0, Landroid/support/v4/app/z;->iM:Landroid/view/View;

    iput-object p4, p0, Landroid/support/v4/app/z;->iK:Landroid/support/v4/app/Fragment;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAnimationEnd(Landroid/animation/Animator;)V
    .locals 6

    iget-object p1, p0, Landroid/support/v4/app/z;->iJ:Landroid/view/ViewGroup;

    iget-object v0, p0, Landroid/support/v4/app/z;->iM:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->endViewTransition(Landroid/view/View;)V

    iget-object p1, p0, Landroid/support/v4/app/z;->iK:Landroid/support/v4/app/Fragment;

    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->getAnimator()Landroid/animation/Animator;

    move-result-object p1

    iget-object v0, p0, Landroid/support/v4/app/z;->iK:Landroid/support/v4/app/Fragment;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/app/Fragment;->a(Landroid/animation/Animator;)V

    if-eqz p1, :cond_0

    iget-object p1, p0, Landroid/support/v4/app/z;->iJ:Landroid/view/ViewGroup;

    iget-object v0, p0, Landroid/support/v4/app/z;->iM:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result p1

    if-gez p1, :cond_0

    iget-object v0, p0, Landroid/support/v4/app/z;->iI:Landroid/support/v4/app/v;

    iget-object v1, p0, Landroid/support/v4/app/z;->iK:Landroid/support/v4/app/Fragment;

    iget-object p1, p0, Landroid/support/v4/app/z;->iK:Landroid/support/v4/app/Fragment;

    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->getStateAfterAnimating()I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/support/v4/app/v;->a(Landroid/support/v4/app/Fragment;IIIZ)V

    :cond_0
    return-void
.end method
