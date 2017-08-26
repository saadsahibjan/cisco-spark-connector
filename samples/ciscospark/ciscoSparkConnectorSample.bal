package samples.ciscospark;

import org.wso2.ballerina.connectors.ciscospark;

import ballerina.lang.system;
import ballerina.lang.messages;
import ballerina.lang.jsons;
import ballerina.net.http;

function main (string[] args) {
    string accessToken = "access-token";
    ciscospark:ClientConnector ciscoSpark = create ciscospark:ClientConnector(accessToken);
    message createTeamRespone = ciscoSpark.createTeam("DevX");
    json createTeamJSONRespone = messages:getJsonPayload(createTeamRespone);
    
    if (http:getStatusCode(createTeamRespone) != 200) {
        system:println(jsons:toString(createTeamJSONRespone));
        return;
    }
    
    string teamId = jsons:toString(createTeamJSONRespone.id);
    message getTeamResponse = ciscoSpark.getTeam(teamId);
    json getTeamJSONResponse = messages:getJsonPayload(getTeamResponse);
    system:println(jsons:toString(getTeamJSONResponse));
}