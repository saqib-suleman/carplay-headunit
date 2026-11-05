.class public final Lcom/autochips/carplay/service/ac;
.super Ljava/lang/Object;


# static fields
.field private static uJ:Lcom/autochips/carplay/service/ac;


# instance fields
.field private uK:Landroid/content/SharedPreferences;

.field private uL:Landroid/content/SharedPreferences$Editor;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "device_ui_state"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Lcom/autochips/carplay/service/ac;->uK:Landroid/content/SharedPreferences;

    return-void
.end method

.method public static declared-synchronized a(Landroid/content/Context;)Lcom/autochips/carplay/service/ac;
    .locals 2

    const-class v0, Lcom/autochips/carplay/service/ac;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/autochips/carplay/service/ac;->uJ:Lcom/autochips/carplay/service/ac;

    if-nez v1, :cond_0

    new-instance v1, Lcom/autochips/carplay/service/ac;

    invoke-direct {v1, p0}, Lcom/autochips/carplay/service/ac;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/autochips/carplay/service/ac;->uJ:Lcom/autochips/carplay/service/ac;

    :cond_0
    sget-object p0, Lcom/autochips/carplay/service/ac;->uJ:Lcom/autochips/carplay/service/ac;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method


# virtual methods
.method public final K(Ljava/lang/String;)I
    .locals 3

    invoke-static {}, Lcom/autochips/carplay/service/z;->l()Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/autochips/carplay/service/ac;->uK:Landroid/content/SharedPreferences;

    const/4 v2, 0x1

    invoke-interface {v1, p1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    monitor-exit v0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public final b(Ljava/lang/String;I)V
    .locals 2

    invoke-static {}, Lcom/autochips/carplay/service/z;->l()Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    invoke-virtual {p0, p1}, Lcom/autochips/carplay/service/ac;->K(Ljava/lang/String;)I

    move-result v1

    if-ne v1, p2, :cond_0

    monitor-exit v0

    return-void

    :cond_0
    iget-object v1, p0, Lcom/autochips/carplay/service/ac;->uL:Landroid/content/SharedPreferences$Editor;

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/autochips/carplay/service/ac;->uK:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    iput-object v1, p0, Lcom/autochips/carplay/service/ac;->uL:Landroid/content/SharedPreferences$Editor;

    :cond_1
    iget-object v1, p0, Lcom/autochips/carplay/service/ac;->uL:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v1, p1, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
