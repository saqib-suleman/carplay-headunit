.class final Landroid/net/a/g;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/net/a/x;


# instance fields
.field final synthetic eX:Landroid/net/a/d;


# direct methods
.method constructor <init>(Landroid/net/a/d;)V
    .locals 0

    iput-object p1, p0, Landroid/net/a/g;->eX:Landroid/net/a/d;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final j(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Landroid/net/a/g;->eX:Landroid/net/a/d;

    iget-object v0, v0, Landroid/net/a/d;->mCallback:Landroid/net/a/i;

    invoke-virtual {v0, p1}, Landroid/net/a/i;->k(Ljava/lang/String;)V

    return-void
.end method
