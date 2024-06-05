//
//  calculatorView.swift
//  IMC_calculator
//
//  Created by Hugo López on 05-06-24.
//

import SwiftUI

struct calculatorView: View {
    @State var gender:Int = 0
    @State var height:Double = 150
    @State var edad:Int = 20
    @State var peso:Int = 70
    var body: some View {
        VStack {
            HStack {
                toggleButton(text: "Hombre", imageName: "heart.fill", gender: 0, selectedGender: $gender)
                toggleButton(text: "Mujer", imageName: "star.fill", gender: 1, selectedGender: $gender)
            }
            heightCalculator(selectedHeight: $height)
            HStack {
                dataComponent(text: "Edad", numberDefault: $edad)
                dataComponent(text: "Peso", numberDefault: $peso)
            }
            calculatorButtom(userWeight: Double(peso), userHeight: height, text: "Calcular")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .toolbar{
            ToolbarItem(placement: .principal){
                Text("IMC Calculator").bold().foregroundColor(.white)
            }
        }
        .cornerRadius(3.0)
        .background(.backgroundApp)
    }
}

struct toggleButton: View {
    let text:String
    let imageName:String
    let gender:Int
    @Binding var selectedGender:Int
    var body: some View {
        let color = if (gender == selectedGender) {
            Color.backgroundSelected
        }
        else {
            Color.backgroundComponent
        }
        Button(action: {selectedGender = gender}) {
            VStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .foregroundColor(.white)
                informationText(text: text)
            }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(color)
                .cornerRadius(16)
        }
    }
}

struct informationText:View {
    let text:String
    var body: some View {
        Text(text).font(.largeTitle).bold().foregroundColor(.white)
    }
}


struct titleText:View {
    let text:String
    var body: some View {
        Text(text).font(.title2).bold().foregroundColor(.gray)
    }
}

struct heightCalculator:View {
    @Binding var selectedHeight:Double
    
    var body: some View {
        VStack{
            titleText(text: "Altura")
            informationText(text: "\(Int(selectedHeight)) CM")
            Slider(value: $selectedHeight, in: 100...230, step: 1).accentColor(.purple).padding(.horizontal, 16)
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(.backgroundComponent)
            .cornerRadius(16)
    }
}

struct dataComponent:View {
    let text:String
    @Binding var numberDefault:Int
    var body: some View {
        VStack {
            titleText(text: text)
            informationText(text: "\(Int(numberDefault))")
            HStack {
                Button(action: {if (numberDefault > 0){numberDefault -= 1}}, label: {
                    imageButtom(imageName: "minus")
                })
                Button(action: {if (numberDefault > 0){numberDefault += 1}}, label: {
                    imageButtom(imageName: "plus")
                })
            }
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundComponent)
            .cornerRadius(16)
    }
}

struct imageButtom:View {
    let imageName:String
    var body: some View {
        
        
        VStack {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.purple)
        .clipShape(.circle)
        
        
        
        
    }
}

struct calculatorButtom:View {
    let userWeight:Double
    let userHeight:Double
    let text:String
    var body: some View {
        NavigationStack {
            NavigationLink(destination: {resultView(userWeight: userWeight, userHeight: userHeight)}){
                Text(text).font(.largeTitle).bold().foregroundColor(.purple)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 100)
        .background(.backgroundComponent)
        .cornerRadius(16)
    }
}

#Preview {
    calculatorView()
}
