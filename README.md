# Baza polskich przemienników krótkofalarskich

## Wstęp

Projekt ma na celu zachowanie społecznie tworzonej bazy polskich przemienników krótkofalarskich wraz z historią zmian.

Istnieje kilka stron, które mają własne bazy przemienników i umożliwiają ich eksport. Na chwilę obecną strony te to:

* https://przemienniki.net/
* https://przemienniki.eu/
* https://mapy73.pl/

Uruchamiany raz na dobę prosty skrypt (*daily.sh*) ściąga aktualne bazy z dwóch pierwszych stron i jeśli są jakieś zmiany, to wypycha je do tego repozytorium.

Baza strony *mapy73.pl* posiada własne repozytorium, które **nie** jest kopiowane tutaj: <https://github.com/Krusz-Beton/przemienniki-mapy73pl/>.

Skrypt *daily.sh* został umieszczony w repozytorium jedynie w celu zapewnienia przejrzystości. Nie jest potrzebny do korzystania z bazy / baz.

## Jakie formaty danych są dostępne?

Dla bazy *przemienniki.net*:

* XML
* CSV dla programu Chirp

Szczegóły: <https://przemienniki.net/export>.

Dla bazy *przemienniki.eu*:

* JSON
* CSV
* CSV dla programu Chirp

Szczegóły: <https://przemienniki.eu/eksport-danych/>.

Oprócz tego, w pliku `old-przemienniki-net.sql` dostępny jest zrzut bazy zgromadzonej przez stronę *przemienniki.net*, wykonany ręcznie 30 stycznia 2025 r., przed przejęciem opieki nad stroną przez PZK. Plik jest w formacie SQL – do zaimportowania np. do MySQL.

Przemienniki z bazy *mapy73.pl* dostępne są w formacie YAML (każdy przemiennik w osobnym pliku).

## Jak mogę zgłosić zmianę w bazie?

Wyłącznie przez wyżej wymienione strony. Tutaj znajduje się jedynie automatycznie wykonywana kopia.

Zmiany w *mapy73.pl* można zgłaszać przez pull requesty do [ich repozytorium](https://github.com/Krusz-Beton/przemienniki-mapy73pl/).

## Jak mogę zgłosić zmianę w tym README?

Najlepiej przez [Issue Tracker](https://github.com/przemienniki/baza-przemiennikow/issues).

## Przejrzałem skrypt, znalazłem błąd! Jak mogę go zgłosić?

Tak samo jak zmianę w README.

## Co jeśli od dawna nie ma zmian w bazie?

Jeśli od dawna nie było zmian, to są dwie możliwości: albo faktycznie nie było zmian, więc nie były tworzone puste commity, albo skrypt z jakiegoś powodu nie działa. Można zajrzeć na stronę <http://przemienniki-status.chmurka.net/>, na której publikowany jest rezultat ostatniego uruchomienia skryptu wraz z datą i godziną. Jeśli data jest dawniejsza niż doba lub w statusie coś jest nie tak, to koniecznie daj mi znać.

## Czy repozytorium jest powiązane ze wspomnianymi stronami?

Nie. Skrypt korzysta z oficjalnego API, udostępnianego przez autorów wyżej wymienionych stron, ale jest tworzony przez inną osobę i pracuje na innej infrastrukturze.

## Tworzę nowy projekt związany z polskimi przemiennikami. Czy mogę wykorzystać te bazy?

Przed skorzystaniem z baz zapoznaj się, proszę, z informacjami podanymi na stronach, z których bazy są pobierane. Przykładowo, zespół *przemienniki.net* [pisze](https://przemienniki.net/export):

> Po pierwsze: co prawda zabraniać sobie możemy, a i tak zrobisz co zechcesz, prosimy, aby bez uzgodnienia z nami, dane te nie były wykorzystywane do tworzenia innych stron WWW bądź aplikacji opartych o HTML. Jesteśmy otwarci na współpracę, ale w takim wypadku wolelibyśmy dowiedzieć się co chcesz zrobić. Może uda Ci się wykorzystać pozostałe rozwiązania z naszej mapy.
> 
> Po drugie: liczymy, że umieścisz w swoim produkcie informację o tym skąd pochodzą dane. Miłe by było pełnoekranowe logo ;-) Ale jak się nie da to wystarczy kilka słów w "about" :-)
> 
> Po trzecie: będziemy wdzięczni mimo wszystko jak napiszesz do nas i powiesz co zrobisz z tymi danymi i co-nieco opowiesz o swoim pomyśle. Może i my dorzucimy trzy grosze?

Jeśli chodzi o to, co ja stworzyłem (czyli w zasadzie tylko skrypt *daily.sh*), to śmiało możesz brać bez pytania.

## Tworzę nowy projekt związany z polskimi przemiennikami. Czy mogę hostować repozytorium w projekcie „przemienniki” na GitHubie?

Jasne. Daj mi znać.

## Kto za tym stoi?

Stronę <https://przemienniki.net/> przejął i rozwija zespół związany z Polskim Związkiem Krótkofalowców.

Stronę <https://przemienniki.eu/> stworzył i rozwija [Wojtek SQ8W](http://qrz.com/db/sq8w).

Strona <https://mapy73.pl/> owiana jest tajemnicą…

Repozytorium na GitHub stworzył i utrzymuje [Adam SP5GOF](http://qrz.com/db/sp5gof).
