LDmicro0.1
MICRO=Microchip PIC16F887 40-PDIP
CYCLE=200
CRYSTAL=20000000
BAUD=9600
COMPILED=C:\Users\work\Desktop\console project\New folder\hmi console.hex

IO LIST
    Y_RA1 at 3
    Y_RA2 at 4
    Y_RA3 at 5
    Y_RA5 at 7
    Y_RB0 at 33
    Y_RB1 at 34
    Y_RB2 at 35
    Y_RB3 at 36
    Y_RB4 at 37
    Y_RB5 at 38
    Y_RC4 at 23
    Y_RC5 at 24
    Y_RD1 at 19
    Y_RD2 at 21
    Y_RD3 at 22
    Y_RD4 at 27
    Y_RD5 at 28
    Y_RD6 at 29
    Y_RD7 at 30
    Y_RE0 at 8
    Y_RE1 at 9
    Y_RE2 at 10
END

PROGRAM
RUNG
    COMMENT FULLY AUTOMATED RETRO CONSOLE CABNIT BUILD BY OLIVER GREANEY. USE HMI FOR INPUT SELECTON OF CONSOLES. 8x3 RELAY BOARDS USED
END
RUNG
    COMMENT OUTPUTS FOR RELAYS NEGATED DUE TO NEGATIVE SWITCHING RELAYS GOT FROM EBAY (RA0 LOGIC POSITIVE WITH TRANSISTOR FOR 12 SUPPLY TO RELAYS)
END
RUNG
    COMMENT =======================================================================================================================================
END
RUNG
    COMMENT POWER ON SEQUENCE. TURN ON TV,HMI,AV SOURCE SELECTOR (USE INTERNAL RELAY OUTPUTS HERE BECAUSE OFF SEQUENCE AS WELL)
END
RUNG
    TON Tnewpup 2000000
    COIL Rpup 0 0 0
END
RUNG
    TON Tnew0 2400000
    COIL R_M100 0 0 0
END
RUNG
    CONTACTS Rpup 0
    CONTACTS R_M100 1
    PARALLEL
        COIL RR_RE2 0 0 0
        COIL RR_RE1 0 0 0
        COIL RR_RD5 0 0 0
    END
END
RUNG
    COMMENT TV AV SELECT. PRESSES AV BUTTON ON TV REMOTE ONCE ON POWER UP
END
RUNG
    TON Tnewpup2 6000000
    COIL Rpup2 0 0 0
END
RUNG
    TON Tnew100 6200000
    COIL R_M1001 0 0 0
END
RUNG
    CONTACTS Rpup2 0
    CONTACTS R_M1001 1
    COIL RR_RE0 0 0 0
END
RUNG
    COMMENT POWER DOWN SEQUENCE FINISH. TURN OFF TV,HMI,AV SOURCE SELECTOR
END
RUNG
    CONTACTS R_M0 0
    TON Tnew123 400000
    COIL R_OFF 0 0 0
END
RUNG
    CONTACTS R_M0 0
    CONTACTS R_OFF 1
    PARALLEL
        COIL RRR_RE2 0 0 0
        COIL RRR_RE1 0 0 0
        COIL RRR_RD5 0 0 0
    END
END
RUNG
    COMMENT NES            (R_M1 ETC TRIGGERED BY HMI) TURN ON CONSOLE AND TURN ON AV NES BUTTON FOR A SHORT PERIED TO SELLECT CORRECT AV CHANNEL. (RD6 = CONSOLE) (RA0 = AV SOURCE SELECTOR)
END
RUNG
    CONTACTS R_M1 0
    PARALLEL
        COIL Y_RD6 1 0 0
        SERIES
            TON Tnew1 400000
            COIL R_M101 0 0 0
        END
        SERIES
            CONTACTS R_M101 1
            COIL Y_RA1 1 0 0
        END
    END
END
RUNG
    COMMENT SNES
END
RUNG
    CONTACTS R_M2 0
    PARALLEL
        COIL Y_RD7 1 0 0
        SERIES
            TON Tnew2 400000
            COIL R_M102 0 0 0
        END
        SERIES
            CONTACTS R_M102 1
            COIL Y_RD1 1 0 0
        END
    END
END
RUNG
    COMMENT SNES 50/60 HZ MOD
END
RUNG
    CONTACTS R_M3 0
    COIL Y_RB0 1 0 0
