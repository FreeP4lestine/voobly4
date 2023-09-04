#Requires AutoHotkey v2.0

#include <gdip_all>
ptoken := gdip_startup()
plist := Gdip_CreateBitmapFromFile("sprite_sheet_emojione.png")
Gdip_GetImageDimensions(plist, &w, &h)
loop h // 44 {
    pb := Gdip_CloneBitmapArea(plist, 0, (A_Index - 1) * 44, 44, 44)
    Gdip_SaveBitmapToFile(pb, "png\sprite" A_Index ".png", 100)
    Gdip_DisposeImage(pb)
}
Gdip_DisposeImage(plist)
Gdip_Shutdown(ptoken)