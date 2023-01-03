MATCH (c:Client), (r:Region)
WHERE c.region_id = r.region_id
MERGE (c)-[:Z_WOJEWODZTWA]->(r);

MATCH (c:Client), (r:City)
WHERE c.city_id = r.city_id
MERGE (c)-[:Z_MIASTA]->(r);

MATCH (c:Client), (r:Street)
WHERE c.street_id = r.street_id
MERGE (c)-[:PRZY_ULICY]->(r);

MATCH (c:Client), (r:HouseNr)
WHERE c.houseNr_id = r.houseNr_id
MERGE (c)-[:POD_ADRESEM]->(r);

MATCH (c:Client), (ct:ClientType)
WHERE c.clientType_id = ct.clientType_id
MERGE (c)-[:TYPU]->(ct);

MATCH (c:Client), (p:Phone)
WHERE c.client_id = p.client_id
MERGE (c)-[:NUMER_TELEFONU]->(p);

MATCH (pt:PhoneType), (p:Phone)
WHERE pt.phoneType_id = p.phoneType_id
MERGE (pt)-[:RODZAJ_NUMERU]->(p);

MATCH (e:Employee), (r:Region)
WHERE e.region_id = r.region_id
MERGE (e)-[:Z_WOJEWODZTWA]->(r);

MATCH (e:Employee), (r:City)
WHERE e.city_id = r.city_id
MERGE (e)-[:Z_MIASTA]->(r);

MATCH (e:Employee), (r:Street)
WHERE e.street_id = r.street_id
MERGE (e)-[:PRZY_ULICY]->(r);

MATCH (e:Employee), (r:HouseNr)
WHERE e.houseNr_id = r.houseNr_id
MERGE (e)-[:POD_ADRESEM]->(r);

MATCH (e:Employee), (b:Branch)
WHERE e.branch_id = b.branch_id
MERGE (e)-[:PRACUJE_W_ODDZIALE]->(b);

MATCH (b:Branch), (c:City)
WHERE b.city_id = c.city_id
MERGE (b)-[:Z_MIASTA]->(c);

MATCH (b:Branch), (r:Region)
WHERE b.region_id = r.region_id
MERGE (b)-[:Z_WOJEWODZTWA]->(r);

MATCH (b:Branch), (s:Street)
WHERE b.street_id = s.street_id
MERGE (b)-[:PRZY_ULICY]->(s);

MATCH (b:Branch), (h:HouseNumber)
WHERE b.houseNr_id = h.houseNr_id
MERGE (b)-[:POD_ADRESEM]->(h);

MATCH (cl:Claim), (i:Insurance)
WHERE cl.insurance_id = i.insurance_id
MERGE (cl)-[:Z_UBEZPIECZENIA]->(i);

MATCH (cl:Claim), (c:Client)
WHERE cl.client_id = c.client_id
MERGE (cl)-[:ROSZCZENIE]->(c);

MATCH (i:Insurance), (br:Branch)
WHERE i.branch_id = br.branch_id
MERGE (i)-[:Z_ODDZIALU]->(br);

MATCH (i:Insurance), (c:Client)
WHERE i.client_id = c.client_id
MERGE (i)-[:WYKUPIL_POLISE]->(c);

MATCH (i:Insurance), (e:Employee)
WHERE i.employee_id = e.employee_id
MERGE (i)-[:SPRZEDANA_PRZEZ]->(e);

MATCH (i:Insurance), (it:InsuranceType)
WHERE i.insuranceType_id = it.insuranceType_id
MERGE (i)-[:WYKUPIL_POLISE]->(it);

MATCH (i:Insurance), (pt:Payment)
WHERE i.payment_id = pt.payment_id
MERGE (i)-[:RODZAJ_PLATNOSCI]->(pt);

MATCH (i:Insurance), (c:Claim)
WHERE i.insurance_id = c.insurance_id
MERGE (i)-[:RODZAJ_PLATNOSCI]->(c);

MATCH (c:Claim), (cs:ClaimStatus)
WHERE c.cs_id = cs.cs_id
MERGE (c)-[:ROSZCZENIE]->(cs);