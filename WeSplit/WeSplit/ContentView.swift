//
//  ContentView.swift
//  WeSplit
//
//  Created by Nuno Pereira on 24/10/2019.
//  Copyright © 2019 Nuno Pereira. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Form {
            Section {
                Text("Hello World")
                Text("Benfica")
            }
            
            Section {
                Text("Benfica")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
