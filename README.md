Stored procedues:

Tabel	Create	Read	Update	Delete	Kommentar
User	✅	✅	✅	✅	Centrale CRUD tjek
Account	✅	✅	✅	✅	Bruges aktivt tjek
Transaction	✅	✅	⚠️	⚠️	Typisk kun Create/Read
Category	⚙️	✅	⚙️	⚙️	Afhænger af om brugeren må ændre
Budget	✅	✅	✅	✅	Typisk dynamisk tjek
Goal	✅	✅	✅	✅	Bruges til opsparing/mål tjek


indexes:
Et index i en database fungerer lidt som et indholdsregister i en bog.
Uden et indeks skal databasen læse hele tabellen for at finde det, du søger (ligesom at bladre igennem hver side i bogen).
Med et indeks kan databasen springe direkte til den relevante række (som at slå op i bogens register).

hvordan et virker:
Et indeks er en speciel datastruktur (oftest et B-tree eller hash), som databasen automatisk vedligeholder.
Når du opretter et indeks på en kolonne:


Forestil dig tabellen User har 1.000.000 brugere.

Uden index:
SELECT * FROM User WHERE email = 'markgonnielsen@gmail.com';


➡️ Databasen tjekker alle 1.000.000 rækker, én ad gangen.
(Tidsforbrug vokser lineært med antallet af brugere.)

Med index på email:

CREATE INDEX idx_user_email ON User(email);

➡️ Databasen bruger indekset til at slå værdien op på få millisekunder.
(Selv med millioner af rækker.)

| Uden index                | Med index                     |
| ------------------------- | ----------------------------- |
| Søgning er langsom        | Søgning er hurtig             |
| Kræver fuld tabelscanning | Finder data via peger         |
| Hurtigere inserts         | Langsommere inserts (lidt)    |
| Simpelt at vedligeholde   | Kræver lidt ekstra hukommelse |
