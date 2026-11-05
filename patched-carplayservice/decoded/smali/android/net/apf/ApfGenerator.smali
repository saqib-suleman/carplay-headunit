.class public final Landroid/net/apf/ApfGenerator;
.super Ljava/lang/Object;


# instance fields
.field private final bQ:Ljava/util/ArrayList;

.field private final bR:Ljava/util/HashMap;

.field private final bS:Landroid/net/apf/e;

.field private final bT:Landroid/net/apf/e;

.field private bU:Z

.field private final mVersion:I


# direct methods
.method constructor <init>(I)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/net/apf/ApfGenerator;->bQ:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroid/net/apf/ApfGenerator;->bR:Ljava/util/HashMap;

    new-instance v0, Landroid/net/apf/e;

    sget-object v1, Landroid/net/apf/ApfGenerator$Opcodes;->cm:Landroid/net/apf/ApfGenerator$Opcodes;

    invoke-direct {v0, p0, v1}, Landroid/net/apf/e;-><init>(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfGenerator$Opcodes;)V

    iput-object v0, p0, Landroid/net/apf/ApfGenerator;->bS:Landroid/net/apf/e;

    new-instance v0, Landroid/net/apf/e;

    sget-object v1, Landroid/net/apf/ApfGenerator$Opcodes;->cm:Landroid/net/apf/ApfGenerator$Opcodes;

    invoke-direct {v0, p0, v1}, Landroid/net/apf/e;-><init>(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfGenerator$Opcodes;)V

    iput-object v0, p0, Landroid/net/apf/ApfGenerator;->bT:Landroid/net/apf/e;

    iput p1, p0, Landroid/net/apf/ApfGenerator;->mVersion:I

    const/4 p1, 0x2

    invoke-direct {p0, p1}, Landroid/net/apf/ApfGenerator;->b(I)V

    return-void
.end method

.method private D()I
    .locals 3

    iget-object v0, p0, Landroid/net/apf/ApfGenerator;->bQ:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/apf/e;

    iput v1, v2, Landroid/net/apf/e;->offset:I

    invoke-virtual {v2}, Landroid/net/apf/e;->size()I

    move-result v2

    add-int/2addr v1, v2

    goto :goto_0

    :cond_0
    return v1
.end method

.method private a(Landroid/net/apf/e;)V
    .locals 1

    iget-boolean v0, p0, Landroid/net/apf/ApfGenerator;->bU:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/net/apf/ApfGenerator;->bQ:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Program already generated"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private b(I)V
    .locals 3

    iget v0, p0, Landroid/net/apf/ApfGenerator;->mVersion:I

    if-lt v0, p1, :cond_0

    return-void

    :cond_0
    new-instance v0, Landroid/net/apf/ApfGenerator$IllegalInstructionException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Requires APF >= "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Landroid/net/apf/ApfGenerator$IllegalInstructionException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static synthetic c(Landroid/net/apf/ApfGenerator;)Ljava/util/HashMap;
    .locals 0

    iget-object p0, p0, Landroid/net/apf/ApfGenerator;->bR:Ljava/util/HashMap;

    return-object p0
.end method

.method static synthetic d(Landroid/net/apf/ApfGenerator;)Landroid/net/apf/e;
    .locals 0

    iget-object p0, p0, Landroid/net/apf/ApfGenerator;->bS:Landroid/net/apf/e;

    return-object p0
.end method

.method static synthetic e(Landroid/net/apf/ApfGenerator;)Landroid/net/apf/e;
    .locals 0

    iget-object p0, p0, Landroid/net/apf/ApfGenerator;->bT:Landroid/net/apf/e;

    return-object p0
.end method


