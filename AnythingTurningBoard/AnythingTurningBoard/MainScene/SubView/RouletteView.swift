//
//  RouletteView.swift
//  AnythingTurningBoard
//
//  Created by 이규현 on 2020/11/16.
//

import SwiftUI
import Combine

struct RouletteView: View {
    
    @State private var isPressed = false
//    @State private var
    
    var body: some View {
        
        GeometryReader { gp in
            ZStack {
                Color.init(red: 237/255, green: 237/255, blue: 237/255, opacity: 1.0)
                    .edgesIgnoringSafeArea(.all)
                
                ShapeOne()
                    .fill(Color.white)
                    .position(x: gp.size.width / 2 , y: gp.size.height / 2)
                    .overlay( VStack(spacing: .zero) {
                        Image("icKoreaBl44Pt")
                        Text("한식")
                    }.offset(x: 0, y: -76.5 - 19))
                ShapeTwo()
                    .fill(Color.white)
                    .position(x: gp.size.width / 2 , y: gp.size.height / 2)
                    .overlay( VStack(spacing: .zero) {
                        Image("icChinaBl44Pt")
                        Text("중식")
                    }.offset(x: 55 + 24.5, y: -34.5 - 19))
                
                ShapeThree()
                    .fill(Color.white)
                    .position(x: gp.size.width / 2 , y: gp.size.height / 2)
                    .overlay( VStack(spacing: .zero) {
                        Image("icJapanBl44Pt")
                        Text("일식")
                    }.offset(x: 55 + 24.5, y: 16.5 + 30.5))
                
                ShapeFour()
                    .fill(Color.white)
                    .position(x: gp.size.width / 2 , y: gp.size.height / 2)
                    .overlay( VStack(spacing: .zero) {
                        Image("icWesturnBl44Pt")
                        Text("양식")
                    }.offset(x: 0, y: 76.5 + 19))
                
                ShapeFive()
                    .fill(Color.white)
                    .position(x: gp.size.width / 2 , y: gp.size.height / 2)
                    .overlay( VStack(spacing: .zero) {
                        Image("icSchollfoodBl44Pt")
                        Text("분식")
                    }.offset(x: -55 - 24.5, y: 16.5 + 30.5))
                
                ShapeSix()
                    .fill(Color.white)
                    .position(x: gp.size.width / 2 , y: gp.size.height / 2)
                    .overlay( VStack(spacing: .zero) {
                        Image("icTacoBl44Pt")
                        Text("그외")
                    }.offset(x: -55 - 24.5, y: -34.5 - 19))
                
                Button(action: {
                    self.isPressed.toggle()
                }, label: {
                    Image(self.isPressed == false ? "btnStartVariant3" : "btnStart")
                })
                .position(x: gp.size.width / 2 , y: gp.size.height / 2)
                
            }
        }
    }
    
    // MARK: 서브 뷰
    struct Test: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
            
            return path
        }
    }
    
    struct Arc: InsettableShape { //Shape {
        var startAngle: Angle
        var endAngle: Angle
        var clockwise: Bool // true == 호, false == 반대
        var insetAmount: CGFloat = 0
        var gp: GeometryProxy
        //    var g
        
        func path(in rect: CGRect) -> Path {
            let rotationAdjustment = Angle.degrees(90)
            let modifiedStart = startAngle - rotationAdjustment
            let modifiedEnd = endAngle - rotationAdjustment
            let centerX = gp.size.width / 2
            let centerY = gp.size.height / 2
            
            var path = Path()
            
            path.addArc(center: CGPoint(x: centerX, y: centerY), radius: rect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
            //        path.addArc(center: CGPoint(x: centerX, y: centerY), radius: rect.width / 2 - (25 + 25), startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: clockwise)
            
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
    
            
            return path
        }
        
        func inset(by amount: CGFloat) -> some InsettableShape {
            var arc = self
            arc.insetAmount += amount
            return arc
        }
    }
    
    
    // https://stackoverflow.com/questions/56760335/round-specific-corners-swiftui
    // 240 - 300
    struct ShapeOne: Shape {
        func path(in rect: CGRect) -> Path {
            var p = Path()
            
            p.addArc(center: CGPoint(x: rect.size.width / 2, y: rect.size.height / 2), radius: rect.size.width / 2 - (25 + 25), startAngle: .degrees(240 + 3), endAngle: .degrees(300 - 3), clockwise: false)
            p.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
            p.closeSubpath()
            //            p.fill(Color.white)
            return p //.strokedPath(.init(lineWidth: 3, dash: [5, 3], dashPhase: 10))
        }
    }
    
    // 300 - 0
    struct ShapeTwo: Shape {
        func path(in rect: CGRect) -> Path {
            var p = Path()
            
            p.addArc(center: CGPoint(x: rect.size.width / 2, y: rect.size.height / 2), radius: rect.size.width / 2 - (25 + 25), startAngle: .degrees(300 + 3), endAngle: .degrees(360 - 3), clockwise: false)
            p.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
            p.closeSubpath()
            return p//.strokedPath(.init(lineWidth: 3, dash: [5, 3], dashPhase: 10))
        }
    }
    
    // 0 - 60
    struct ShapeThree: Shape {
        func path(in rect: CGRect) -> Path {
            var p = Path()
            
            p.addArc(center: CGPoint(x: rect.size.width / 2, y: rect.size.height / 2), radius: rect.size.width / 2 - (25 + 25), startAngle: .degrees(0 + 3), endAngle: .degrees(60 - 3), clockwise: false)
            p.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
            p.closeSubpath()
            return p //.strokedPath(.init(lineWidth: 3, dash: [5, 3], dashPhase: 10))
        }
    }
    
    // 60 - 120
    struct ShapeFour: Shape {
        func path(in rect: CGRect) -> Path {
            var p = Path()
            
            p.addArc(center: CGPoint(x: rect.size.width / 2, y: rect.size.height / 2), radius: rect.size.width / 2 - (25 + 25), startAngle: .degrees(60 + 3), endAngle: .degrees(120 - 3), clockwise: false)
            p.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
            p.closeSubpath()
            return p//.strokedPath(.init(lineWidth: 3, dash: [5, 3], dashPhase: 10))
        }
    }
    
    // 120 - 180
    struct ShapeFive: Shape {
        func path(in rect: CGRect) -> Path {
            var p = Path()
            
            p.addArc(center: CGPoint(x: rect.size.width / 2, y: rect.size.height / 2), radius: rect.size.width / 2 - (25 + 25), startAngle: .degrees(120 + 3), endAngle: .degrees(180 - 3), clockwise: false)
            p.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
            p.closeSubpath()
            return p //.strokedPath(.init(lineWidth: 3, dash: [5, 3], dashPhase: 10))
        }
    }
    
    // 180 - 240
    struct ShapeSix: Shape {
        func path(in rect: CGRect) -> Path {
            var p = Path()
            p.addArc(center: CGPoint(x: rect.size.width / 2, y: rect.size.height / 2), radius: rect.size.width / 2 - (25 + 25), startAngle: .degrees(180 + 3), endAngle: .degrees(240 - 3), clockwise: false)
            p.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
            p.closeSubpath()
            
            return p //.strokedPath(style)
        }
    }
}

struct RouletteView_Previews: PreviewProvider {
    static var previews: some View {
        RouletteView()
    }
}
