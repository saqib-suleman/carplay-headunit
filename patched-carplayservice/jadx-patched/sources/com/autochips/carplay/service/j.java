package com.autochips.carplay.service;

/* JADX INFO: loaded from: classes.dex */
final class j {
    public final int id;
    public String name;
    public boolean tQ;
    public boolean tR;
    public final int type;

    j(int i, int i2) {
        this.id = i;
        this.type = i2;
    }

    public final String toString() {
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append("Iface:{Name=");
        stringBuffer.append(this.name);
        stringBuffer.append(",Id=");
        stringBuffer.append(this.id);
        stringBuffer.append(",Type=");
        stringBuffer.append(this.type == 0 ? "USB" : "WIFI_AP");
        stringBuffer.append("}");
        return stringBuffer.toString();
    }
}
