# Baza polskich przemienników krótkofalarskich

## Wstęp

W związku z powstaniem i rozwojem strony <https://przemienniki.eu/> powstał pomysł przechowywania bazy przemienników w ogólnodostępnym repozytorium GitHub. Wybór padł na prosty do zapamiętania adres:

<https://github.com/przemienniki/baza-przemiennikow/>

Uruchamiany raz na dobę prosty skrypt (*daily.sh*) ściąga aktualną bazę z strony *przemienniki.eu* i jeśli są jakieś zmiany, to wypycha je do tego repozytorium.

Celem jest zachowanie gromadzonej społecznie wiedzy oraz historii zmian.

Skrypt został umieszczony w repozytorium jedynie w celu zapewnienia przejrzystości. Nie jest potrzebny do korzystania z bazy.

## Jakie formaty danych są dostępne?

JSON, CSV i CSV dla programu Chirp. Szczegóły: <https://przemienniki.eu/eksport-danych/>.

Oprócz tego, w pliku `przemienniki.net.sql` dostępny jest zrzut bazy zgromadzonej przez stronę *przemienniki.net*, wykonany ręcznie 30 stycznia 2025 r. Plik jest w formacie SQL – do zaimportowania np. do MySQL.

## Jak mogę zgłosić zmianę w bazie?

Wyłącznie przez stronę <https://przemienniki.eu/>. Tak długo, jak strona jest funkcjonalna, nie chcemy tworzyć kopii bazy (choć oczywiście nic nie stoi na przeszkodzie, żeby ktoś sobie sforkował repozytorium i używał go tak, jak uważa za stosowne). Oficjalna baza znajduje się na stronie *przemienniki.eu*. Tutaj znajduje się jedynie kopia.

Jeśli autor strony *przemienniki.eu* kiedykolwiek porzuci projekt, to oczywiście będzie można zgłaszać zmiany poprzez PR do repozytorium (lub w inny sposób), ale najlepiej, gdyby nie porzucił :)

## Jak mogę zgłosić zmianę w tym README?

Najlepiej przez [Issue Tracker](https://github.com/przemienniki/baza-przemiennikow/issues).

## Przejrzałem skrypt, znalazłem błąd! Jak mogę go zgłosić?

Tak samo jak zmianę w README.

## Co jeśli od dawna nie ma zmian w bazie?

Jeśli od dawna nie było zmian, to są dwie możliwości: albo faktycznie nie było zmian, więc nie były tworzone puste commity, albo skrypt z jakiegoś powodu nie działa. Można zajrzeć na stronę <http://przemienniki-status.chmurka.net/>, na której publikowany jest rezultat ostatniego uruchomienia skryptu wraz z datą i godziną. Jeśli data jest dawniejsza niż doba lub w statusie coś jest nie tak, to koniecznie daj mi znać.

## Czy repozytorium jest powiązane ze stroną przemienniki.eu?

Nie, choć autor wie o jego istnieniu. Skrypt korzysta z oficjalnego API, udostępnianego przez stronę *przemienniki.eu*, ale jest tworzony przez inną osobę i pracuje na innej infrastrukturze. Autor *przemienniki.eu* nie ma z tym repozytorium nic wspólnego.

## Tworzę nowy projekt związany z polskimi przemiennikami. Czy mogę hostować repozytorium w projekcie „przemienniki” na GitHubie?

Jasne. Daj mi znać.

## Kto za tym stoi?

Stronę <https://przemienniki.eu/> stworzył i rozwija [Wojtek SQ8W](http://qrz.com/db/sq8w).

Repozytorium na GitHub stworzył i utrzymuje [Adam SP5GOF](http://qrz.com/db/sp5gof).
