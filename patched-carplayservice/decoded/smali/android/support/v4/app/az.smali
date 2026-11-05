.class final Landroid/support/v4/app/az;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/transition/Transition$TransitionListener;


# instance fields
.field final synthetic jJ:Landroid/support/v4/app/aw;

.field final synthetic jL:Ljava/lang/Object;

.field final synthetic jn:Ljava/util/ArrayList;

.field final synthetic jo:Ljava/lang/Object;

.field final synthetic js:Ljava/util/ArrayList;

.field final synthetic jt:Ljava/util/ArrayList;

.field final synthetic ju:Ljava/lang/Object;


# direct methods
.method constructor <init>(Landroid/support/v4/app/aw;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/app/az;->jJ:Landroid/support/v4/app/aw;

    iput-object p2, p0, Landroid/support/v4/app/az;->jo:Ljava/lang/Object;

    iput-object p3, p0, Landroid/support/v4/app/az;->jt:Ljava/util/ArrayList;

    iput-object p4, p0, Landroid/support/v4/app/az;->ju:Ljava/lang/Object;

    iput-object p5, p0, Landroid/support/v4/app/az;->jn:Ljava/util/ArrayList;

    iput-object p6, p0, Landroid/support/v4/app/az;->jL:Ljava/lang/Object;

    iput-object p7, p0, Landroid/support/v4/app/az;->js:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onTransitionCancel(Landroid/transition/Transition;)V
    .locals 0

    return-void
.end method

.method public final onTransitionEnd(Landroid/transition/Transition;)V
    .locals 0

    return-void
.end method

.method public final onTransitionPause(Landroid/transition/Transition;)V
    .locals 0

    return-void
.end method

.method public final onTransitionResume(Landroid/transition/Transition;)V
    .locals 0

    return-void
.end method

.method public final onTransitionStart(Landroid/transition/Transition;)V
    .locals 3

    iget-object p1, p0, Landroid/support/v4/app/az;->jo:Ljava/lang/Object;

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    iget-object p1, p0, Landroid/support/v4/app/az;->jJ:Landroid/support/v4/app/aw;

    iget-object v1, p0, Landroid/support/v4/app/az;->jo:Ljava/lang/Object;

    iget-object v2, p0, Landroid/support/v4/app/az;->jt:Ljava/util/ArrayList;

    invoke-virtual {p1, v1, v2, v0}, Landroid/support/v4/app/aw;->b(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    :cond_0
    iget-object p1, p0, Landroid/support/v4/app/az;->ju:Ljava/lang/Object;

    if-eqz p1, :cond_1

    iget-object p1, p0, Landroid/support/v4/app/az;->jJ:Landroid/support/v4/app/aw;

    iget-object v1, p0, Landroid/support/v4/app/az;->ju:Ljava/lang/Object;

    iget-object v2, p0, Landroid/support/v4/app/az;->jn:Ljava/util/ArrayList;

    invoke-virtual {p1, v1, v2, v0}, Landroid/support/v4/app/aw;->b(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    :cond_1
    iget-object p1, p0, Landroid/support/v4/app/az;->jL:Ljava/lang/Object;

    if-eqz p1, :cond_2

    iget-object p1, p0, Landroid/support/v4/app/az;->jJ:Landroid/support/v4/app/aw;

    iget-object v1, p0, Landroid/support/v4/app/az;->jL:Ljava/lang/Object;

    iget-object v2, p0, Landroid/support/v4/app/az;->js:Ljava/util/ArrayList;

    invoke-virtual {p1, v1, v2, v0}, Landroid/support/v4/app/aw;->b(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    :cond_2
    return-void
.end method