END
RUNG
    COMMENT N64 LOCATED ON TV AV2 SO RUNG BELOW CHANGES FROM AV1 TO AV2 AND THEN BACK TO AV1 WHEN FINISHED PLAYING N64
END
RUNG
    CONTACTS R_M4 0
    PARALLEL
        COIL Y_RB1 1 0 0
        SERIES
            TON Tnew3 350000
            COIL R_M103 0 0 0
        END
        SERIES
            CONTACTS R_M103 1
            PARALLEL
                COIL Y_RD2 1 0 0
                COIL RRR_RE0 0 0 0
            END
        END
        SERIES
            TOF Tnew678 800000
            CONTACTS R_M4 1
            COIL R_MAV2 0 0 0
        END
    END
END
RUNG
    CONTACTS R_MAV2 0
    PARALLEL
        SERIES
            TON TnewE1 200000
            COIL R_ME1 0 0 0
        END
        SERIES
            CONTACTS R_ME1 1
            COIL RMR1 0 0 0
        END
        SERIES
            TON TnewE2 600000
            COIL R_ME2 0 0 0
        END
        SERIES
            CONTACTS R_ME2 0
            COIL RMR2 0 0 0
        END
    END
END
RUNG
    COMMENT GAMEBOY / GAMEBOY COLOUR\r\n
END
RUNG
    CONTACTS R_M5 0
    PARALLEL
        COIL Y_RB2 1 0 0
        SERIES
            TON Tnew4 400000
            COIL R_M104 0 0 0
        END
        SERIES
            CONTACTS R_M104 1
            COIL Y_RD3 1 0 0
        END
    END
END
RUNG
    COMMENT GAMEBOY ADVANCE
END
RUNG
    CONTACTS R_M6 0
    PARALLEL
        COIL Y_RB3 1 0 0
        SERIES
            TON Tnew5 400000
            COIL R_M105 0 0 0
        END
        SERIES
            CONTACTS R_M105 1
            COIL Y_RC4 1 0 0
        END
    END
END
RUNG
    COMMENT SEGA MEGA DRIVE
END
RUNG
    CONTACTS R_M7 0
    PARALLEL
        COIL Y_RB4 1 0 0
        SERIES
            TON Tnew6 400000
            COIL R_M106 0 0 0
        END
        SERIES
            CONTACTS R_M106 1
            COIL Y_RC5 1 0 0
        END
    END
END
RUNG
    COMMENT SEGA MASTER SYSTEM
END
RUNG
    CONTACTS R_M8 0
    PARALLEL
        COIL Y_RB5 1 0 0
        SERIES
            TON Tnew7 400000
            COIL R_M107 0 0 0
        END
        SERIES
            CONTACTS R_M107 1
            COIL Y_RD4 1 0 0
        END
    END
END
RUNG
    COMMENT INTERNAL RELAYS SWITCHING OUTPUTS. (RE2 = TV REMOTE POWER) (RE1 = HMI COMPUTER POWER) (RD5 = AV SOURCE SELECTOR) (RE0 = TV REMOTE AV SELECT)
END
RUNG
    PARALLEL
        CONTACTS RR_RE2 0
        CONTACTS RRR_RE2 0
    END
    COIL Y_RE2 1 0 0
END
RUNG
    PARALLEL
        CONTACTS RR_RE1 0
        CONTACTS RRR_RE1 0
    END
    COIL Y_RE1 1 0 0
END
RUNG
    PARALLEL
        CONTACTS RR_RD5 0
        CONTACTS RRR_RD5 0
    END
    COIL Y_RD5 1 0 0
END
RUNG
    PARALLEL
        CONTACTS RR_RE0 0
        CONTACTS RRR_RE0 0
        CONTACTS RMR1 0
        CONTACTS RMR2 0
    END
    COIL Y_RE0 1 0 0
END
RUNG
    COMMENT lighting system (RA5 = NES,SNES,N64) (RA3 = GAMEBOYS) (RA2 = SEGA STUFF)
END
RUNG
    PARALLEL
        CONTACTS R_M1 0
        CONTACTS R_M2 0
        CONTACTS R_M4 0
    END
    COIL Y_RA5 1 0 0
END
RUNG
    PARALLEL
        CONTACTS R_M5 0
        CONTACTS R_M6 0
    END
    COIL Y_RA3 1 0 0
END
RUNG
    PARALLEL
        CONTACTS R_M7 0
        CONTACTS R_M8 0
    END
    COIL Y_RA2 1 0 0
