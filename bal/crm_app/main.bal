import ballerina/http;
import ballerina/io;

public function main() {
    io:println("Starting CRM service...");
}

type Customer record {|
    string customerId;
    string name;
    int age;
|};

service /crm on new http:Listener(9090) {
    resource function get customers/[string customerId]() returns Customer {
        io:println("Customer ID: " + customerId);
        Customer customer = {customerId: customerId, name: "John Doe", age: 30};
        return customer;
    }
}

