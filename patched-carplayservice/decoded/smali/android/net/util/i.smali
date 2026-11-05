.class final Landroid/net/util/i;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/MessageQueue$OnFileDescriptorEventListener;


# instance fields
.field final synthetic gz:Landroid/net/util/h;


# direct methods
.method constructor <init>(Landroid/net/util/h;)V
    .locals 0

    iput-object p1, p0, Landroid/net/util/i;->gz:Landroid/net/util/h;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onFileDescriptorEvents(Ljava/io/FileDescriptor;I)I
    .locals 0

    iget-object p1, p0, Landroid/net/util/i;->gz:Landroid/net/util/h;

    invoke-static {p1}, Landroid/net/util/h;->a(Landroid/net/util/h;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Landroid/net/util/i;->gz:Landroid/net/util/h;

    invoke-static {p1}, Landroid/net/util/h;->b(Landroid/net/util/h;)Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x5

    return p1

    :cond_1
    :goto_0
    iget-object p1, p0, Landroid/net/util/i;->gz:Landroid/net/util/h;

    invoke-static {p1}, Landroid/net/util/h;->c(Landroid/net/util/h;)V

    const/4 p1, 0x0

    return p1
.end method
