@echo off
rem M:n = MaxChars
rem U:n = UpperCase At least
rem L:n = LowerCasea At least
rem D:n = Digits At least
rem S:n = Special At least
rem A:n = avoid consecutive letters = 1 or 0
rem n = min chars , if n LSS 0 then exclude this pattern , If EQU 0 then unlimited number of characters
rem Other= "exclude characters"

rem F:filename = Append Password to filename

PassWordG_%PROCESSOR_ARCHITECTURE%.exe M:12 U:1 L:1 D:1 S:-1 "'()*,./;=@[\]^`{|}~" F:tpw.txt
rem "'()*,./;=@[\]^`{|}~" F:tpw.txt
