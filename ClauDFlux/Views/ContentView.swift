//
//  ContentView.swift
//  ClauDFlux
//
//  Created by Claudia Fiorentino on 08/08/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()
    var body: some View {
        VStack {
            HStack {
                Text("Atual:")
                MoneyNumberView(number: viewModel.totalValue)
            }
            .padding()
            TextField("Insira seu valor aqui", text: $viewModel.textFieldValue)
                .textFieldStyle(.roundedBorder)
                .padding()
                .keyboardType(.decimalPad)
            HStack {
                Button {
                    viewModel.revertTransaction()
                } label: {
                    Text("Desfazer")
                        .foregroundColor(.white)
                        .padding()
                        .background(.gray)
                        .cornerRadius(10)
                }
                Spacer()
                Button {
                    viewModel.addTransaction(flow: .loss)
                } label: {
                    Text("Saiu")
                        .foregroundColor(.white)
                        .padding()
                        .background(.red)
                        .cornerRadius(10)
                }
                Button {
                    viewModel.addTransaction(flow: .gain)
                } label: {
                    Text("Entrou")
                        .foregroundColor(.white)
                        .padding()
                        .background(.green)
                        .cornerRadius(10)
                }

            }
            .padding()
            
            List(viewModel.transactionData) {transaction in
                CellView(date: transaction.date, number: transaction.flow == .gain ? transaction.value : -transaction.value)
            }
            .listStyle(.plain)
        }
        
    }
    
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
