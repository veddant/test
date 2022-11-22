     org 0000h
main:clr a
again:mov p1,a
      acall delay
	  inc a
	  cjne a,#0fh,again
	  sjmp main
delay:mov r1,#0ah
      mov tmod,#10h
loop:mov tl1,#0ffh
     mov th1,#0a5h
	 setb tr1
back:jnb tf1,back
     clr tr1
	 clr tf1
	 djnz r1,loop
	 ret 
	 end