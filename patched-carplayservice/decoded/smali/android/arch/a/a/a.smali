.class public Landroid/arch/a/a/a;
.super Landroid/arch/a/a/e;


# static fields
.field private static volatile a:Landroid/arch/a/a/a;

.field private static final d:Ljava/util/concurrent/Executor;

.field private static final e:Ljava/util/concurrent/Executor;


# instance fields
.field private b:Landroid/arch/a/a/e;

.field private c:Landroid/arch/a/a/e;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Landroid/arch/a/a/b;

    invoke-direct {v0}, Landroid/arch/a/a/b;-><init>()V

    sput-object v0, Landroid/arch/a/a/a;->d:Ljava/util/concurrent/Executor;

    new-instance v0, Landroid/arch/a/a/c;

    invoke-direct {v0}, Landroid/arch/a/a/c;-><init>()V

    sput-object v0, Landroid/arch/a/a/a;->e:Ljava/util/concurrent/Executor;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/arch/a/a/e;-><init>()V

    new-instance v0, Landroid/arch/a/a/d;

    invoke-direct {v0}, Landroid/arch/a/a/d;-><init>()V

    iput-object v0, p0, Landroid/arch/a/a/a;->c:Landroid/arch/a/a/e;

    iget-object v0, p0, Landroid/arch/a/a/a;->c:Landroid/arch/a/a/e;

    iput-object v0, p0, Landroid/arch/a/a/a;->b:Landroid/arch/a/a/e;

    return-void
.end method

.method public static a()Landroid/arch/a/a/a;
    .locals 2

    sget-object v0, Landroid/arch/a/a/a;->a:Landroid/arch/a/a/a;

    if-eqz v0, :cond_0

    sget-object v0, Landroid/arch/a/a/a;->a:Landroid/arch/a/a/a;

    return-object v0

    :cond_0
    const-class v0, Landroid/arch/a/a/a;

    monitor-enter v0

    :try_start_0
    sget-object v1, Landroid/arch/a/a/a;->a:Landroid/arch/a/a/a;

    if-nez v1, :cond_1

    new-instance v1, Landroid/arch/a/a/a;

    invoke-direct {v1}, Landroid/arch/a/a/a;-><init>()V

    sput-object v1, Landroid/arch/a/a/a;->a:Landroid/arch/a/a/a;

    :cond_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sget-object v0, Landroid/arch/a/a/a;->a:Landroid/arch/a/a/a;

    return-object v0

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method


# virtual methods
.method public final a(Ljava/lang/Runnable;)V
    .locals 1

    iget-object v0, p0, Landroid/arch/a/a/a;->b:Landroid/arch/a/a/e;

    invoke-virtual {v0, p1}, Landroid/arch/a/a/e;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final b(Ljava/lang/Runnable;)V
    .locals 1

    iget-object v0, p0, Landroid/arch/a/a/a;->b:Landroid/arch/a/a/e;

    invoke-virtual {v0, p1}, Landroid/arch/a/a/e;->b(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final b()Z
    .locals 1

    iget-object v0, p0, Landroid/arch/a/a/a;->b:Landroid/arch/a/a/e;

    invoke-virtual {v0}, Landroid/arch/a/a/e;->b()Z

    move-result v0

    return v0
.end method
