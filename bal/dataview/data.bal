import ballerina/io;
import ballerina/sql;
import ballerinax/java.jdbc;

configurable string dbUrl = ?;
configurable string dbUser = ?;
configurable string dbPassword = ?;

public type SalesData record {|
    int tid;
    string timestamp;
    string productId;
    string productName;
    string storeId;
    string customerId;
    int customerAge;
    float unitPrice;
    int quantiry;
    float total;
|};
public function getSalesData(string? store, string? customer) returns SalesData[]|error {
    jdbc:Client|sql:Error dbClient = new(dbUrl, dbUser, dbPassword);

    if (dbClient is sql:Error) {
        io:println("Error occurred while creating the database client.", dbClient);
        return [];
    }

    SalesData[] salesData = [];
    sql:ParameterizedQuery salesDataQuery = `SELECT * FROM sales_data`;
    if (store is string && customer is string) {
        salesDataQuery = `SELECT * FROM sales_data WHERE storeId = ${store} AND customerId = ${customer}`;
    } else if (store is string) {
        salesDataQuery = `SELECT * FROM sales_data WHERE storeId = ${store}`;
    } else if (customer is string) {
        salesDataQuery = `SELECT * FROM sales_data WHERE customerId = ${customer}`;
    }
    stream<SalesData, sql:Error?> resultStream = dbClient->query(salesDataQuery);
    check from SalesData dataLine in resultStream
    do {
        salesData.push(dataLine);
    };
    return salesData;
}