# virtual methods
.method public final A()Landroid/net/apf/ApfGenerator;
    .locals 2

    new-instance v0, Landroid/net/apf/e;

    sget-object v1, Landroid/net/apf/ApfGenerator$Opcodes;->ct:Landroid/net/apf/ApfGenerator$Opcodes;

    invoke-direct {v0, p0, v1}, Landroid/net/apf/e;-><init>(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfGenerator$Opcodes;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/net/apf/e;->d(I)V

    invoke-direct {p0, v0}, Landroid/net/apf/ApfGenerator;->a(Landroid/net/apf/e;)V

    return-object p0
.end method

.method public final B()Landroid/net/apf/ApfGenerator;
    .locals 2

    new-instance v0, Landroid/net/apf/e;

    sget-object v1, Landroid/net/apf/ApfGenerator$Opcodes;->cw:Landroid/net/apf/ApfGenerator$Opcodes;

    invoke-direct {v0, p0, v1}, Landroid/net/apf/e;-><init>(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfGenerator$Opcodes;)V

    const/16 v1, 0xf0

    invoke-virtual {v0, v1}, Landroid/net/apf/e;->c(I)V

    invoke-direct {p0, v0}, Landroid/net/apf/ApfGenerator;->a(Landroid/net/apf/e;)V

    return-object p0
.end method

.method public final C()Landroid/net/apf/ApfGenerator;
    .locals 3

    new-instance v0, Landroid/net/apf/e;

    sget-object v1, Landroid/net/apf/ApfGenerator$Opcodes;->ct:Landroid/net/apf/ApfGenerator$Opcodes;

    sget-object v2, Landroid/net/apf/ApfGenerator$Register;->cM:Landroid/net/apf/ApfGenerator$Register;

    invoke-direct {v0, p0, v1, v2}, Landroid/net/apf/e;-><init>(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfGenerator$Opcodes;Landroid/net/apf/ApfGenerator$Register;)V

    invoke-direct {p0, v0}, Landroid/net/apf/ApfGenerator;->a(Landroid/net/apf/e;)V

    return-object p0
.end method

.method public final E()I
    .locals 1

    invoke-direct {p0}, Landroid/net/apf/ApfGenerator;->D()I

    move-result v0

    return v0
.end method

.method public final F()[B
    .locals 6

    iget-boolean v0, p0, Landroid/net/apf/ApfGenerator;->bU:Z

    if-nez v0, :cond_5

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/net/apf/ApfGenerator;->bU:Z

    const/16 v1, 0xa

    :goto_0
    invoke-direct {p0}, Landroid/net/apf/ApfGenerator;->D()I

    move-result v2

    iget-object v3, p0, Landroid/net/apf/ApfGenerator;->bS:Landroid/net/apf/e;

    add-int/lit8 v4, v2, 0x1

    iput v4, v3, Landroid/net/apf/e;->offset:I

    iget-object v3, p0, Landroid/net/apf/ApfGenerator;->bT:Landroid/net/apf/e;

    iput v2, v3, Landroid/net/apf/e;->offset:I

    add-int/lit8 v3, v1, -0x1

    if-eqz v1, :cond_3

    const/4 v1, 0x0

    iget-object v4, p0, Landroid/net/apf/ApfGenerator;->bQ:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/net/apf/e;

    invoke-virtual {v5}, Landroid/net/apf/e;->G()Z

    move-result v5

    if-eqz v5, :cond_0

    move v1, v0

    goto :goto_1

    :cond_1
    if-nez v1, :cond_2

    goto :goto_2

    :cond_2
    move v1, v3

    goto :goto_0

    :cond_3
    :goto_2
    new-array v0, v2, [B

    iget-object v1, p0, Landroid/net/apf/ApfGenerator;->bQ:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/apf/e;

    invoke-virtual {v2, v0}, Landroid/net/apf/e;->d([B)V

    goto :goto_3

    :cond_4
    return-object v0

    :cond_5
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Can only generate() once!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final a(ILjava/lang/String;)Landroid/net/apf/ApfGenerator;
    .locals 2

    new-instance v0, Landroid/net/apf/e;

    sget-object v1, Landroid/net/apf/ApfGenerator$Opcodes;->cB:Landroid/net/apf/ApfGenerator$Opcodes;

    invoke-direct {v0, p0, v1}, Landroid/net/apf/e;-><init>(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfGenerator$Opcodes;)V

    invoke-virtual {v0, p1}, Landroid/net/apf/e;->c(I)V

    invoke-virtual {v0, p2}, Landroid/net/apf/e;->f(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Landroid/net/apf/ApfGenerator;->a(Landroid/net/apf/e;)V

    return-object p0
.end method

.method public final a(Landroid/net/apf/ApfGenerator$Register;)Landroid/net/apf/ApfGenerator;
    .locals 2

    new-instance v0, Landroid/net/apf/e;

    sget-object v1, Landroid/net/apf/ApfGenerator$Opcodes;->cr:Landroid/net/apf/ApfGenerator$Opcodes;

    invoke-direct {v0, p0, v1, p1}, Landroid/net/apf/e;-><init>(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfGenerator$Opcodes;Landroid/net/apf/ApfGenerator$Register;)V

    const/16 p1, 0x10

    invoke-virtual {v0, p1}, Landroid/net/apf/e;->c(I)V

    invoke-direct {p0, v0}, Landroid/net/apf/ApfGenerator;->a(Landroid/net/apf/e;)V

    return-object p0
.end method

.method public final a(Landroid/net/apf/ApfGenerator$Register;I)Landroid/net/apf/ApfGenerator;
    .locals 2

    new-instance v0, Landroid/net/apf/e;

    sget-object v1, Landroid/net/apf/ApfGenerator$Opcodes;->cn:Landroid/net/apf/ApfGenerator$Opcodes;

    invoke-direct {v0, p0, v1, p1}, Landroid/net/apf/e;-><init>(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfGenerator$Opcodes;Landroid/net/apf/ApfGenerator$Register;)V

    invoke-virtual {v0, p2}, Landroid/net/apf/e;->c(I)V

    invoke-direct {p0, v0}, Landroid/net/apf/ApfGenerator;->a(Landroid/net/apf/e;)V

    return-object p0
.end method

.method public final a(Landroid/net/apf/ApfGenerator$Register;[BLjava/lang/String;)Landroid/net/apf/ApfGenerator;
    .locals 2

    sget-object v0, Landroid/net/apf/ApfGenerator$Register;->cM:Landroid/net/apf/ApfGenerator$Register;

    if-eq p1, v0, :cond_0

    new-instance v0, Landroid/net/apf/e;

    sget-object v1, Landroid/net/apf/ApfGenerator$Opcodes;->cG:Landroid/net/apf/ApfGenerator$Opcodes;

    invoke-direct {v0, p0, v1, p1}, Landroid/net/apf/e;-><init>(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfGenerator$Opcodes;Landroid/net/apf/ApfGenerator$Register;)V

    array-length p1, p2

    invoke-virtual {v0, p1}, Landroid/net/apf/e;->c(I)V

    invoke-virtual {v0, p3}, Landroid/net/apf/e;->f(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Landroid/net/apf/e;->c([B)V

    invoke-direct {p0, v0}, Landroid/net/apf/ApfGenerator;->a(Landroid/net/apf/e;)V

    return-object p0

    :cond_0
    new-instance p1, Landroid/net/apf/ApfGenerator$IllegalInstructionException;

    const-string p2, "JNEBS fails with R1"

    invoke-direct {p1, p2}, Landroid/net/apf/ApfGenerator$IllegalInstructionException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final b(ILjava/lang/String;)Landroid/net/apf/ApfGenerator;
    .locals 2

    new-instance v0, Landroid/net/apf/e;

    sget-object v1, Landroid/net/apf/ApfGenerator$Opcodes;->cC:Landroid/net/apf/ApfGenerator$Opcodes;

    invoke-direct {v0, p0, v1}, Landroid/net/apf/e;-><init>(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfGenerator$Opcodes;)V

    invoke-virtual {v0, p1}, Landroid/net/apf/e;->c(I)V

    invoke-virtual {v0, p2}, Landroid/net/apf/e;->f(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Landroid/net/apf/ApfGenerator;->a(Landroid/net/apf/e;)V

    return-object p0
.end method

.method public final b(Landroid/net/apf/ApfGenerator$Register;)Landroid/net/apf/ApfGenerator;
    .locals 2

    const/4 v0, 0x3

    invoke-direct {p0, v0}, Landroid/net/apf/ApfGenerator;->b(I)V

    new-instance v0, Landroid/net/apf/e;

    sget-object v1, Landroid/net/apf/ApfGenerator$Opcodes;->cI:Landroid/net/apf/ApfGenerator$Opcodes;

    invoke-direct {v0, p0, v1, p1}, Landroid/net/apf/e;-><init>(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfGenerator$Opcodes;Landroid/net/apf/ApfGenerator$Register;)V

    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/net/apf/e;->d(I)V

    invoke-direct {p0, v0}, Landroid/net/apf/ApfGenerator;->a(Landroid/net/apf/e;)V

    return-object p0
.end method

.method public final b(Landroid/net/apf/ApfGenerator$Register;I)Landroid/net/apf/ApfGenerator;
    .locals 2

    new-instance v0, Landroid/net/apf/e;

    sget-object v1, Landroid/net/apf/ApfGenerator$Opcodes;->co:Landroid/net/apf/ApfGenerator$Opcodes;

    invoke-direct {v0, p0, v1, p1}, Landroid/net/apf/e;-><init>(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfGenerator$Opcodes;Landroid/net/apf/ApfGenerator$Register;)V

    invoke-virtual {v0, p2}, Landroid/net/apf/e;->c(I)V

    invoke-direct {p0, v0}, Landroid/net/apf/ApfGenerator;->a(Landroid/net/apf/e;)V

    return-object p0
.end method

.method public final c(ILjava/lang/String;)Landroid/net/apf/ApfGenerator;
    .locals 2

    new-instance v0, Landroid/net/apf/e;

    sget-object v1, Landroid/net/apf/ApfGenerator$Opcodes;->cD:Landroid/net/apf/ApfGenerator$Opcodes;

    invoke-direct {v0, p0, v1}, Landroid/net/apf/e;-><init>(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfGenerator$Opcodes;)V

    invoke-virtual {v0, p1}, Landroid/net/apf/e;->c(I)V

    invoke-virtual {v0, p2}, Landroid/net/apf/e;->f(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Landroid/net/apf/ApfGenerator;->a(Landroid/net/apf/e;)V

    return-object p0
.end method

.method public final c(Landroid/net/apf/ApfGenerator$Register;)Landroid/net/apf/ApfGenerator;
    .locals 2

    const/4 v0, 0x3

    invoke-direct {p0, v0}, Landroid/net/apf/ApfGenerator;->b(I)V

    new-instance v0, Landroid/net/apf/e;

    sget-object v1, Landroid/net/apf/ApfGenerator$Opcodes;->cJ:Landroid/net/apf/ApfGenerator$Opcodes;

    invoke-direct {v0, p0, v1, p1}, Landroid/net/apf/e;-><init>(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfGenerator$Opcodes;Landroid/net/apf/ApfGenerator$Register;)V

    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/net/apf/e;->d(I)V

    invoke-direct {p0, v0}, Landroid/net/apf/ApfGenerator;->a(Landroid/net/apf/e;)V

    return-object p0
.end method

.method public final c(Landroid/net/apf/ApfGenerator$Register;I)Landroid/net/apf/ApfGenerator;
    .locals 2

    new-instance v0, Landroid/net/apf/e;

    sget-object v1, Landroid/net/apf/ApfGenerator$Opcodes;->cp:Landroid/net/apf/ApfGenerator$Opcodes;

    invoke-direct {v0, p0, v1, p1}, Landroid/net/apf/e;-><init>(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfGenerator$Opcodes;Landroid/net/apf/ApfGenerator$Register;)V

    invoke-virtual {v0, p2}, Landroid/net/apf/e;->c(I)V

    invoke-direct {p0, v0}, Landroid/net/apf/ApfGenerator;->a(Landroid/net/apf/e;)V

    return-object p0
.end method

.method public final c(Ljava/lang/String;)Landroid/net/apf/ApfGenerator;
    .locals 2

    new-instance v0, Landroid/net/apf/e;

    sget-object v1, Landroid/net/apf/ApfGenerator$Opcodes;->cm:Landroid/net/apf/ApfGenerator$Opcodes;

    invoke-direct {v0, p0, v1}, Landroid/net/apf/e;-><init>(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfGenerator$Opcodes;)V

    invoke-virtual {v0, p1}, Landroid/net/apf/e;->setLabel(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Landroid/net/apf/ApfGenerator;->a(Landroid/net/apf/e;)V

    return-object p0
.end method

.method public final d(ILjava/lang/String;)Landroid/net/apf/ApfGenerator;
    .locals 2

    new-instance v0, Landroid/net/apf/e;

    sget-object v1, Landroid/net/apf/ApfGenerator$Opcodes;->cE:Landroid/net/apf/ApfGenerator$Opcodes;

    invoke-direct {v0, p0, v1}, Landroid/net/apf/e;-><init>(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfGenerator$Opcodes;)V

    invoke-virtual {v0, p1}, Landroid/net/apf/e;->c(I)V

    invoke-virtual {v0, p2}, Landroid/net/apf/e;->f(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Landroid/net/apf/ApfGenerator;->a(Landroid/net/apf/e;)V

    return-object p0
.end method

.method public final d(Landroid/net/apf/ApfGenerator$Register;I)Landroid/net/apf/ApfGenerator;
    .locals 2

    new-instance v0, Landroid/net/apf/e;

    sget-object v1, Landroid/net/apf/ApfGenerator$Opcodes;->cz:Landroid/net/apf/ApfGenerator$Opcodes;

    invoke-direct {v0, p0, v1, p1}, Landroid/net/apf/e;-><init>(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfGenerator$Opcodes;Landroid/net/apf/ApfGenerator$Register;)V

    invoke-virtual {v0, p2}, Landroid/net/apf/e;->d(I)V

    invoke-direct {p0, v0}, Landroid/net/apf/ApfGenerator;->a(Landroid/net/apf/e;)V

    return-object p0
.end method

.method public final d(Ljava/lang/String;)Landroid/net/apf/ApfGenerator;
    .locals 2

    new-instance v0, Landroid/net/apf/e;

    sget-object v1, Landroid/net/apf/ApfGenerator$Opcodes;->cA:Landroid/net/apf/ApfGenerator$Opcodes;

    invoke-direct {v0, p0, v1}, Landroid/net/apf/e;-><init>(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfGenerator$Opcodes;)V

    invoke-virtual {v0, p1}, Landroid/net/apf/e;->f(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Landroid/net/apf/ApfGenerator;->a(Landroid/net/apf/e;)V

    return-object p0
.end method

.method public final e(Landroid/net/apf/ApfGenerator$Register;I)Landroid/net/apf/ApfGenerator;
    .locals 2

    if-ltz p2, :cond_0

    const/16 v0, 0xf

    if-gt p2, v0, :cond_0

    new-instance v0, Landroid/net/apf/e;

    sget-object v1, Landroid/net/apf/ApfGenerator$Opcodes;->cH:Landroid/net/apf/ApfGenerator$Opcodes;

    invoke-direct {v0, p0, v1, p1}, Landroid/net/apf/e;-><init>(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfGenerator$Opcodes;Landroid/net/apf/ApfGenerator$Register;)V

    sget-object p1, Landroid/net/apf/ApfGenerator$ExtendedOpcodes;->bV:Landroid/net/apf/ApfGenerator$ExtendedOpcodes;

    iget p1, p1, Landroid/net/apf/ApfGenerator$ExtendedOpcodes;->value:I

    add-int/2addr p1, p2

    invoke-virtual {v0, p1}, Landroid/net/apf/e;->c(I)V

    invoke-direct {p0, v0}, Landroid/net/apf/ApfGenerator;->a(Landroid/net/apf/e;)V

    return-object p0

    :cond_0
    new-instance p1, Landroid/net/apf/ApfGenerator$IllegalInstructionException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "illegal memory slot number: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/net/apf/ApfGenerator$IllegalInstructionException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final e(Ljava/lang/String;)Landroid/net/apf/ApfGenerator;
    .locals 2

    new-instance v0, Landroid/net/apf/e;

    sget-object v1, Landroid/net/apf/ApfGenerator$Opcodes;->cF:Landroid/net/apf/ApfGenerator$Opcodes;

    invoke-direct {v0, p0, v1}, Landroid/net/apf/e;-><init>(Landroid/net/apf/ApfGenerator;Landroid/net/apf/ApfGenerator$Opcodes;)V

    const/16 v1, 0x1fff

    invoke-virtual {v0, v1}, Landroid/net/apf/e;->c(I)V

    invoke-virtual {v0, p1}, Landroid/net/apf/e;->f(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Landroid/net/apf/ApfGenerator;->a(Landroid/net/apf/e;)V

    return-object p0
.end method
