#Requires AutoHotkey v2.0

#include <gdip_all>

emojs := fileopen("flags.html", "r")
while !emojs.AtEOF {
    if p := instr(l := emojs.readline(), "src") {
        lnk := substr(l, 26, - 1)
        l := emojs.readline()
        sn := substr(l, 38, - 12)
        tooltip("downloading " sn "...")
        try {
            If !fileexist("png\" sn ".png")
                download(lnk, "png\" sn ".png")
        }
    }
}