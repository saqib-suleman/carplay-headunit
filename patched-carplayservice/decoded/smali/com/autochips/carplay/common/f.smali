.class public final Lcom/autochips/carplay/common/f;
.super Ljava/lang/Object;


# instance fields
.field public qF:Lcom/autochips/carplay/common/g;

.field public qG:Lcom/autochips/carplay/common/g;

.field public qH:I

.field public qI:I

.field public qJ:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/autochips/carplay/common/g;

    invoke-direct {v0, p0}, Lcom/autochips/carplay/common/g;-><init>(Lcom/autochips/carplay/common/f;)V

    iput-object v0, p0, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    new-instance v0, Lcom/autochips/carplay/common/g;

    invoke-direct {v0, p0}, Lcom/autochips/carplay/common/g;-><init>(Lcom/autochips/carplay/common/f;)V

    iput-object v0, p0, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    const/4 v0, 0x0

    iput v0, p0, Lcom/autochips/carplay/common/f;->qH:I

    iput v0, p0, Lcom/autochips/carplay/common/f;->qI:I

    iput v0, p0, Lcom/autochips/carplay/common/f;->qJ:I

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
    instance-of v1, p1, Lcom/autochips/carplay/common/f;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    check-cast p1, Lcom/autochips/carplay/common/f;

    iget-object v2, p1, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    invoke-virtual {v1, v2}, Lcom/autochips/carplay/common/g;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    iget-object v2, p1, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    invoke-virtual {v1, v2}, Lcom/autochips/carplay/common/g;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget v1, p0, Lcom/autochips/carplay/common/f;->qH:I

    iget v2, p1, Lcom/autochips/carplay/common/f;->qH:I

    if-ne v1, v2, :cond_2

    iget v1, p0, Lcom/autochips/carplay/common/f;->qI:I

    iget v2, p1, Lcom/autochips/carplay/common/f;->qI:I

    if-ne v1, v2, :cond_2

    iget v1, p0, Lcom/autochips/carplay/common/f;->qJ:I

    iget p1, p1, Lcom/autochips/carplay/common/f;->qJ:I

    if-ne v1, p1, :cond_2

    const/4 p1, 0x1

    return p1

    :cond_2
    return v0
.end method

.method public final hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    invoke-virtual {v0}, Lcom/autochips/carplay/common/g;->hashCode()I

    move-result v0

    iget-object v1, p0, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    invoke-virtual {v1}, Lcom/autochips/carplay/common/g;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/autochips/carplay/common/f;->qH:I

    add-int/2addr v0, v1

    iget v1, p0, Lcom/autochips/carplay/common/f;->qI:I

    add-int/2addr v0, v1

    iget v1, p0, Lcom/autochips/carplay/common/f;->qJ:I

    add-int/2addr v0, v1

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "mainScreen: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget-object v1, p0, Lcom/autochips/carplay/common/f;->qF:Lcom/autochips/carplay/common/g;

    invoke-virtual {v1}, Lcom/autochips/carplay/common/g;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, ", mainAuido: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget-object v1, p0, Lcom/autochips/carplay/common/f;->qG:Lcom/autochips/carplay/common/g;

    invoke-virtual {v1}, Lcom/autochips/carplay/common/g;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, ", phoneCall: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget v1, p0, Lcom/autochips/carplay/common/f;->qH:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string v1, ", speechMode: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget v1, p0, Lcom/autochips/carplay/common/f;->qI:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string v1, ", turnByTurn: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget v1, p0, Lcom/autochips/carplay/common/f;->qJ:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
