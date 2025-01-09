Rejestry:
    AL / BL / CL / DL - Przeznaczenia ogólnego
    SR - Flagi (Z, S, O, I)
    IP - Adres instrukcji, która będzie wykonywwana lub jest aktualnie wykonywwana
    SP - Adres kolejnego wolnego miejsca na stosie

Flagi:
    Z - Zero 
    S - Znak minusowy (ujemna)
    O - Przepełnienie
    I - Przerwanie

Instrukcje podstawowe:

    MOV AL,0 - Przenoszenie wartości do rejestru 

    ADD AL,1 - Dodaje do rejestru
    SUB AL,1 - Odejmuje od rejestru
    MUL AL,1 - Mnoży i przechowuje w rejestrze
    DIV AL,1 - Dzieli i przechowuje w rejestrze
    MOD AL,1 - Ustawia na resztę z dzielenia w rejestrze

    INC AL - Zwiększa o 1 rejestr
    DEC AL - Zmniejsza o 1 rejestr

    CMP AL,3 - Porównuje rejestr do liczby i ustawia flagi
                Z - jeżeli równe
                S - jeżeli wartość rejestru jest mniejsza (AL<3)

Instrukcje stosu:

    PUSH AL - Kopiuje z rejestru na stos
    POP AL  - Zdejmuje wartość ze stosu

    PUSHF - Kopiuje flagi na stos
    POPF - Zdejmuje wartość flagi ze stosu

Instrukcje skoku (pętle itd):

    label:    - Etykieta o nazwie label

    JMP label - Skok bezwarunkowy

    JZ label  - Skok jeśli zero 
    JNZ label - Skok jeśli różne od zera

    JS label  - Skok jeśli ujemna
    JNS label - Skok jeśli nie ujemna

    JO label  - Skok jeśli przepełniene
    JNO label - Skok jeśli nie przepełnione

Tablica (szablon kodu):

    JMP start - poczatek tablicy (pomija wykonanie niedozwolonej operacji)
    DB 1      - wartość 1
    DB 2      - wartość 2
    DB FF     - wartość 3
    start:    - koniec tablicy

Procedura (szablon kodu):

    ORG A   - Procedura o adresie A
    RET     - Powraca do CALL / Kończy procedurę

    CALL A  - Przejście do procedury

    PRZYKŁAD:
    ---
    JMP label
        DB 1
        DB FF
        ORG 30
            ; kod
        RET ; Powrót z procedury (skok na następny adres po CALL)
    label:
        MOV AL, 3
        CALL 30
    END
    ---

Przerwanie programowe (szablon kodu):

    ORG 03 ;  - Przerwanie programowe
      DB 4B ; - Wywołanie przerwania o numerze 03 jako procedura pod adresem 4B

    ORG 4B ;  - Procedura przerwania programowego o adresie 4B
      ;(kod [przerwania])
      IRET ;  - Powrót z przerwania programowego (Interruption Return)

    INT 03 - Wywołanie przerwania o numerze 03

Przerwania sprzętowe:

    DB 10 - Wektor przerwania zegara (Przerwanie 02)
    DB 00 - Wektor przerwania klawiatury (Przerwanie 03)
    DB 20 - Wektor przerwania klawiatury numerycznej (Przerwanie 04)

    NOP - nic nie robi (not operation)

    CLI - Czyści flagę I na 0 czyli wyłącza przerwania

    STI - Ustawia flagę I na 1 czyli włącza przerwania

    PUSHF - ODKŁADA Z FLAGAMI NA STOS

Przerwanie sprzętowe (szablon kodu):

    JMP start ; - Skok za tablice wektorow przerwań

    DB 10 ; - Wektor przerwania zegara
    DB 00 ; - Wektor przerwania klawiatury (nieuzywany)
    DB 20 ; - Wektor przerwania klawiatury numerycznej


    ORG 10
     CLI ; - Wyłączenie przerwań
      PUSH AL
       PUSHF
        ;kod przerwana
       POPF
      POP AL
     STI ; - Włączenie przerwań
    IRET

    start:
    STI ; Włączenie przerwań
     ;kod programu
    END


Komórki wyświetlacza VDU (konsoli) [64 bity]:
    C0 - pierwszy znak
    C1 - drugi znak
    C2 - trzeci znak
    ...
    FF - ostatni znak

Wyświetlanie na wyświetlaczu VDU:
    MOV CL, C0   - Ustawia adres CL na adres C0 (CL staje się tym samym co C0) 
    MOV [CL], AL - Wpisuje znak AL do wartości CL


Urządzenia wyjścia i wejścia:
    OUT 01 - Przesyła dane z rejestru AL na urządzenie nr 01
    IN 01 - Przesyła dane z urządzenia nr 01 do rejestru AL

