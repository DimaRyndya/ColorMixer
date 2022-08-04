//
//  ContentView.swift
//  ColorMixer
//
//  Created by Dmitriy Ryndya on 04.08.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var redColorValue: Double = 0.0
    @State private var greenColorValue: Double = 0.0
    @State private var blueColorValue: Double = 0.0
    var body: some View {
        ZStack {
            Color(red: 0 / 255, green: 40 / 255, blue: 255 / 250, opacity: 0.75)
                .ignoresSafeArea()
            VStack() {
                DisplayView()
                    .foregroundColor(Color(red: redColorValue / 255, green: greenColorValue / 255, blue: blueColorValue / 255))
                SliderView(value: $redColorValue, sliderColor: .red)
                SliderView(value: $greenColorValue, sliderColor: .green)
                SliderView(value: $blueColorValue, sliderColor: .blue)
            Spacer()
            }
        }
    }
}

struct DisplayView: View {
    var body: some View {
        Rectangle()
            .frame(width: 330, height: 200)
            .cornerRadius(15)
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.white, lineWidth: 4))
            .shadow(color: .gray, radius: 5, x: 1, y: 1)
            .padding()
        }
    }

struct SliderView: View {
    @Binding var value: Double
    @State private var typedSliderValue = ""
    var sliderColor: Color
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .foregroundColor(.black)
                .frame(width: 35, height: 35)
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(sliderColor)
            TextField("", text: $typedSliderValue)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 50, height: 50)
        }
        .padding(EdgeInsets(top: 1, leading: 16, bottom: 1, trailing: 16))
    }
    
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
