#Requires AutoHotkey v2.0.8
#SingleInstance Force
setting := Gui('-MinimizeBox', 'Uni-Color theme adjuster')
setting.MarginX := setting.MarginY := 10
setting.OnEvent('close', (*) => ExitApp())
ma := setting.AddListView('checked r15 c0000cc', ['main'])
ma.SetFont('bold s10', 'calibri')
ma.Modifycol(1, 'center')
loop files '*.css' {
    ma.Add('check', SubStr(A_LoopFileName, 1, -4))
}
ma.OnEvent('Click', (*) => controls())
controls() {
    if (!r := ma.GetNext()) 
        return
    qc.Delete()
    rc := FileRead(ma.GetText(r) '.css')
    sp := 1
    while (lb := InStr(rc, '{',, sp)) && (rb := InStr(rc, '}',, sp)) {
        qn := SubStr(rc, sp, lb - sp)
        qc.Add(, qn)
        sp := rb + 1
    }
}
qc := setting.AddListView('ym checked r15 c008000', ['controls'])
qc.SetFont('bold s10', 'calibri')
qc.Modifycol(1, 'center')
setting.Show()
Return