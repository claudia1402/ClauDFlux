//
//  Transaction.swift
//  ClauDFlux
//
//  Created by Claudia Fiorentino on 08/08/22.
//

import Foundation

struct Transaction: Identifiable, Equatable {
    var id: UUID = UUID()
    
    var value: Float
    var date: Date
    var flow: Flow
    
    enum Flow {
        case gain
        case loss
    }
}
