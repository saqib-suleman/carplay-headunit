.class Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;
.super Landroid/arch/lifecycle/u;


# static fields
.field private static final jX:Landroid/arch/lifecycle/w;


# instance fields
.field private jY:Landroid/support/v4/c/t;

.field private mCreatingLoader:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Landroid/support/v4/app/bj;

    invoke-direct {v0}, Landroid/support/v4/app/bj;-><init>()V

    sput-object v0, Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;->jX:Landroid/arch/lifecycle/w;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/arch/lifecycle/u;-><init>()V

    new-instance v0, Landroid/support/v4/c/t;

    invoke-direct {v0}, Landroid/support/v4/c/t;-><init>()V

    iput-object v0, p0, Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;->jY:Landroid/support/v4/c/t;

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;->mCreatingLoader:Z

    return-void
.end method

.method static a(Landroid/arch/lifecycle/x;)Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;
    .locals 2

    new-instance v0, Landroid/arch/lifecycle/v;

    sget-object v1, Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;->jX:Landroid/arch/lifecycle/w;

    invoke-direct {v0, p0, v1}, Landroid/arch/lifecycle/v;-><init>(Landroid/arch/lifecycle/x;Landroid/arch/lifecycle/w;)V

    const-class p0, Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;

    invoke-virtual {v0, p0}, Landroid/arch/lifecycle/v;->g(Ljava/lang/Class;)Landroid/arch/lifecycle/u;

    move-result-object p0

    check-cast p0, Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;

    return-object p0
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 4

    iget-object v0, p0, Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;->jY:Landroid/support/v4/c/t;

    invoke-virtual {v0}, Landroid/support/v4/c/t;->size()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "Loaders:"

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "    "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;->jY:Landroid/support/v4/c/t;

    invoke-virtual {v2}, Landroid/support/v4/c/t;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    iget-object v2, p0, Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;->jY:Landroid/support/v4/c/t;

    invoke-virtual {v2, v1}, Landroid/support/v4/c/t;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/app/bh;

    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v3, "  #"

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v3, p0, Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;->jY:Landroid/support/v4/c/t;

    invoke-virtual {v3, v1}, Landroid/support/v4/c/t;->keyAt(I)I

    move-result v3

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->print(I)V

    const-string v3, ": "

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {v2}, Landroid/support/v4/app/bh;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    invoke-virtual {v2, v0, p2}, Landroid/support/v4/app/bh;->a(Ljava/lang/String;Ljava/io/PrintWriter;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method final bI()V
    .locals 3

    iget-object v0, p0, Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;->jY:Landroid/support/v4/c/t;

    invoke-virtual {v0}, Landroid/support/v4/c/t;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    iget-object v2, p0, Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;->jY:Landroid/support/v4/c/t;

    invoke-virtual {v2, v1}, Landroid/support/v4/c/t;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/app/bh;

    invoke-virtual {v2}, Landroid/support/v4/app/bh;->bI()V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method protected final p()V
    .locals 3

    invoke-super {p0}, Landroid/arch/lifecycle/u;->p()V

    iget-object v0, p0, Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;->jY:Landroid/support/v4/c/t;

    invoke-virtual {v0}, Landroid/support/v4/c/t;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    iget-object v2, p0, Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;->jY:Landroid/support/v4/c/t;

    invoke-virtual {v2, v1}, Landroid/support/v4/c/t;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/app/bh;

    invoke-virtual {v2}, Landroid/support/v4/app/bh;->bJ()Landroid/support/v4/a/b;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/LoaderManagerImpl$LoaderViewModel;->jY:Landroid/support/v4/c/t;

    invoke-virtual {v0}, Landroid/support/v4/c/t;->clear()V

    return-void
.end method
