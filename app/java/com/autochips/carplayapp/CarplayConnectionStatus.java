package com.autochips.carplayapp;

/** Result of asking the vendor CarPlay stack whether an iPhone is connected. */
enum CarplayConnectionStatus {
    CONNECTED,
    DISCONNECTED,
    /** The vendor call threw, usually because CarPlay is starting or stopping. */
    UNKNOWN
}
