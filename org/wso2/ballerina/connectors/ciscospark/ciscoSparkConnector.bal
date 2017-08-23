package org.wso2.ballerina.connectors.ciscospark;

import org.wso2.ballerina.connectors.oauth2;

connector ClientConnector (string accessToken, string refreshToken, string clientId, string clientSecret) {
    
    string baseUrl = "https://api.ciscospark.com/v1";
    string refreshTokenEP = "https://api.ciscospark.com/v1/access_token";
    
    oauth2:ClientConnector ciscoSparkEP = create oauth2:ClientConnector(baseUrl, accessToken, clientId,
                                                                clientSecret, refreshToken, refreshTokenEP);
}