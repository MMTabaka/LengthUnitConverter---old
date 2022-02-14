//
//  ContentView.swift
//  LengthUnitConverter
//
//  Created by Milosz Tabaka on 14/02/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var value1: Double = 5
    @State private var selectedUnit1 = "meter"
    @State private var selectedUnit2 = "meter"
    @FocusState private var amountIsFocused: Bool
    
    var convertedValue: Double {
        value1 * universalUnit[selectedUnit1]! / universalUnit[selectedUnit2]!
    }
    
    let units = ["meter", "km", "foot", "yard", "mile"]
    let universalUnit = [ "meter": 1.0, "km": 1000.0, "foot": 0.30479924241959999165, "yard":0.9143977272588, "mile": 1609.34]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter your value...", value: $value1, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Selected unit 1", selection: $selectedUnit1) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Initial Value")
                }
                
                Section {
                    Text(convertedValue, format: .number)
                    Picker("Selected unit 2", selection: $selectedUnit2) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Converted Value")
                }
            }
            .navigationTitle("Unit Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
