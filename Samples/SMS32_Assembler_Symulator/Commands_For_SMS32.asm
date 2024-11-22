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
        RET
    label:
        MOV AL, 3
        CALL 30
    END
    ---

Komórki wyświetlacza VDU (konsoli) [64 bity]:
    C0 - pierwszy znak
    C1 - drugi znak
    C2 - trzeci znak
    ...
    FF - ostatni znak

Wyświetlanie na wyświetlaczu VDU:
    MOV CL, C0 - Ustawia adres CL na adres C0 (CL staje się tym samym co C0) 
    MOV [CL], AL - Wpisuje znak AL do wartości CL

Inne przydatne instrukcje:

    CLO - Zamyka wszystkie okna

    END - Kończy program