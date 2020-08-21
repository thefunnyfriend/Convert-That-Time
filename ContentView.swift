//
//  ContentView.swift
//  ConvertThatTime
//
//  Created by Alison Co on 2020-08-20.
//  Copyright © 2020 Alison Co. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNumber = ""
    @State private var inputUnit: Int = 0
    @State private var outputUnit: Int = 0
    
    let inputUnits = ["Seconds", "Minutes", "Hours", "Days"]
    let outputUnits = ["Seconds", "Minutes", "Hours", "Days"]
    
    var convertedValue: Double {
        var initialValue = Double(inputNumber) ?? 0
        
        let seconds = inputUnits[0]
        let minutes = inputUnits[1]
        let hours = inputUnits[2]
        let days = inputUnits[3]
        
        let secondsOutput = outputUnits[0]
        let minutesOutput = outputUnits[1]
        let hoursOutput = outputUnits[2]
        let daysOutput = outputUnits[3]
        
        let inputSelection = inputUnits[inputUnit]
        let outputSelection = outputUnits[outputUnit]
        
        if inputSelection == seconds {
            initialValue *= 1
        } else if inputSelection == minutes {
            initialValue *= 60
        } else if inputSelection == hours {
            initialValue *= 3600
        } else if inputSelection == days {
            initialValue *= 86400
        }
        
        var finalValue: Double
        
        if outputSelection == secondsOutput {
            finalValue = initialValue / 1
            return finalValue
        } else if outputSelection == minutesOutput {
            finalValue = initialValue / 60
            return finalValue
        } else if outputSelection == hoursOutput {
            finalValue = initialValue / 3600
            return finalValue
        } else if outputSelection == daysOutput {
            finalValue = initialValue / 86400
            return finalValue
        } else {
            return 0
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter a value", text: $inputNumber)
                        .keyboardType(.decimalPad)
                    }
                
                Section(header: Text("From")) {
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(0 ..< inputUnits.count) {
                            Text("\(self.inputUnits[$0])")
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("To")) {
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(0 ..< outputUnits.count) {
                            Text("\(self.inputUnits[$0])")
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Here is your converted value.")) {
                    Text("\(convertedValue, specifier: "%.4f")")
                }
            }
        .navigationBarTitle("Convert That Time")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
