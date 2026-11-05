.class final Landroid/net/apf/e;
.super Ljava/lang/Object;


# instance fields
.field private final cc:B

.field private final cd:B

.field private ce:Z

.field private cf:B

.field private cg:Z

.field private ch:I

.field private ci:B

.field private cj:Ljava/lang/String;

.field private ck:[B

.field final synthetic cl:Landroid/net/apf/ApfGenerator;

.field private mLabel:Ljava/lang/String;

.field offset:I


# direct methods
.method constructor <init>(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfGenerator$Opcodes;)V
    .locals 1

    sget-object v0, Landroid/net/apf/ApfGenerator$Register;->cL:Landroid/net/apf/ApfGenerator$Register;

    invoke-direct {p0, p1, p2, v0}, Landroid/net/apf/e;-><init>(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfGenerator$Opcodes;Landroid/net/apf/ApfGenerator$Register;)V

    return-void
.end method

.method constructor <init>(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfGenerator$Opcodes;Landroid/net/apf/ApfGenerator$Register;)V
    .locals 0

    iput-object p1, p0, Landroid/net/apf/e;->cl:Landroid/net/apf/ApfGenerator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget p1, p2, Landroid/net/apf/ApfGenerator$Opcodes;->value:I

    int-to-byte p1, p1

    iput-byte p1, p0, Landroid/net/apf/e;->cc:B

    iget p1, p3, Landroid/net/apf/ApfGenerator$Register;->value:I

    int-to-byte p1, p1

    iput-byte p1, p0, Landroid/net/apf/e;->cd:B

    return-void
.end method

.method private H()B
    .locals 2

    iget-byte v0, p0, Landroid/net/apf/e;->cf:B

    iget-byte v1, p0, Landroid/net/apf/e;->ci:B

    if-le v0, v1, :cond_0

    iget-byte v0, p0, Landroid/net/apf/e;->cf:B

    return v0

    :cond_0
    iget-byte v0, p0, Landroid/net/apf/e;->ci:B

    return v0
.end method

.method private I()I
    .locals 3

    iget-object v0, p0, Landroid/net/apf/e;->cj:Ljava/lang/String;

    const-string v1, "__DROP__"

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Landroid/net/apf/e;->cl:Landroid/net/apf/ApfGenerator;

    invoke-static {v0}, Landroid/net/apf/ApfGenerator;->d(Landroid/net/apf/ApfGenerator;)Landroid/net/apf/e;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroid/net/apf/e;->cj:Ljava/lang/String;

    const-string v1, "__PASS__"

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Landroid/net/apf/e;->cl:Landroid/net/apf/ApfGenerator;

    invoke-static {v0}, Landroid/net/apf/ApfGenerator;->e(Landroid/net/apf/ApfGenerator;)Landroid/net/apf/e;

    move-result-object v0

    goto :goto_0

    :cond_1
    iget-object v0, p0, Landroid/net/apf/e;->cl:Landroid/net/apf/ApfGenerator;

    invoke-static {v0}, Landroid/net/apf/ApfGenerator;->c(Landroid/net/apf/ApfGenerator;)Ljava/util/HashMap;

    move-result-object v0

    iget-object v1, p0, Landroid/net/apf/e;->cj:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/apf/e;

    :goto_0
    if-eqz v0, :cond_3

    iget v0, v0, Landroid/net/apf/e;->offset:I

    iget v1, p0, Landroid/net/apf/e;->offset:I

    invoke-virtual {p0}, Landroid/net/apf/e;->size()I

    move-result v2

    add-int/2addr v1, v2

    sub-int/2addr v0, v1

    if-ltz v0, :cond_2

    return v0

    :cond_2
    new-instance v0, Landroid/net/apf/ApfGenerator$IllegalInstructionException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "backward branches disallowed; label: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Landroid/net/apf/e;->cj:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/net/apf/ApfGenerator$IllegalInstructionException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    new-instance v0, Landroid/net/apf/ApfGenerator$IllegalInstructionException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "label not found: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Landroid/net/apf/e;->cj:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/net/apf/ApfGenerator$IllegalInstructionException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private a(I[BI)I
    .locals 3

    invoke-direct {p0}, Landroid/net/apf/e;->H()B

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_0

    add-int/lit8 v1, p3, 0x1

    mul-int/lit8 v2, v0, 0x8

    shr-int v2, p1, v2

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, p2, p3

    add-int/lit8 v0, v0, -0x1

    move p3, v1

    goto :goto_0

    :cond_0
    return p3
.end method

.method private a(IZ)V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/net/apf/e;->ce:Z

    iput p1, p0, Landroid/net/apf/e;->ch:I

    iput-boolean p2, p0, Landroid/net/apf/e;->cg:Z

    invoke-static {p1, p2}, Landroid/net/apf/e;->b(IZ)B

    move-result p1

    iput-byte p1, p0, Landroid/net/apf/e;->cf:B

    return-void
.end method

.method private static b(IZ)B
    .locals 1

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    if-eqz p1, :cond_1

    const/16 v0, -0x80

    if-lt p0, v0, :cond_1

    const/16 v0, 0x7f

    if-le p0, v0, :cond_2

    :cond_1
    if-nez p1, :cond_3

    if-ltz p0, :cond_3

    const/16 v0, 0xff

    if-gt p0, v0, :cond_3

    :cond_2
    const/4 p0, 0x1

    return p0

    :cond_3
    if-eqz p1, :cond_4

    const/16 v0, -0x8000

    if-lt p0, v0, :cond_4

    const/16 v0, 0x7fff

    if-le p0, v0, :cond_5

    :cond_4
    if-nez p1, :cond_6

    if-ltz p0, :cond_6

    const p1, 0xffff

    if-gt p0, p1, :cond_6

    :cond_5
    const/4 p0, 0x2

    return p0

    :cond_6
    const/4 p0, 0x4

    return p0
.end method


# virtual methods
.method final G()Z
    .locals 4

    iget-object v0, p0, Landroid/net/apf/e;->cj:Ljava/lang/String;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p0}, Landroid/net/apf/e;->size()I

    move-result v0

    iget-byte v2, p0, Landroid/net/apf/e;->ci:B

    invoke-direct {p0}, Landroid/net/apf/e;->I()I

    move-result v3

    invoke-static {v3, v1}, Landroid/net/apf/e;->b(IZ)B

    move-result v3

    iput-byte v3, p0, Landroid/net/apf/e;->ci:B

    iget-byte v3, p0, Landroid/net/apf/e;->ci:B

    if-gt v3, v2, :cond_2

    invoke-virtual {p0}, Landroid/net/apf/e;->size()I

    move-result v2

    if-ge v2, v0, :cond_1

    const/4 v0, 0x1

    return v0

    :cond_1
    return v1

    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "instruction grew"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method final c(I)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/net/apf/e;->a(IZ)V

    return-void
.end method

.method final c([B)V
    .locals 2

    iget-byte v0, p0, Landroid/net/apf/e;->cc:B

    sget-object v1, Landroid/net/apf/ApfGenerator$Opcodes;->cG:Landroid/net/apf/ApfGenerator$Opcodes;

    iget v1, v1, Landroid/net/apf/ApfGenerator$Opcodes;->value:I

    if-ne v0, v1, :cond_0

    iput-object p1, p0, Landroid/net/apf/e;->ck:[B

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "adding compare bytes to non-JNEBS instruction"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method final d(I)V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Landroid/net/apf/e;->a(IZ)V

    return-void
.end method

.method final d([B)V
    .locals 5

    iget-byte v0, p0, Landroid/net/apf/e;->cc:B

    sget-object v1, Landroid/net/apf/ApfGenerator$Opcodes;->cm:Landroid/net/apf/ApfGenerator$Opcodes;

    iget v1, v1, Landroid/net/apf/ApfGenerator$Opcodes;->value:I

    if-ne v0, v1, :cond_0

    return-void

    :cond_0
    iget v0, p0, Landroid/net/apf/e;->offset:I

    add-int/lit8 v1, v0, 0x1

    invoke-direct {p0}, Landroid/net/apf/e;->H()B

    move-result v2

    const/4 v3, 0x4

    const/4 v4, 0x3

    if-ne v2, v3, :cond_1

    move v2, v4

    :cond_1
    iget-byte v3, p0, Landroid/net/apf/e;->cc:B

    shl-int/2addr v3, v4

    shl-int/lit8 v2, v2, 0x1

    or-int/2addr v2, v3

    iget-byte v3, p0, Landroid/net/apf/e;->cd:B

    or-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, p1, v0

    iget-object v0, p0, Landroid/net/apf/e;->cj:Ljava/lang/String;

    if-eqz v0, :cond_2

    invoke-direct {p0}, Landroid/net/apf/e;->I()I

    move-result v0

    invoke-direct {p0, v0, p1, v1}, Landroid/net/apf/e;->a(I[BI)I

    move-result v1

    :cond_2
    iget-boolean v0, p0, Landroid/net/apf/e;->ce:Z

    if-eqz v0, :cond_3

    iget v0, p0, Landroid/net/apf/e;->ch:I

    invoke-direct {p0, v0, p1, v1}, Landroid/net/apf/e;->a(I[BI)I

    move-result v1

    :cond_3
    iget-object v0, p0, Landroid/net/apf/e;->ck:[B

    if-eqz v0, :cond_4

    iget-object v0, p0, Landroid/net/apf/e;->ck:[B

    const/4 v2, 0x0

    iget-object v3, p0, Landroid/net/apf/e;->ck:[B

    array-length v3, v3

    invoke-static {v0, v2, p1, v1, v3}, Ljava/lang/System;->arraycopy([BI[BII)V

    iget-object p1, p0, Landroid/net/apf/e;->ck:[B

    array-length p1, p1

    add-int/2addr v1, p1

    :cond_4
    iget p1, p0, Landroid/net/apf/e;->offset:I

    sub-int p1, v1, p1

    invoke-virtual {p0}, Landroid/net/apf/e;->size()I

    move-result v0

    if-ne p1, v0, :cond_5

    return-void

    :cond_5
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "wrote "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Landroid/net/apf/e;->offset:I

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " but should have written "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/net/apf/e;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method final f(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Landroid/net/apf/e;->cj:Ljava/lang/String;

    const/4 p1, 0x4

    iput-byte p1, p0, Landroid/net/apf/e;->ci:B

    return-void
.end method

.method final setLabel(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Landroid/net/apf/e;->cl:Landroid/net/apf/ApfGenerator;

    invoke-static {v0}, Landroid/net/apf/ApfGenerator;->c(Landroid/net/apf/ApfGenerator;)Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-byte v0, p0, Landroid/net/apf/e;->cc:B

    sget-object v1, Landroid/net/apf/ApfGenerator$Opcodes;->cm:Landroid/net/apf/ApfGenerator$Opcodes;

    iget v1, v1, Landroid/net/apf/ApfGenerator$Opcodes;->value:I

    if-ne v0, v1, :cond_0

    iput-object p1, p0, Landroid/net/apf/e;->mLabel:Ljava/lang/String;

    iget-object v0, p0, Landroid/net/apf/e;->cl:Landroid/net/apf/ApfGenerator;

    invoke-static {v0}, Landroid/net/apf/ApfGenerator;->c(Landroid/net/apf/ApfGenerator;)Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v0, p1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "adding label to non-label instruction"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance v0, Landroid/net/apf/ApfGenerator$IllegalInstructionException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "duplicate label "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Landroid/net/apf/ApfGenerator$IllegalInstructionException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method final size()I
    .locals 2

    iget-byte v0, p0, Landroid/net/apf/e;->cc:B

    sget-object v1, Landroid/net/apf/ApfGenerator$Opcodes;->cm:Landroid/net/apf/ApfGenerator$Opcodes;

    iget v1, v1, Landroid/net/apf/ApfGenerator$Opcodes;->value:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-boolean v0, p0, Landroid/net/apf/e;->ce:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    invoke-direct {p0}, Landroid/net/apf/e;->H()B

    move-result v0

    add-int/2addr v1, v0

    :cond_1
    iget-object v0, p0, Landroid/net/apf/e;->cj:Ljava/lang/String;

    if-eqz v0, :cond_2

    invoke-direct {p0}, Landroid/net/apf/e;->H()B

    move-result v0

    add-int/2addr v1, v0

    :cond_2
    iget-object v0, p0, Landroid/net/apf/e;->ck:[B

    if-eqz v0, :cond_3

    iget-object v0, p0, Landroid/net/apf/e;->ck:[B

    array-length v0, v0

    add-int/2addr v1, v0

    :cond_3
    return v1
.end method
