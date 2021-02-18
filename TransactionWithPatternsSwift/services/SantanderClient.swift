import Foundation

public class SantanderClient : Client{
    public func verifyAccount(operation: Operation) -> Bool {
        if(operation.bank  == "santander"){
            return true
        }
        return false
    }
    
    public func send(request: ApiClientRequest) -> ApiClientResponse {
        if(request.originBank  == "santander"){
            return ApiClientResponse(code: 200, msg: "Ok from santander")
        }
        return ApiClientResponse(code: 500, msg: "Bank not valid")
    }        
}
