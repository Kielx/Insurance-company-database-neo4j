:auto LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Kielx/Insurance-company-database-neo4j/master/generatedData/client.csv' AS row
CALL {
    WITH row
    MERGE (:Client {client_id: row.client_id, first_name: row.first_name, last_name: row.last_name, date_of_birth: row.date_of_birth, region_id: row.region_id, city_id: row.city_id, street_id: row.street_id, houseNr_id: row.houseNr_id, clientType_id: row.clientType_id, discount: row.discount})
} IN TRANSACTIONS OF 500 ROWS;

:auto LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Kielx/Insurance-company-database-neo4j/master/generatedData/clientType.csv' AS row
CALL {
    WITH row
    MERGE (:ClientType {clientType_id: row.clientType_id, clientType_name: row.clientType_name})
} IN TRANSACTIONS OF 500 ROWS;

:auto LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Kielx/Insurance-company-database-neo4j/master/generatedData/region.csv' AS row
CALL {
    WITH row
    MERGE (:Region {region_id: row.region_id, region_name: row.region_name})
} IN TRANSACTIONS OF 500 ROWS;

:auto LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Kielx/Insurance-company-database-neo4j/master/generatedData/city.csv' AS row
CALL {
    WITH row
    MERGE (:City {city_id: row.city_id, city_name: row.city_name})
} IN TRANSACTIONS OF 500 ROWS;

:auto LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Kielx/Insurance-company-database-neo4j/master/generatedData/street.csv' AS row
CALL {
    WITH row
    MERGE (:Street {street_id: row.street_id, street_name: row.street_name})
} IN TRANSACTIONS OF 500 ROWS;

:auto LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Kielx/Insurance-company-database-neo4j/master/generatedData/branch.csv' AS row
CALL {
WITH row
MERGE (:Branch {branch_id: row.branch_id, branch_name: row.branch_name, region_id: row.region_id, city_id: row.city_id, street_id: row.street_id, houseNr_id: row.houseNr_id})
} IN TRANSACTIONS OF 500 ROWS;

:auto LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Kielx/Insurance-company-database-neo4j/master/generatedData/claim.csv' AS row
CALL {
    WITH row
    MERGE (:Claim {claim_id: row.claim_id, claim_name: row.claim_name, insurance_id: row.insurance_id, claim_amount: row.claim_amount, cs_id: row.cs_id})
} IN TRANSACTIONS OF 500 ROWS;

:auto LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Kielx/Insurance-company-database-neo4j/master/generatedData/claimStatus.csv' AS row
CALL {
    WITH row
    MERGE (:ClaimStatus {cs_id: row.cs_id, cs_status: row.cs_status})
} IN TRANSACTIONS OF 500 ROWS;

:auto LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Kielx/Insurance-company-database-neo4j/master/generatedData/payment.csv' AS row
CALL {
    WITH row
    MERGE (:Payment {payment_id: row.payment_id, payment_type: row.payment_type, payment_amount: row.payment_amount, payment_date: row.payment_date})
} IN TRANSACTIONS OF 500 ROWS;

:auto LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Kielx/Insurance-company-database-neo4j/master/generatedData/employee.csv' AS row
CALL {
    WITH row
    MERGE (:Employee {employee_id: row.employee_id, first_name: row.first_name, last_name: row.last_name, date_of_birth: row.date_of_birth, region_id: row.region_id, city_id: row.city_id, street_id: row.street_id, houseNr_id: row.houseNr_id, date_of_employment: row.date_of_employment, salary: row.salary})
} IN TRANSACTIONS OF 500 ROWS;

:auto LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Kielx/Insurance-company-database-neo4j/master/generatedData/houseNr.csv' AS row
CALL {
    WITH row
    MERGE (:HouseNr {houseNr_id: row.houseNr_id, houseNr_nr: row.houseNr_nr})
} IN TRANSACTIONS OF 500 ROWS;

:auto LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Kielx/Insurance-company-database-neo4j/master/generatedData/insurance.csv' AS row
CALL {
WITH row
MERGE (:Insurance {
insurance_id: row.insurance_id,
insurance_number: row.insurance_number,
client_id: row.client_id,
employee_id: row.employee_id,
begin_date: row.begin_date,
expiration_date: row.expiration_date,
insuranceType_id: row.insuranceType_id,
payment_id: row.payment_id,
branch_id: row.branch_id,
price: row.price
})
} IN TRANSACTIONS OF 500 ROWS;

:auto LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Kielx/Insurance-company-database-neo4j/master/generatedData/insuranceType.csv' AS row
CALL {
WITH row
MERGE (:InsuranceType {
insuranceType_id: row.insuranceType_id,
insurance_type: row.insurance_type
})
} IN TRANSACTIONS OF 500 ROWS;

:auto LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Kielx/Insurance-company-database-neo4j/master/generatedData/phone.csv' AS row
CALL {
WITH row
MERGE (:Phone {
phone_id: row.phone_id,
phone_number: row.phone_number,
client_id: row.client_id,
employee_id: row.employee_id,
branch_id: row.branch_id,
phoneType_id: row.phoneType_id
})
} IN TRANSACTIONS OF 500 ROWS;

:auto LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Kielx/Insurance-company-database-neo4j/master/generatedData/phoneType.csv' AS row
CALL {
WITH row
MERGE (:PhoneType {
phoneType_id: row.phoneType_id,
type_name: row.type_name
})
} IN TRANSACTIONS OF 500 ROWS;