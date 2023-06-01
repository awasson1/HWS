//
//  ContentView.swift
//  WeSplit
//
//  Created by Anthony Wasson on 5/31/23.
//

import SwiftUI

struct ContentView: View {
    @State private var name = "";
    
    var body: some View {
        Form
        {
            ForEach(0..<100)
            {
                //number in
                Text("Row \($0)")
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
