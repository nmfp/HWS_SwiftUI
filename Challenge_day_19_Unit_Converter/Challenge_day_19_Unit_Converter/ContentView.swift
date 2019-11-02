//
//  ContentView.swift
//  Challenge_day_19_Unit_Converter
//
//  Created by Nuno Pereira on 26/10/2019.
//  Copyright © 2019 Nuno Pereira. All rights reserved.
//

import SwiftUI

enum Units: String, CaseIterable {
    case meters = "m", kilometers = "km", feet = "ft", yards = "yds", miles = "mil"
    
    var toMeters: Double {
        switch self {
        case .meters:
            return 1
        case .kilometers:
            return 1000
        case .feet:
            return 0.33
        case .yards:
            return 1.6
        case .miles:
            return 1600
        }
    }
}

struct ContentView: View {
    
    @State private var inputUnit = 2
    @State private var outputUnit = 2
    @State private var inputValue = ""
    
    
    var totalConverted: Double {
        guard inputUnit != outputUnit else { return Double(inputValue) ?? 0.0 }
        let value = Double(inputValue) ?? 0.0
        let inputInMeters = value * Units.allCases[inputUnit].toMeters
        let outputValue = inputInMeters / Units.allCases[outputUnit].toMeters
        return outputValue
    }
    
    var result: CGFloat = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Choose your unit to convert")) {
                    TextField("Your unit", text: $inputValue)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Choose your input unit")) {
                    Picker("Input unit", selection: $inputUnit) {
                        ForEach(0..<Units.allCases.count) {
                            Text(Units.allCases[$0].rawValue)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Choose your output unit")) {
                    Picker("Output unit", selection: $outputUnit) {
                        ForEach(0..<Units.allCases.count) {
                            Text(Units.allCases[$0].rawValue)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Total:")) {
                    Text("\(totalConverted, specifier: "%.3f")")
                }
            }.navigationBarTitle("Unit Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
