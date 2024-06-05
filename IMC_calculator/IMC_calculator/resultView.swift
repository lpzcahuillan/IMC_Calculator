//
//  resultView.swift
//  IMC_calculator
//
//  Created by Hugo López on 05-06-24.
//

import SwiftUI

struct resultView: View {
    let userWeight:Double
    let userHeight:Double
    
    var body: some View {
        let information = getImcResult(result: calculate(userWeight: userWeight, userHeight: userHeight))
        VStack{
            VStack{
                Spacer()
                Text(information.0).font(.title).bold().foregroundColor(.white)
                Spacer()
                Text(String(format:"%.2f",(calculate(userWeight: userWeight, userHeight: userHeight)))).font(.system(size: 80)).bold().foregroundColor(information.2)
                Spacer()
                Text(information.1).font(.title2).foregroundColor(.white).padding()
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundComponent)
            .cornerRadius(16)
            .padding()
        }
        .toolbar{
            ToolbarItem(placement: .principal){
                Text("Tu resultado").bold().foregroundColor(.white)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundApp)
    }
}


func calculate(userWeight:Double, userHeight:Double) -> Double {
    let result = userWeight / ((userHeight/100)*(userHeight/100))
    return result
}

func getImcResult(result:Double) -> (String, String, Color){
    let title:String
    let description:String
    let color:Color
    
    switch result{
    case 0.00...19.99:
        title = "Peso bajo"
        description = "Estás por debajo del peso recomendado según el IMC."
        color = .yellow
    case 20.00...24.99:
        title = "Peso Normal"
        description = "Estás en el peso recomendado según el IMC."
        color = .green
    case 25.00...29.99:
        title = "Sobrepeso"
        description = "Estás por encima del peso recomendado según el IMC."
        color = .orange
    case 30.00...100:
        title = "Obesidad"
        description = "Estás muy por encima del peso recomendado según el IMC."
        color = .red
    default:
        title = "ERROR"
        description = "Ha ocurrido un error"
        color = Color.gray
    }
    
    return (title, description, color)
}

#Preview {
    resultView(userWeight: 86, userHeight: 170)
}
