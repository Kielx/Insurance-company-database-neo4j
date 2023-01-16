//1. Zapytanie zwracające wszystkich klientów z danego województwa - ich imion i nazwisk
MATCH (c:Client)-[:Z_WOJEWODZTWA]->(r:Region)
WHERE r.region_name = "Lodz (Lodzkie)"
RETURN c.first_name, c.last_name;

//2. Zapytanie zwracające wszystkie oddziały z Opola wraz z relacją w celu łatwej wizualizacji
MATCH (b:Branch)-[:Z_MIASTA]->(c:City)
WHERE c.city_name = "Bydgoszcz"
RETURN b, c;

//3. Zapytanie zwracające imiona i nazwiska wszystkich klientów detalicznych
MATCH (c:Client)-[:TYPU]->(ct:ClientType)
WHERE ct.clientType_name = "retail"
RETURN c.first_name, c.last_name;

//4. Zapytanie zwracające całkowitą liczbę klientów określonego rodzaju (tu klienci detaliczni)
MATCH (c:Client)-[:TYPU]->(ct:ClientType)
WHERE ct.clientType_name = "retail"
RETURN COUNT(c);

//5. Zapytanie zwracające wszystkich klientów, którzy mieszkają przy określonej ulicy
MATCH (c:Client)-[:PRZY_ULICY]->(s:Street)
WHERE s.street_name = "Tulipanowa"
RETURN c;

//6. Zapytanie zwracające wszystkie roszcenia, które mają status oczekujący na rozpatrzenie
MATCH (c:Claim)-[:ROSZCZENIE]->(cs:ClaimStatus)
WHERE cs.cs_status = "Pending"
RETURN c;

//7. Obliczanie średniej zniżki klientów mieszkających w Bydgoszczy
MATCH (c:Client)-[:Z_MIASTA]->(ct:City)
WHERE ct.city_name = "Bydgoszcz"
RETURN AVG(toInteger(c.discount)) AS Srednia;

//8. Zapytanie zwracające wszystkich pracowników, którzy mieszkają przy określonej ulicy
MATCH (e:Employee)-[:PRZY_ULICY]->(s:Street)
WHERE s.street_name = "Tulipanowa"
RETURN e;

//9. Zapytanie zwracające wszystkich klientów urodzonych przed rokiem 2000
MATCH (c:Client) WHERE (date(c.date_of_birth).year < 2000)
RETURN c;

//10. Zapytanie zwracające wszystkie miasta, w których zlokalizowane są oddziały firmy
MATCH (c:City)<-[:Z_MIASTA]-(b:Branch)
RETURN c;

//11. Zapytanie zwracające wszystkie polisy wykupione przez klienta o ID "4":
MATCH (i:Insurance)-[:WYKUPIL_POLISE]->(c:Client)
WHERE c.client_id_id = "4"
RETURN i;

//12. Zapytanie zwracające wszystkie roszczenia ubezpieczeniowe 
MATCH (cl:Claim)-[:ROSZCZENIE]->()
RETURN cl

//13. Zapytanie zwracające dane dotyczące klienta, polisy oraz płatności, w których klient płacił gotówką
MATCH (p:Payment {payment_type: "cash"})<-[:RODZAJ_PLATNOSCI]-(i:Insurance)-[:WYKUPIL_POLISE]->(c:Client)
return *;

//14. Zwróć sumę uzyskaną ze sprzedaży wszystkich polis
MATCH (i:Insurance)
RETURN sum(toInteger(i.price));

//15. Zwróć wszystkie polisy, które wygasają przed dzisiejszą datą

MATCH (i:Insurance) WHERE date(i.expiration_date) < date()
RETURN i;

