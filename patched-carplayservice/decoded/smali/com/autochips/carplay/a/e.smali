.class public final Lcom/autochips/carplay/a/e;
.super Landroid/os/Handler;


# static fields
.field private static rf:Lcom/autochips/carplay/a/h;


# instance fields
.field private mContext:Landroid/content/Context;

.field private final rA:I

.field private final rB:I

.field private final rC:I

.field private final rD:I

.field private final rE:I

.field private final rF:I

.field private final rG:I

.field private final rH:I

.field private final rI:I

.field private final rJ:I

.field private final rK:I

.field private final rL:I

.field private rd:Z

.field private re:Landroid/location/LocationManager;

.field private rg:Lcom/autochips/carplay/a/g;

.field private rh:Lcom/autochips/carplay/a/f;

.field private ri:I

.field private rj:Ljava/lang/String;

.field public final rk:I

.field public final rl:I

.field public final rm:I

.field public final rn:I

.field public final ro:I

.field public final rp:I

.field public final rq:I

.field private final rr:I

.field private final rs:I

.field private final rt:I

.field private final ru:I

.field private final rv:I

.field private final rw:I

.field private final rx:I

.field private final ry:I

.field private final rz:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/autochips/carplay/a/h;)V
    .locals 10

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/autochips/carplay/a/e;->rd:Z

    const/4 v1, 0x1

    iput v1, p0, Lcom/autochips/carplay/a/e;->rk:I

    const/4 v2, 0x2

    iput v2, p0, Lcom/autochips/carplay/a/e;->rl:I

    const/4 v3, 0x3

    iput v3, p0, Lcom/autochips/carplay/a/e;->rm:I

    const/4 v4, 0x4

    iput v4, p0, Lcom/autochips/carplay/a/e;->rn:I

    const/4 v5, 0x5

    iput v5, p0, Lcom/autochips/carplay/a/e;->ro:I

    const/4 v6, 0x6

    iput v6, p0, Lcom/autochips/carplay/a/e;->rp:I

    const/4 v7, 0x7

    iput v7, p0, Lcom/autochips/carplay/a/e;->rq:I

    iput v1, p0, Lcom/autochips/carplay/a/e;->rr:I

    const/16 v8, 0x10

    iput v8, p0, Lcom/autochips/carplay/a/e;->rs:I

    const/16 v9, 0xe

    iput v9, p0, Lcom/autochips/carplay/a/e;->rt:I

    iput v1, p0, Lcom/autochips/carplay/a/e;->ru:I

    iput v2, p0, Lcom/autochips/carplay/a/e;->rv:I

    iput v3, p0, Lcom/autochips/carplay/a/e;->rw:I

    iput v4, p0, Lcom/autochips/carplay/a/e;->rx:I

    iput v5, p0, Lcom/autochips/carplay/a/e;->ry:I

    iput v6, p0, Lcom/autochips/carplay/a/e;->rz:I

    iput v7, p0, Lcom/autochips/carplay/a/e;->rA:I

    const/16 v1, 0x8

    iput v1, p0, Lcom/autochips/carplay/a/e;->rB:I

    const/16 v1, 0x9

    iput v1, p0, Lcom/autochips/carplay/a/e;->rC:I

    const/16 v1, 0xa

    iput v1, p0, Lcom/autochips/carplay/a/e;->rD:I

    const/16 v1, 0xb

    iput v1, p0, Lcom/autochips/carplay/a/e;->rE:I

    const/16 v1, 0xc

    iput v1, p0, Lcom/autochips/carplay/a/e;->rF:I

    const/16 v1, 0xd

    iput v1, p0, Lcom/autochips/carplay/a/e;->rG:I

    iput v9, p0, Lcom/autochips/carplay/a/e;->rH:I

    const/16 v1, 0xf

    iput v1, p0, Lcom/autochips/carplay/a/e;->rI:I

    iput v8, p0, Lcom/autochips/carplay/a/e;->rJ:I

    iput v4, p0, Lcom/autochips/carplay/a/e;->rK:I

    iput v6, p0, Lcom/autochips/carplay/a/e;->rL:I

    iput-object p1, p0, Lcom/autochips/carplay/a/e;->mContext:Landroid/content/Context;

    const-string v1, "location"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/location/LocationManager;

    iput-object p1, p0, Lcom/autochips/carplay/a/e;->re:Landroid/location/LocationManager;

    sput-object p2, Lcom/autochips/carplay/a/e;->rf:Lcom/autochips/carplay/a/h;

    iput v0, p0, Lcom/autochips/carplay/a/e;->ri:I

    const-string p1, ""

    iput-object p1, p0, Lcom/autochips/carplay/a/e;->rj:Ljava/lang/String;

    return-void
.end method

