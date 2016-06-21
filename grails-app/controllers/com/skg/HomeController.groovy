package com.skg

import io.swagger.client.ApiClient;
import io.swagger.client.api.*;
import io.swagger.client.model.*;

class HomeController {

    def index() {
        session.clientId = "vr5qyk2BDEHYmCqJ0cZfCE0I3CnU8DElbwph76ZKwQruHZhIPg"
        session.platformAccessToken = "ZxRPuxyVwNdKaL0CKwCMlbQ12gVITwCNhPj0b0iwjKppgzbToK"
        session.clientSecret = "3vXIbhffKoCUPz77RwnLMrE5ntMZLtubld20Z7a2JPlh1P6OX1"
        session.baseurl = "https://api-uat.dwolla.com"
//        ApiClient a = new ApiClient();
//        a.setBasePath("https://api-uat.dwolla.com");
//        a.setAccessToken("UXePkwEl1MYLdd8e0gXPZYaFytHK3tHTGgpzLe4Jm7QuYduVAV");
//
//        CustomersApi c = new CustomersApi(a);
//        CustomerListResponse custies = c.list(10,5);
//        print custies
        render 'hello'
    }
}
