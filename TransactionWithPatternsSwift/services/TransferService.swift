import Foundation

public class TransferService{
    
    var storage: Storage
    
    init(storage: Storage) {
        self.storage = storage
    }
    
    //option 1
    
    func transfer(opOrigin: Operation, opDestiny: Operation) -> TransferResponse{
        let client  = ApiClient()
        
        let originResponse = client.verifyAccount(operation: opOrigin)
        let destinyResponse = client.verifyAccount(operation: opDestiny)
        
        if(originResponse && destinyResponse){
            
            let clientRequest = ApiClientRequest(origin: opOrigin, destiny: opDestiny)
            let responseApi = client.send(request: clientRequest)
                        
            storage.save(message: responseApi.message)
            
            return TransferResponse(code: responseApi.code, msg: responseApi.message)
        }
        return TransferResponse(code: 501, msg: "The accounts aren't corrects")
    }
    
    //option 2
    /*
    func transfer(opOrigin: Operation, opDestiny: Operation) -> TransferResponse{    
        
        let clientOrigin = SantanderClient()
        let clientDestiny = BCIClient()
        
        let originResponse = clientOrigin.verifyAccount(operation: opOrigin)
        let destinyResponse = clientDestiny.verifyAccount(operation: opDestiny)
        
        if(originResponse && destinyResponse){
            
            let clientRequest = ApiClientRequest(origin: opOrigin, destiny: opDestiny)
            
            let responseApi = clientOrigin.send(request: clientRequest)
                        
            storage.save(message: responseApi.message)
            
            return TransferResponse(code: responseApi.code, msg: responseApi.message)
        }
        return TransferResponse(code: 501, msg: "The accounts aren't corrects")
    }*/
    
    
    //option 3
    /*
    func transfer(opOrigin: Operation, opDestiny: Operation) -> TransferResponse{
        
        do{
            let clientOrigin = try ClientFactory.build(bank: opOrigin.bank)
            let clientDestiny = try ClientFactory.build(bank: opDestiny.bank)
                        
            clientOrigin.verifyAccount(operation: opOrigin)
            clientDestiny.verifyAccount(operation: opDestiny)
            
            let clientRequest = ApiClientRequest(origin: opOrigin, destiny: opDestiny)
            let responseApi = clientOrigin.send(request: clientRequest)
                        
            storage.save(message: responseApi.message)
            
            return TransferResponse(code: responseApi.code, msg: responseApi.message)
            
        } catch ClientError.bankNotFound {
            return TransferResponse(code: 509, msg: "Bank not found")
        } catch{
            return TransferResponse(code: 509, msg: "Bank not found")
        }
    }
    */
    
}
