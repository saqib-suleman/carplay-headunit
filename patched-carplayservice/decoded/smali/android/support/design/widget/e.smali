.class public final Landroid/support/design/widget/e;
.super Landroid/view/ViewGroup$MarginLayoutParams;


# instance fields
.field public gravity:I

.field private hA:Z

.field final hB:Landroid/graphics/Rect;

.field hC:Ljava/lang/Object;

.field hm:Landroid/support/design/widget/c;

.field hn:Z

.field public ho:I

.field public hp:I

.field hq:I

.field public hr:I

.field public hs:I

.field ht:I

.field hu:I

.field hv:Landroid/view/View;

.field hw:Landroid/view/View;

.field private hx:Z

.field private hy:Z

.field private hz:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    const/4 v0, -0x2

    invoke-direct {p0, v0, v0}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/design/widget/e;->hn:Z

    iput v0, p0, Landroid/support/design/widget/e;->gravity:I

    iput v0, p0, Landroid/support/design/widget/e;->ho:I

    const/4 v1, -0x1

    iput v1, p0, Landroid/support/design/widget/e;->hp:I

    iput v1, p0, Landroid/support/design/widget/e;->hq:I

    iput v0, p0, Landroid/support/design/widget/e;->hr:I

    iput v0, p0, Landroid/support/design/widget/e;->hs:I

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/support/design/widget/e;->hB:Landroid/graphics/Rect;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4

    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/design/widget/e;->hn:Z

    iput v0, p0, Landroid/support/design/widget/e;->gravity:I

    iput v0, p0, Landroid/support/design/widget/e;->ho:I

    const/4 v1, -0x1

    iput v1, p0, Landroid/support/design/widget/e;->hp:I

    iput v1, p0, Landroid/support/design/widget/e;->hq:I

    iput v0, p0, Landroid/support/design/widget/e;->hr:I

    iput v0, p0, Landroid/support/design/widget/e;->hs:I

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Landroid/support/design/widget/e;->hB:Landroid/graphics/Rect;

    sget-object v2, Landroid/support/b/b;->gJ:[I

    invoke-virtual {p1, p2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v2

    sget v3, Landroid/support/b/b;->gK:I

    invoke-virtual {v2, v3, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v3

    iput v3, p0, Landroid/support/design/widget/e;->gravity:I

    sget v3, Landroid/support/b/b;->gL:I

    invoke-virtual {v2, v3, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    iput v3, p0, Landroid/support/design/widget/e;->hq:I

    sget v3, Landroid/support/b/b;->gM:I

    invoke-virtual {v2, v3, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v3

    iput v3, p0, Landroid/support/design/widget/e;->ho:I

    sget v3, Landroid/support/b/b;->gQ:I

    invoke-virtual {v2, v3, v1}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v1

    iput v1, p0, Landroid/support/design/widget/e;->hp:I

    sget v1, Landroid/support/b/b;->gP:I

    invoke-virtual {v2, v1, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p0, Landroid/support/design/widget/e;->hr:I

    sget v1, Landroid/support/b/b;->gO:I

    invoke-virtual {v2, v1, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Landroid/support/design/widget/e;->hs:I

    sget v0, Landroid/support/b/b;->gN:I

    invoke-virtual {v2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    iput-boolean v0, p0, Landroid/support/design/widget/e;->hn:Z

    iget-boolean v0, p0, Landroid/support/design/widget/e;->hn:Z

    if-eqz v0, :cond_0

    sget v0, Landroid/support/b/b;->gN:I

    invoke-virtual {v2, v0}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, p2, v0}, Landroid/support/design/widget/CoordinatorLayout;->a(Landroid/content/Context;Landroid/util/AttributeSet;Ljava/lang/String;)Landroid/support/design/widget/c;

    move-result-object p1

    iput-object p1, p0, Landroid/support/design/widget/e;->hm:Landroid/support/design/widget/c;

    :cond_0
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method

.method public constructor <init>(Landroid/support/design/widget/e;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Landroid/support/design/widget/e;->hn:Z

    iput p1, p0, Landroid/support/design/widget/e;->gravity:I

    iput p1, p0, Landroid/support/design/widget/e;->ho:I

    const/4 v0, -0x1

    iput v0, p0, Landroid/support/design/widget/e;->hp:I

    iput v0, p0, Landroid/support/design/widget/e;->hq:I

    iput p1, p0, Landroid/support/design/widget/e;->hr:I

    iput p1, p0, Landroid/support/design/widget/e;->hs:I

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Landroid/support/design/widget/e;->hB:Landroid/graphics/Rect;

    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup$LayoutParams;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Landroid/support/design/widget/e;->hn:Z

    iput p1, p0, Landroid/support/design/widget/e;->gravity:I

    iput p1, p0, Landroid/support/design/widget/e;->ho:I

    const/4 v0, -0x1

    iput v0, p0, Landroid/support/design/widget/e;->hp:I

    iput v0, p0, Landroid/support/design/widget/e;->hq:I

    iput p1, p0, Landroid/support/design/widget/e;->hr:I

    iput p1, p0, Landroid/support/design/widget/e;->hs:I

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Landroid/support/design/widget/e;->hB:Landroid/graphics/Rect;

    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup$MarginLayoutParams;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Landroid/support/design/widget/e;->hn:Z

    iput p1, p0, Landroid/support/design/widget/e;->gravity:I

    iput p1, p0, Landroid/support/design/widget/e;->ho:I

    const/4 v0, -0x1

    iput v0, p0, Landroid/support/design/widget/e;->hp:I

    iput v0, p0, Landroid/support/design/widget/e;->hq:I

    iput p1, p0, Landroid/support/design/widget/e;->hr:I

    iput p1, p0, Landroid/support/design/widget/e;->hs:I

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Landroid/support/design/widget/e;->hB:Landroid/graphics/Rect;

    return-void
.end method


# virtual methods
.method public final a(Landroid/support/design/widget/c;)V
    .locals 1

    iget-object v0, p0, Landroid/support/design/widget/e;->hm:Landroid/support/design/widget/c;

    if-eq v0, p1, :cond_0

    iput-object p1, p0, Landroid/support/design/widget/e;->hm:Landroid/support/design/widget/c;

    const/4 p1, 0x0

    iput-object p1, p0, Landroid/support/design/widget/e;->hC:Ljava/lang/Object;

    const/4 p1, 0x1

    iput-boolean p1, p0, Landroid/support/design/widget/e;->hn:Z

    :cond_0
    return-void
.end method

.method final aN()Z
    .locals 1

    iget-object v0, p0, Landroid/support/design/widget/e;->hm:Landroid/support/design/widget/c;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/design/widget/e;->hx:Z

    :cond_0
    iget-boolean v0, p0, Landroid/support/design/widget/e;->hx:Z

    return v0
.end method

.method final aO()Z
    .locals 1

    iget-boolean v0, p0, Landroid/support/design/widget/e;->hx:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    iget-boolean v0, p0, Landroid/support/design/widget/e;->hx:Z

    or-int/lit8 v0, v0, 0x0

    iput-boolean v0, p0, Landroid/support/design/widget/e;->hx:Z

    return v0
.end method

.method final aP()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/design/widget/e;->hx:Z

    return-void
.end method

.method final aQ()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/design/widget/e;->hA:Z

    return-void
.end method

.method final p(I)V
    .locals 1

    const/4 v0, 0x0

    packed-switch p1, :pswitch_data_0

    return-void

    :pswitch_0
    iput-boolean v0, p0, Landroid/support/design/widget/e;->hz:Z

    return-void

    :pswitch_1
    iput-boolean v0, p0, Landroid/support/design/widget/e;->hy:Z

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method final q(I)Z
    .locals 0

    packed-switch p1, :pswitch_data_0

    const/4 p1, 0x0

    return p1

    :pswitch_0
    iget-boolean p1, p0, Landroid/support/design/widget/e;->hz:Z

    return p1

    :pswitch_1
    iget-boolean p1, p0, Landroid/support/design/widget/e;->hy:Z

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
