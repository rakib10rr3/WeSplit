//
//  ContentView.swift
//  WeSplit
//
//  Created by Rakibul Huda on 15/12/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var peopleCount : Double {
        return Double(numberOfPeople + 2)
    }
    
    var tipSelection : Double {
        return Double(tipPercentages[tipPercentage])
    }
    
    var orderAmount : Double {
        return Double(checkAmount) ?? 0
    }
    
    var tipValue : Double {
        return orderAmount / 100 * tipSelection
    }
    
    var grandTotal : Double {
        return orderAmount + tipValue
    }
    
    var totalPerPerson : Double {
        return grandTotal / peopleCount
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("How much tip do you want to leave?")
                            .textCase(.none)) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count){
                            Text("\(tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Total amount")
                            .textCase(.none)){
                    Text("$\(grandTotal, specifier: "%.2f")")
                }
                
                Section(header: Text("Amount per person")
                            .textCase(.none)){
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
