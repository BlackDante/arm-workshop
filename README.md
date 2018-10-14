# Praca Domowa - Tydzień 3

## Treść zadania

TYDZIEN3.1 „Zbuduj prostą konwencję nazewniczą dla min. takich zasobów jak Grupa Zasobów, VNET, Maszyn Wirtualna, Dysk, Konta składowania danych. Pamiętaj o ograniczeniach w nazywaniu zasobów, które występują w Azure”
TYDZIEN3.2 „ Zbuduj prosty ARM Template (możesz wykorzystać już gotowe wzorce z GitHub), który wykorzystuje koncepcję Linked Templates. Template powinien zbudować środowisko złożone z jednej sieci VNET, podzielonej na dwa subnety. W każdy subnecie powinna powstać najprostsza maszyna wirtualna z systemem Ubuntu 18.04 a na każdym subnecie powinny zostać skonfigurowane NSG.”
TYDZIEN3.3 „Zbuduj najprostrzą właśną rolę RBAC, która pozwala użytkownikowi uruchomić maszynę, zatrzymać ją i zgłosić zgłoszenie do supportu przez Portal Azure”
TYDZIEN3.4 „Spróbuj na koniec zmodyfikować template tak, by nazwa użytkownika i hasło do każdej maszyny z pkt. 2 było pobierane z KeyVault.„

## Zadanie 3.1

### Ogólne zasady

- Wszystkie nazwy (projektów, zasobów, prefiksów) piszemy małymi literami
- Wszystkie nazwy muszą być zapisane w języku angielskim
- Kazdy projekt powinien mieć swój własny unikalny prefiks. Prefiks powinien składać się od 2 do 5 liter.

#### Definicja skrótów dla regionów

- North Europe - ne
- West Europe - we
- UK West - ukw
- UK South - uks
- Germany West Central - gwc
- Germany North - gn
- Norway West - now
- Norway East - noe

W przypadku ekspancji na świat, skróty regionów wyglądały by następująco

- East US - eus
- East US2 - eus2
- WestCentral US - wcus *(<3 mój ulubiony :) 

#### Definicja skrótów dla środowisk

- prod - środowisko produkcyjne
- stag - środowisko stagingowe, inaczej zwane pre produkcją
- dev - środowisko developerskie
- test-<x> - środowisko testowe, jezeli jest więcej niz jedno powinno otrzymać suffix z numerem środowiska

#### Zasady nazewnictwa dla zasobów

##### Grupa Zasobów

`<prefix>-rg-<region>-<nazwa>-<env>`

###### Pole: [Nazwa]

- Jest Wymagane
- Powinno mieć długość 3 - 70
- Dozwolone znaki: `/^[a-z0-9_-]{3,70}$/`
- Nazwa powinna opisywać przeznaczenie grupy zasobów

##### Maszyna Wirtualna

`<prefix>-vm-{index}-<nazwa>`

- Maksymalna długość całości
  - Windows: 15 znaków
  - Linux: 64 znaki
- Ograniczenia: 
  - Dozwolone znaki: `/^[a-z0-9-]{1,15}$|^[a-z0-9-]{1,64}$/`

###### Pole: [Index]

- Jest wymagane kiedy w systemie znajduje się więcej niz 1 maszyna o danej nazwie
- Powinno zawierać indeks tworzonej maszyny
- Dozwolone znaki: `/[0-9]{0,2}/`

###### Pole: [Nazwa]

- Jest wymagane
- Powinno opisywać przeznaczenie danej maszyny
- Dozwolone znaki: 
  - Windows: `/[a-z0-9-]{1,7}/`
  - Linux: `/[a-z0-9-]{1,56}/`


##### Wirtualne sieci

`<prefix>-vnet-<nazwa>`

##### Podsieci

##### Karty Sieciowe

