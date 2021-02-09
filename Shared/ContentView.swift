//
//  ContentView.swift
//  Shared
//
//  Created by feeen q on 8/2/2564 BE.
//

import SwiftUI

struct ContentView: View {
    @State private var displayResult : String = ""
    @State private var displayText : String = "BMI Calculator"
    @State private var isShowAlert = false
    @State private var imageName = "BMI"
    @State private var bmiResults:Double = 0.0
    @State public var weight:Double = 0.0
    @State public var height: Double = 0.0
    @State public var inputWeight = ""
    @State public var inputHeight = ""


    fileprivate func calculate() {
        let formattedBmi = String(format: "%.2f", bmiResults)
        switch bmiResults {
        case let bmi where bmi < Double(18.5):
            displayText = "Underweight"
            imageName = "underweight"
        case let bmi where bmi > Double(18.5) && bmi < Double(24.9):
            displayText = "Normal"
            imageName = "normal"
        case let bmi where bmi > Double(25) && bmi < Double(29.9):
            displayText = "Overweight"
            imageName = "over"
        case let bmi where bmi > Double(30) && bmi < Double(34.9):
            displayText = "Obese"
            imageName = "obese"
        case let bmi where bmi > Double(35):
            displayText = "Extremly obese"
            imageName = "extremly"
        default:
            imageName = ""
        }
        displayResult = "Your BMI is " + String(formattedBmi)
    }
    
    var body: some View {
                    
        VStack (alignment: .center,spacing: 25){
            
            Image(imageName).frame(width: 200, height: 200, alignment: .center)
                .clipShape(Circle())
            Text(displayText)
                .font(.title)
            Text(displayResult)
                .font(.title)
            HStack(alignment: .center){
                Text("Weight : ")
                    .padding(.all)
                TextField("Type your weight ... (kg)", text: $inputWeight)
                    .frame(width: 200.0)
                    .keyboardType(.decimalPad)
            }
            
            HStack(alignment: .center){
                Text("Height : ")
                    .padding(.all)
                    .keyboardType(.numberPad)
                TextField("Type your height ... (cm)", text: $inputHeight)
                    .frame(width: 200.0)
                    .keyboardType(.decimalPad)
            }
            Button(action: {
                if inputWeight.isEmpty || inputHeight.isEmpty {
                    self.isShowAlert = true
                }
                if !inputWeight.isEmpty && !inputHeight.isEmpty {
                    height = (inputHeight as NSString).doubleValue
                    weight = (inputWeight as NSString).doubleValue
                    bmiResults = weight / ((height/100) * (height/100))
                    calculate()
                }
            }, label: {
                Text("Calculator")
            })
            .alert(isPresented: $isShowAlert){
                    Alert(title: Text("Please type your information"))}
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


