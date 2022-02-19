//
//  ContentView.swift
//  Utilities
//
//  Created by Georgios Loulakis on 19.02.22.
//

import SwiftUI

struct ContentView: View {
    @State private var electricity = ""
    @State private var coldwater = ""
    @State private var hotWater = ""
    @State private var coldwaterAdditional = ""
    @State private var hotWaterAdditional = ""
    @State private var gas = ""
    
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    IconTextField(icon: "bolt", text: $electricity)
                        .foregroundColor(.yellow)

                } header: {
                    Text("Electricity")
                }
                
                Section{
                 
                    IconTextField(icon: "thermometer.snowflake", text: $coldwater)
                        .foregroundColor(.blue)

                    IconTextField(icon: "thermometer.snowflake", text: $hotWater)
                        .foregroundColor(.red)
                } header: {
                    Text("Water")
                }
                
                Section{
                    IconTextField(icon: "thermometer.sun.fill", text: $coldwaterAdditional)
                        .foregroundColor(.blue)
                    IconTextField(icon: "thermometer.sun.fill", text: $hotWaterAdditional)
                        .foregroundColor(.red)
                } header: {
                    Text("Water Additional")
                }
                
                Section{
                    IconTextField(icon: "flame", text: $gas)
                        .foregroundColor(.red)
                } header: {
                    Text("Gas")
                }
                
                Section {
                    Button("Copy to cliboard"){
                        copyToClipboard()
                    }
                    .foregroundColor(
                        isRequiredFieldsProvided() ? Color.green : Color.gray
                    )
                    .disabled(
                        isRequiredFieldsProvided() == false
                    )
                } footer:{
                    Text("""
        By pressing the "Copy to clipboard" button, the app will prepare a formatted text with all the measurements and copy it to your clipboard, so that you could just paste it wherever you want.
        """)
                }
                
                
            }
            .keyboardType(.decimalPad)
            .navigationTitle("Utilities")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                       
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                    
                }
            }
        }
    }
    func copyToClipboard(){
        let text = """
                    Hello, readings are:
                      - electricity: \(electricity)
                      - water:
                        - cold: \(coldwater)
                        - hot: \(hotWater)
                      - water (additional):
                        - cold: \(coldwaterAdditional)
                        - hot: \(hotWaterAdditional)
                      - gas: \(gas)
        
                    Have a nice day.
        """
        UIPasteboard.general.string = text
        
        print(text)
    }
    
    func isRequiredFieldsProvided () -> Bool {
        if electricity.isEmpty == true {
            return false
        } else if coldwater.isEmpty == true {
            return false
        } else if hotWater.isEmpty == true {
            return false
        } else if gas.isEmpty == true {
            return false
        } else{
            return true
        }
     }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
