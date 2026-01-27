E-handel Databasprojekt
Setup & ordning
För att köra projektet, kör scripten i den ordning de är numrerade (01-10). Detta är viktigt för att alla tabeller och relationer ska skapas i rätt ordning innan datan läggs in.

Kort reflektion
Jag har byggt en databas med 6 tabeller som täcker flödet från kund till betalning.

Normalisering: Jag har siktat på 3NF. Den viktigaste delen är kopplingstabellen OrderItems som hanterar många-till-många-relationen mellan order och produkt. Jag bröt även ut kategorier för att slippa dubbellagring av data.

Dataskydd: För att säkra datan har jag använt UNIQUE på mejladresser och CHECK på priser (inga minuspriser) och orderstatus.

Nästa steg: I nästa fas skulle jag vilja lägga till Stored Procedures för att automatisera lagerhanteringen och Views för att enklare få ut försäljningsstatistik.
