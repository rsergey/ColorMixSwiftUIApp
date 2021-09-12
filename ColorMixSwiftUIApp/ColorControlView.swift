//
//  ColorControlView.swift
//  ColorMixSwiftUIApp
//
//  Created by Sergey on 10.09.2021.
//

import SwiftUI

struct ColorControlView: View {
    let color: Color
    
    @Binding var sliderValue: Double
    
    @State private var text = ""
    @State private var alertPresented = false
    
    var body: some View {
        HStack(spacing: 15) {
            Text("\(lround(sliderValue))")
                .foregroundColor(.white)
                .frame(width: 35, alignment: .leading)
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .accentColor(color)
            TextField("\(lround(sliderValue))", text: $text) { (editing) in
                if editing {
                    text = ""
                } else {
                    checkForNumber()
                }
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .multilineTextAlignment(.trailing)
            .frame(width: 55)
            .keyboardType(.numbersAndPunctuation)
            .alert(isPresented: $alertPresented) {
                Alert(title: Text("Wrong format!"),
                      message: Text("Only numbers from 0 to 255. Try again."))
            }
        }
        .padding(.horizontal)
    }
    
    private func checkForNumber() {
        guard let value = Double(text) else {
            text = "\(lround(sliderValue))"
            alertPresented.toggle()
            return
        }
        if value >= 0, value <= 255 {
            sliderValue = value
            text = "\(lround(sliderValue))"
        } else {
            text = "\(lround(sliderValue))"
            alertPresented.toggle()
        }
    }
}

struct ColorControlView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))
                .ignoresSafeArea()
            ColorControlView(color: .green, sliderValue: .constant(100))
        }
    }
}
