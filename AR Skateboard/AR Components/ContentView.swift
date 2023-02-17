//
//  ContentView.swift
//  AR Skateboard
//
//  Created by Aleksey Libin on 17.02.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      CustomARViewRepresentable()
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
