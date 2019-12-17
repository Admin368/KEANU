@echo %Debug%
call Keanu.location.bat

count=0
BoxOpen("Hello - Press Shift to exit",count)
while 1
   count=count+1
   TimeDelay(1)
   BoxText(count)
   if IsKeyDown(@SHIFT) then break
endwhile
Message("Do Forever exited at",count)