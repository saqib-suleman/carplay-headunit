#!/bin/sh
# Head Unit Helper: restart button + call-volume accept/reject service. PLATFORM-signed.
set -e
cd "$(dirname "$0")"
SDK=${ANDROID_HOME:?set ANDROID_HOME}
BT=$(ls -d "$SDK"/build-tools/* | tail -1)
JAR=$(ls -d "$SDK"/platforms/*/android.jar | tail -1)
KEYS="$(cd .. && pwd)/keys"

rm -rf build && mkdir -p build/stubs build/classes build/gen
# compile-only bw.car stubs (real classes load on-device from BwCarProxy.jar)
javac -nowarn -source 8 -target 8 -bootclasspath "$JAR" -d build/stubs $(find stubs -name '*.java')
(cd build/stubs && jar cf ../stubs.jar .)
# resources -> R.java + unsigned.apk
"$BT/aapt2" compile --dir res -o build/res.zip
"$BT/aapt2" link -o build/unsigned.apk -I "$JAR" --manifest AndroidManifest.xml --java build/gen build/res.zip
# app + R.java against android.jar + stubs
javac -nowarn -source 8 -target 8 -bootclasspath "$JAR" -cp build/stubs -d build/classes $(find src build/gen -name '*.java')
"$BT/d8" --min-api 27 --lib "$JAR" --lib build/stubs.jar --output build $(find build/classes -name '*.class')
(cd build && zip -q unsigned.apk classes.dex)
"$BT/zipalign" -f 4 build/unsigned.apk build/aligned.apk
"$BT/apksigner" sign --key "$KEYS/platform.pk8" --cert "$KEYS/platform.x509.pem" --out HeadUnitHelper.apk build/aligned.apk
echo "built $(pwd)/HeadUnitHelper.apk"
