.class public Landroid/net/util/c;
.super Ljava/lang/Object;


# static fields
.field private static TAG:Ljava/lang/String;


# instance fields
.field private final gn:Ljava/lang/Runnable;

.field private final go:Ljava/util/List;

.field private final gp:Landroid/content/ContentResolver;

.field private final gq:Landroid/net/util/e;

.field private final gr:Landroid/content/BroadcastReceiver;

.field private volatile gs:Z

.field private volatile gt:I

.field private final mContext:Landroid/content/Context;

.field private final mHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Landroid/net/util/c;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroid/net/util/c;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/os/Handler;Ljava/lang/Runnable;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/net/util/c;->gs:Z

    iput-object p1, p0, Landroid/net/util/c;->mContext:Landroid/content/Context;

    iput-object p2, p0, Landroid/net/util/c;->mHandler:Landroid/os/Handler;

    new-instance p1, Landroid/net/util/-$$Lambda$c$pf5lAh682b8zL7WCiMaKMpWCRjc;

    invoke-direct {p1, p0, p3}, Landroid/net/util/-$$Lambda$c$pf5lAh682b8zL7WCiMaKMpWCRjc;-><init>(Landroid/net/util/c;Ljava/lang/Runnable;)V

    iput-object p1, p0, Landroid/net/util/c;->gn:Ljava/lang/Runnable;

    const/4 p1, 0x2

    new-array p1, p1, [Landroid/net/Uri;

    const-string p2, "network_avoid_bad_wifi"

    invoke-static {p2}, Landroid/provider/Settings$Global;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    const/4 p3, 0x0

    aput-object p2, p1, p3

    const-string p2, "network_metered_multipath_preference"

    invoke-static {p2}, Landroid/provider/Settings$Global;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    aput-object p2, p1, v0

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Landroid/net/util/c;->go:Ljava/util/List;

    iget-object p1, p0, Landroid/net/util/c;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    iput-object p1, p0, Landroid/net/util/c;->gp:Landroid/content/ContentResolver;

    new-instance p1, Landroid/net/util/e;

    invoke-direct {p1, p0}, Landroid/net/util/e;-><init>(Landroid/net/util/c;)V

    iput-object p1, p0, Landroid/net/util/c;->gq:Landroid/net/util/e;

    new-instance p1, Landroid/net/util/d;

    invoke-direct {p1, p0}, Landroid/net/util/d;-><init>(Landroid/net/util/c;)V

    iput-object p1, p0, Landroid/net/util/c;->gr:Landroid/content/BroadcastReceiver;

    invoke-direct {p0}, Landroid/net/util/c;->az()Z

    invoke-direct {p0}, Landroid/net/util/c;->aA()V

    return-void
.end method

.method static synthetic a(Landroid/net/util/c;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Landroid/net/util/c;->go:Ljava/util/List;

    return-object p0
.end method

.method private aA()V
    .locals 2

    iget-object v0, p0, Landroid/net/util/c;->gp:Landroid/content/ContentResolver;

    const-string v1, "network_metered_multipath_preference"

    invoke-static {v0, v1}, Landroid/provider/Settings$Global;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :try_start_0
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Landroid/net/util/c;->gt:I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    iget-object v0, p0, Landroid/net/util/c;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x10e006b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    iput v0, p0, Landroid/net/util/c;->gt:I

    return-void
.end method

.method static synthetic aB()Ljava/lang/String;
    .locals 1

    sget-object v0, Landroid/net/util/c;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private az()Z
    .locals 5

    const-string v0, "1"

    iget-object v1, p0, Landroid/net/util/c;->gp:Landroid/content/ContentResolver;

    const-string v2, "network_avoid_bad_wifi"

    invoke-static {v1, v2}, Landroid/provider/Settings$Global;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    iget-boolean v1, p0, Landroid/net/util/c;->gs:Z

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v0, :cond_2

    iget-object v0, p0, Landroid/net/util/c;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v4, 0x10e0069

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    if-nez v0, :cond_0

    move v0, v3

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    if-nez v0, :cond_1

    goto :goto_1

    :cond_1
    move v0, v2

    goto :goto_2

    :cond_2
    :goto_1
    move v0, v3

    :goto_2
    iput-boolean v0, p0, Landroid/net/util/c;->gs:Z

    iget-boolean v0, p0, Landroid/net/util/c;->gs:Z

    if-eq v0, v1, :cond_3

    return v3

    :cond_3
    return v2
.end method

.method private synthetic c(Ljava/lang/Runnable;)V
    .locals 1

    invoke-direct {p0}, Landroid/net/util/c;->az()Z

    move-result v0

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    :cond_0
    invoke-direct {p0}, Landroid/net/util/c;->aA()V

    return-void
.end method

.method public static synthetic lambda$pf5lAh682b8zL7WCiMaKMpWCRjc(Landroid/net/util/c;Ljava/lang/Runnable;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/net/util/c;->c(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public final ay()Z
    .locals 1

    iget-boolean v0, p0, Landroid/net/util/c;->gs:Z

    return v0
.end method

.method public reevaluate()V
    .locals 2
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation

    iget-object v0, p0, Landroid/net/util/c;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Landroid/net/util/c;->gn:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final shutdown()V
    .locals 2

    iget-object v0, p0, Landroid/net/util/c;->gp:Landroid/content/ContentResolver;

    iget-object v1, p0, Landroid/net/util/c;->gq:Landroid/net/util/e;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    iget-object v0, p0, Landroid/net/util/c;->mContext:Landroid/content/Context;

    iget-object v1, p0, Landroid/net/util/c;->gr:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    return-void
.end method

.method public final start()V
    .locals 11

    iget-object v0, p0, Landroid/net/util/c;->go:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/Uri;

    iget-object v2, p0, Landroid/net/util/c;->gp:Landroid/content/ContentResolver;

    const/4 v3, 0x0

    iget-object v4, p0, Landroid/net/util/c;->gq:Landroid/net/util/e;

    invoke-virtual {v2, v1, v3, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    goto :goto_0

    :cond_0
    new-instance v8, Landroid/content/IntentFilter;

    invoke-direct {v8}, Landroid/content/IntentFilter;-><init>()V

    const-string v0, "android.intent.action.CONFIGURATION_CHANGED"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v5, p0, Landroid/net/util/c;->mContext:Landroid/content/Context;

    iget-object v6, p0, Landroid/net/util/c;->gr:Landroid/content/BroadcastReceiver;

    sget-object v7, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual/range {v5 .. v10}, Landroid/content/Context;->registerReceiverAsUser(Landroid/content/BroadcastReceiver;Landroid/os/UserHandle;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    invoke-virtual {p0}, Landroid/net/util/c;->reevaluate()V

    return-void
.end method
