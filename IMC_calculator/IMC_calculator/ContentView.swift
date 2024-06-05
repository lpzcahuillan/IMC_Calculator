//
//  ContentView.swift
//  IMC_calculator
//
//  Created by Hugo López on 05-06-24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: calculatorView()) {
                    Text("IMC Calculator").bold()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
