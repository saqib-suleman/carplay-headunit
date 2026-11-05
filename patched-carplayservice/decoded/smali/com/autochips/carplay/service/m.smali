.class final Lcom/autochips/carplay/service/m;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/IBinder$DeathRecipient;


# instance fields
.field private mBinder:Landroid/os/IBinder;

.field private uj:I

.field final synthetic uk:Lcom/autochips/carplay/service/CarplayService;


# direct methods
.method constructor <init>(Lcom/autochips/carplay/service/CarplayService;Landroid/os/IBinder;I)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/service/m;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/autochips/carplay/service/m;->mBinder:Landroid/os/IBinder;

    iput p3, p0, Lcom/autochips/carplay/service/m;->uj:I

    return-void
.end method


# virtual methods
.method public final binderDied()V
    .locals 3

    const-string v0, "CarplayService"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Binder is dead - unregister "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lcom/autochips/carplay/service/m;->uj:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/service/m;->mBinder:Landroid/os/IBinder;

    const/4 v1, 0x0

    invoke-interface {v0, p0, v1}, Landroid/os/IBinder;->unlinkToDeath(Landroid/os/IBinder$DeathRecipient;I)Z

    iget-object v0, p0, Lcom/autochips/carplay/service/m;->uk:Lcom/autochips/carplay/service/CarplayService;

    iget v1, p0, Lcom/autochips/carplay/service/m;->uj:I

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/autochips/carplay/service/CarplayService;->o(II)V

    return-void
.end method
