.class final Landroid/support/v4/c/b;
.super Landroid/support/v4/c/h;


# instance fields
.field final synthetic ms:Landroid/support/v4/c/a;


# direct methods
.method constructor <init>(Landroid/support/v4/c/a;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/c/b;->ms:Landroid/support/v4/c/a;

    invoke-direct {p0}, Landroid/support/v4/c/h;-><init>()V

    return-void
.end method


# virtual methods
.method protected final colClear()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/c/b;->ms:Landroid/support/v4/c/a;

    invoke-virtual {v0}, Landroid/support/v4/c/a;->clear()V

    return-void
.end method

.method protected final colGetEntry(II)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/c/b;->ms:Landroid/support/v4/c/a;

    iget-object v0, v0, Landroid/support/v4/c/a;->mArray:[Ljava/lang/Object;

    shl-int/lit8 p1, p1, 0x1

    add-int/2addr p1, p2

    aget-object p1, v0, p1

    return-object p1
.end method

.method protected final colGetMap()Ljava/util/Map;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/c/b;->ms:Landroid/support/v4/c/a;

    return-object v0
.end method

.method protected final colGetSize()I
    .locals 1

    iget-object v0, p0, Landroid/support/v4/c/b;->ms:Landroid/support/v4/c/a;

    iget v0, v0, Landroid/support/v4/c/a;->mSize:I

    return v0
.end method

.method protected final colIndexOfKey(Ljava/lang/Object;)I
    .locals 1

    iget-object v0, p0, Landroid/support/v4/c/b;->ms:Landroid/support/v4/c/a;

    invoke-virtual {v0, p1}, Landroid/support/v4/c/a;->indexOfKey(Ljava/lang/Object;)I

    move-result p1

    return p1
.end method

.method protected final colIndexOfValue(Ljava/lang/Object;)I
    .locals 1

    iget-object v0, p0, Landroid/support/v4/c/b;->ms:Landroid/support/v4/c/a;

    invoke-virtual {v0, p1}, Landroid/support/v4/c/a;->indexOfValue(Ljava/lang/Object;)I

    move-result p1

    return p1
.end method

.method protected final colPut(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/c/b;->ms:Landroid/support/v4/c/a;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/c/a;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method protected final colRemoveAt(I)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/c/b;->ms:Landroid/support/v4/c/a;

    invoke-virtual {v0, p1}, Landroid/support/v4/c/a;->removeAt(I)Ljava/lang/Object;

    return-void
.end method

.method protected final colSetValue(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Landroid/support/v4/c/b;->ms:Landroid/support/v4/c/a;

    shl-int/lit8 p1, p1, 0x1

    add-int/lit8 p1, p1, 0x1

    iget-object v1, v0, Landroid/support/v4/c/s;->mArray:[Ljava/lang/Object;

    aget-object v1, v1, p1

    iget-object v0, v0, Landroid/support/v4/c/s;->mArray:[Ljava/lang/Object;

    aput-object p2, v0, p1

    return-object v1
.end method