Urządzenia (lista):
    00 - Dane z klawiatury
    01 - Światła drogowe
    02 - Wyświetlacz siedmiosegmentowy
    03 - Grzałka i termostat
    04 - Labirynt
    05 - Silnik krokowy
    06 - Winda
    07 - Klawiatura
    08 - Klawiatura numeryczna

Światła drogowe: 
    ([A,B,C,D; E,F,G,H] W szesnastkowym: [Y; Z])
    128bit-C1, 64bit-Ż1, 32bit-Z1, 16bit-C2; 8bit-Ż2, 4bit-Z2, 2bit-X, 1bit-X

Wyświetlacz siedmiosegmentowy:

    Pierwszy bit (1):
        0 - Lewy wyświetlacz
        1 - Prawy wyświetlacz

    Drugi bit (2)   - Prawa górna krawędź
    Drugi bit (4)   - Środkowa krawędź
    Drugi bit (8)   - Prawa dolna krawędź
    Drugi bit (16)  - Dolna krawędź
    Drugi bit (32)  - Lewa dolna krawędź
    Drugi bit (64)  - Lewa górna krawędź
    Drugi bit (128) - Górna krawędź
    
    PRZYKŁADY:
    ---
    MOV AL, 0 OUT 02 - Wyzerowanie lewego
    MOV AL, 1 OUT 02 - Wyzerowanie prawego
    ---

    MOV AL, FA OUT 01 ; Ustawia wyświetlacz siedmiosegmentowy (lewy) na 0 
    MOV AL, 0A OUT 01 ; Ustawia wyświetlacz siedmiosegmentowy (lewy) na 1
    MOV AL, B6 OUT 01 ; Ustawia wyświetlacz siedmiosegmentowy (lewy) na 2
    MOV AL, 9E OUT 01 ; Ustawia wyświetlacz siedmiosegmentowy (lewy) na 3
    MOV AL, 4E OUT 01 ; Ustawia wyświetlacz siedmiosegmentowy (lewy) na 4
    MOV AL, DC OUT 01 ; Ustawia wyświetlacz siedmiosegmentowy (lewy) na 5
    MOV AL, FC OUT 01 ; Ustawia wyświetlacz siedmiosegmentowy (lewy) na 6 
    MOV AL, 8A OUT 01 ; Ustawia wyświetlacz siedmiosegmentowy (lewy) na 7
    MOV AL, FE OUT 01 ; Ustawia wyświetlacz siedmiosegmentowy (lewy) na 8
    MOV AL, DE OUT 01 ; Ustawia wyświetlacz siedmiosegmentowy (lewy) na 9

    MOV AL, FB OUT 02 ; Ustawia wyświetlacz siedmiosegmentowy (prawy) na 0
    MOV AL, 0B OUT 02 ; Ustawia wyświetlacz siedmiosegmentowy (prawy) na 1
    MOV AL, B7 OUT 02 ; Ustawia wyświetlacz siedmiosegmentowy (prawy) na 2
    MOV AL, 9F OUT 02 ; Ustawia wyświetlacz siedmiosegmentowy (prawy) na 3
    MOV AL, 4F OUT 02 ; Ustawia wyświetlacz siedmiosegmentowy (prawy) na 4
    MOV AL, DD OUT 02 ; Ustawia wyświetlacz siedmiosegmentowy (prawy) na 5
    MOV AL, FD OUT 02 ; Ustawia wyświetlacz siedmiosegmentowy (prawy) na 6 
    MOV AL, 8B OUT 02 ; Ustawia wyświetlacz siedmiosegmentowy (prawy) na 7
    MOV AL, FF OUT 02 ; Ustawia wyświetlacz siedmiosegmentowy (prawy) na 8
    MOV AL, DF OUT 02 ; Ustawia wyświetlacz siedmiosegmentowy (prawy) na 9

    ---

Grzałka i termostat (automatyczna kontrola temperatury w normie - PRZYKŁAD kodu):

    MOV AL, 0
    OUT 03

    PETLA:
    IN 03
    AND AL, 1
    JZ HOT
    JNZ COLD

    COLD: ; Schładzanie
    MOV AL, 00
    OUT 03
    JMP PETLA

    HOT: ; Ogrzewanie
    MOV AL, 80
    OUT 03
    JMP PETLA

    END

Labirynt:

    Bity:
        4 najmniej znaczące     - Dystans
        4 najbardziej znaczące  - Kierunek
        
    Kierunek (wartości):
        8 - Góra
        4 - Dół
        2 - Lewo
        1 - Prawo

Silnik krokowy:
    Magnesy krokowe 8, 4, 2, 1

Dane z klawiatury:

    IN 00 - Czekaj na naciśnięcie klawisza i zapisz jego kod (ASCI) w AL

    CMP AL, 0D - Sprawdź czy wpisanym klawiszem był enter (0D hex)

Inne przydatne instrukcje:

    CLO - Zamyka wszystkie okna

    END - Kończy program
