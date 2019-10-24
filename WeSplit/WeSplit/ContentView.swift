//
//  ContentView.swift
//  WeSplit
//
//  Created by Nuno Pereira on 24/10/2019.
//  Copyright © 2019 Nuno Pereira. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let students = ["Nuno", "Olegario", "Diogo"]
    @State private var selectedStudent = "Nuno"
    
    var body: some View {
        Picker("Select your Student", selection: $selectedStudent) {
            ForEach(0..<students.count) {
                Text(self.students[$0])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
