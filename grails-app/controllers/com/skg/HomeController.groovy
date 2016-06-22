package com.skg

import io.swagger.client.ApiClient;
import io.swagger.client.api.*;
import io.swagger.client.model.*;

class HomeController {

    def index() {
        ApiClient apiClient = new ApiClient();
        apiClient.setBasePath("https://api-uat.dwolla.com");
        apiClient.setAccessToken("0ckGprG2acJqptwbtzSPufMw7Ha5SZyjK2dxUYNYmS3NSQXdWL");
        session.apiClient = apiClient
        render view: '/index'
    }
}
