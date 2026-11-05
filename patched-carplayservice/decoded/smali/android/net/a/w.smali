.class final Landroid/net/a/w;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/android/internal/util/DumpUtils$Dump;


# instance fields
.field final synthetic fD:Landroid/net/a/v;


# direct methods
.method constructor <init>(Landroid/net/a/v;)V
    .locals 0

    iput-object p1, p0, Landroid/net/a/w;->fD:Landroid/net/a/v;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final dump(Ljava/io/PrintWriter;Ljava/lang/String;)V
    .locals 1

    iget-object p2, p0, Landroid/net/a/w;->fD:Landroid/net/a/v;

    const-string v0, "\n"

    invoke-static {p2, v0}, Landroid/net/a/v;->a(Landroid/net/a/v;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    return-void
.end method
