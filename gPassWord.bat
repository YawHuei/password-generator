@echo off
rem M:n = MaxChars
rem U:n = UpperCase
rem L:n = LowerCase
rem D:n = Digits
rem S:n = Special
rem n = min chars , if n LSS 0 then exclude this pattern , If EQU 0 then unlimited number of characters
rem Other= "exclude characters"

rem F:filename = Append Password to filename

PassWordG.exe M:12 U:1 L:1 D:0 S:-1 "'()*,./;=@[\]^`{|}~" F:tpw.txt
::PassWordG.exe M:12 U:1 L:1 D:1 S:-1