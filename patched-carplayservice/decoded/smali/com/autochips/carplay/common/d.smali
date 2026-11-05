.class public final Lcom/autochips/carplay/common/d;
.super Ljava/lang/Object;


# instance fields
.field public qA:I

.field public qB:I


# direct methods
.method constructor <init>(II)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/autochips/carplay/common/d;->qA:I

    iput p2, p0, Lcom/autochips/carplay/common/d;->qB:I

    return-void
.end method


# virtual methods
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
    instance-of v1, p1, Lcom/autochips/carplay/common/d;

    if-eqz v1, :cond_2

    iget v1, p0, Lcom/autochips/carplay/common/d;->qA:I

    check-cast p1, Lcom/autochips/carplay/common/d;

    iget v2, p1, Lcom/autochips/carplay/common/d;->qA:I

    if-ne v1, v2, :cond_2

    iget v1, p0, Lcom/autochips/carplay/common/d;->qB:I

    iget p1, p1, Lcom/autochips/carplay/common/d;->qB:I

    if-ne v1, p1, :cond_2

    const/4 p1, 0x1

    return p1

    :cond_2
    return v0
.end method

.method public final hashCode()I
    .locals 2

    iget v0, p0, Lcom/autochips/carplay/common/d;->qA:I

    iget v1, p0, Lcom/autochips/carplay/common/d;->qB:I

    add-int/2addr v0, v1

    return v0
.end method