.method private static a([Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    :goto_0
    array-length v2, p0

    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v3, p0, v1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    array-length v1, p0

    add-int/lit8 v1, v1, -0x1

    aget-object p0, p0, v1

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static a([Ljava/lang/String;I)V
    .locals 2

    array-length v0, p0

    add-int/lit8 v0, v0, -0x1

    if-le p1, v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    add-int/lit8 p1, p1, -0x1

    aget-object v1, p0, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "00"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, p0, p1

    return-void
.end method

.method private static v(Ljava/lang/String;)Z
    .locals 2

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const-string p0, "iAPLocation"

    const-string v0, "data not valid"

    invoke-static {p0, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_0
    const-string v0, "$GPGGA"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p0

    if-ltz p0, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method private static x(Ljava/lang/String;)Z
    .locals 2

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const-string p0, "iAPLocation"

    const-string v0, "data not valid"

    invoke-static {p0, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_0
    const-string v0, "$GPRMC"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p0

    if-ltz p0, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method private y(Ljava/lang/String;)V
    .locals 3

    invoke-static {p1}, Lcom/autochips/carplay/a/e;->x(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/autochips/carplay/a/e;->ri:I

    const/4 v1, 0x4

    and-int/2addr v0, v1

    if-eqz v0, :cond_1

    const-string v0, ","

    const/4 v2, -0x1

    invoke-virtual {p1, v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object p1

    array-length v0, p1

    const/16 v2, 0xd

    if-eq v0, v2, :cond_0

    const-string p1, "iAPLocation"

    const-string v0, "data of GPRMC not valid:"

    invoke-static {p1, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    invoke-static {p1, v1}, Lcom/autochips/carplay/a/e;->a([Ljava/lang/String;I)V

    const/4 v0, 0x6

    invoke-static {p1, v0}, Lcom/autochips/carplay/a/e;->a([Ljava/lang/String;I)V

    invoke-static {p1}, Lcom/autochips/carplay/a/e;->a([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    sget-object v0, Lcom/autochips/carplay/a/e;->rf:Lcom/autochips/carplay/a/h;

    iget-object v1, p0, Lcom/autochips/carplay/a/e;->rj:Ljava/lang/String;

    invoke-interface {v0, p1, v1}, Lcom/autochips/carplay/a/h;->a(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method private z(Ljava/lang/String;)V
    .locals 6

    sget-object v0, Lcom/autochips/carplay/a/e;->rf:Lcom/autochips/carplay/a/h;

    if-eqz v0, :cond_8

    iget-boolean v0, p0, Lcom/autochips/carplay/a/e;->rd:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {p1}, Lcom/autochips/carplay/a/e;->v(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    iget v0, p0, Lcom/autochips/carplay/a/e;->ri:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_7

    const-string v0, ","

    const/4 v1, -0x1

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    array-length v1, v0

    const/16 v2, 0xf

    if-eq v1, v2, :cond_1

    const-string v0, "iAPLocation"

    const-string v1, "data of GPGGA not valid:"

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    :cond_1
    const/4 v1, 0x3

    invoke-static {v0, v1}, Lcom/autochips/carplay/a/e;->a([Ljava/lang/String;I)V

    const/4 v1, 0x5

    invoke-static {v0, v1}, Lcom/autochips/carplay/a/e;->a([Ljava/lang/String;I)V

    const/16 v1, 0x8

    array-length v2, v0

    add-int/lit8 v2, v2, -0x1

    if-gt v1, v2, :cond_2

    const/4 v1, 0x7

    const-string v2, ""

    aput-object v2, v0, v1

    :cond_2
    invoke-static {v0}, Lcom/autochips/carplay/a/e;->a([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    invoke-static {v0}, Lcom/autochips/carplay/a/e;->v(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    invoke-static {v0}, Lcom/autochips/carplay/a/e;->x(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_3
    const-string v1, "$"

    const-string v2, "*"

    const-string v3, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-ltz v4, :cond_4

    if-ltz v2, :cond_4

    invoke-virtual {v0, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v2, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_4
    move-object v1, v3

    :cond_5
    :goto_0
    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    const/4 v2, 0x0

    move v3, v2

    move v4, v3

    :goto_1
    array-length v5, v1

    if-ge v3, v5, :cond_6

    aget-char v5, v1, v3

    xor-int/2addr v4, v5

    int-to-char v4, v4

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_6
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "*"

    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "*"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/autochips/carplay/a/e;->rf:Lcom/autochips/carplay/a/h;

    iget-object v2, p0, Lcom/autochips/carplay/a/e;->rj:Ljava/lang/String;

    invoke-interface {v1, v0, v2}, Lcom/autochips/carplay/a/h;->a(Ljava/lang/String;Ljava/lang/String;)V

    :cond_7
    :goto_2
    invoke-direct {p0, p1}, Lcom/autochips/carplay/a/e;->y(Ljava/lang/String;)V

    :cond_8
    return-void
.end method


# virtual methods
.method public final cZ()Z
    .locals 3

    iget-boolean v0, p0, Lcom/autochips/carplay/a/e;->rd:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string v0, "iAPLocation"

    const-string v2, "already stop"

    invoke-static {v0, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_0
    iput-boolean v1, p0, Lcom/autochips/carplay/a/e;->rd:Z

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/a/e;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/a/e;->sendMessage(Landroid/os/Message;)Z

    move-result v0

    return v0
.end method

.method public final e(ILjava/lang/String;)V
    .locals 3

    const-string v0, "iAPLocation"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "set type:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v0, p0, Lcom/autochips/carplay/a/e;->ri:I

    or-int/2addr p1, v0

    iput p1, p0, Lcom/autochips/carplay/a/e;->ri:I

    iput-object p2, p0, Lcom/autochips/carplay/a/e;->rj:Ljava/lang/String;

    return-void
.end method

.method public final handleMessage(Landroid/os/Message;)V
    .locals 7

    const-string v0, "iAPLocation"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "handleMessage, what:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    const-string v0, "iAPLocation"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "handle unknown Message, what:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p1, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :pswitch_0
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/autochips/carplay/a/e;->z(Ljava/lang/String;)V

    return-void

    :pswitch_1
    iget-object p1, p0, Lcom/autochips/carplay/a/e;->re:Landroid/location/LocationManager;

    iget-object v0, p0, Lcom/autochips/carplay/a/e;->rh:Lcom/autochips/carplay/a/f;

    invoke-virtual {p1, v0}, Landroid/location/LocationManager;->removeUpdates(Landroid/location/LocationListener;)V

    iget-object p1, p0, Lcom/autochips/carplay/a/e;->rg:Lcom/autochips/carplay/a/g;

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/autochips/carplay/a/e;->re:Landroid/location/LocationManager;

    iget-object v1, p0, Lcom/autochips/carplay/a/e;->rg:Lcom/autochips/carplay/a/g;

    invoke-virtual {p1, v1}, Landroid/location/LocationManager;->removeNmeaListener(Landroid/location/OnNmeaMessageListener;)V

    iput-object v0, p0, Lcom/autochips/carplay/a/e;->rg:Lcom/autochips/carplay/a/g;

    :cond_0
    iget-object p1, p0, Lcom/autochips/carplay/a/e;->rh:Lcom/autochips/carplay/a/f;

    if-eqz p1, :cond_1

    iput-object v0, p0, Lcom/autochips/carplay/a/e;->rh:Lcom/autochips/carplay/a/f;

    :cond_1
    return-void

    :pswitch_2
    iget-object p1, p0, Lcom/autochips/carplay/a/e;->rg:Lcom/autochips/carplay/a/g;

    const/4 v0, 0x0

    if-nez p1, :cond_2

    new-instance p1, Lcom/autochips/carplay/a/g;

    invoke-direct {p1, p0, v0}, Lcom/autochips/carplay/a/g;-><init>(Lcom/autochips/carplay/a/e;B)V

    iput-object p1, p0, Lcom/autochips/carplay/a/e;->rg:Lcom/autochips/carplay/a/g;

    iget-object p1, p0, Lcom/autochips/carplay/a/e;->re:Landroid/location/LocationManager;

    iget-object v1, p0, Lcom/autochips/carplay/a/e;->rg:Lcom/autochips/carplay/a/g;

    invoke-virtual {p1, v1}, Landroid/location/LocationManager;->addNmeaListener(Landroid/location/OnNmeaMessageListener;)Z

    :cond_2
    iget-object p1, p0, Lcom/autochips/carplay/a/e;->rh:Lcom/autochips/carplay/a/f;

    if-nez p1, :cond_3

    new-instance p1, Lcom/autochips/carplay/a/f;

    invoke-direct {p1, p0, v0}, Lcom/autochips/carplay/a/f;-><init>(Lcom/autochips/carplay/a/e;B)V

    iput-object p1, p0, Lcom/autochips/carplay/a/e;->rh:Lcom/autochips/carplay/a/f;

    :cond_3
    iget-object v1, p0, Lcom/autochips/carplay/a/e;->re:Landroid/location/LocationManager;

    const-string v2, "gps"

    const-wide/16 v3, 0x3e8

    const/high16 v5, 0x3f000000    # 0.5f

    iget-object v6, p0, Lcom/autochips/carplay/a/e;->rh:Lcom/autochips/carplay/a/f;

    invoke-virtual/range {v1 .. v6}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final start()Z
    .locals 2

    iget-boolean v0, p0, Lcom/autochips/carplay/a/e;->rd:Z

    if-eqz v0, :cond_0

    const-string v0, "iAPLocation"

    const-string v1, "already start"

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    return v0

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/autochips/carplay/a/e;->rd:Z

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/a/e;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/a/e;->sendMessage(Landroid/os/Message;)Z

    move-result v0

    return v0
.end method
