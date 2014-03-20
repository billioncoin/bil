mkdir "$2/BillionCoin-Qt"
mkdir "$2/BillionCoin-Qt/.background"
cp -R "$2/BillionCoin-Qt.app" "$2/BillionCoin-Qt/BillionCoin-Qt.app"
cp "$1/src/qt/res/images/dmg_bg.png" "$2/BillionCoin-Qt/.background/BillionCoin.png"
ln -s /Applications/ "$2/BillionCoin-Qt/Applications"

hdiutil create -srcfolder "$2/BillionCoin-Qt" -volname "BillionCoin-Qt" -fs HFS+ -fsargs "-c c=64,a=16,e=16" -format UDRW -size 100m "$2/pack.temp.dmg"
device=$(hdiutil attach -readwrite -noverify -noautoopen "$2/pack.temp.dmg" | egrep '^/dev/' | sed 1q | awk '{print $1}')
sleep 15
osascript "$1/src/qt/res/setdmg.scpt"
#chmod -Rf go-w /Volumes/BillionCoin-Qt
#sync
#sync
#hdiutil detach ${device}
hdiutil convert "$2/pack.temp.dmg" -format UDZO -imagekey zlib-level=9 -o "$2/BillionCoin-Qt"
rm -f "$2/pack.temp.dmg"
