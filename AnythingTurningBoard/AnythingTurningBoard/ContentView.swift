//
//  ContentView.swift
//  AnythingTurningBoard
//
//  Created by 이규현 on 2020/10/24.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var isStart = false
    
    var body: some View {
        VStack {
            Text("Hello, world!")
//                .padding()
//
//            Button(action: {
//                self.isStart.toggle()
//            }, label: {
//                Text("Button")
//            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
