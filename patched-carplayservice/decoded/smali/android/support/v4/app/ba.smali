.class final Landroid/support/v4/app/ba;
.super Landroid/transition/Transition$EpicenterCallback;


# instance fields
.field final synthetic jJ:Landroid/support/v4/app/aw;

.field final synthetic jz:Landroid/graphics/Rect;


# direct methods
.method constructor <init>(Landroid/support/v4/app/aw;Landroid/graphics/Rect;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/app/ba;->jJ:Landroid/support/v4/app/aw;

    iput-object p2, p0, Landroid/support/v4/app/ba;->jz:Landroid/graphics/Rect;

    invoke-direct {p0}, Landroid/transition/Transition$EpicenterCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public final onGetEpicenter(Landroid/transition/Transition;)Landroid/graphics/Rect;
    .locals 0

    iget-object p1, p0, Landroid/support/v4/app/ba;->jz:Landroid/graphics/Rect;

    if-eqz p1, :cond_1

    iget-object p1, p0, Landroid/support/v4/app/ba;->jz:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/Rect;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Landroid/support/v4/app/ba;->jz:Landroid/graphics/Rect;

    return-object p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method
