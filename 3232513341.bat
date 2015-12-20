if %1==0 (
     set arg=set1
) else if %1==1 (
    set arg=set2
)

autohotkey.exe test.ahk %arg%
