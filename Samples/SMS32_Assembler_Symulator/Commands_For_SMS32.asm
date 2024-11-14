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

Inne przydatne instrukcje:

    CLO - Zamyka wszystkie okna

    END - Kończy program