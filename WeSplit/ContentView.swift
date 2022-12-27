//
//  ContentView.swift
//  WeSplit
//
//  Created by Denny Arfansyah on 27/12/22.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    @State private var pressCount = 0
    
    private var players = ["Neuer", "Gundogan", "Rudiger", "Kimich"]
    @State private var selectedPlayer = "Kimich"
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Hallo, Willkommen nach SwiftUI")
                }
                
                Section {
                    TextField("Schreiben Sie Ihr Name", text: $name)
                    Text("Mein Name ist \(name)")
                }
                Button("Press Me!: \(pressCount)") {
                    pressCount += 1
                }
                Picker("Select your player", selection: $selectedPlayer) {
                    ForEach(players, id: \.self) {
                        Text($0)
                    }
                }
            }
            .navigationTitle("Tag 1")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
