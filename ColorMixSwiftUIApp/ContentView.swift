//
//  ContentView.swift
//  ColorMixSwiftUIApp
//
//  Created by Sergey on 10.09.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var redComponent = Double.random(in: 0...255)
    @State private var greenComponent = Double.random(in: 0...255)
    @State private var blueComponent = Double.random(in: 0...255)
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))
                .ignoresSafeArea()
            VStack(spacing: 25) {
                Color(red: redComponent / 255,
                      green: greenComponent / 255,
                      blue: blueComponent / 255)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.white, lineWidth: 5)
                    )
                    .padding()
                    .aspectRatio(2/1, contentMode: .fit)
                VStack {
                    ColorControlView(color: .red, sliderValue: $redComponent)
                    ColorControlView(color: .green, sliderValue: $greenComponent)
                    ColorControlView(color: .blue, sliderValue: $blueComponent)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
