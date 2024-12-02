﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance, Force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

F1::
    run, explorer.exe Shell:::{2559a1f3-21d7-11d4-bdaf-00c04f60b9f0}
return

F3::
    right_now := A_Now

    FormatTime, date1, % right_now, yyyy
    FormatTime, date2, % right_now, MM
    FormatTime, date3, % right_now, dd
    MsgBox, 4, For Work?, Is this a work item? Select YES for WORK.
    InputBox, folder1, Folder Name?, What's the folder name?
    ifMsgBox, Yes
    {
        folder1 := folder_clean(folder1)
        folder2 := "C:\Users\dompa\OneDrive - State of Alaska\Log\" date1 "." date2 "." date3 " - " folder1
    }
    ifMsgBox, No
    {
        folder1 := folder_clean(folder1)
        folder2 := "C:\METACOGNITION\LOG\" date1 "." date2 "." date3 " - " folder1
    }

    if folder1 =
        return

    FileCreateDir, % folder2
    run, explorer.exe "%folder2%"
    Clipboard := folder2
    Clipboard := folder2 "\"
return


:*:frm::
from_outlook() {
    ;Send, ^!z - subfolders
    Send, ^e
    Send, from:"*"{LEFT}{LEFT}
}

:*:gfrm::
from_gmail() {
    ;Send, ^!z - subfolders
    Send, in:inbox from:
}
:*:==ktn::
known_traveler_number() {

    Send, TT13QZKTK
}

:*:==tod::
date_stamp() {
    ;Send, ^!z - subfolders
    right_now := A_Now
    FormatTime, type_this, % right_now, yyyy
    Send, %type_this%.
    FormatTime, type_this, % right_now, MM
    Send, %type_this%.
    FormatTime, type_this, % right_now, dd
    Send, %type_this%
}

; For Searching in outlook, just type "frm" then type persons name.
:*:fme::
from__me_outlook() {
    ;Send, ^!z - subfolders
    Send, ^e
    Send, from:"Pannone, Dom*" to:"*"{LEFT}{LEFT}
}



; ==== DOT&PF conference room ====
:*:conferenceroom::Conf-JNU 3Mile
:*:confroom::Conf-JNU 3Mile

:*:==abs::
fund_codes() {
this_msg=
(
Expediture Lines:
 1000 Personal Services
 2000 Travel
 3000 Services
 4000 Commodities
 5000 Capital Outlay
 7000 Grants, Benefits
 8000 Miscellaneous
 
Reports:
 Export Component Detail (1512)
 Export Project Summary (UGF/DGF/Other/Fed) (1328)
 Export Project Information (Appropriations with Allocations) (272)
 Export (1791)
 Report Change Record Detail with Description (1839) 
)
msgbox % this_msg
}

folder_clean(var)
{
   chars = \/:*?"<>|
   loop, parse, chars,
      stringreplace,var,var,%A_loopfield%,,a
   return var
}
