.class public final Lcom/autochips/carplay/common/e;
.super Ljava/lang/Object;


# instance fields
.field public qC:Z

.field public qD:I

.field public qE:I


# direct methods
.method public constructor <init>(ZII)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/autochips/carplay/common/e;->qC:Z

    iput p2, p0, Lcom/autochips/carplay/common/e;->qD:I

    iput p3, p0, Lcom/autochips/carplay/common/e;->qE:I

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
    instance-of v1, p1, Lcom/autochips/carplay/common/e;

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Lcom/autochips/carplay/common/e;->qC:Z

    check-cast p1, Lcom/autochips/carplay/common/e;

    iget-boolean v2, p1, Lcom/autochips/carplay/common/e;->qC:Z

    if-ne v1, v2, :cond_2

    iget v1, p0, Lcom/autochips/carplay/common/e;->qD:I

    iget v2, p1, Lcom/autochips/carplay/common/e;->qD:I

    if-ne v1, v2, :cond_2

    iget v1, p0, Lcom/autochips/carplay/common/e;->qE:I

    iget p1, p1, Lcom/autochips/carplay/common/e;->qE:I

    if-ne v1, p1, :cond_2

    const/4 p1, 0x1

    return p1

    :cond_2
    return v0
.end method

.method public final hashCode()I
    .locals 2

    iget-boolean v0, p0, Lcom/autochips/carplay/common/e;->qC:Z

    iget v1, p0, Lcom/autochips/carplay/common/e;->qD:I

    add-int/2addr v0, v1

    iget v1, p0, Lcom/autochips/carplay/common/e;->qE:I

    add-int/2addr v0, v1

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "press: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget-boolean v1, p0, Lcom/autochips/carplay/common/e;->qC:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    const-string v1, ", x: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget v1, p0, Lcom/autochips/carplay/common/e;->qD:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string v1, ", y: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget v1, p0, Lcom/autochips/carplay/common/e;->qE:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
