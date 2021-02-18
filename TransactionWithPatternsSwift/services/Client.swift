import Foundation

public protocol Client{
   
    func verifyAccount(operation: Operation) -> Bool
    
    func send(request: ApiClientRequest) -> ApiClientResponse
}
