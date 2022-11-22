      org 0000h
start:mov a,#0aah
      mov p2,a
      acall delay
	  mov a,#55h
	  mov p2,a
	  acall delay
     sjmp start
delay:mov r1,#255
here:mov r2,#100
here1:djnz r2,here1
     djnz r1,here
     ret
     end  