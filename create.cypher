LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Kielx/Insurance-company-database-neo4j/master/generatedData/client.csv?token=GHSAT0AAAAAABSXCWAXONTSCBPRQ24GU7M2Y5SBZLQ' AS row
WITH row LIMIT 10
CREATE (:Client {
  client_id: toInteger(row.client_id), first_name: row.first_name, last_name: row.last_name, date_of_birth: row.date_of_birth,
  region_id: toInteger(row.region_id), city_id: toInteger(row.city_id), street_id: toInteger(row.street_id), 
  houseNr_id: toInteger(row.houseNr_id), clientType_id: toInteger(row.clientType_id), discount: toInteger(row.discount)
  }
)