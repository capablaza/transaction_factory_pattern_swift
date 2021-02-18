import XCTest
@testable import TransactionWithPatternsSwift

public class TransferServiceTest : XCTestCase{
    
    public func testA(){
        let storage = StorageDummy()
        let service = TransferService(storage: storage)
        
        let opOrigin = Operation(account: 10092, bank: "santander", amount: 50400)
        let opDestiny = Operation(account: 98128, bank: "bci", amount: 90500)
        
        let response = service.transfer(opOrigin: opOrigin, opDestiny: opDestiny)
        
        XCTAssertEqual(200, response.code)
    }
    
    public func testB(){
        let storage = StorageDummy()
        let service = TransferService(storage: storage)
        
        let opOrigin = Operation(account: 10092, bank: "bbva", amount: 50400)
        let opDestiny = Operation(account: 98128, bank: "santader", amount: 90500)
        
        let response = service.transfer(opOrigin: opOrigin, opDestiny: opDestiny)
        
        XCTAssertEqual(509, response.code)
    }
}
