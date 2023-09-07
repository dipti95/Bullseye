
//
//  ContentView.swift
//  Bullseye
//
//  Created by Dipti Yadav on 9/1/23.
//

import SwiftUI

struct ContentView: View {
  @State private var alertIsVisible = false
  @State private var sliderValue = 50.0
  @State private var game =  Game()
  
  
  var body: some View {
    
    ZStack {
      Color("BackgroundColor")
        .ignoresSafeArea()
      VStack {
          Text("🎯🎯🎯\nPut the Bullseye as close as you can to".uppercased())
            .bold()
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .kerning(2.0)
            .padding(.horizontal, 30)
          Text(String(game.target))
            .kerning(-1)
            .font(.largeTitle)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
          HStack {
            Text("1")
              .bold()
            Slider(value: $sliderValue, in:1.0...100.0)
            Text("100")
              .bold()
          }
          .padding()
          Button("Hit me".uppercased()) {
            alertIsVisible = true
          }
          .padding(20.0)
          .background(
            ZStack {
              Color("ButtonColor")
              LinearGradient(
                gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]),
                startPoint: .top, endPoint: .bottom)
            }
          )
          .foregroundStyle(.white)
          .cornerRadius(21.0)
          .bold()
          .font(.title3)
          .alert(
            "Hello there!",
            isPresented: $alertIsVisible,
            actions: {
              Button("Awesome") {
                print("Alert Closed")
              }
            },
            message: {
              let roundedValue = Int(sliderValue.rounded())
              Text("""
                  The slider's value is \(roundedValue).
                  Your scored \(game.points(sliderValue: roundedValue)) points this
                   round.
                  """)
            }
            
          )
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
