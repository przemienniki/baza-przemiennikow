# Baza polskich przemienników krótkofalarskich

## Wstęp

W związku z powstaniem i rozwojem strony <https://przemienniki.eu/> powstał pomysł przechowywania bazy przemienników w ogólnodostępnym repozytorium GitHub. Wybór padł na prosty do zapamiętania adres:

<https://github.com/przemienniki/baza-przemiennikow/>

Uruchamiany raz na dobę prosty skrypt (*daily.sh*) ściąga aktualną bazę ze wspomnianej strony i jeśli są jakieś zmiany, to wypycha je do tego repozytorium.

Celem jest zachowanie gromadzonej społecznie wiedzy oraz historii zmian.

Skrypt został umieszczony w repozytorium jedynie w celu zapewnienia przejrzystości. Nie jest potrzebny do korzystania z bazy.

## Jak mogę zgłosić zmianę w bazie?

Wyłącznie przez stronę <https://przemienniki.eu/>. Tak długo, jak strona jest funkcjonalna, nie chcemy tworzyć kopii bazy (choć oczywiście nic nie stoi na przeszkodzie, żeby ktoś sobie sforkował repozytorium i używał go tak, jak uważa za stosowne). Oficjalna baza znajduje się na stronie *przemienniki.eu*. Tutaj znajduje się jedynie kopia.

Jeśli autor strony *przemienniki.eu* kiedykolwiek porzuci projekt, to oczywiście będzie można zgłaszać zmiany poprzez Pull Request do tego repozytorium, ale najlepiej, gdyby nie porzucił :)

## Jak mogę zgłosić zmianę w README?

Przez pull request albo issue tracker na GitHubie.

## Przejrzałem skrypt, zawiera błąd! Jak mogę go zgłosić?

Tak samo jak zmianę w README.

## Co jeśli od dawna nie ma zmian w bazie?

Jeśli od dawna nie było zmian, to są dwie możliwości: albo faktycznie nie było zmian, więc nie były tworzone puste commity, albo skrypt z jakiegoś powodu nie działa. Można zajrzeć na stronę <http://przemienniki-status.chmurka.net/>, na której publikowany jest rezultat ostatniego uruchomienia skryptu wraz z datą i godziną. Jeśli data jest dawniejsza niż doba lub w statusie coś jest nie tak, to koniecznie daj mi znać.

## Czy repozytorium jest powiązane ze stroną przemienniki.eu?

Nie, choć autor (SQ8W) wie o jego istnieniu. Skrypt korzysta z oficjalnego API, udostępnianego przez stronę *przemienniki.eu*, ale jest tworzony przez inną osobę i pracuje na innej infrastrukturze. Autor *przemienniki.eu* nie ma z tym repozytorium nic wspólnego.

## Tworzę nowy projekt związany z polskimi przemiennikami. Czy mogę hostować repozytorium w projekcie „przemienniki” na GitHubie?

Jasne. Daj mi znać.

## Kto za tym stoi?

[SP5GOF](http://qrz.com/db/sp5gof)
