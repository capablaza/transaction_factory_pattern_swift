import Foundation


public class TransferServiceOnline{
    
    var storage: Storage = OnlineStorage()
    
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
}
