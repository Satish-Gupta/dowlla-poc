package com.skg

import io.swagger.client.ApiClient;
import io.swagger.client.api.*;
import io.swagger.client.model.*;

class HomeController {

    def index() {
        ApiClient apiClient = new ApiClient();
        apiClient.setBasePath("https://api-uat.dwolla.com");
        apiClient.setAccessToken("Mm6l1wJ5mR8RU0DWYx3hU9739FSWFbf7TALk28b0GnLkG7h63r");
        session.apiClient = apiClient
        render view: '/index'
    }
}
