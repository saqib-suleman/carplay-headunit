package com.autochips.carplayapp;

import android.view.MotionEvent;
import android.view.View;

/**
 * Forwards single-finger touches on the video surface to the iPhone, scaled from view pixels to
 * CarPlay video pixels. The head unit's CarPlay stack only accepts one touch point, so the first
 * finger down is tracked until it lifts and any other fingers are ignored.
 */
final class CarplayTouchForwarder implements View.OnTouchListener {

    private final CarplaySession carplaySession;
    private final int videoWidth;
    private final int videoHeight;
    private int trackedPointerId = MotionEvent.INVALID_POINTER_ID;

    CarplayTouchForwarder(CarplaySession carplaySession, int videoWidth, int videoHeight) {
        this.carplaySession = carplaySession;
        this.videoWidth = videoWidth;
        this.videoHeight = videoHeight;
    }

    @Override
    public boolean onTouch(View view, MotionEvent event) {
        if (view.getWidth() == 0 || view.getHeight() == 0) {
            return false;
        }
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                trackedPointerId = event.getPointerId(0);
                sendTrackedPointer(view, event, true);
                return true;
            case MotionEvent.ACTION_MOVE:
                sendTrackedPointer(view, event, true);
                return true;
            case MotionEvent.ACTION_POINTER_UP:
                if (event.getPointerId(event.getActionIndex()) == trackedPointerId) {
                    sendTrackedPointer(view, event, false);
                    trackedPointerId = MotionEvent.INVALID_POINTER_ID;
                }
                return true;
            case MotionEvent.ACTION_UP:
            case MotionEvent.ACTION_CANCEL:
                sendTrackedPointer(view, event, false);
                trackedPointerId = MotionEvent.INVALID_POINTER_ID;
                return true;
            case MotionEvent.ACTION_POINTER_DOWN:
                return true;
            default:
                return false;
        }
    }

    private void sendTrackedPointer(View view, MotionEvent event, boolean isPressed) {
        int pointerIndex = event.findPointerIndex(trackedPointerId);
        if (pointerIndex < 0) {
            return;
        }
        int videoX = toVideoCoordinate(event.getX(pointerIndex), view.getWidth(), videoWidth);
        int videoY = toVideoCoordinate(event.getY(pointerIndex), view.getHeight(), videoHeight);
        carplaySession.sendTouch(isPressed, videoX, videoY);
    }

    private static int toVideoCoordinate(float viewCoordinate, int viewLength, int videoLength) {
        int scaled = Math.round(viewCoordinate * videoLength / viewLength);
        return Math.max(0, Math.min(videoLength - 1, scaled));
    }
}
