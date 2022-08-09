//
//  TextView.swift
//  ClauDFlux
//
//  Created by Claudia Fiorentino on 08/08/22.
//

import SwiftUI

struct MoneyNumberView: View {
    var number: Float
    
    private var colored: Color {
        number >= 0 ? .green : .red
    }
    var body: some View {
        Text("R$ \(number)")
            .foregroundColor(colored)
    }
}

struct MoneyNumberView_Previews: PreviewProvider {
    static var previews: some View {
        MoneyNumberView(number: 10)
    }
}
