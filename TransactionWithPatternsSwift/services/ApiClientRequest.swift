//
//  ApiClientRequest.swift
//  TransactionWithPatternsSwift
//
//  Created by carlos alberto apablaza zamorano on 18-02-21.
//

import Foundation


public class ApiClientRequest{
    
    var originAccount : Int
    var originBank: String
    var originAmount: Int
    var destinyAccount : Int
    var destinyBank: String
    var destinyAmount: Int
    
    init(origin: Operation, destiny: Operation) {
        self.originAccount = origin.account
        self.originBank = origin.bank
        self.originAmount = origin.amount
                
        self.destinyAccount = destiny.account
        self.destinyBank = destiny.bank
        self.destinyAmount = destiny.amount
        
    }
}
