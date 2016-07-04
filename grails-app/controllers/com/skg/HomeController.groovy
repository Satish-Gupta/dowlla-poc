package com.skg

import io.swagger.client.ApiClient;
import io.swagger.client.api.*
import io.swagger.client.auth.OAuth;
import io.swagger.client.model.*;

class HomeController {

    def index() {
        ApiClient apiClient = new ApiClient();
        apiClient.setBasePath("https://api-uat.dwolla.com");
        apiClient.setAccessToken("R2rBY47osDBvX5qhLLzkiorhA9rGjWyK4QkbmYTiLj66mtdYGS");
        session.apiClient = apiClient
        render view: '/index'
    }
}
