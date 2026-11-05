.class public Landroid/net/a/a;
.super Ljava/lang/Object;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final el:Landroid/util/LocalLog;

.field private final em:Landroid/net/util/h;

.field private en:Ljava/lang/String;

.field private mRunning:Z

.field private final mTag:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Landroid/net/a/a;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroid/net/a/a;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/os/Handler;Landroid/net/util/b;Landroid/util/LocalLog;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p2, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Landroid/net/a/a;->TAG:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p2, Landroid/net/util/b;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/net/a/a;->mTag:Ljava/lang/String;

    iput-object p3, p0, Landroid/net/a/a;->el:Landroid/util/LocalLog;

    new-instance p3, Landroid/net/a/b;

    invoke-direct {p3, p0, p1, p2}, Landroid/net/a/b;-><init>(Landroid/net/a/a;Landroid/os/Handler;Landroid/net/util/b;)V

    iput-object p3, p0, Landroid/net/a/a;->em:Landroid/net/util/h;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "null InterfaceParams"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method static synthetic a(Landroid/net/a/a;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Landroid/net/a/a;->en:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic b(Landroid/net/a/a;)Landroid/util/LocalLog;
    .locals 0

    iget-object p0, p0, Landroid/net/a/a;->el:Landroid/util/LocalLog;

    return-object p0
.end method

.method static synthetic c(Landroid/net/a/a;)Z
    .locals 0

    iget-boolean p0, p0, Landroid/net/a/a;->mRunning:Z

    return p0
.end method

.method static synthetic d(Landroid/net/a/a;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Landroid/net/a/a;->mTag:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public final start(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/net/a/a;->mRunning:Z

    iput-object p1, p0, Landroid/net/a/a;->en:Ljava/lang/String;

    iget-object p1, p0, Landroid/net/a/a;->em:Landroid/net/util/h;

    invoke-virtual {p1}, Landroid/net/util/h;->start()V

    return-void
.end method

.method public final stop()V
    .locals 1

    iget-object v0, p0, Landroid/net/a/a;->em:Landroid/net/util/h;

    invoke-virtual {v0}, Landroid/net/util/h;->stop()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/net/a/a;->mRunning:Z

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/net/a/a;->en:Ljava/lang/String;

    return-void
.end method
