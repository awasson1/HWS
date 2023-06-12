//
//  ContentView.swift
//  WeSplit Project, first module of the Hacking With Swift project list
//
//  Created by Anthony Wasson on 5/31/23.
//

import SwiftUI

struct ContentView: View
{
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]

    var totalPerPerson: Double
    {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var tipValue: Double
    {
        let tipSelection = Double(tipPercentage)
        
        let tipAmount = checkAmount / 100 * tipSelection
        
        return tipAmount
    }
    
    var body: some View
    {
        NavigationView
        {
            Form
            {
                //Data entry section
                Section
                {
                    //Bill value entry
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    //Number of people drop down selector
                    Picker("Number of people", selection: $numberOfPeople)
                    {
                        ForEach(2 ..< 100)
                        {
                            Text("\($0) people")
                        }
                    }
                }
                
                //Multiple choice tip value selection
                Section
                {
                    Picker("Tip percentage", selection: $tipPercentage)
                    {
                        ForEach(tipPercentages, id: \.self)
                        {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }   //header for the tip choice section
                    header:
                    {
                        Text("How much tip would you like to leave?")
                    }
                
                //Total amount + tip / people = split cost for each person, displayed here
                Section
                {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }   //header for the split cost
                    header:
                    {
                        Text("Amount per person")
                    }
                
                
                //Pre-split information display
                Section
                {
                    //Bill before tip and before split
                    HStack
                    {
                        Text("Bill: ")
                        Text(checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    }
                    //Tip calculated based on pre-split bill
                    HStack
                    {
                        Text("Tip: ")
                        Text(tipValue, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    }
                    //Bill + tip before split
                    HStack
                    {
                        Text("Total: ")
                        Text(tipValue + checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    }
                }   //Header for pre-split information
                    header:
                    {
                        Text("Before split")
                    }
            }
            .navigationTitle("WeSplit Bills")
            .toolbar
            {
                ToolbarItemGroup(placement: .keyboard)
                {
                    Spacer()
                    
                    Button("Done")
                    {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/
