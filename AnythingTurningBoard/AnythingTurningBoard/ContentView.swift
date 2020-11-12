//
//  ContentView.swift
//  AnythingTurningBoard
//
//  Created by 이규현 on 2020/10/24.
//

import SwiftUI

struct SpiroSquare: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let rotations = 5
        let amount = .pi / CGFloat(rotations)
        let transform = CGAffineTransform(rotationAngle: amount)

        for _ in 0 ..< rotations {
            path = path.applying(transform)

            path.addRect(CGRect(x: -rect.width / 2, y: -rect.height / 2, width: rect.width, height: rect.height))
        }

        return path
    }
}

struct ContentView: View {
    
    @State private var isStart = false
    
    var body: some View {
        VStack {
//            Text("Hello, world!")
//                .padding()
//
//            Button(action: {
//                self.isStart.toggle()
//            }, label: {
//                Text("Button")
//            })
            SpiroSquare()
                       .stroke()
                       .frame(width: 200, height: 200)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
