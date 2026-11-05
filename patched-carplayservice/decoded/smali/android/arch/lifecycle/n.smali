.class abstract Landroid/arch/lifecycle/n;
.super Ljava/lang/Object;


# instance fields
.field final synthetic ac:Landroid/arch/lifecycle/LiveData;

.field final ae:Landroid/arch/lifecycle/q;

.field af:I

.field mActive:Z


# direct methods
.method constructor <init>(Landroid/arch/lifecycle/LiveData;Landroid/arch/lifecycle/q;)V
    .locals 0

    iput-object p1, p0, Landroid/arch/lifecycle/n;->ac:Landroid/arch/lifecycle/LiveData;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, -0x1

    iput p1, p0, Landroid/arch/lifecycle/n;->af:I

    iput-object p2, p0, Landroid/arch/lifecycle/n;->ae:Landroid/arch/lifecycle/q;

    return-void
.end method


# virtual methods
.method final a(Z)V
    .locals 4

    iget-boolean v0, p0, Landroid/arch/lifecycle/n;->mActive:Z

    if-ne p1, v0, :cond_0

    return-void

    :cond_0
    iput-boolean p1, p0, Landroid/arch/lifecycle/n;->mActive:Z

    iget-object p1, p0, Landroid/arch/lifecycle/n;->ac:Landroid/arch/lifecycle/LiveData;

    invoke-static {p1}, Landroid/arch/lifecycle/LiveData;->c(Landroid/arch/lifecycle/LiveData;)I

    move-result p1

    const/4 v0, 0x1

    if-nez p1, :cond_1

    move p1, v0

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    iget-object v1, p0, Landroid/arch/lifecycle/n;->ac:Landroid/arch/lifecycle/LiveData;

    invoke-static {v1}, Landroid/arch/lifecycle/LiveData;->c(Landroid/arch/lifecycle/LiveData;)I

    move-result v2

    iget-boolean v3, p0, Landroid/arch/lifecycle/n;->mActive:Z

    if-eqz v3, :cond_2

    goto :goto_1

    :cond_2
    const/4 v0, -0x1

    :goto_1
    add-int/2addr v2, v0

    invoke-static {v1, v2}, Landroid/arch/lifecycle/LiveData;->a(Landroid/arch/lifecycle/LiveData;I)I

    if-eqz p1, :cond_3

    iget-boolean p1, p0, Landroid/arch/lifecycle/n;->mActive:Z

    if-eqz p1, :cond_3

    iget-object p1, p0, Landroid/arch/lifecycle/n;->ac:Landroid/arch/lifecycle/LiveData;

    invoke-virtual {p1}, Landroid/arch/lifecycle/LiveData;->onActive()V

    :cond_3
    iget-object p1, p0, Landroid/arch/lifecycle/n;->ac:Landroid/arch/lifecycle/LiveData;

    invoke-static {p1}, Landroid/arch/lifecycle/LiveData;->c(Landroid/arch/lifecycle/LiveData;)I

    move-result p1

    if-nez p1, :cond_4

    iget-boolean p1, p0, Landroid/arch/lifecycle/n;->mActive:Z

    if-nez p1, :cond_4

    iget-object p1, p0, Landroid/arch/lifecycle/n;->ac:Landroid/arch/lifecycle/LiveData;

    invoke-virtual {p1}, Landroid/arch/lifecycle/LiveData;->j()V

    :cond_4
    iget-boolean p1, p0, Landroid/arch/lifecycle/n;->mActive:Z

    if-eqz p1, :cond_5

    iget-object p1, p0, Landroid/arch/lifecycle/n;->ac:Landroid/arch/lifecycle/LiveData;

    invoke-static {p1, p0}, Landroid/arch/lifecycle/LiveData;->a(Landroid/arch/lifecycle/LiveData;Landroid/arch/lifecycle/n;)V

    :cond_5
    return-void
.end method

.method b(Landroid/arch/lifecycle/g;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method abstract m()Z
.end method

.method n()V
    .locals 0

    return-void
.end method
