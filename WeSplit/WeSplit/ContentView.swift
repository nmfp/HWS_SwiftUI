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
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    private let tipValues = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount: ", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Amount of people", selection: $numberOfPeople) {
                        ForEach (2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("How much tip you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach (0 ..< tipValues.count) {
                            Text("\(self.tipValues[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("$\(checkAmount)")
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
