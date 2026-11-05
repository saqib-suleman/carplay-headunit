.class public Lcom/autochips/carplay/service/CarplayService;
.super Landroid/app/Service;


# static fields
.field private static tV:Lcom/autochips/carplay/service/CarplayService;

.field private static final uf:Ljava/lang/String;

.field private static final ug:Ljava/lang/String;

.field private static final uh:Z

.field private static final ui:Z


# instance fields
.field private mContext:Landroid/content/Context;

.field private mPackageManager:Landroid/content/pm/PackageManager;

.field private mRemoteDevices:Lcom/autochips/carplay/service/z;

.field private tW:Lcom/autochips/carplay/service/p;

.field private tX:Landroid/os/UserManager;

.field private tY:Landroid/os/UserHandle;

.field private tZ:Z

.field private tm:Lcom/autochips/carplay/service/a;

.field private ua:Z

.field private ub:Ljava/util/HashMap;

.field private uc:Lcom/autochips/carplay/service/o;

.field private ud:Lcom/autochips/carplay/service/g;

.field private ue:Lcom/autochips/carplay/service/n;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "ro.atc.carplay.client.action"

    const-string v1, ""

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/autochips/carplay/service/CarplayService;->uf:Ljava/lang/String;

    const-string v0, "ro.atc.carplay.client.package"

    const-string v1, ""

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/autochips/carplay/service/CarplayService;->ug:Ljava/lang/String;

    const-string v0, "ro.atc.carplay.init_resolution"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/autochips/carplay/service/CarplayService;->uh:Z

    const-string v0, "ro.atc.carplay.toast_finalized"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/autochips/carplay/service/CarplayService;->ui:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/autochips/carplay/service/CarplayService;->ua:Z

    return-void
.end method

