.class public final Lcom/autochips/carplay/common/g;
.super Ljava/lang/Object;


# instance fields
.field public qK:I

.field public qL:I

.field public qM:I

.field public qN:I

.field final synthetic qO:Lcom/autochips/carplay/common/f;


# direct methods
.method public constructor <init>(Lcom/autochips/carplay/common/f;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/common/g;->qO:Lcom/autochips/carplay/common/f;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput p1, p0, Lcom/autochips/carplay/common/g;->qK:I

    iput p1, p0, Lcom/autochips/carplay/common/g;->qL:I

    iput p1, p0, Lcom/autochips/carplay/common/g;->qM:I

    iput p1, p0, Lcom/autochips/carplay/common/g;->qN:I

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
    instance-of v1, p1, Lcom/autochips/carplay/common/g;

    if-eqz v1, :cond_2

    iget v1, p0, Lcom/autochips/carplay/common/g;->qK:I

    check-cast p1, Lcom/autochips/carplay/common/g;

    iget v2, p1, Lcom/autochips/carplay/common/g;->qK:I

    if-ne v1, v2, :cond_2

    iget v1, p0, Lcom/autochips/carplay/common/g;->qL:I

    iget v2, p1, Lcom/autochips/carplay/common/g;->qL:I

    if-ne v1, v2, :cond_2

    iget v1, p0, Lcom/autochips/carplay/common/g;->qM:I

    iget v2, p1, Lcom/autochips/carplay/common/g;->qM:I

    if-ne v1, v2, :cond_2

    iget v1, p0, Lcom/autochips/carplay/common/g;->qN:I

    iget p1, p1, Lcom/autochips/carplay/common/g;->qN:I

    if-ne v1, p1, :cond_2

    const/4 p1, 0x1

    return p1

    :cond_2
    return v0
.end method

.method public final hashCode()I
    .locals 2

    iget v0, p0, Lcom/autochips/carplay/common/g;->qK:I

    iget v1, p0, Lcom/autochips/carplay/common/g;->qL:I

    add-int/2addr v0, v1

    iget v1, p0, Lcom/autochips/carplay/common/g;->qM:I

    add-int/2addr v0, v1

    iget v1, p0, Lcom/autochips/carplay/common/g;->qN:I

    add-int/2addr v0, v1

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "transferType: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget v1, p0, Lcom/autochips/carplay/common/g;->qK:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string v1, ", transferPriority: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget v1, p0, Lcom/autochips/carplay/common/g;->qL:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string v1, ", takeConstraint: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget v1, p0, Lcom/autochips/carplay/common/g;->qM:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string v1, ", borrowOrUnborrowConstraint: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget v1, p0, Lcom/autochips/carplay/common/g;->qN:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
