import ballerina/graphql;
import ballerina/io;

service /data on new graphql:Listener(8050) {
    resource function get sales(string? store, string? customer) returns SalesData[]|error {
        io:println("Fetching sales data for params:", store, customer);
        return getSalesData(store, customer);
    }
}

public function main() returns error? {
    io:println("Starting data view service...");
}




