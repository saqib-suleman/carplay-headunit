.class public final Landroid/support/v4/view/a/b;
.super Ljava/lang/Object;


# instance fields
.field private final nY:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_0

    new-instance v0, Landroid/support/v4/view/a/d;

    invoke-direct {v0, p0}, Landroid/support/v4/view/a/d;-><init>(Landroid/support/v4/view/a/b;)V

    :goto_0
    iput-object v0, p0, Landroid/support/v4/view/a/b;->nY:Ljava/lang/Object;

    return-void

    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_1

    new-instance v0, Landroid/support/v4/view/a/c;

    invoke-direct {v0, p0}, Landroid/support/v4/view/a/c;-><init>(Landroid/support/v4/view/a/b;)V

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/support/v4/view/a/b;->nY:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final ct()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/view/a/b;->nY:Ljava/lang/Object;

    return-object v0
.end method
