.class public Lcom/autochips/carplay/common/CarplayMessage;
.super Ljava/lang/Object;


# static fields
.field public static final ACCESSORY_AUDIO_STATE_CHANGED:I = 0x901

.field public static final ACCESSORY_CALL_STATE_CHANGED:I = 0x902

.field public static final ALL_DEVICES_DISCONNECTED:I = 0x46

.field public static final ALL_DEVICES_DISCONNECTED_TIMEOUT:I = 0x47

.field public static final BACKCAR_EVENT_ARM2_EXIT:I = 0x1003

.field public static final BACKCAR_EVENT_ERROR:I = 0x1004

.field public static final BACKCAR_EVENT_START:I = 0x1001

.field public static final BACKCAR_EVENT_STOP:I = 0x1002

.field public static final BASE_ACCESSORY:I = 0x900

.field public static final BASE_BACKCAR_EVENT:I = 0x1000

.field public static final BASE_BLUETOOTH:I = 0x300

.field public static final BASE_CARPLAY_PLUGIN:I = 0x700

.field public static final BASE_IAP2:I = 0x500

.field public static final BASE_NET:I = 0x800

.field public static final BASE_NSD:I = 0x600

.field public static final BASE_USB_NCM:I = 0x200

.field public static final BASE_USER_CMD:I = 0x100

.field public static final BASE_WIFI_AP:I = 0x400

.field public static final BLUETOOTH_ADDRESS:I = 0x30a

.field public static final BLUETOOTH_DISABLED:I = 0x308

.field public static final BLUETOOTH_ENABLED:I = 0x307

.field public static final BLUETOOTH_PROFILE_STATE_CHANGED:I = 0x309

.field public static final BLUETOOTH_STARTED:I = 0x301

.field public static final BLUETOOTH_START_FAILURE:I = 0x303

.field public static final BLUETOOTH_START_TIMEOUT:I = 0x305

.field public static final BLUETOOTH_STOPPED:I = 0x302

.field public static final BLUETOOTH_STOP_FAILURE:I = 0x304

.field public static final BLUETOOTH_STOP_TIMEOUT:I = 0x306

.field public static final CARPLAY_DUCK_AUDIO:I = 0x714

.field public static final CARPLAY_MODE_CHANGED:I = 0x716

.field public static final CARPLAY_PLUGIN_STARTED:I = 0x701

.field public static final CARPLAY_PLUGIN_START_FAILURE:I = 0x703

.field public static final CARPLAY_PLUGIN_START_TIMEOUT:I = 0x705

.field public static final CARPLAY_PLUGIN_STOPPED:I = 0x702

.field public static final CARPLAY_PLUGIN_STOP_FAILURE:I = 0x704

.field public static final CARPLAY_PLUGIN_STOP_TIMEOUT:I = 0x706

