//
//  ContentView.swift
//  AR Skateboard
//
//  Created by Aleksey Libin on 17.02.2023.
//

import SwiftUI

struct ContentView: View {
  
  @State private var colors: [Color] = [ .green, .red, .blue ]
  
    var body: some View {
      CustomARViewRepresentable()
        .ignoresSafeArea()
        .overlay(alignment: .bottom) {
          ScrollView(.horizontal) {
            HStack {
              Button {
                ARManager.shared.actionStream.send(.removeAllAnchors)
              } label: {
                Image(systemName: "trash")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 40, height: 40)
                  .padding()
                  .backgroundStyle(.regularMaterial)
                  .cornerRadius(16)
              }
              
              ForEach(colors, id: \.self) { color in
                Button {
                  ARManager.shared.actionStream.send(.placeBlock(color: color))
                } label: {
                  color
                    .frame(width: 40, height: 40)
                    .padding()
                    .backgroundStyle(.regularMaterial)
                    .cornerRadius(16)
                }
              }
            }
            .padding()
          }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
