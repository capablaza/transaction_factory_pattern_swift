import Foundation


public class ApiClientResponse{
    
    var code: Int
    var message: String
    
    init(code: Int, msg: String) {
        self.code = code
        self.message = msg
    }
    
}
