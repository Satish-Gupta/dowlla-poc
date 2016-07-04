package dwolla

import com.sun.jersey.multipart.FormDataMultiPart
import grails.transaction.Transactional
import io.swagger.client.ApiClient
import io.swagger.client.ApiException
import io.swagger.client.model.TransferRequestWithFeeBody

@Transactional
class ThirdPartyService {

    public  createTxn(TransferRequestWithFeeBody body, ApiClient apiClient) throws ApiException {
        Object postBody = body;
        String path = "/transfers".replaceAll("\\{format\\}", "json");
        HashMap queryParams = new HashMap();
        HashMap headerParams = new HashMap();
        HashMap formParams = new HashMap();
        String[] accepts = ["application/vnd.dwolla.v1.hal+json"]
        String accept = apiClient.selectHeaderAccept(accepts);
        String[] contentTypes = ["application/vnd.dwolla.v1.hal+json"]
        String contentType = apiClient.selectHeaderContentType(contentTypes);
        if(contentType.startsWith("multipart/form-data")) {
            boolean ex = false;
            FormDataMultiPart mp = new FormDataMultiPart();
            if(ex) {
                postBody = mp;
            }
        }

        try {
            String[] authNames = ["oauth2"]
            String ex1 = apiClient.invokeAPI(path, "POST", queryParams, postBody, headerParams, formParams, accept, contentType, authNames);
            return ex1 != null?apiClient.deserialize(ex1, "", TransferRequestWithFeeBody.class):null;
        } catch (ApiException var13) {
            throw var13;
        }
    }
}
