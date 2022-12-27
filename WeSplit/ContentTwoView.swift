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
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(selectedPercentage)
        let tipValue = amount / 100.0 * tipSelection
        let total = amount + tipValue
        return total / peopleCount
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
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How mcuh tips do you want to leave ?")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
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
