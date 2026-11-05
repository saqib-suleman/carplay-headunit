.class public final Landroid/support/v4/c/t;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Cloneable;


# static fields
.field private static final mD:Ljava/lang/Object;


# instance fields
.field private mE:Z

.field private mF:[I

.field private mG:[Ljava/lang/Object;

.field private mSize:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Landroid/support/v4/c/t;->mD:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/16 v0, 0xa

    invoke-direct {p0, v0}, Landroid/support/v4/c/t;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/c/t;->mE:Z

    if-nez p1, :cond_0

    sget-object p1, Landroid/support/v4/c/e;->mu:[I

    iput-object p1, p0, Landroid/support/v4/c/t;->mF:[I

    sget-object p1, Landroid/support/v4/c/e;->mw:[Ljava/lang/Object;

    :goto_0
    iput-object p1, p0, Landroid/support/v4/c/t;->mG:[Ljava/lang/Object;

    goto :goto_1

    :cond_0
    invoke-static {p1}, Landroid/support/v4/c/e;->z(I)I

    move-result p1

    new-array v1, p1, [I

    iput-object v1, p0, Landroid/support/v4/c/t;->mF:[I

    new-array p1, p1, [Ljava/lang/Object;

    goto :goto_0

    :goto_1
    iput v0, p0, Landroid/support/v4/c/t;->mSize:I

    return-void
.end method

.method private cb()Landroid/support/v4/c/t;
    .locals 2

    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/c/t;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    iget-object v1, p0, Landroid/support/v4/c/t;->mF:[I

    invoke-virtual {v1}, [I->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    iput-object v1, v0, Landroid/support/v4/c/t;->mF:[I

    iget-object v1, p0, Landroid/support/v4/c/t;->mG:[Ljava/lang/Object;

    invoke-virtual {v1}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Object;

    iput-object v1, v0, Landroid/support/v4/c/t;->mG:[Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_1 .. :try_end_1} :catch_0

    return-object v0

    :catch_0
    move-exception v1

    return-object v0

    :catch_1
    move-exception v0

    const/4 v0, 0x0

    return-object v0
.end method

.method private gc()V
    .locals 8

    iget v0, p0, Landroid/support/v4/c/t;->mSize:I

    iget-object v1, p0, Landroid/support/v4/c/t;->mF:[I

    iget-object v2, p0, Landroid/support/v4/c/t;->mG:[Ljava/lang/Object;

    const/4 v3, 0x0

    move v4, v3

    move v5, v4

    :goto_0
    if-ge v4, v0, :cond_2

    aget-object v6, v2, v4

    sget-object v7, Landroid/support/v4/c/t;->mD:Ljava/lang/Object;

    if-eq v6, v7, :cond_1

    if-eq v4, v5, :cond_0

    aget v7, v1, v4

    aput v7, v1, v5

    aput-object v6, v2, v5

    const/4 v6, 0x0

    aput-object v6, v2, v4

    :cond_0
    add-int/lit8 v5, v5, 0x1

    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_2
    iput-boolean v3, p0, Landroid/support/v4/c/t;->mE:Z

    iput v5, p0, Landroid/support/v4/c/t;->mSize:I

    return-void
.end method


# virtual methods
.method public final clear()V
    .locals 5

    iget v0, p0, Landroid/support/v4/c/t;->mSize:I

    iget-object v1, p0, Landroid/support/v4/c/t;->mG:[Ljava/lang/Object;

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v0, :cond_0

    const/4 v4, 0x0

    aput-object v4, v1, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    iput v2, p0, Landroid/support/v4/c/t;->mSize:I

    iput-boolean v2, p0, Landroid/support/v4/c/t;->mE:Z

    return-void
.end method

.method public final synthetic clone()Ljava/lang/Object;
    .locals 1

    invoke-direct {p0}, Landroid/support/v4/c/t;->cb()Landroid/support/v4/c/t;

    move-result-object v0

    return-object v0
.end method

.method public final get(I)Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Landroid/support/v4/c/t;->mF:[I

    iget v1, p0, Landroid/support/v4/c/t;->mSize:I

    invoke-static {v0, v1, p1}, Landroid/support/v4/c/e;->binarySearch([III)I

    move-result p1

    if-ltz p1, :cond_1

    iget-object v0, p0, Landroid/support/v4/c/t;->mG:[Ljava/lang/Object;

    aget-object v0, v0, p1

    sget-object v1, Landroid/support/v4/c/t;->mD:Ljava/lang/Object;

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/c/t;->mG:[Ljava/lang/Object;

    aget-object p1, v0, p1

    return-object p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public final keyAt(I)I
    .locals 1

    iget-boolean v0, p0, Landroid/support/v4/c/t;->mE:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Landroid/support/v4/c/t;->gc()V

    :cond_0
    iget-object v0, p0, Landroid/support/v4/c/t;->mF:[I

    aget p1, v0, p1

    return p1
.end method

.method public final put(ILjava/lang/Object;)V
    .locals 6

    iget-object v0, p0, Landroid/support/v4/c/t;->mF:[I

    iget v1, p0, Landroid/support/v4/c/t;->mSize:I

    invoke-static {v0, v1, p1}, Landroid/support/v4/c/e;->binarySearch([III)I

    move-result v0

    if-ltz v0, :cond_0

    iget-object p1, p0, Landroid/support/v4/c/t;->mG:[Ljava/lang/Object;

    aput-object p2, p1, v0

    return-void

    :cond_0
    not-int v0, v0

    iget v1, p0, Landroid/support/v4/c/t;->mSize:I

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Landroid/support/v4/c/t;->mG:[Ljava/lang/Object;

    aget-object v1, v1, v0

    sget-object v2, Landroid/support/v4/c/t;->mD:Ljava/lang/Object;

    if-ne v1, v2, :cond_1

    iget-object v1, p0, Landroid/support/v4/c/t;->mF:[I

    aput p1, v1, v0

    iget-object p1, p0, Landroid/support/v4/c/t;->mG:[Ljava/lang/Object;

    aput-object p2, p1, v0

    return-void

    :cond_1
    iget-boolean v1, p0, Landroid/support/v4/c/t;->mE:Z

    if-eqz v1, :cond_2

    iget v1, p0, Landroid/support/v4/c/t;->mSize:I

    iget-object v2, p0, Landroid/support/v4/c/t;->mF:[I

    array-length v2, v2

    if-lt v1, v2, :cond_2

    invoke-direct {p0}, Landroid/support/v4/c/t;->gc()V

    iget-object v0, p0, Landroid/support/v4/c/t;->mF:[I

    iget v1, p0, Landroid/support/v4/c/t;->mSize:I

    invoke-static {v0, v1, p1}, Landroid/support/v4/c/e;->binarySearch([III)I

    move-result v0

    not-int v0, v0

    :cond_2
    iget v1, p0, Landroid/support/v4/c/t;->mSize:I

    iget-object v2, p0, Landroid/support/v4/c/t;->mF:[I

    array-length v2, v2

    if-lt v1, v2, :cond_3

    iget v1, p0, Landroid/support/v4/c/t;->mSize:I

    add-int/lit8 v1, v1, 0x1

    invoke-static {v1}, Landroid/support/v4/c/e;->z(I)I

    move-result v1

    new-array v2, v1, [I

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v3, p0, Landroid/support/v4/c/t;->mF:[I

    iget-object v4, p0, Landroid/support/v4/c/t;->mF:[I

    array-length v4, v4

    const/4 v5, 0x0

    invoke-static {v3, v5, v2, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object v3, p0, Landroid/support/v4/c/t;->mG:[Ljava/lang/Object;

    iget-object v4, p0, Landroid/support/v4/c/t;->mG:[Ljava/lang/Object;

    array-length v4, v4

    invoke-static {v3, v5, v1, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iput-object v2, p0, Landroid/support/v4/c/t;->mF:[I

    iput-object v1, p0, Landroid/support/v4/c/t;->mG:[Ljava/lang/Object;

    :cond_3
    iget v1, p0, Landroid/support/v4/c/t;->mSize:I

    sub-int/2addr v1, v0

    if-eqz v1, :cond_4

    iget-object v1, p0, Landroid/support/v4/c/t;->mF:[I

    iget-object v2, p0, Landroid/support/v4/c/t;->mF:[I

    add-int/lit8 v3, v0, 0x1

    iget v4, p0, Landroid/support/v4/c/t;->mSize:I

    sub-int/2addr v4, v0

    invoke-static {v1, v0, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object v1, p0, Landroid/support/v4/c/t;->mG:[Ljava/lang/Object;

    iget-object v2, p0, Landroid/support/v4/c/t;->mG:[Ljava/lang/Object;

    iget v4, p0, Landroid/support/v4/c/t;->mSize:I

    sub-int/2addr v4, v0

    invoke-static {v1, v0, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_4
    iget-object v1, p0, Landroid/support/v4/c/t;->mF:[I

    aput p1, v1, v0

    iget-object p1, p0, Landroid/support/v4/c/t;->mG:[Ljava/lang/Object;

    aput-object p2, p1, v0

    iget p1, p0, Landroid/support/v4/c/t;->mSize:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Landroid/support/v4/c/t;->mSize:I

    return-void
.end method

.method public final remove(I)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/c/t;->mF:[I

    iget v1, p0, Landroid/support/v4/c/t;->mSize:I

    invoke-static {v0, v1, p1}, Landroid/support/v4/c/e;->binarySearch([III)I

    move-result p1

    if-ltz p1, :cond_0

    iget-object v0, p0, Landroid/support/v4/c/t;->mG:[Ljava/lang/Object;

    aget-object v0, v0, p1

    sget-object v1, Landroid/support/v4/c/t;->mD:Ljava/lang/Object;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Landroid/support/v4/c/t;->mG:[Ljava/lang/Object;

    sget-object v1, Landroid/support/v4/c/t;->mD:Ljava/lang/Object;

    aput-object v1, v0, p1

    const/4 p1, 0x1

    iput-boolean p1, p0, Landroid/support/v4/c/t;->mE:Z

    :cond_0
    return-void
.end method

.method public final size()I
    .locals 1

    iget-boolean v0, p0, Landroid/support/v4/c/t;->mE:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Landroid/support/v4/c/t;->gc()V

    :cond_0
    iget v0, p0, Landroid/support/v4/c/t;->mSize:I

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    invoke-virtual {p0}, Landroid/support/v4/c/t;->size()I

    move-result v0

    if-gtz v0, :cond_0

    const-string v0, "{}"

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/support/v4/c/t;->mSize:I

    mul-int/lit8 v1, v1, 0x1c

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const/16 v1, 0x7b

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    :goto_0
    iget v2, p0, Landroid/support/v4/c/t;->mSize:I

    if-ge v1, v2, :cond_3

    if-lez v1, :cond_1

    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    invoke-virtual {p0, v1}, Landroid/support/v4/c/t;->keyAt(I)I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v2, 0x3d

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v1}, Landroid/support/v4/c/t;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, p0, :cond_2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_1

    :cond_2
    const-string v2, "(this Map)"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final valueAt(I)Ljava/lang/Object;
    .locals 1

    iget-boolean v0, p0, Landroid/support/v4/c/t;->mE:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Landroid/support/v4/c/t;->gc()V

    :cond_0
    iget-object v0, p0, Landroid/support/v4/c/t;->mG:[Ljava/lang/Object;

    aget-object p1, v0, p1

    return-object p1
.end method
