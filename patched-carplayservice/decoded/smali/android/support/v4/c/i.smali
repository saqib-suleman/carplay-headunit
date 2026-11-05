.class final Landroid/support/v4/c/i;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/Iterator;


# instance fields
.field final synthetic mA:Landroid/support/v4/c/h;

.field mCanRemove:Z

.field mIndex:I

.field final mOffset:I

.field mSize:I


# direct methods
.method constructor <init>(Landroid/support/v4/c/h;I)V
    .locals 1

    iput-object p1, p0, Landroid/support/v4/c/i;->mA:Landroid/support/v4/c/h;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/c/i;->mCanRemove:Z

    iput p2, p0, Landroid/support/v4/c/i;->mOffset:I

    invoke-virtual {p1}, Landroid/support/v4/c/h;->colGetSize()I

    move-result p1

    iput p1, p0, Landroid/support/v4/c/i;->mSize:I

    return-void
.end method


# virtual methods
.method public final hasNext()Z
    .locals 2

    iget v0, p0, Landroid/support/v4/c/i;->mIndex:I

    iget v1, p0, Landroid/support/v4/c/i;->mSize:I

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final next()Ljava/lang/Object;
    .locals 3

    invoke-virtual {p0}, Landroid/support/v4/c/i;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/c/i;->mA:Landroid/support/v4/c/h;

    iget v1, p0, Landroid/support/v4/c/i;->mIndex:I

    iget v2, p0, Landroid/support/v4/c/i;->mOffset:I

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/c/h;->colGetEntry(II)Ljava/lang/Object;

    move-result-object v0

    iget v1, p0, Landroid/support/v4/c/i;->mIndex:I

    const/4 v2, 0x1

    add-int/2addr v1, v2

    iput v1, p0, Landroid/support/v4/c/i;->mIndex:I

    iput-boolean v2, p0, Landroid/support/v4/c/i;->mCanRemove:Z

    return-object v0

    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public final remove()V
    .locals 2

    iget-boolean v0, p0, Landroid/support/v4/c/i;->mCanRemove:Z

    if-eqz v0, :cond_0

    iget v0, p0, Landroid/support/v4/c/i;->mIndex:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Landroid/support/v4/c/i;->mIndex:I

    iget v0, p0, Landroid/support/v4/c/i;->mSize:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Landroid/support/v4/c/i;->mSize:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/c/i;->mCanRemove:Z

    iget-object v0, p0, Landroid/support/v4/c/i;->mA:Landroid/support/v4/c/h;

    iget v1, p0, Landroid/support/v4/c/i;->mIndex:I

    invoke-virtual {v0, v1}, Landroid/support/v4/c/h;->colRemoveAt(I)V

    return-void

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method
