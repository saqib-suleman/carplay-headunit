.class public abstract Landroid/support/v4/app/t;
.super Landroid/support/v4/app/r;


# instance fields
.field final hP:Landroid/support/v4/app/v;

.field private final mActivity:Landroid/app/Activity;

.field private final mContext:Landroid/content/Context;

.field private final mHandler:Landroid/os/Handler;

.field private final mWindowAnimations:I


# direct methods
.method private constructor <init>(Landroid/app/Activity;Landroid/content/Context;Landroid/os/Handler;)V
    .locals 1

    invoke-direct {p0}, Landroid/support/v4/app/r;-><init>()V

    new-instance v0, Landroid/support/v4/app/v;

    invoke-direct {v0}, Landroid/support/v4/app/v;-><init>()V

    iput-object v0, p0, Landroid/support/v4/app/t;->hP:Landroid/support/v4/app/v;

    iput-object p1, p0, Landroid/support/v4/app/t;->mActivity:Landroid/app/Activity;

    const-string p1, "context == null"

    invoke-static {p2, p1}, Landroid/support/v4/c/r;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/Context;

    iput-object p1, p0, Landroid/support/v4/app/t;->mContext:Landroid/content/Context;

    const-string p1, "handler == null"

    invoke-static {p3, p1}, Landroid/support/v4/c/r;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/Handler;

    iput-object p1, p0, Landroid/support/v4/app/t;->mHandler:Landroid/os/Handler;

    const/4 p1, 0x0

    iput p1, p0, Landroid/support/v4/app/t;->mWindowAnimations:I

    return-void
.end method

.method constructor <init>(Landroid/support/v4/app/n;)V
    .locals 1

    iget-object v0, p1, Landroid/support/v4/app/n;->mHandler:Landroid/os/Handler;

    invoke-direct {p0, p1, p1, v0}, Landroid/support/v4/app/t;-><init>(Landroid/app/Activity;Landroid/content/Context;Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public br()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public bs()V
    .locals 0

    return-void
.end method

.method final getActivity()Landroid/app/Activity;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/t;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method final getContext()Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/t;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method final getHandler()Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/t;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public onFindViewById(I)Landroid/view/View;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public onGetLayoutInflater()Landroid/view/LayoutInflater;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/t;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    return-object v0
.end method

.method public onGetWindowAnimations()I
    .locals 1

    iget v0, p0, Landroid/support/v4/app/t;->mWindowAnimations:I

    return v0
.end method

.method public onHasView()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public onHasWindowAnimations()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
