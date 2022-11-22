org 0000h
clr a
     mov a,#01h
main:	  rl a
	 mov p1,a
	


mov tmod,#10h
loop:mov tl1,#0ffh
     mov th1,#0a5h
	 setb tr1
back:jnb tf1,back
     clr tr1
	 clr tf1
	
	 sjmp main
	  end