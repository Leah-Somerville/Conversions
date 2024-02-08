//
//  ContentView.swift
//  Conversions
//
//  Created by Leah Somerville on 2/7/24.
//

import SwiftUI

struct ContentView: View {
    @State var ogTemp: Double = 0.0
    @State private var ogUnitSelected: String = "Fahrenheit"
    @State var newUnitSelected: String = "Fahrenheit"
    let unitSelection = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var convertedTemp: Double {
        var newTemp: Double = 0.0
        
        if ogUnitSelected == "Celsius" && newUnitSelected == "Celsius"{
            newTemp = ogTemp
        } else if ogUnitSelected == "Fahrenheit" && newUnitSelected == "Fahrenheit" {
            newTemp = ogTemp
        } else if ogUnitSelected == "Kelvin" && newUnitSelected == "Kelvin" {
            newTemp = ogTemp
        } else if ogUnitSelected == "Celsius" && newUnitSelected == "Fahrenheit"{
            newTemp = (ogTemp - 32) * 5/9
        } else if ogUnitSelected == "Celsius" && newUnitSelected == "Kelvin" {
            newTemp = ogTemp + 273.15
        } else if ogUnitSelected == "Fahrenheit" && newUnitSelected == "Celsius" {
            newTemp = (ogTemp * 9/5) + 32
        } else if ogUnitSelected == "Fahrenheit" && newUnitSelected == "Kelvin" {
            newTemp = ((ogTemp - 32) * 5/9) + 273.15
        } else if ogUnitSelected == "Kelvin" && newUnitSelected == "Celsius" {
            newTemp = ogTemp - 273.15
        } else if ogUnitSelected == "Kelvin" && newUnitSelected == "Fahrenheit" {
            newTemp = (ogTemp - 273.15) * 1.8 + 32
        } else {
            newTemp = 99.99
        }
        
        return newTemp
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Please Enter the Orginal Temperature"){
                    TextField("Temperature", value: $ogTemp, format: .number)
                    
                    Picker("Temperature Unit", selection: $ogUnitSelected){
                        ForEach(unitSelection, id: \.self){
                            Text("\($0)")
                        }
                    }.pickerStyle(.segmented)
                }
                Section("Please Enter the New Unit"){
                    Picker("Temperature Unit", selection: $newUnitSelected){
                        ForEach(unitSelection, id: \.self){
                            Text("\($0)")
                        }
                    }.pickerStyle(.segmented)
                }
                
                Section("New Temperature"){
                    Text("\(convertedTemp.formatted())°")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
