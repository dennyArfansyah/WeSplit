//
//  ContentTwoView.swift
//  WeSplit
//
//  Created by Denny Arfansyah on 28/12/22.
//

import SwiftUI

struct ContentTwoView: View {
    @State private var amount = 0.0
    @State private var numberOfPeople = 2
    @State private var selectedPercentage = 20
    @FocusState private var amountIsFocus: Bool
    private var tipPercentages = [10, 15, 20, 25, 0]
    
    var totalAmount: Double {
        let tipSelection = Double(selectedPercentage)
        let tipValue = amount / 100.0 * tipSelection
        let total = amount + tipValue
        return total
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        return totalAmount / peopleCount
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocus)
                    Picker("Number Of People", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    Picker("Tip Percentage", selection: $selectedPercentage) {
                        ForEach(0..<101, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                } header: {
                    Text("How much tips do you want to leave ?")
                }
                
                Section {
                    Text(totalAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                } header: {
                    Text("Total Amount + Tips ")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                } header: {
                    Text("Amount per person")
                }
            }
            .navigationTitle("Tag 2")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocus = false
                    }
                }
            }
        }
        
    }
}

struct ContentTwoView_Previews: PreviewProvider {
    static var previews: some View {
        ContentTwoView()
    }
}
