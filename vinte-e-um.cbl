  IDENTIFICATION DIVISION.
        PROGRAM-ID.     VINTE-E-UM.
        AUTHOR.         Marshallowitz.
        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01  PLAYER-TOTAL            PIC 9(2)    VALUE 0.
        01  HIT-OR-STAY             PIC X       VALUE "N".
        01  RANDOM-VALUE            PIC 9(2).
        01  RANDOM-SEED             PIC 9(8).
        
        PROCEDURE DIVISION.
        PROGRAM-BEGIN.
      * SEED RANDOM
            MOVE FUNCTION CURRENT-DATE(9:8) TO RANDOM-SEED.
            COMPUTE RANDOM-VALUE = FUNCTION RANDOM(RANDOM-SEED).
            DISPLAY RANDOM-SEED.
            DISPLAY "TRUCO É MAIS DIVERTIDO, MAS AQUI É VINTE-E-UM, PARCEIRA!".
            PERFORM PLAY-GAME UNTIL HIT-OR-STAY = 'S'.
            DISPLAY "TU TERMINOU O JOGO COM: ", PLAYER-TOTAL.
        PROGRAM-DONE.
            STOP RUN.
        PLAY-GAME.
            IF PLAYER-TOTAL < 21
                DISPLAY "TU TÁ NA MÃO DE: " WITH NO ADVANCING
                DISPLAY PLAYER-TOTAL
                DISPLAY "VAI QUERER CONTINUAR OU JÁ TÁ BOM? (V/T): " WITH NO ADVANCING
                ACCEPT HIT-OR-STAY
                IF HIT-OR-STAY = "V" OR HIT-OR-STAY = "T"
                    IF HIT-OR-STAY = "V"
                        PERFORM HIT-DECK
                    END-IF
                ELSE
                    DISPLAY 'NÃO DÁ. APERTE ENTER.'
      -             " V or T " WITH NO ADVANCING
                END-IF
            ELSE
                IF PLAYER-TOTAL = 21
                    DISPLAY "VINTE-E-UM!"
                    DISPLAY "BORA PAGAR UM GORÓ PRA TODO MUNDO!"
                ELSE
                    DISPLAY "MANO, DEU RUIM!"
                END-IF
                MOVE 'T' TO HIT-OR-STAY
            END-IF.
        HIT-DECK.
            COMPUTE RANDOM-VALUE = FUNCTION RANDOM() * 12.
            COMPUTE RANDOM-VALUE = FUNCTION MOD(RANDOM-VALUE, 12).
            ADD 1 TO RANDOM-VALUE.
            ADD RANDOM-VALUE TO PLAYER-TOTAL.
            DISPLAY "TU PEGOU UMA CARTA DE: ", RANDOM-VALUE.
