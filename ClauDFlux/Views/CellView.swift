//
//  CellView.swift
//  ClauDFlux
//
//  Created by Claudia Fiorentino on 08/08/22.
//

import SwiftUI

struct CellView: View {
    var date: Date
    var number: Float
    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yy"
        return dateFormatter.string(from: date)
    }
    var body: some View {
        HStack {
            Text(dateString)
            Spacer()
            MoneyNumberView(number: number)
        }
        .padding()
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(date: Date(), number: 1000)
    }
}
