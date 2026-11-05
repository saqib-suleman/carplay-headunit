.class public final Landroid/support/v4/app/bh;
.super Landroid/arch/lifecycle/p;

# interfaces
.implements Landroid/support/v4/a/c;


# instance fields
.field private jR:Landroid/arch/lifecycle/g;

.field private final jT:Landroid/support/v4/a/b;

.field private jU:Landroid/support/v4/app/bi;

.field private jV:Landroid/support/v4/a/b;

.field private final mArgs:Landroid/os/Bundle;

.field private final mId:I


# virtual methods
.method public final a(Landroid/arch/lifecycle/q;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/arch/lifecycle/p;->a(Landroid/arch/lifecycle/q;)V

    const/4 p1, 0x0

    iput-object p1, p0, Landroid/support/v4/app/bh;->jR:Landroid/arch/lifecycle/g;

    iput-object p1, p0, Landroid/support/v4/app/bh;->jU:Landroid/support/v4/app/bi;

    return-void
.end method

.method public final a(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 3

    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mId="

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Landroid/support/v4/app/bh;->mId:I

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(I)V

    const-string v0, " mArgs="

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Landroid/support/v4/app/bh;->mArgs:Landroid/os/Bundle;

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mLoader="

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Landroid/support/v4/app/bh;->jT:Landroid/support/v4/a/b;

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    iget-object v0, p0, Landroid/support/v4/app/bh;->jT:Landroid/support/v4/a/b;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "  "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Landroid/support/v4/a/b;->a(Ljava/lang/String;Ljava/io/PrintWriter;)V

    iget-object v0, p0, Landroid/support/v4/app/bh;->jU:Landroid/support/v4/app/bi;

    if-eqz v0, :cond_0

    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mCallbacks="

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Landroid/support/v4/app/bh;->jU:Landroid/support/v4/app/bi;

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    iget-object v0, p0, Landroid/support/v4/app/bh;->jU:Landroid/support/v4/app/bi;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "  "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Landroid/support/v4/app/bi;->dump(Ljava/lang/String;Ljava/io/PrintWriter;)V

    :cond_0
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mData="

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/support/v4/app/bh;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/a/b;->dataToString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string p1, "mStarted="

    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/support/v4/app/bh;->k()Z

    move-result p1

    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->println(Z)V

    return-void
.end method

.method final bI()V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/app/bh;->jR:Landroid/arch/lifecycle/g;

    iget-object v1, p0, Landroid/support/v4/app/bh;->jU:Landroid/support/v4/app/bi;

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    invoke-super {p0, v1}, Landroid/arch/lifecycle/p;->a(Landroid/arch/lifecycle/q;)V

    invoke-virtual {p0, v0, v1}, Landroid/support/v4/app/bh;->a(Landroid/arch/lifecycle/g;Landroid/arch/lifecycle/q;)V

    :cond_0
    return-void
.end method

.method final bJ()Landroid/support/v4/a/b;
    .locals 3

    sget-boolean v0, Landroid/support/v4/app/LoaderManagerImpl;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "LoaderManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "  Destroying: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/bh;->jT:Landroid/support/v4/a/b;

    invoke-virtual {v0}, Landroid/support/v4/a/b;->abandon()V

    iget-object v0, p0, Landroid/support/v4/app/bh;->jU:Landroid/support/v4/app/bi;

    if-eqz v0, :cond_1

    invoke-virtual {p0, v0}, Landroid/support/v4/app/bh;->a(Landroid/arch/lifecycle/q;)V

    invoke-virtual {v0}, Landroid/support/v4/app/bi;->reset()V

    :cond_1
    iget-object v0, p0, Landroid/support/v4/app/bh;->jT:Landroid/support/v4/a/b;

    invoke-virtual {v0, p0}, Landroid/support/v4/a/b;->a(Landroid/support/v4/a/c;)V

    iget-object v0, p0, Landroid/support/v4/app/bh;->jT:Landroid/support/v4/a/b;

    invoke-virtual {v0}, Landroid/support/v4/a/b;->reset()V

    iget-object v0, p0, Landroid/support/v4/app/bh;->jV:Landroid/support/v4/a/b;

    return-object v0
.end method

.method protected final j()V
    .locals 3

    sget-boolean v0, Landroid/support/v4/app/LoaderManagerImpl;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "LoaderManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "  Stopping: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/bh;->jT:Landroid/support/v4/a/b;

    invoke-virtual {v0}, Landroid/support/v4/a/b;->stopLoading()V

    return-void
.end method

.method protected final onActive()V
    .locals 3

    sget-boolean v0, Landroid/support/v4/app/LoaderManagerImpl;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "LoaderManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "  Starting: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/bh;->jT:Landroid/support/v4/a/b;

    invoke-virtual {v0}, Landroid/support/v4/a/b;->startLoading()V

    return-void
.end method

.method public final setValue(Ljava/lang/Object;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/arch/lifecycle/p;->setValue(Ljava/lang/Object;)V

    iget-object p1, p0, Landroid/support/v4/app/bh;->jV:Landroid/support/v4/a/b;

    if-eqz p1, :cond_0

    iget-object p1, p0, Landroid/support/v4/app/bh;->jV:Landroid/support/v4/a/b;

    invoke-virtual {p1}, Landroid/support/v4/a/b;->reset()V

    const/4 p1, 0x0

    iput-object p1, p0, Landroid/support/v4/app/bh;->jV:Landroid/support/v4/a/b;

    :cond_0
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x40

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v1, "LoaderInfo{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " #"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/support/v4/app/bh;->mId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroid/support/v4/app/bh;->jT:Landroid/support/v4/a/b;

    invoke-static {v1, v0}, Landroid/support/v4/c/f;->buildShortClassTag(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    const-string v1, "}}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
