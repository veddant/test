
#include<P18F4550.h>

void delay()
{
	unsigned int i;
	for(i=0;i<30000;i++);
}

void main()
{
    unsigned char i, key = 0;

    TRISB = 0x00;                        //LED pins as output
    PORTB = 0x00;

    TRISDbits.TRISD0 = 1;                   //set RD0 as input
    TRISDbits.TRISD1 = 1;                   //set RD1 as input

    TRISDbits.TRISD2 = 0;       //set buzzer pin RD2 as output
    TRISAbits.TRISA4 = 0;        //set relay pin RA4 as output

    while(1)
    {

        if(PORTDbits.RD0 == 0) key =0;   //If button1 pressed
        if(PORTDbits.RD1 == 0) key =1;    //If button2 pressed

        if(key == 0)
        {
            PORTAbits.RA4 = 1;             //Relay OFF
            PORTDbits.RD2 = 0;             //Buzzer OFF
            for(i=0;i<8;i++)         //Chase LED right to left
            {
                PORTB = 1<<i;
                delay();
                PORTB = 0x00;
                delay();
            }
        }
        if(key == 1)
        {
            PORTAbits.RA4 = 0;             //Relay ON
            PORTDbits.RD2 = 1;             //Buzzer ON
            for(i=7;i> 0;i--)               //Chase LED left to right
            {
                PORTB = 1<<i;
                delay();
                PORTB = 0x00;
                delay();
            }
        }

    }
}
