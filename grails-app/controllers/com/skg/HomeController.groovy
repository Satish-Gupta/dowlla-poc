package com.skg

import io.swagger.client.ApiClient;
import io.swagger.client.api.*;
import io.swagger.client.model.*;

class HomeController {

    def index() {
        ApiClient apiClient = new ApiClient();
        apiClient.setBasePath("https://api-uat.dwolla.com");
        apiClient.setAccessToken("7l1nyPCWS08PRjHs0l8MWH3Bxzn7eek469shVMtZjcZyWLNruF");
        session.apiClient = apiClient
        render view: '/index'
    }
}
