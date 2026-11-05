.class public abstract Landroid/support/v4/media/i;
.super Landroid/os/Binder;

# interfaces
.implements Landroid/support/v4/media/h;


# direct methods
.method public static b(Landroid/os/IBinder;)Landroid/support/v4/media/h;
    .locals 2

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    const-string v0, "android.support.v4.media.IMediaSession2"

    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    if-eqz v0, :cond_1

    instance-of v1, v0, Landroid/support/v4/media/h;

    if-eqz v1, :cond_1

    check-cast v0, Landroid/support/v4/media/h;

    return-object v0

    :cond_1
    new-instance v0, Landroid/support/v4/media/j;

    invoke-direct {v0, p0}, Landroid/support/v4/media/j;-><init>(Landroid/os/IBinder;)V

    return-object v0
.end method


# virtual methods
.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 8

    const v0, 0x5f4e5446

    const/4 v1, 0x1

    if-eq p1, v0, :cond_18

    const/4 v0, 0x0

    packed-switch p1, :pswitch_data_0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result p1

    return p1

    :pswitch_0
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Landroid/support/v4/media/i;->c(Landroid/support/v4/media/e;Ljava/lang/String;)V

    return v1

    :pswitch_1
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_0

    sget-object p4, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p2

    move-object v0, p2

    check-cast v0, Landroid/os/Bundle;

    :cond_0
    invoke-virtual {p0, p1, p3, v0}, Landroid/support/v4/media/i;->g(Landroid/support/v4/media/e;Ljava/lang/String;Landroid/os/Bundle;)V

    return v1

    :pswitch_2
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object v3

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v5

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v6

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_1

    sget-object p1, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p1, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Landroid/os/Bundle;

    :cond_1
    move-object v7, v0

    move-object v2, p0

    invoke-virtual/range {v2 .. v7}, Landroid/support/v4/media/i;->b(Landroid/support/v4/media/e;Ljava/lang/String;IILandroid/os/Bundle;)V

    return v1

    :pswitch_3
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_2

    sget-object p4, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p2

    move-object v0, p2

    check-cast v0, Landroid/os/Bundle;

    :cond_2
    invoke-virtual {p0, p1, p3, v0}, Landroid/support/v4/media/i;->f(Landroid/support/v4/media/e;Ljava/lang/String;Landroid/os/Bundle;)V

    return v1

    :pswitch_4
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object v3

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v5

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v6

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_3

    sget-object p1, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p1, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Landroid/os/Bundle;

    :cond_3
    move-object v7, v0

    move-object v2, p0

    invoke-virtual/range {v2 .. v7}, Landroid/support/v4/media/i;->a(Landroid/support/v4/media/e;Ljava/lang/String;IILandroid/os/Bundle;)V

    return v1

    :pswitch_5
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Landroid/support/v4/media/i;->b(Landroid/support/v4/media/e;Ljava/lang/String;)V

    return v1

    :pswitch_6
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p3

    if-eqz p3, :cond_4

    sget-object p3, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p3, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p2

    move-object v0, p2

    check-cast v0, Landroid/os/Bundle;

    :cond_4
    invoke-virtual {p0, p1, v0}, Landroid/support/v4/media/i;->e(Landroid/support/v4/media/e;Landroid/os/Bundle;)V

    return v1

    :pswitch_7
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p3

    if-eqz p3, :cond_5

    sget-object p3, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p3, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p2

    move-object v0, p2

    check-cast v0, Landroid/os/Bundle;

    :cond_5
    invoke-virtual {p0, p1, v0}, Landroid/support/v4/media/i;->d(Landroid/support/v4/media/e;Landroid/os/Bundle;)V

    return v1

    :pswitch_8
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/support/v4/media/i;->k(Landroid/support/v4/media/e;)V

    return v1

    :pswitch_9
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/support/v4/media/i;->j(Landroid/support/v4/media/e;)V

    return v1

    :pswitch_a
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p2

    invoke-virtual {p0, p1, p2}, Landroid/support/v4/media/i;->b(Landroid/support/v4/media/e;I)V

    return v1

    :pswitch_b
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p2

    invoke-virtual {p0, p1, p2}, Landroid/support/v4/media/i;->a(Landroid/support/v4/media/e;I)V

    return v1

    :pswitch_c
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/support/v4/media/i;->i(Landroid/support/v4/media/e;)V

    return v1

    :pswitch_d
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/support/v4/media/i;->h(Landroid/support/v4/media/e;)V

    return v1

    :pswitch_e
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p3

    if-eqz p3, :cond_6

    sget-object p3, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p3, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p2

    move-object v0, p2

    check-cast v0, Landroid/os/Bundle;

    :cond_6
    invoke-virtual {p0, p1, v0}, Landroid/support/v4/media/i;->c(Landroid/support/v4/media/e;Landroid/os/Bundle;)V

    return v1

    :pswitch_f
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p3

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_7

    sget-object p4, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p2

    move-object v0, p2

    check-cast v0, Landroid/os/Bundle;

    :cond_7
    invoke-virtual {p0, p1, p3, v0}, Landroid/support/v4/media/i;->b(Landroid/support/v4/media/e;ILandroid/os/Bundle;)V

    return v1

    :pswitch_10
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p3

    if-eqz p3, :cond_8

    sget-object p3, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p3, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p2

    move-object v0, p2

    check-cast v0, Landroid/os/Bundle;

    :cond_8
    invoke-virtual {p0, p1, v0}, Landroid/support/v4/media/i;->b(Landroid/support/v4/media/e;Landroid/os/Bundle;)V

    return v1

    :pswitch_11
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p3

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_9

    sget-object p4, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p2

    move-object v0, p2

    check-cast v0, Landroid/os/Bundle;

    :cond_9
    invoke-virtual {p0, p1, p3, v0}, Landroid/support/v4/media/i;->a(Landroid/support/v4/media/e;ILandroid/os/Bundle;)V

    return v1

    :pswitch_12
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p3

    if-eqz p3, :cond_a

    sget-object p3, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p3, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p2

    move-object v0, p2

    check-cast v0, Landroid/os/Bundle;

    :cond_a
    invoke-virtual {p0, p1, v0}, Landroid/support/v4/media/i;->a(Landroid/support/v4/media/e;Landroid/os/Bundle;)V

    return v1

    :pswitch_13
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    sget-object p3, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p2, p3}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object p3

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_b

    sget-object p4, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p2

    move-object v0, p2

    check-cast v0, Landroid/os/Bundle;

    :cond_b
    invoke-virtual {p0, p1, p3, v0}, Landroid/support/v4/media/i;->a(Landroid/support/v4/media/e;Ljava/util/List;Landroid/os/Bundle;)V

    return v1

    :pswitch_14
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readFloat()F

    move-result p2

    invoke-virtual {p0, p1, p2}, Landroid/support/v4/media/i;->a(Landroid/support/v4/media/e;F)V

    return v1

    :pswitch_15
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_c

    sget-object p4, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p2

    move-object v0, p2

    check-cast v0, Landroid/os/Bundle;

    :cond_c
    invoke-virtual {p0, p1, p3, v0}, Landroid/support/v4/media/i;->e(Landroid/support/v4/media/e;Ljava/lang/String;Landroid/os/Bundle;)V

    return v1

    :pswitch_16
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_d

    sget-object p4, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p2

    move-object v0, p2

    check-cast v0, Landroid/os/Bundle;

    :cond_d
    invoke-virtual {p0, p1, p3, v0}, Landroid/support/v4/media/i;->d(Landroid/support/v4/media/e;Ljava/lang/String;Landroid/os/Bundle;)V

    return v1

    :pswitch_17
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_e

    sget-object p4, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p2

    move-object v0, p2

    check-cast v0, Landroid/os/Bundle;

    :cond_e
    invoke-virtual {p0, p1, p3, v0}, Landroid/support/v4/media/i;->c(Landroid/support/v4/media/e;Ljava/lang/String;Landroid/os/Bundle;)V

    return v1

    :pswitch_18
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p3

    if-eqz p3, :cond_f

    sget-object p3, Landroid/net/Uri;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p3, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/net/Uri;

    goto :goto_0

    :cond_f
    move-object p3, v0

    :goto_0
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_10

    sget-object p4, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p2

    move-object v0, p2

    check-cast v0, Landroid/os/Bundle;

    :cond_10
    invoke-virtual {p0, p1, p3, v0}, Landroid/support/v4/media/i;->b(Landroid/support/v4/media/e;Landroid/net/Uri;Landroid/os/Bundle;)V

    return v1

    :pswitch_19
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_11

    sget-object p4, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p2

    move-object v0, p2

    check-cast v0, Landroid/os/Bundle;

    :cond_11
    invoke-virtual {p0, p1, p3, v0}, Landroid/support/v4/media/i;->b(Landroid/support/v4/media/e;Ljava/lang/String;Landroid/os/Bundle;)V

    return v1

    :pswitch_1a
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_12

    sget-object p4, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p2

    move-object v0, p2

    check-cast v0, Landroid/os/Bundle;

    :cond_12
    invoke-virtual {p0, p1, p3, v0}, Landroid/support/v4/media/i;->a(Landroid/support/v4/media/e;Ljava/lang/String;Landroid/os/Bundle;)V

    return v1

    :pswitch_1b
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p3

    if-eqz p3, :cond_13

    sget-object p3, Landroid/net/Uri;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p3, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/net/Uri;

    goto :goto_1

    :cond_13
    move-object p3, v0

    :goto_1
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_14

    sget-object p4, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p2

    move-object v0, p2

    check-cast v0, Landroid/os/Bundle;

    :cond_14
    invoke-virtual {p0, p1, p3, v0}, Landroid/support/v4/media/i;->a(Landroid/support/v4/media/e;Landroid/net/Uri;Landroid/os/Bundle;)V

    return v1

    :pswitch_1c
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p3

    if-eqz p3, :cond_15

    sget-object p3, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p3, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/os/Bundle;

    goto :goto_2

    :cond_15
    move-object p3, v0

    :goto_2
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_16

    sget-object p4, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Landroid/os/Bundle;

    goto :goto_3

    :cond_16
    move-object p4, v0

    :goto_3
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_17

    sget-object v0, Landroid/os/ResultReceiver;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p2

    move-object v0, p2

    check-cast v0, Landroid/os/ResultReceiver;

    :cond_17
    invoke-virtual {p0, p1, p3, p4, v0}, Landroid/support/v4/media/i;->a(Landroid/support/v4/media/e;Landroid/os/Bundle;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V

    return v1

    :pswitch_1d
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide p2

    invoke-virtual {p0, p1, p2, p3}, Landroid/support/v4/media/i;->a(Landroid/support/v4/media/e;J)V

    return v1

    :pswitch_1e
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/support/v4/media/i;->g(Landroid/support/v4/media/e;)V

    return v1

    :pswitch_1f
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/support/v4/media/i;->f(Landroid/support/v4/media/e;)V

    return v1

    :pswitch_20
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/support/v4/media/i;->e(Landroid/support/v4/media/e;)V

    return v1

    :pswitch_21
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/support/v4/media/i;->d(Landroid/support/v4/media/e;)V

    return v1

    :pswitch_22
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/support/v4/media/i;->c(Landroid/support/v4/media/e;)V

    return v1

    :pswitch_23
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/support/v4/media/i;->b(Landroid/support/v4/media/e;)V

    return v1

    :pswitch_24
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p3

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p2

    invoke-virtual {p0, p1, p3, p2}, Landroid/support/v4/media/i;->b(Landroid/support/v4/media/e;II)V

    return v1

    :pswitch_25
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p3

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p2

    invoke-virtual {p0, p1, p3, p2}, Landroid/support/v4/media/i;->a(Landroid/support/v4/media/e;II)V

    return v1

    :pswitch_26
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/support/v4/media/i;->a(Landroid/support/v4/media/e;)V

    return v1

    :pswitch_27
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/f;->a(Landroid/os/IBinder;)Landroid/support/v4/media/e;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Landroid/support/v4/media/i;->a(Landroid/support/v4/media/e;Ljava/lang/String;)V

    return v1

    :cond_18
    const-string p1, "android.support.v4.media.IMediaSession2"

    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
