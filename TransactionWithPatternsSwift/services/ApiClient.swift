import Foundation

public class ApiClient{
    
    func verifyAccount(operation: Operation) -> Bool {
        if(operation.bank  == "santander"){
            return true
        }
        if(operation.bank  == "bci"){
            return true
        }        
        return false
    }
    
    func send(request: ApiClientRequest) -> ApiClientResponse{
        if(request.originBank  == "santander"){
            return ApiClientResponse(code: 200, msg: "Ok from santander")
        }
        if(request.originBank  == "bci"){
            return ApiClientResponse(code: 200, msg: "Ok from bci")
        }
        if(request.originBank == "bbva"){
            return ApiClientResponse(code: 200, msg: "Ok from bbva")
        }
        return ApiClientResponse(code: 500, msg: "Bank not valid")
    }
    
}
