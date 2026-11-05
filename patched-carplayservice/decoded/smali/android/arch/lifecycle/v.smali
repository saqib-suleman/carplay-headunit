.class public final Landroid/arch/lifecycle/v;
.super Ljava/lang/Object;


# instance fields
.field private final al:Landroid/arch/lifecycle/w;

.field private final am:Landroid/arch/lifecycle/x;


# direct methods
.method public constructor <init>(Landroid/arch/lifecycle/x;Landroid/arch/lifecycle/w;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Landroid/arch/lifecycle/v;->al:Landroid/arch/lifecycle/w;

    iput-object p1, p0, Landroid/arch/lifecycle/v;->am:Landroid/arch/lifecycle/x;

    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Class;)Landroid/arch/lifecycle/u;
    .locals 3

    invoke-virtual {p1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "android.arch.lifecycle.ViewModelProvider.DefaultKey:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Landroid/arch/lifecycle/v;->am:Landroid/arch/lifecycle/x;

    invoke-virtual {v1, v0}, Landroid/arch/lifecycle/x;->b(Ljava/lang/String;)Landroid/arch/lifecycle/u;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    return-object v1

    :cond_0
    iget-object p1, p0, Landroid/arch/lifecycle/v;->al:Landroid/arch/lifecycle/w;

    invoke-interface {p1}, Landroid/arch/lifecycle/w;->q()Landroid/arch/lifecycle/u;

    move-result-object p1

    iget-object v1, p0, Landroid/arch/lifecycle/v;->am:Landroid/arch/lifecycle/x;

    invoke-virtual {v1, v0, p1}, Landroid/arch/lifecycle/x;->a(Ljava/lang/String;Landroid/arch/lifecycle/u;)V

    return-object p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Local and anonymous classes can not be ViewModels"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
