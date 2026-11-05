.class public final Lcom/autochips/carplay/common/b;
.super Ljava/lang/Object;


# instance fields
.field qt:I

.field qu:I

.field qv:Lcom/autochips/carplay/common/d;

.field qw:I

.field qx:I


# direct methods
.method public constructor <init>(IIIIII)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/autochips/carplay/common/b;->qt:I

    iput p2, p0, Lcom/autochips/carplay/common/b;->qu:I

    new-instance p1, Lcom/autochips/carplay/common/d;

    invoke-direct {p1, p3, p4}, Lcom/autochips/carplay/common/d;-><init>(II)V

    iput-object p1, p0, Lcom/autochips/carplay/common/b;->qv:Lcom/autochips/carplay/common/d;

    iput p5, p0, Lcom/autochips/carplay/common/b;->qw:I

    iput p6, p0, Lcom/autochips/carplay/common/b;->qx:I

    return-void
.end method


# virtual methods
.method public final a(Lcom/autochips/carplay/common/b;)Z
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    iget v1, p0, Lcom/autochips/carplay/common/b;->qt:I

    iget v2, p1, Lcom/autochips/carplay/common/b;->qt:I

    if-ne v1, v2, :cond_2

    iget v1, p0, Lcom/autochips/carplay/common/b;->qu:I

    iget p1, p1, Lcom/autochips/carplay/common/b;->qu:I

    if-eq v1, p1, :cond_1

    goto :goto_0

    :cond_1
    return v0

    :cond_2
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method public final b(Lcom/autochips/carplay/common/b;)Z
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    iget-object v1, p0, Lcom/autochips/carplay/common/b;->qv:Lcom/autochips/carplay/common/d;

    iget-object v2, p1, Lcom/autochips/carplay/common/b;->qv:Lcom/autochips/carplay/common/d;

    invoke-virtual {v1, v2}, Lcom/autochips/carplay/common/d;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget v1, p0, Lcom/autochips/carplay/common/b;->qw:I

    iget v2, p1, Lcom/autochips/carplay/common/b;->qw:I

    if-ne v1, v2, :cond_2

    iget v1, p0, Lcom/autochips/carplay/common/b;->qx:I

    iget p1, p1, Lcom/autochips/carplay/common/b;->qx:I

    if-eq v1, p1, :cond_1

    goto :goto_0

    :cond_1
    return v0

    :cond_2
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method public final cS()I
    .locals 1

    iget v0, p0, Lcom/autochips/carplay/common/b;->qt:I

    return v0
.end method

.method public final cT()Lcom/autochips/carplay/common/d;
    .locals 1

    iget-object v0, p0, Lcom/autochips/carplay/common/b;->qv:Lcom/autochips/carplay/common/d;

    return-object v0
.end method

.method public final cU()I
    .locals 1

    iget v0, p0, Lcom/autochips/carplay/common/b;->qw:I

    return v0
.end method

.method public final cV()I
    .locals 1

    iget v0, p0, Lcom/autochips/carplay/common/b;->qx:I

    return v0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_1

    return v0

    :cond_1
    instance-of v1, p1, Lcom/autochips/carplay/common/b;

    if-eqz v1, :cond_2

    iget v1, p0, Lcom/autochips/carplay/common/b;->qt:I

    check-cast p1, Lcom/autochips/carplay/common/b;

    iget v2, p1, Lcom/autochips/carplay/common/b;->qt:I

    if-ne v1, v2, :cond_2

    iget v1, p0, Lcom/autochips/carplay/common/b;->qu:I

    iget v2, p1, Lcom/autochips/carplay/common/b;->qu:I

    if-ne v1, v2, :cond_2

    iget-object v1, p0, Lcom/autochips/carplay/common/b;->qv:Lcom/autochips/carplay/common/d;

    iget-object v2, p1, Lcom/autochips/carplay/common/b;->qv:Lcom/autochips/carplay/common/d;

    invoke-virtual {v1, v2}, Lcom/autochips/carplay/common/d;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget v1, p0, Lcom/autochips/carplay/common/b;->qw:I

    iget v2, p1, Lcom/autochips/carplay/common/b;->qw:I

    if-ne v1, v2, :cond_2

    iget v1, p0, Lcom/autochips/carplay/common/b;->qx:I

    iget p1, p1, Lcom/autochips/carplay/common/b;->qx:I

    if-ne v1, p1, :cond_2

    const/4 p1, 0x1

    return p1

    :cond_2
    return v0
.end method

.method public final getMainAudio()I
    .locals 1

    iget v0, p0, Lcom/autochips/carplay/common/b;->qu:I

    return v0
.end method

.method public final hashCode()I
    .locals 2

    iget v0, p0, Lcom/autochips/carplay/common/b;->qt:I

    iget v1, p0, Lcom/autochips/carplay/common/b;->qu:I

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/autochips/carplay/common/b;->qv:Lcom/autochips/carplay/common/d;

    invoke-virtual {v1}, Lcom/autochips/carplay/common/d;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/autochips/carplay/common/b;->qw:I

    add-int/2addr v0, v1

    iget v1, p0, Lcom/autochips/carplay/common/b;->qx:I

    add-int/2addr v0, v1

    return v0
.end method
