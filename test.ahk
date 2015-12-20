; Credit for passing in command line arguments: https://autohotkey.com/board/topic/29726-how-to-close-command-prompt-window-started-by-script/
#Persistent
#SingleInstance force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

CoordMode, Mouse, Screen ; When mouse coords are set, it will be relative to the screen


Loop, %0%  ; For each parameter:
{
    param := %A_Index%  ; Fetch the contents of the variable whose name is contained in A_Index.
	if (param = "set1")
	{
		MouseGetPos, sliderX1, sliderY1
		IniWrite, %sliderX1%, sliderpos.ini, slidersection, X1
		IniWrite, %sliderY1%, sliderpos.ini, slidersection, Y1
	}
	else if (param = "set2")
	{
		MouseGetPos, sliderX2, sliderY2
		IniWrite, %sliderX2%, sliderpos.ini, slidersection, X2
		IniWrite, %sliderY2%, sliderpos.ini, slidersection, Y2
	}
	else
	{
		IniRead, sliderX1, sliderpos.ini, slidersection, X1
		IniRead, sliderY1, sliderpos.ini, slidersection, Y1
		IniRead, sliderX2, sliderpos.ini, slidersection, X2
		IniRead, sliderY2, sliderpos.ini, slidersection, Y2
		paramPercent := param / 255
		xToClick := paramPercent * sliderX1 + ( 1 - paramPercent ) * sliderX2
		yToClick := paramPercent * sliderY1 + ( 1 - paramPercent ) * sliderY2
		MouseClick, left, xToClick, yToClick
	}
}

ExitApp

; https://autohotkey.com/board/topic/7984-ahk-functions-incache-cache-list-of-recent-items/page-3#entry78387
varExist(ByRef v) { ; Requires 1.0.46+
   return &v = &n ? 0 : v = "" ? 2 : 1
}