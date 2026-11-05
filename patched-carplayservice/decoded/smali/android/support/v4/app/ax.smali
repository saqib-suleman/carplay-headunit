.class final Landroid/support/v4/app/ax;
.super Landroid/transition/Transition$EpicenterCallback;


# instance fields
.field final synthetic jJ:Landroid/support/v4/app/aw;

.field final synthetic jz:Landroid/graphics/Rect;


# direct methods
.method constructor <init>(Landroid/support/v4/app/aw;Landroid/graphics/Rect;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/app/ax;->jJ:Landroid/support/v4/app/aw;

    iput-object p2, p0, Landroid/support/v4/app/ax;->jz:Landroid/graphics/Rect;

    invoke-direct {p0}, Landroid/transition/Transition$EpicenterCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public final onGetEpicenter(Landroid/transition/Transition;)Landroid/graphics/Rect;
    .locals 0

    iget-object p1, p0, Landroid/support/v4/app/ax;->jz:Landroid/graphics/Rect;

    return-object p1
.end method
