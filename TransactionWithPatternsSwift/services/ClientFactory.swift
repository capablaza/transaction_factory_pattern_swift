import Foundation

public class ClientFactory{
    
    static func build(bank: String) throws -> Client {
        if(bank == "santander"){
            return SantanderClient()
        }
        if(bank == "bci"){
            return BCIClient()
        }
        throw ClientError.bankNotFound
    }
}
