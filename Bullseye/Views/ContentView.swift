
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
    VStack {
      Text("🎯🎯🎯\nPUT THE BULLSEYES AS CLOSE AS YOU CAN TO")
        .bold()
        .multilineTextAlignment(.center)
        .lineSpacing(4.0)
        .font(.footnote)
        .kerning(2.0)
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
      Button("Hit me") {
        alertIsVisible = true
      }
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

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
