package samples.ciscospark;

import org.wso2.ballerina.connectors.ciscospark;
import ballerina.lang.system;

function main (string[] args) {
    string accessToken = "access-token";
    ciscospark:ClientConnector ciscoSpark = create ciscospark:ClientConnector(accessToken, "", "", "");
    message respone = ciscoSpark.createTeam("del");
    system:println(respone);
}