.field private static final CARPLAY_PREFIXES:[Ljava/lang/String;

.field public static final CARPLAY_REQUEST_ACCESSORY_UI:I = 0x717

.field public static final CARPLAY_SESSION_CONNECTED:I = 0x70a

.field public static final CARPLAY_SESSION_CONNECT_TIMEOUT:I = 0x70d

.field public static final CARPLAY_SESSION_CONTROL:I = 0x718

.field public static final CARPLAY_SESSION_DISCONNECTED:I = 0x70b

.field public static final CARPLAY_SESSION_DISCONNECT_TIMEOUT:I = 0x70e

.field public static final CARPLAY_SESSION_FAILED:I = 0x70c

.field public static final CARPLAY_STREAM_STATE_CHANGED:I = 0x719

.field public static final CARPLAY_UNDUCK_AUDIO:I = 0x715

.field public static final IAP2_CALL_STATE_UPDATE:I = 0x532

.field public static final IAP2_CONNECT_TIMEOUT:I = 0x528

.field public static final IAP2_DISCONNECT_TIMEOUT:I = 0x529

.field public static final IAP2_OVER_BLUETOOTH_CONNECTED:I = 0x515

.field public static final IAP2_OVER_BLUETOOTH_CONNECTING:I = 0x514

.field public static final IAP2_OVER_BLUETOOTH_CONNECT_FAIL:I = 0x518

.field public static final IAP2_OVER_BLUETOOTH_DISCONNECTED:I = 0x517

.field public static final IAP2_OVER_BLUETOOTH_DISCONNECTING:I = 0x516

.field public static final IAP2_OVER_CARPLAY_CONNECTED:I = 0x51f

.field public static final IAP2_OVER_CARPLAY_CONNECTING:I = 0x51e

.field public static final IAP2_OVER_CARPLAY_CONNECT_FAIL:I = 0x522

.field public static final IAP2_OVER_CARPLAY_DISCONNECTED:I = 0x521

.field public static final IAP2_OVER_CARPLAY_DISCONNECTING:I = 0x520

.field public static final IAP2_OVER_USB_CONNECTED:I = 0x50b

.field public static final IAP2_OVER_USB_CONNECTING:I = 0x50a

.field public static final IAP2_OVER_USB_CONNECT_FAIL:I = 0x50e

.field public static final IAP2_OVER_USB_DISCONNECTED:I = 0x50d

.field public static final IAP2_OVER_USB_DISCONNECTING:I = 0x50c

.field public static final IAP2_STARTED:I = 0x501

.field public static final IAP2_START_FAILURE:I = 0x503

.field public static final IAP2_START_TIMEOUT:I = 0x505

.field public static final IAP2_STOPPED:I = 0x502

.field public static final IAP2_STOP_FAILURE:I = 0x504

.field public static final IAP2_STOP_TIMEOUT:I = 0x506

.field public static final NET_DEVICE_HW_ADDRESS_CHANGED:I = 0x804

.field public static final NET_IFACE_ADD:I = 0x801

.field public static final NET_IFACE_LINK_STATE_CHANGED:I = 0x803

.field public static final NET_IFACE_REMOVE:I = 0x802

.field public static final NSD_STARTED:I = 0x601

.field public static final NSD_START_FAILURE:I = 0x603

.field public static final NSD_START_TIMEOUT:I = 0x605

.field public static final NSD_STOPPED:I = 0x602

.field public static final NSD_STOP_FAILURE:I = 0x604

.field public static final NSD_STOP_TIMEOUT:I = 0x606

.field public static final USB_NCM_STARTED:I = 0x201

.field public static final USB_NCM_START_FAILURE:I = 0x203

.field public static final USB_NCM_START_TIMEOUT:I = 0x205

.field public static final USB_NCM_STOPPED:I = 0x202

.field public static final USB_NCM_STOP_FAILURE:I = 0x204

.field public static final USB_NCM_STOP_TIMEOUT:I = 0x206

.field public static final USER_CHANGE_MODE_REQUEST:I = 0x10a

.field public static final USER_FORCE_KEY_FRAME:I = 0x108

.field public static final USER_REQUEST_DEVICE_UI:I = 0x106

.field public static final USER_REQUEST_SIRI:I = 0x107

.field public static final USER_SELECT_STOP_VIDEO:I = 0x11e

.field public static final USER_SET_AUDIO_ENABLE:I = 0x105

.field public static final USER_SET_LIMIT_UI:I = 0x109

.field public static final USER_SET_NIGHT_MODE:I = 0x10b

.field public static final USER_SET_OEM_ICON_LABEL:I = 0x10e

.field public static final USER_SET_SCREEN_SIZE:I = 0x10d

.field public static final USER_SET_VIDEO_RESOLUTION:I = 0x10c

.field public static final USER_START_VIDEO:I = 0x103

.field public static final USER_STOP_VIDEO:I = 0x104

.field public static final USER_TURN_OFF:I = 0x102

.field public static final USER_TURN_ON:I = 0x101

.field public static final USER_UPDATE_KNOB:I = 0x117

.field public static final USER_UPDATE_MEDIA_BUTTON:I = 0x116

.field public static final USER_UPDATE_TELEPHONY:I = 0x115

.field public static final USER_UPDATE_TOUCH_SCREEN:I = 0x114

.field public static final WIFI_AP_STARTED:I = 0x401

.field public static final WIFI_AP_START_FAILURE:I = 0x403

.field public static final WIFI_AP_START_TIMEOUT:I = 0x405

.field public static final WIFI_AP_STOPPED:I = 0x402

.field public static final WIFI_AP_STOP_FAILURE:I = 0x404

.field public static final WIFI_AP_STOP_TIMEOUT:I = 0x406

.field private static final sMessageClasses:[Ljava/lang/Class;

.field private static final sSmToString:Landroid/util/SparseArray;


# direct methods
.method static constructor <clinit>()V
    .locals 14

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Class;

    const-class v1, Lcom/autochips/carplay/common/CarplayMessage;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sput-object v0, Lcom/autochips/carplay/common/CarplayMessage;->sMessageClasses:[Ljava/lang/Class;

    const-string v3, "USER_"

    const-string v4, "USB_NCM_"

    const-string v5, "BLUETOOTH_"

    const-string v6, "WIFI_AP_"

    const-string v7, "IAP2_"

    const-string v8, "NSD_"

    const-string v9, "CARPLAY_"

    const-string v10, "NET_"

    const-string v11, "ACCESSORY_"

    const-string v12, "ALL_DEVICES_"

    const-string v13, "BACKCAR_EVENT_"

    filled-new-array/range {v3 .. v13}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/autochips/carplay/common/CarplayMessage;->CARPLAY_PREFIXES:[Ljava/lang/String;

    sget-object v0, Lcom/autochips/carplay/common/CarplayMessage;->sMessageClasses:[Ljava/lang/Class;

    sget-object v1, Lcom/autochips/carplay/common/CarplayMessage;->CARPLAY_PREFIXES:[Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/android/internal/util/MessageUtils;->findMessageNames([Ljava/lang/Class;[Ljava/lang/String;)Landroid/util/SparseArray;

    move-result-object v0

    sput-object v0, Lcom/autochips/carplay/common/CarplayMessage;->sSmToString:Landroid/util/SparseArray;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static messageString(I)Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/autochips/carplay/common/CarplayMessage;->sSmToString:Landroid/util/SparseArray;

    invoke-virtual {v0, p0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method