END
RUNG
    COMMENT =======================================================================================================================================
END
RUNG
    COMMENT HMI CODE BELOW (TAKE NUMBERS FROM HMI AND CONVERT THEM TO INTERNAL RELAYS TO CONTROL THE CONSOLES)   (R_M0 TO R_M8)
END
RUNG
    COMMENT LDMicro PLC Framework to Comunicate betwen XEdit\r\n
END
RUNG
    MOVE TEMP PORTD
END
RUNG
    GEQ TEMP 256
    PARALLEL
        SUB TEMP TEMP 256
        COIL R_M8 0 0 0
    END
END
RUNG
    GEQ TEMP 128
    PARALLEL
        SUB TEMP TEMP 128
        COIL R_M7 0 0 0
    END
END
RUNG
    GEQ TEMP 64
    PARALLEL
        SUB TEMP TEMP 64
        COIL R_M6 0 0 0
    END
END
RUNG
    GEQ TEMP 32
    PARALLEL
        SUB TEMP TEMP 32
        COIL R_M5 0 0 0
    END
END
RUNG
    GEQ TEMP 16
    PARALLEL
        SUB TEMP TEMP 16
        COIL R_M4 0 0 0
    END
END
RUNG
    GEQ TEMP 8
    PARALLEL
        SUB TEMP TEMP 8
        COIL R_M3 0 0 0
    END
END
RUNG
    GEQ TEMP 4
    PARALLEL
        SUB TEMP TEMP 4
        COIL R_M2 0 0 0
    END
END
RUNG
    GEQ TEMP 2
    PARALLEL
        SUB TEMP TEMP 2
        COIL R_M1 0 0 0
    END
END
RUNG
    GEQ TEMP 1
    PARALLEL
        SUB TEMP TEMP 1
        COIL R_M0 0 0 0
    END
END
RUNG
    COMMENT Get char in comm port & calculate char count \r\n
END
RUNG
    UART_RECV char
    CTC Crindex 100
END
RUNG
    EQU char '['
    PARALLEL
        MOVE begin 1
        MOVE end 0
        MOVE devadr 0
        MOVE regadr 0
        MOVE comm 0
        MOVE data1 0
        MOVE data2 0
        MOVE data3 0
        MOVE ValueIn 0
    END
END
RUNG
    EQU char ']'
    PARALLEL
        MOVE end 1
        MOVE begin 0
        RES Crindex
    END
END
RUNG
    COMMENT [1;2;?;123]  1(DeviceAddress) 2(RegisterAddress) ?(W FOR WRITE R , FOT READ) 123(Value To Set Register) \r\nCalculate DevAdr,RegAdr,Command,Value
END
RUNG
    EQU begin 1
    PARALLEL
        SERIES
            EQU Crindex 2
            MOVE devadr char
        END
        SERIES
            EQU Crindex 4
            MOVE regadr char
        END
        SERIES
            EQU Crindex 6
            MOVE comm char
        END
        SERIES
            EQU Crindex 8
            PARALLEL
                MOVE data1 char
                SUB data1 data1 '0'
                MOVE ValueIn data1
            END
        END
        SERIES
            EQU Crindex 9
            PARALLEL
                MOVE data2 char
                SUB data2 data2 '0'
                MOVE ValueIn 0
                MUL temp data1 10
                ADD ValueIn ValueIn temp
                ADD ValueIn ValueIn data2
            END
        END
        SERIES
            EQU Crindex 10
            PARALLEL
                MOVE data3 char
                SUB data3 data3 '0'
                MOVE ValueIn 0
                MUL temp data1 100
                MOVE ValueIn temp
                MUL temp data2 10
                ADD ValueIn ValueIn temp
                ADD ValueIn ValueIn data3
            END
        END
    END
END
RUNG
    COMMENT if String in Scada [1;2;R;1]\r\nScada Get information for register2 (OUTPUT)
END
RUNG
    EQU end 1
    EQU devadr '1'
    EQU comm 'R'
    EQU regadr '2'
    FORMATTED_STRING PORTD 10 91 49 59 50 59 87 59 92 51 93
END
RUNG
    COMMENT if String in Scada [1;2;W;10]\r\nScada Set information  register2 = 10 (OUTPUT)
END
RUNG
    EQU end 1
    EQU devadr '1'
    EQU comm 'W'
    EQU regadr '2'
    MOVE PORTD ValueIn
END
RUNG
    MOVE end 0
END
