.class public final Lcom/autochips/carplay/common/h;
.super Ljava/lang/Object;


# instance fields
.field public qP:Z

.field public qQ:Z

.field public qR:Z

.field public qS:I

.field public x:I

.field public y:I


# direct methods
.method public constructor <init>(ZZZIII)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/autochips/carplay/common/h;->qP:Z

    iput-boolean p2, p0, Lcom/autochips/carplay/common/h;->qQ:Z

    iput-boolean p3, p0, Lcom/autochips/carplay/common/h;->qR:Z

    iput p4, p0, Lcom/autochips/carplay/common/h;->x:I

    iput p5, p0, Lcom/autochips/carplay/common/h;->y:I

    iput p6, p0, Lcom/autochips/carplay/common/h;->qS:I

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
    instance-of v1, p1, Lcom/autochips/carplay/common/h;

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Lcom/autochips/carplay/common/h;->qP:Z

    check-cast p1, Lcom/autochips/carplay/common/h;

    iget-boolean v2, p1, Lcom/autochips/carplay/common/h;->qP:Z

    if-ne v1, v2, :cond_2

    iget-boolean v1, p0, Lcom/autochips/carplay/common/h;->qQ:Z

    iget-boolean v2, p1, Lcom/autochips/carplay/common/h;->qQ:Z

    if-ne v1, v2, :cond_2

    iget-boolean v1, p0, Lcom/autochips/carplay/common/h;->qR:Z

    iget-boolean v2, p1, Lcom/autochips/carplay/common/h;->qR:Z

    if-ne v1, v2, :cond_2

    iget v1, p0, Lcom/autochips/carplay/common/h;->x:I

    iget v2, p1, Lcom/autochips/carplay/common/h;->x:I

    if-ne v1, v2, :cond_2

    iget v1, p0, Lcom/autochips/carplay/common/h;->y:I

    iget v2, p1, Lcom/autochips/carplay/common/h;->y:I

    if-ne v1, v2, :cond_2

    iget v1, p0, Lcom/autochips/carplay/common/h;->qS:I

    iget p1, p1, Lcom/autochips/carplay/common/h;->qS:I

    if-ne v1, p1, :cond_2

    const/4 p1, 0x1

    return p1

    :cond_2
    return v0
.end method

.method public final hashCode()I
    .locals 2

    iget-boolean v0, p0, Lcom/autochips/carplay/common/h;->qP:Z

    iget-boolean v1, p0, Lcom/autochips/carplay/common/h;->qQ:Z

    add-int/2addr v0, v1

    iget-boolean v1, p0, Lcom/autochips/carplay/common/h;->qR:Z

    add-int/2addr v0, v1

    iget v1, p0, Lcom/autochips/carplay/common/h;->x:I

    add-int/2addr v0, v1

    iget v1, p0, Lcom/autochips/carplay/common/h;->y:I

    add-int/2addr v0, v1

    iget v1, p0, Lcom/autochips/carplay/common/h;->qS:I

    add-int/2addr v0, v1

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "button: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget-boolean v1, p0, Lcom/autochips/carplay/common/h;->qP:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    const-string v1, ", home: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget-boolean v1, p0, Lcom/autochips/carplay/common/h;->qQ:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    const-string v1, ", back: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget-boolean v1, p0, Lcom/autochips/carplay/common/h;->qR:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    const-string v1, ", x: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget v1, p0, Lcom/autochips/carplay/common/h;->x:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string v1, ", y: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget v1, p0, Lcom/autochips/carplay/common/h;->y:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string v1, ", wheel: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget v1, p0, Lcom/autochips/carplay/common/h;->qS:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
