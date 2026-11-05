.class final Landroid/support/v4/app/ae;
.super Ljava/lang/Object;


# instance fields
.field public final animator:Landroid/animation/Animator;

.field public final iQ:Landroid/view/animation/Animation;


# direct methods
.method private constructor <init>(Landroid/animation/Animator;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v4/app/ae;->iQ:Landroid/view/animation/Animation;

    iput-object p1, p0, Landroid/support/v4/app/ae;->animator:Landroid/animation/Animator;

    if-eqz p1, :cond_0

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Animator cannot be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method synthetic constructor <init>(Landroid/animation/Animator;B)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/support/v4/app/ae;-><init>(Landroid/animation/Animator;)V

    return-void
.end method

.method private constructor <init>(Landroid/view/animation/Animation;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/support/v4/app/ae;->iQ:Landroid/view/animation/Animation;

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v4/app/ae;->animator:Landroid/animation/Animator;

    if-eqz p1, :cond_0

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Animation cannot be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method synthetic constructor <init>(Landroid/view/animation/Animation;B)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/support/v4/app/ae;-><init>(Landroid/view/animation/Animation;)V

    return-void
.end method
