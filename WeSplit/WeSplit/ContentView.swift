//
//  ContentView.swift
//  WeSplit
//
//  Created by Nuno Pereira on 24/10/2019.
//  Copyright © 2019 Nuno Pereira. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    
    private let tipValues = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(Int(numberOfPeople) ?? 1)
        return totalAmount / peopleCount
    }
    
    var totalAmount: Double {
        let tipAmount = Double(tipValues[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipAmount
        let grandTotal = orderAmount + tipValue
        return grandTotal
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount: ", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    TextField("Amount of people:", text: $numberOfPeople)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("How much tip you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach (0 ..< tipValues.count) { value in
                            Text("\(self.tipValues[value])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                
                Section(header: Text("Total Amount")) {
                    Text("$\(totalAmount, specifier: "%.2f")")
                }
            }.navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
