.class public Landroid/net/dhcp/DhcpPacket$ParseException;
.super Ljava/lang/Exception;


# instance fields
.field public final errorCode:I


# direct methods
.method public varargs constructor <init>(ILjava/lang/String;[Ljava/lang/Object;)V
    .locals 0

    invoke-static {p2, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    iput p1, p0, Landroid/net/dhcp/DhcpPacket$ParseException;->errorCode:I

    return-void
.end method
