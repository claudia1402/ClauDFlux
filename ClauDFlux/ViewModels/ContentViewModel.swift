//
//  ContentViewModel.swift
//  ClauDFlux
//
//  Created by Claudia Fiorentino on 09/08/22.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var textFieldValue: String = ""
    
    @Published var transactionData: [Transaction] = []
    
    var textFieldNumber: Float? {
        let s = textFieldValue.replacingOccurrences(of: ",", with: ".")
        
        return Float(s)
    }
    
    @Published var totalValue: Float = 0
    
    func sortTransactionData(transaction1: Transaction, transaction2: Transaction) -> Bool {
        transaction1.date > transaction2.date
    }
    
    func addTransaction(flow: Transaction.Flow)  {
        guard let textFieldNumber = textFieldNumber else {
            return
        }

        let transaction = Transaction(value: textFieldNumber, date: Date(), flow: flow)
        transactionData.append(transaction)
        
        transactionData.sort(by: sortTransactionData)
        
        calculateTotalValue()
        
        textFieldValue = ""
    }
    
    func revertTransaction() {
        if !transactionData.isEmpty {
            transactionData.removeFirst()
            calculateTotalValue()
        }
    }
    
    func calculateTotalValue() {
        totalValue = transactionData.reduce(0.0, { partialResult, transaction in
            if transaction.flow == .gain {
                return partialResult + transaction.value
            }
            else {
                return partialResult - transaction.value
            }
        })
        
    }
    
}
