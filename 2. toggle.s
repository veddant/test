
A)TOGGLE LED(without interrupt)

CODE:


   org 0000h
mov TMOD,#01h		;timer 0, mode 1
here:mov TL0,#0ffh	; delay 20ms
     mov TH0,#00h	 ;delay 20ms
     acall delay
     sjmp here
delay: setb TR0		  ;start timer
back: jnb TF0,back	  ;monitor timer overflow flag 
      cpl p2.0		  ;complement led at p2.0
      clr TF0		  ;clear timer overflow flag
      clr TR0		   ;stop timer
      ret
end