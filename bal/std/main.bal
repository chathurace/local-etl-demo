import ballerina/http;
import ballerina/io;

map<string> pidMap = {
    "P_016": "P_216",
    "P_058": "P_365",
    "P_620": "P_302"
};

public function main() {
    io:println("Starting std app...");
}

type ProductId record {
    string id;
    string newId?;
};

service /products on new http:Listener(8090) {
    resource function post id(@http:Payload ProductId pid) returns ProductId {
        io:println("Standardizing product ID: " + pid.id);
        string newId = pid.id;
        if !pid.id.startsWith("P_") {
            newId = "P_" + pid.id;
        }
        string? mappedId = pidMap[newId];
        if mappedId is string {
            newId = mappedId;
        }
        pid.newId = newId;
        return pid;
    }
}

