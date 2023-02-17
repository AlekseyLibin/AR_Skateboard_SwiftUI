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
              Button("Place") {
                ARManager.shared.actionStream.send(.placeSkateboard)
              }
                .frame(width: 50, height: 50)
                .font(.system(size: 20))
                .padding()
                .background(.regularMaterial)
                .cornerRadius(16)
              
              Button("360º") {
                ARManager.shared.actionStream.send(.playSkateboardAnimation)
              }
                .frame(width: 50, height: 50)
                .font(.system(size: 20))
                .padding()
                .background(.regularMaterial)
                .cornerRadius(16)
              
              Button {
                ARManager.shared.actionStream.send(.removeAllAnchors)
              } label: {
                Image(systemName: "trash")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 50, height: 50)
                  .padding()
                  .background(.regularMaterial)
                  .cornerRadius(16)
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
