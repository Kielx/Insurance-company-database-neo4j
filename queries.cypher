//1. Znajdowanie wszystkich klientów z danego województwa i zwrócenie ich imion i nazwisk
MATCH (c:Client)-[:Z_WOJEWODZTWA]->(r:Region)
WHERE r.region_name = "Masovian (Mazowieckie)"
RETURN c.first_name, c.last_name

//2. Znajdowanie wszystkich oddziałów z Opola i zwrócenie ich wraz z relacją w celu łatwej wizualizacji
MATCH (b:Branch)-[:Z_MIASTA]->(c:City)
WHERE c.city_name = "Opole"
RETURN b, c

//3. Znajdowanie wszystkich klientów detalicznych i zwrócenie ich imion i nazwisk
MATCH (c:Client)-[:TYPU]->(ct:ClientType)
WHERE ct.clientType_name = "retail"
RETURN c.first_name, c.last_name


//Find the total number of clients of a specific client type:

MATCH (c:Client)-[:JEST_TYPEM]->(ct:ClientType)
WHERE ct.clientType_name = "Client Type Name"
RETURN COUNT(c)

//Find the names of all branches located on a specific street:

MATCH (b:Branch)-[:LOCATED_AT]->(s:Street)
WHERE s.street_name = "Street Name"
RETURN b.branch_name

//Find the total number of claims filed at a specific branch:

MATCH (c:Claim)-[:FILED_AT]->(b:Branch)
WHERE b.branch_name = "Branch Name"
RETURN COUNT(c)

//Find the average discount of all clients living in a specific city:

MATCH (c:Client)-[:Z_MIASTA]->(ct:City)
WHERE ct.city_name = "City Name"
RETURN AVG(c.discount)

//Find the names of all clients who live on a specific street:

MATCH (c:Client)-[:PRZY_ULICY]->(s:Street)
WHERE s.street_name = "Street Name"
RETURN c.first_name, c.last_name

//Find the names of all clients who were born in a specific year:

MATCH (c:Client)
WHERE YEAR(c.date_of_birth) = "Year"
RETURN c.first_name, c.last_name

//Find the names of all cities with branches:

MATCH (c:City)<-[:IN_CITY]-(b:Branch)
RETURN c.city_name

//Find the names of all regions with branches:

MATCH (r:Region)<-[:LOCATED_IN]-(b:Branch)
RETURN r.region_name

//Find the total number of claims filed by clients of a specific client type:

MATCH (c:Client)-[:JEST_TYPEM]->(ct:ClientType), (cl:Claim)
WHERE ct.clientType_name = "Client Type Name" AND c.client_id = cl.client_id
RETURN COUNT(cl)

//Find the total number of claims filed by clients living in a specific city:

MATCH (c:Client)-[:Z_MIASTA]->(ct:City), (cl:Claim)
WHERE ct.city_name = "City Name" AND c.client_id = cl.client_id
RETURN COUNT(cl)

//Znajdź wszystkich klientów z województwa "śląskie":
MATCH (c:Client)-[:Z_WOJEWODZTWA]->(r:Region)
WHERE r.region_name = "śląskie"
RETURN c

//Znajdź wszystkich klientów z miasta "Katowice":
MATCH (c:Client)-[:Z_MIASTA]->(r:City)
WHERE r.city_name = "Katowice"
RETURN c

//Znajdź wszystkich pracowników z oddziału o ID "3":
MATCH (e:Employee)-[:PRACUJE_W_ODDZIALE]->(b:Branch)
WHERE b.branch_id = "3"
RETURN e

//Znajdź wszystkie polisy wystawione przez pracownika o ID "4":
MATCH (i:Insurance)-[:WYSTAWIL]->(e:Employee)
WHERE e.employee_id = "4"
RETURN i

//Znajdź wszystkie roszczenia zgłoszone przez klienta o ID "7":
MATCH (cl:Claim)-[:ZGLOSZONE_PRZEZ]->(c:Client)
WHERE c.client_id = "7"
RETURN cl

//Znajdź wszystkie roszczenia związane z polisą o ID "9":
MATCH (cl:Claim)-[:Z_UBEZPIECZENIA]->(i:Insurance)
WHERE i.insurance_id = "9"
RETURN cl

//Znajdź wszystkie płatności związane z roszczeniem o ID "6":
MATCH (p:Payment)-[:PLATNOSC_ZA]->(cl:Claim)
WHERE cl.claim_id = "6"
RETURN p

//Znajdź wszystkie oddziały z miasta "Kraków":
Copy code
MATCH (b:Branch)-[:Z_MIASTA]->(c:City)
WHERE c.city_name = "Kraków"
RETURN b

//Znajdź wszystkie polisy zakupione przez klientów z typem "indywidualny":
MATCH (i:Insurance)-[:WYKUPIL_POLISE]->(c:Client)-[:TYPU]->(ct:ClientType)
WHERE ct.clientType_name = "indywidualny"
RETURN i

//Znajdź wszystkie ulicę z miasta "Kraków":
MATCH (s:Street)-[:Z_MIASTA]->(c:City)
WHERE c.city_name = "Kraków"
RETURN s

//Znajdź wszystkie numery telefonów klienta o ID "5":
MATCH (c:Client)-[:NUMER_TELEFONU]->(p:Phone)
WHERE c.client_id = "5"
RETURN p

//Znajdź wszystkie roszczenia o statusie "rozpatrzone":
MATCH (cl:Claim)-[:STATUS_ROSZCZENIA]->(cs:ClaimStatus)
WHERE cs.cs_status = "rozpatrzone"
RETURN cl

//Znajdź wszystkie płatności o typie "gotówka":
MATCH (p:Payment)
WHERE p.payment_type = "gotówka"
RETURN p

//MATCH (i:Insurance)-[:WYKUPIL_POLISE]->(c:Client)-[:Z_WOJEWODZTWA]->(r:Region)
WHERE r.region_name = "małopolskie"
RETURN i

//Znajdź wszystkie oddziały przy ulicy "Kwiatowa":
MATCH (b:Branch)-[:PRZY_ULICY]->(s:Street)
WHERE s.street_name = "Kwiatowa"
RETURN b