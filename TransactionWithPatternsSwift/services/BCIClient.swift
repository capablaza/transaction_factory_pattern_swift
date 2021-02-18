import Foundation

public class BCIClient : Client{
    
    public func verifyAccount(operation: Operation) -> Bool {
        if(operation.bank  == "bci"){
            return true
        }
        return false
    }
    
    public func send(request: ApiClientRequest) -> ApiClientResponse {
        if(request.originBank  == "bci"){
            return ApiClientResponse(code: 200, msg: "Ok from bci")
        }
        return ApiClientResponse(code: 500, msg: "Bank not valid")
    }
}