.method private declared-synchronized a(ZI)I
    .locals 2

    monitor-enter p0

    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "enable() - Enable called with quiet mode status =  "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CarplayService"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean p1, p0, Lcom/autochips/carplay/service/CarplayService;->ua:Z

    iget-object p1, p0, Lcom/autochips/carplay/service/CarplayService;->tm:Lcom/autochips/carplay/service/a;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/autochips/carplay/service/CarplayService;->tm:Lcom/autochips/carplay/service/a;

    const/16 v0, 0x101

    invoke-virtual {p1, v0, p2}, Lcom/autochips/carplay/service/a;->sendMessage(II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/16 p1, -0x13

    :goto_0
    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private static declared-synchronized b(Lcom/autochips/carplay/service/CarplayService;)V
    .locals 4

    const-class v0, Lcom/autochips/carplay/service/CarplayService;

    monitor-enter v0

    :try_start_0
    const-string v1, "CarplayService"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "setCarplayService() - trying to set service to "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez p0, :cond_0

    monitor-exit v0

    return-void

    :cond_0
    :try_start_1
    sput-object p0, Lcom/autochips/carplay/service/CarplayService;->tV:Lcom/autochips/carplay/service/CarplayService;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private static declared-synchronized c(Lcom/autochips/carplay/service/CarplayService;)V
    .locals 2

    const-class v0, Lcom/autochips/carplay/service/CarplayService;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/autochips/carplay/service/CarplayService;->tV:Lcom/autochips/carplay/service/CarplayService;

    if-ne v1, p0, :cond_0

    const/4 p0, 0x0

    sput-object p0, Lcom/autochips/carplay/service/CarplayService;->tV:Lcom/autochips/carplay/service/CarplayService;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method static synthetic d(Lcom/autochips/carplay/service/CarplayService;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/service/CarplayService;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic dW()Z
    .locals 1

    sget-boolean v0, Lcom/autochips/carplay/service/CarplayService;->uh:Z

    return v0
.end method

.method static synthetic dX()Z
    .locals 1

    sget-boolean v0, Lcom/autochips/carplay/service/CarplayService;->ui:Z

    return v0
.end method

.method static synthetic dY()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/autochips/carplay/service/CarplayService;->ug:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic dZ()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/autochips/carplay/service/CarplayService;->uf:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic e(Lcom/autochips/carplay/service/CarplayService;)Ljava/util/HashMap;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/service/CarplayService;->ub:Ljava/util/HashMap;

    return-object p0
.end method

.method static synthetic f(Lcom/autochips/carplay/service/CarplayService;)Lcom/autochips/carplay/service/g;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/service/CarplayService;->ud:Lcom/autochips/carplay/service/g;

    return-object p0
.end method

.method static synthetic g(Lcom/autochips/carplay/service/CarplayService;)Lcom/autochips/carplay/service/a;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/service/CarplayService;->tm:Lcom/autochips/carplay/service/a;

    return-object p0
.end method

.method static synthetic h(Lcom/autochips/carplay/service/CarplayService;)Lcom/autochips/carplay/service/z;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/service/CarplayService;->mRemoteDevices:Lcom/autochips/carplay/service/z;

    return-object p0
.end method

.method static synthetic i(Lcom/autochips/carplay/service/CarplayService;)Landroid/os/UserHandle;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/service/CarplayService;->tY:Landroid/os/UserHandle;

    return-object p0
.end method

.method static synthetic j(Lcom/autochips/carplay/service/CarplayService;)Landroid/content/pm/PackageManager;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/service/CarplayService;->mPackageManager:Landroid/content/pm/PackageManager;

    return-object p0
.end method

.method static synthetic k(Lcom/autochips/carplay/service/CarplayService;)Lcom/autochips/carplay/service/n;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/service/CarplayService;->ue:Lcom/autochips/carplay/service/n;

    return-object p0
.end method


# virtual methods
.method final a(Lcom/autochips/carplay/CarplayAppState;)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "updateAppState, appState="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CarplayService"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->ue:Lcom/autochips/carplay/service/n;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->ue:Lcom/autochips/carplay/service/n;

    const/16 v1, 0xd

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/service/n;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/autochips/carplay/service/CarplayService;->ue:Lcom/autochips/carplay/service/n;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/n;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    return-void
.end method

.method final a(Lcom/autochips/carplay/CarplayCall;)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "updateCallState, call="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CarplayService"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->ue:Lcom/autochips/carplay/service/n;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->ue:Lcom/autochips/carplay/service/n;

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/service/n;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/autochips/carplay/service/CarplayService;->ue:Lcom/autochips/carplay/service/n;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/n;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    return-void
.end method

.method public final a(Lcom/autochips/carplay/CarplayDevice;I)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "updateConnectionState, device="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", state="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CarplayService"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->ue:Lcom/autochips/carplay/service/n;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->ue:Lcom/autochips/carplay/service/n;

    const/16 v1, 0xb

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/service/n;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iput p2, v0, Landroid/os/Message;->arg1:I

    iget-object p1, p0, Lcom/autochips/carplay/service/CarplayService;->ue:Lcom/autochips/carplay/service/n;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/n;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    return-void
.end method

.method final a(Lcom/autochips/carplay/CarplayResourceState;)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "updateResourceState, resourceState="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CarplayService"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->ue:Lcom/autochips/carplay/service/n;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->ue:Lcom/autochips/carplay/service/n;

    const/16 v1, 0xe

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/service/n;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/autochips/carplay/service/CarplayService;->ue:Lcom/autochips/carplay/service/n;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/n;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    return-void
.end method

.method final aj(I)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "updateRequestAccessoryUI, url="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CarplayService"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->ue:Lcom/autochips/carplay/service/n;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->ue:Lcom/autochips/carplay/service/n;

    const/16 v1, 0xf

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/service/n;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iput p1, v0, Landroid/os/Message;->arg1:I

    iget-object p1, p0, Lcom/autochips/carplay/service/CarplayService;->ue:Lcom/autochips/carplay/service/n;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/n;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    return-void
.end method

.method public final c(IILandroid/os/Parcel;)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "updateAudioInfo, streamId="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", audioType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CarplayService"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->ue:Lcom/autochips/carplay/service/n;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->ue:Lcom/autochips/carplay/service/n;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/service/n;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iput p1, v0, Landroid/os/Message;->arg1:I

    iput p2, v0, Landroid/os/Message;->arg2:I

    iput-object p3, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/autochips/carplay/service/CarplayService;->ue:Lcom/autochips/carplay/service/n;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/n;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    return-void
.end method

.method final disable(I)I
    .locals 2

    const-string v0, "disable()"

    const-string v1, "CarplayService"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tm:Lcom/autochips/carplay/service/a;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tm:Lcom/autochips/carplay/service/a;

    const/16 v1, 0x102

    invoke-virtual {v0, v1, p1}, Lcom/autochips/carplay/service/a;->sendMessage(II)V

    const/4 p1, 0x0

    return p1

    :cond_0
    const/16 p1, -0x13

    return p1
.end method

.method protected dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 2

    array-length v0, p3

    if-nez v0, :cond_0

    const-string p1, "Skipping dump in APP SERVICES, see Carplay_manager section."

    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const-string p1, "Use --print argument for dumpsys direct from CarplayService."

    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    return-void

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "dumpsys arguments, check for protobuf output: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, " "

    invoke-static {v1, p3}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CarplayService"

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p2}, Ljava/io/PrintWriter;->println()V

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tm:Lcom/autochips/carplay/service/a;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tm:Lcom/autochips/carplay/service/a;

    invoke-virtual {v0, p1, p2, p3}, Lcom/autochips/carplay/service/a;->dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    :cond_1
    invoke-virtual {p2}, Ljava/io/PrintWriter;->println()V

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tm:Lcom/autochips/carplay/service/a;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    invoke-virtual {v0, p1, p2, p3}, Lcom/autochips/carplay/service/p;->dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    :cond_2
    invoke-virtual {p2}, Ljava/io/PrintWriter;->flush()V

    return-void
.end method

.method public final enable(I)I
    .locals 2

    const-string v0, "enable()"

    const-string v1, "CarplayService"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lcom/autochips/carplay/service/CarplayService;->a(ZI)I

    move-result p1

    return p1
.end method

.method public final enableNoAutoSwitch(I)I
    .locals 2

    const-string v0, "enableNoAutoSwitch()"

    const-string v1, "CarplayService"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    invoke-direct {p0, v0, p1}, Lcom/autochips/carplay/service/CarplayService;->a(ZI)I

    move-result p1

    return p1
.end method

.method public final g(III)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "updateStreamState, streamId="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", audioType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", streamState="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CarplayService"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->ue:Lcom/autochips/carplay/service/n;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->ue:Lcom/autochips/carplay/service/n;

    const/16 v1, 0xc

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/service/n;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iput p1, v0, Landroid/os/Message;->arg1:I

    iput p2, v0, Landroid/os/Message;->arg2:I

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/autochips/carplay/service/CarplayService;->ue:Lcom/autochips/carplay/service/n;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/n;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    return-void
.end method

.method public final getAppState()Lcom/autochips/carplay/CarplayAppState;
    .locals 1

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    invoke-virtual {v0}, Lcom/autochips/carplay/service/p;->getAppState()Lcom/autochips/carplay/CarplayAppState;

    move-result-object v0

    return-object v0
.end method

.method public final getConnectedDevices()Ljava/util/List;
    .locals 1

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    invoke-virtual {v0}, Lcom/autochips/carplay/service/p;->getConnectedDevices()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public final getConnectionState(Lcom/autochips/carplay/CarplayDevice;)I
    .locals 1

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/p;->getConnectionState(Lcom/autochips/carplay/CarplayDevice;)I

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public final getCurrentCalls()Ljava/util/List;
    .locals 1

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    invoke-virtual {v0}, Lcom/autochips/carplay/service/p;->getCurrentCalls()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public final getEnableState()I
    .locals 1

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tm:Lcom/autochips/carplay/service/a;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tm:Lcom/autochips/carplay/service/a;

    invoke-virtual {v0}, Lcom/autochips/carplay/service/a;->getEnableState()I

    move-result v0

    return v0
.end method

.method public final getLastUIState(Lcom/autochips/carplay/CarplayDevice;)I
    .locals 1

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/autochips/carplay/service/ac;->a(Landroid/content/Context;)Lcom/autochips/carplay/service/ac;

    move-result-object v0

    invoke-virtual {p1}, Lcom/autochips/carplay/CarplayDevice;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/ac;->K(Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public final getRemoteName(Lcom/autochips/carplay/CarplayDevice;)Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->mRemoteDevices:Lcom/autochips/carplay/service/z;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->mRemoteDevices:Lcom/autochips/carplay/service/z;

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/z;->b(Lcom/autochips/carplay/CarplayDevice;)Lcom/autochips/carplay/service/aa;

    move-result-object p1

    if-nez p1, :cond_1

    return-object v1

    :cond_1
    invoke-virtual {p1}, Lcom/autochips/carplay/service/aa;->getName()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final getResourceState()Lcom/autochips/carplay/CarplayResourceState;
    .locals 1

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    invoke-virtual {v0}, Lcom/autochips/carplay/service/p;->getResourceState()Lcom/autochips/carplay/CarplayResourceState;

    move-result-object v0

    return-object v0
.end method

.method public final getStreamState(Lcom/autochips/carplay/CarplayDevice;II)I
    .locals 4

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->mRemoteDevices:Lcom/autochips/carplay/service/z;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->mRemoteDevices:Lcom/autochips/carplay/service/z;

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/z;->b(Lcom/autochips/carplay/CarplayDevice;)Lcom/autochips/carplay/service/aa;

    move-result-object v0

    if-nez v0, :cond_1

    return v1

    :cond_1
    invoke-virtual {v0, p2, p3}, Lcom/autochips/carplay/service/aa;->r(II)I

    move-result v0

    const-string v1, "CarplayService"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "getStreamState , devices="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, ", streamId="

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", audioType="

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", state="

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    return v0
.end method

.method public final isAvailable()Z
    .locals 1

    iget-boolean v0, p0, Lcom/autochips/carplay/service/CarplayService;->tZ:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final isEnabled()Z
    .locals 3

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tm:Lcom/autochips/carplay/service/a;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x2

    iget-object v2, p0, Lcom/autochips/carplay/service/CarplayService;->tm:Lcom/autochips/carplay/service/a;

    invoke-virtual {v2}, Lcom/autochips/carplay/service/a;->getEnableState()I

    move-result v2

    if-ne v0, v2, :cond_1

    const/4 v0, 0x1

    return v0

    :cond_1
    return v1
.end method

.method final o(II)V
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->ue:Lcom/autochips/carplay/service/n;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->ue:Lcom/autochips/carplay/service/n;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/service/n;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iput p1, v0, Landroid/os/Message;->arg1:I

    iput p2, v0, Landroid/os/Message;->arg2:I

    iget-object p1, p0, Lcom/autochips/carplay/service/CarplayService;->ue:Lcom/autochips/carplay/service/n;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/n;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    return-void
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1

    const-string p1, "onBind()"

    const-string v0, "CarplayService"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/autochips/carplay/service/CarplayService;->uc:Lcom/autochips/carplay/service/o;

    return-object p1
.end method

.method public onCreate()V
    .locals 2

    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    invoke-virtual {p0}, Lcom/autochips/carplay/service/CarplayService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->mContext:Landroid/content/Context;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "onCreate(), mContext:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/autochips/carplay/service/CarplayService;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CarplayService"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/autochips/carplay/service/CarplayService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->mPackageManager:Landroid/content/pm/PackageManager;

    const-string v0, "user"

    invoke-virtual {p0, v0}, Lcom/autochips/carplay/service/CarplayService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/UserManager;

    iput-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tX:Landroid/os/UserManager;

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tX:Landroid/os/UserManager;

    invoke-virtual {v0}, Landroid/os/UserManager;->getUserHandle()I

    move-result v0

    invoke-static {v0}, Landroid/os/UserHandle;->of(I)Landroid/os/UserHandle;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tY:Landroid/os/UserHandle;

    new-instance v0, Lcom/autochips/carplay/service/g;

    iget-object v1, p0, Lcom/autochips/carplay/service/CarplayService;->mContext:Landroid/content/Context;

    invoke-direct {v0, p0, v1}, Lcom/autochips/carplay/service/g;-><init>(Lcom/autochips/carplay/service/CarplayService;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->ud:Lcom/autochips/carplay/service/g;

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->ud:Lcom/autochips/carplay/service/g;

    invoke-virtual {v0}, Lcom/autochips/carplay/service/g;->init()V

    new-instance v0, Lcom/autochips/carplay/service/o;

    invoke-direct {v0, p0}, Lcom/autochips/carplay/service/o;-><init>(Lcom/autochips/carplay/service/CarplayService;)V

    iput-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->uc:Lcom/autochips/carplay/service/o;

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->ud:Lcom/autochips/carplay/service/g;

    invoke-virtual {v0}, Lcom/autochips/carplay/service/g;->dB()Lcom/autochips/carplay/service/a;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tm:Lcom/autochips/carplay/service/a;

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->ud:Lcom/autochips/carplay/service/g;

    invoke-virtual {v0}, Lcom/autochips/carplay/service/g;->dC()Lcom/autochips/carplay/service/p;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->ud:Lcom/autochips/carplay/service/g;

    invoke-virtual {v0}, Lcom/autochips/carplay/service/g;->dA()Lcom/autochips/carplay/service/z;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->mRemoteDevices:Lcom/autochips/carplay/service/z;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->ub:Ljava/util/HashMap;

    invoke-static {p0}, Lcom/autochips/carplay/service/CarplayService;->b(Lcom/autochips/carplay/service/CarplayService;)V

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->ud:Lcom/autochips/carplay/service/g;

    invoke-virtual {v0}, Lcom/autochips/carplay/service/g;->dD()Landroid/os/HandlerThread;

    move-result-object v0

    new-instance v1, Lcom/autochips/carplay/service/n;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {v1, p0, v0}, Lcom/autochips/carplay/service/n;-><init>(Lcom/autochips/carplay/service/CarplayService;Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/autochips/carplay/service/CarplayService;->ue:Lcom/autochips/carplay/service/n;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "onCreate(), mClientHandler:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/autochips/carplay/service/CarplayService;->ue:Lcom/autochips/carplay/service/n;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CarplayService"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onDestroy()V
    .locals 2

    const-string v0, "onDestroy()"

    const-string v1, "CarplayService"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "CarplayService"

    const-string v1, "Force exit to cleanup internal state in Carplay stack"

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/System;->exit(I)V

    return-void
.end method

.method public onUnbind(Landroid/content/Intent;)Z
    .locals 2

    const-string v0, "onUnbind() - calling cleanup"

    const-string v1, "CarplayService"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "cleanup()"

    const-string v1, "CarplayService"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-boolean v0, p0, Lcom/autochips/carplay/service/CarplayService;->tZ:Z

    if-eqz v0, :cond_0

    const-string v0, "cleanup() - Service already starting to cleanup, ignoring request..."

    const-string v1, "CarplayService"

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_0
    invoke-static {p0}, Lcom/autochips/carplay/service/CarplayService;->c(Lcom/autochips/carplay/service/CarplayService;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/autochips/carplay/service/CarplayService;->tZ:Z

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->uc:Lcom/autochips/carplay/service/o;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->uc:Lcom/autochips/carplay/service/o;

    invoke-virtual {v0}, Lcom/autochips/carplay/service/o;->cleanup()V

    iput-object v1, p0, Lcom/autochips/carplay/service/CarplayService;->uc:Lcom/autochips/carplay/service/o;

    :cond_1
    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->ud:Lcom/autochips/carplay/service/g;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->ud:Lcom/autochips/carplay/service/g;

    invoke-virtual {v0}, Lcom/autochips/carplay/service/g;->deinit()V

    iput-object v1, p0, Lcom/autochips/carplay/service/CarplayService;->ud:Lcom/autochips/carplay/service/g;

    :cond_2
    :goto_0
    invoke-super {p0, p1}, Landroid/app/Service;->onUnbind(Landroid/content/Intent;)Z

    move-result p1

    return p1
.end method

.method public final p(II)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "updateEnableState, prevState="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", newState="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CarplayService"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->ue:Lcom/autochips/carplay/service/n;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->ue:Lcom/autochips/carplay/service/n;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/service/n;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iput p1, v0, Landroid/os/Message;->arg1:I

    iput p2, v0, Landroid/os/Message;->arg2:I

    iget-object p1, p0, Lcom/autochips/carplay/service/CarplayService;->ue:Lcom/autochips/carplay/service/n;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/n;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    return-void
.end method

.method public final registerCallback(Landroid/os/IBinder;Lcom/autochips/carplay/ICarplayCallback;I)I
    .locals 3

    if-eqz p1, :cond_2

    if-eqz p2, :cond_1

    new-instance v0, Lcom/autochips/carplay/service/m;

    invoke-direct {v0, p0, p1, p3}, Lcom/autochips/carplay/service/m;-><init>(Lcom/autochips/carplay/service/CarplayService;Landroid/os/IBinder;I)V

    const/4 v1, 0x0

    const/4 v2, -0x1

    :try_start_0
    invoke-interface {p1, v0, v1}, Landroid/os/IBinder;->linkToDeath(Landroid/os/IBinder$DeathRecipient;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    iget-object p1, p0, Lcom/autochips/carplay/service/CarplayService;->ue:Lcom/autochips/carplay/service/n;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/autochips/carplay/service/CarplayService;->ue:Lcom/autochips/carplay/service/n;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/n;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    iput p3, p1, Landroid/os/Message;->arg1:I

    iput-object p2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p2, p0, Lcom/autochips/carplay/service/CarplayService;->ue:Lcom/autochips/carplay/service/n;

    invoke-virtual {p2, p1}, Lcom/autochips/carplay/service/n;->sendMessage(Landroid/os/Message;)Z

    move-result p1

    if-ne v0, p1, :cond_0

    move v2, v1

    :cond_0
    return v2

    :catch_0
    move-exception p1

    const-string p2, "CarplayService"

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "Error on linkToDeath - "

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Callback must not be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Binder must not be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final requestDeviceUI(ILjava/lang/String;)I
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    const/16 v1, 0x106

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/service/p;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iput p1, v0, Landroid/os/Message;->arg1:I

    const/16 p1, 0x11e

    iput p1, v0, Landroid/os/Message;->arg2:I

    iput-object p2, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/p;->sendMessage(Landroid/os/Message;)V

    const/4 p1, 0x0

    return p1

    :cond_0
    const/4 p1, -0x1

    return p1
.end method

.method public final requestSiri(I)I
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    const/16 v1, 0x107

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/service/p;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iput p1, v0, Landroid/os/Message;->arg1:I

    iget-object p1, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/p;->sendMessage(Landroid/os/Message;)V

    const/4 p1, 0x0

    return p1

    :cond_0
    const/4 p1, -0x1

    return p1
.end method

.method public final setAudioEnable(Z)I
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    const/16 v1, 0x105

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/service/p;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/p;->sendMessage(Landroid/os/Message;)V

    const/4 p1, 0x0

    return p1

    :cond_0
    const/4 p1, -0x1

    return p1
.end method

.method public final setNightMode(Z)I
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    const/16 v1, 0x10b

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/service/p;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/p;->sendMessage(Landroid/os/Message;)V

    const/4 p1, 0x0

    return p1

    :cond_0
    const/4 p1, -0x1

    return p1
.end method

.method public final setOemIconLabel(Ljava/lang/String;)I
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    const/16 v1, 0x10e

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/service/p;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/p;->sendMessage(Landroid/os/Message;)V

    const/4 p1, 0x0

    return p1

    :cond_0
    const/4 p1, -0x1

    return p1
.end method

.method public final setScreenSize(II)I
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    const/16 v1, 0x10d

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/service/p;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iput p1, v0, Landroid/os/Message;->arg1:I

    iput p2, v0, Landroid/os/Message;->arg2:I

    iget-object p1, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/p;->sendMessage(Landroid/os/Message;)V

    const/4 p1, 0x0

    return p1

    :cond_0
    const/4 p1, -0x1

    return p1
.end method

.method public final setVideoResolution(II)I
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    const/16 v1, 0x10c

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/service/p;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iput p1, v0, Landroid/os/Message;->arg1:I

    iput p2, v0, Landroid/os/Message;->arg2:I

    iget-object p1, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/p;->sendMessage(Landroid/os/Message;)V

    const/4 p1, 0x0

    return p1

    :cond_0
    const/4 p1, -0x1

    return p1
.end method

.method public final startVideo(Landroid/view/Surface;)I
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    const/16 v1, 0x103

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/service/p;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/p;->sendMessage(Landroid/os/Message;)V

    const/4 p1, 0x0

    return p1

    :cond_0
    const/4 p1, -0x1

    return p1
.end method

.method public final stopVideo(Z)I
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    const/16 v1, 0x104

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/service/p;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    if-eqz p1, :cond_0

    const/16 p1, 0x11e

    iput p1, v0, Landroid/os/Message;->arg1:I

    :cond_0
    iget-object p1, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/p;->sendMessage(Landroid/os/Message;)V

    const/4 p1, 0x0

    return p1

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public final updateKnob(ZZZIII)I
    .locals 9

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    const/16 v1, 0x117

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/service/p;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    new-instance v8, Lcom/autochips/carplay/common/h;

    move-object v1, v8

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    invoke-direct/range {v1 .. v7}, Lcom/autochips/carplay/common/h;-><init>(ZZZIII)V

    iput-object v8, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/p;->sendMessage(Landroid/os/Message;)V

    const/4 p1, 0x0

    return p1

    :cond_0
    const/4 p1, -0x1

    return p1
.end method

.method public final updateMedia(I)I
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    const/16 v1, 0x116

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/service/p;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iput p1, v0, Landroid/os/Message;->arg1:I

    iget-object p1, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/p;->sendMessage(Landroid/os/Message;)V

    const/4 p1, 0x0

    return p1

    :cond_0
    const/4 p1, -0x1

    return p1
.end method

.method public final updateTelehony(I)I
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    const/16 v1, 0x115

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/service/p;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iput p1, v0, Landroid/os/Message;->arg1:I

    iget-object p1, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/p;->sendMessage(Landroid/os/Message;)V

    const/4 p1, 0x0

    return p1

    :cond_0
    const/4 p1, -0x1

    return p1
.end method

.method public final updateTouchScreen(ZII)I
    .locals 2

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    const/16 v1, 0x114

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/service/p;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iput p2, v0, Landroid/os/Message;->arg1:I

    iput p3, v0, Landroid/os/Message;->arg2:I

    iget-object p1, p0, Lcom/autochips/carplay/service/CarplayService;->tW:Lcom/autochips/carplay/service/p;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/p;->sendMessage(Landroid/os/Message;)V

    const/4 p1, 0x0

    return p1

    :cond_0
    const/4 p1, -0x1

    return p1
.end method
