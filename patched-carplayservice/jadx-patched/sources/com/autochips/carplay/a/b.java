package com.autochips.carplay.a;

import android.os.Message;
import android.util.Log;
import com.autochips.carplay.CarplayCall;
import com.autochips.carplay.CarplayDevice;
import com.autochips.carplay.common.CarplayMessage;
import java.util.UUID;
import vendor.autochips.hardware.iap.V1_0.CallState;
import vendor.autochips.hardware.iap.V1_0.DatabaseInfo;
import vendor.autochips.hardware.iap.V1_0.IAPDev;
import vendor.autochips.hardware.iap.V1_0.IIAPClient;
import vendor.autochips.hardware.iap.V1_0.LocationEvent;
import vendor.autochips.hardware.iap.V1_0.PlaybackStatus;

/* JADX INFO: loaded from: classes.dex */
final class b extends IIAPClient.Stub {
    final /* synthetic */ a rc;

    private b(a aVar) {
        this.rc = aVar;
    }

    /* synthetic */ b(a aVar, byte b) {
        this(aVar);
    }

    public final void onCallStateUpdate(IAPDev iAPDev, CallState callState) {
        Log.d("IAPClient", "onCallStateUpdate");
        Log.d("IAPClient", "remoteID:" + callState.remoteID);
        Log.d("IAPClient", "displayName:" + callState.displayName);
        Log.d("IAPClient", "status:" + ((int) callState.status));
        Log.d("IAPClient", "direction:" + ((int) callState.direction));
        Log.d("IAPClient", "callUUID:" + callState.callUUID);
        Log.d("IAPClient", "addrBookID:" + callState.addrBookID);
        Log.d("IAPClient", "label:" + callState.label);
        Log.d("IAPClient", "service:" + ((int) callState.service));
        Log.d("IAPClient", "isConferenced:" + ((int) callState.isConferenced));
        Log.d("IAPClient", "conferenceGroup:" + ((int) callState.conferenceGroup));
        Log.d("IAPClient", "disconnectReason:" + ((int) callState.disconnectReason));
        Log.d("IAPClient", "startTimeStamp:" + callState.startTimeStamp);
        CarplayCall carplayCall = new CarplayCall((CarplayDevice) null, callState.remoteID, callState.displayName, callState.status, callState.direction, UUID.fromString(callState.callUUID), callState.addrBookID, callState.label, callState.service, callState.isConferenced == 1, callState.conferenceGroup, callState.disconnectReason, callState.startTimeStamp);
        Log.d("IAPClient", "call:" + carplayCall.toString());
        Message messageObtainMessage = this.rc.obtainMessage(CarplayMessage.IAP2_CALL_STATE_UPDATE);
        messageObtainMessage.obj = carplayCall;
        this.rc.sendMessage(messageObtainMessage);
    }

    public final void onConnectStatusChanged(IAPDev iAPDev, int i) {
        Log.d("IAPClient", "ConnectStatusChanged:" + i);
        Message messageObtainMessage = this.rc.obtainMessage(10);
        messageObtainMessage.arg1 = i;
        messageObtainMessage.arg2 = iAPDev.transportType;
        messageObtainMessage.obj = iAPDev.id;
        this.rc.sendMessage(messageObtainMessage);
    }

    public final void onDatabaseInfoChanged(IAPDev iAPDev, DatabaseInfo databaseInfo) {
    }

    public final void onEapReady(IAPDev iAPDev, boolean z) {
    }

    public final void onLocationStart(IAPDev iAPDev, LocationEvent locationEvent) {
        Log.d("IAPClient", "onLocationStart:" + locationEvent.start);
        Message messageObtainMessage = this.rc.obtainMessage(11);
        messageObtainMessage.arg1 = locationEvent.start ? 1 : 0;
        messageObtainMessage.arg2 = locationEvent.type;
        messageObtainMessage.obj = iAPDev.id;
        this.rc.sendMessage(messageObtainMessage);
    }

    public final void onPlaybackStatusChanged(IAPDev iAPDev, PlaybackStatus playbackStatus) {
    }

    public final void onSamplerateChanged(IAPDev iAPDev, int i) {
    }
}
