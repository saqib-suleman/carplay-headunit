.class public Landroid/support/v4/c/p;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/support/v4/c/o;


# instance fields
.field private final mB:[Ljava/lang/Object;

.field private mC:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0xc

    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Landroid/support/v4/c/p;->mB:[Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public acquire()Ljava/lang/Object;
    .locals 4

    iget v0, p0, Landroid/support/v4/c/p;->mC:I

    const/4 v1, 0x0

    if-lez v0, :cond_0

    iget v0, p0, Landroid/support/v4/c/p;->mC:I

    add-int/lit8 v0, v0, -0x1

    iget-object v2, p0, Landroid/support/v4/c/p;->mB:[Ljava/lang/Object;

    aget-object v2, v2, v0

    iget-object v3, p0, Landroid/support/v4/c/p;->mB:[Ljava/lang/Object;

    aput-object v1, v3, v0

    iget v0, p0, Landroid/support/v4/c/p;->mC:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Landroid/support/v4/c/p;->mC:I

    return-object v2

    :cond_0
    return-object v1
.end method

.method public release(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget v2, p0, Landroid/support/v4/c/p;->mC:I

    const/4 v3, 0x1

    if-ge v1, v2, :cond_1

    iget-object v2, p0, Landroid/support/v4/c/p;->mB:[Ljava/lang/Object;

    aget-object v2, v2, v1

    if-ne v2, p1, :cond_0

    move v1, v3

    goto :goto_1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    move v1, v0

    :goto_1
    if-nez v1, :cond_3

    iget v1, p0, Landroid/support/v4/c/p;->mC:I

    iget-object v2, p0, Landroid/support/v4/c/p;->mB:[Ljava/lang/Object;

    array-length v2, v2

    if-ge v1, v2, :cond_2

    iget-object v0, p0, Landroid/support/v4/c/p;->mB:[Ljava/lang/Object;

    iget v1, p0, Landroid/support/v4/c/p;->mC:I

    aput-object p1, v0, v1

    iget p1, p0, Landroid/support/v4/c/p;->mC:I

    add-int/2addr p1, v3

    iput p1, p0, Landroid/support/v4/c/p;->mC:I

    return v3

    :cond_2
    return v0

    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Already in the pool!"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
