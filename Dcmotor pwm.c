
/*      Calculations
 * Fosc = 20MHz
 *
 * PWM Period = [(PR2) + 1] * 4 * TMR2 Prescale Value / Fosc
 * PWM Period = 200us
 * TMR2 Prescale = 4
 * Hence, PR2 =  249 or 0xF9
 *
 * Duty Cycle = 10% of 200us
 * Duty Cycle = 20us
 * Duty Cycle = (CCPR1L:CCP1CON<5:4>) * TMR2 Prescale Value / Fosc
 * CCP1CON<5:4> = <1:1>
 * Hence, CCPR1L = 24 or 0x18
 */


#include<p18f4550.h>

void delay(unsigned int time)
{
    unsigned int i,j;
    for(i=0;i<time;i++)
        for(j=0;j<3000;j++);
}

void main(void)
{
    TRISCbits.TRISC2    = 0;            //CCP1 pin as output
    T2CON   =   0b00000001;             //Prescalar = 4; Timer2 OFF
    PR2     =   0xF9;                   //Period Register
    CCP1CON  =   0b00111100;            //Select PWM mode; Duty cycle LSB CCP1CON<4:5> = <1:1>
    CCPR1L   =   0x18;                  //Duty cycle 10%
    TMR2ON = 1;                         //Timer2 ON

    while(1)                           //Loop forever
    {
        CCPR1L = 0x18;			//10% Duty Cycle
        delay(1000);
        CCPR1L = 0x18 * 4;			//40%
        delay(1000);
        CCPR1L = 0x18 * 6;			//60%
        delay(1000);
        CCPR1L = 0x18 * 9;			//90%
        delay(1000);
    }
}



