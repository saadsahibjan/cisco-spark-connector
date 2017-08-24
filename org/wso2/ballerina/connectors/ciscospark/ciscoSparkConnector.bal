package org.wso2.ballerina.connectors.ciscospark;

import org.wso2.ballerina.connectors.oauth2;
import ballerina.lang.messages;

connector ClientConnector (string accessToken, string refreshToken, string clientId, string clientSecret) {
    
    string baseUrl = "https://api.ciscospark.com/v1";
    string refreshTokenEP = "https://api.ciscospark.com/v1/access_token";
    
    oauth2:ClientConnector ciscoSparkEP = create oauth2:ClientConnector(baseUrl, accessToken, clientId,
                                                                clientSecret, refreshToken, refreshTokenEP);

    action createTeam(string teamName) (message) {
        message request = {};
        
        string createTeamPath = "/teams";
        json createTeamPayload = {"name": teamName};
        
        messages:setJsonPayload(request, createTeamPayload);
        messages:setHeader(request, "Content-Type", "application/json");
        
        message response = ciscoSparkEP.post(createTeamPath, request);
        return response;
    }
    
    action updateTeam(string teamId, string teamName) (message) {
        message request = {};
        
        string updateTeamPath = "/teams/" + teamId;
        json updateTeamPayload = {"name": teamName};
        
        messages:setJsonPayload(request, updateTeamPayload);
        messages:setHeader(request, "Content-Type", "application/json");
        
        message response = ciscoSparkEP.put(updateTeamPath, request);
        return response;
    }
    
    action deleteTeam(string teamId) (message) {
        message request = {};
        
        string deleteTeamPath = "/teams/" + teamId;
        
        message response = ciscoSparkEP.delete(deleteTeamPath, request);
        return response;
    }
    
    action getTeam(string teamId) (message) {
        message request = {};
        
        string getTeamPath = "/teams/" + teamId;
        
        message response = ciscoSparkEP.get(getTeamPath, request);
        return response;
    }
    
    action getAllTeams(int limit) (message) {
        message request = {};
        
        string getAllTeamPath = "/teams";
        
        if (limit != 0) {
            getAllTeamPath = "/teams?max=" + limit;
        }

        message response = ciscoSparkEP.get(getAllTeamPath, request);
        return response;
    }
}