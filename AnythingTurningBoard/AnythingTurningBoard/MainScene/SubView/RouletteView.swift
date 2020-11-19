//
//  RouletteView.swift
//  AnythingTurningBoard
//
//  Created by 이규현 on 2020/11/16.
//

import SwiftUI
import Combine


struct ShapeTest: Shape {
    @State var cnt: Int
    
    // 원 사이의 간격은 14로 고정 합시당
    func path(in rect: CGRect) -> Path {
        
//        let (x, y, width, height) = rect
        let center = CGPoint(x: rect.size.width / 2, y: rect.size.height / 2)
        
        var p = Path()
        
        cnt = 2
        
        switch cnt {
        case 2: break
            p.move(to: center)
//            p.move(to: <#T##CGPoint#>)
            
//            p.addArc(center: CGPoint(x: rect.size.width / 2, y: rect.size.height / 2), radius: rect.size.width / 2 - (25 + 25), startAngle: .degrees(300 + 3), endAngle: .degrees(360 - 3), clockwise: false)
//            p.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
//            p.closeSubpath()
            
        default:
            break
            
        }
        return p//.strokedPath(.init(lineWidth: 3, dash: [5, 3], dashPhase: 10))
    }
}

struct ShapeTwoLeft: Shape {
    func path(in rect: CGRect) -> Path {
        
        //        let (x, y, width, height) = rect
        let center = CGPoint(x: rect.size.width / 2, y: rect.size.height / 2)
        
        var p = Path()
        
        p.move(to: CGPoint(x: center.x - 5, y: center.y))
        p.addLine(to: CGPoint(x: p.currentPoint!.x, y: rect.minY + 25))
        p.addQuadCurve(to: CGPoint(x: p.currentPoint!.x - 10, y: rect.minY), control: CGPoint(x: p.currentPoint!.x - 10, y: rect.minY))
        
        return p.strokedPath(.init(lineWidth: 3, dash: [5, 3], dashPhase: 10))
    }
}

struct ShapeTwoRight: Shape {
    func path(in rect: CGRect) -> Path {
        
        //        let (x, y, width, height) = rect
        let center = CGPoint(x: rect.size.width / 2, y: rect.size.height / 2)
        
        var p = Path()
        
        p.move(to: CGPoint(x: center.x + 5, y: center.y))
        p.addLine(to: CGPoint(x: p.currentPoint!.x, y: rect.minY))
//        p.addQuadCurve(to: CGPoint(x: p.., y: <#T##CGFloat#>), control: <#T##CGPoint#>)
        
        return p.strokedPath(.init(lineWidth: 3, dash: [5, 3], dashPhase: 10))
    }
}

struct ShapeSix1: Shape {
    func path(in rect: CGRect) -> Path {
        // 센터 위치 잡는거만 넣으면 됨
        
        
        //        let (x, y, width, height) = rect
        let center = CGPoint(x: rect.size.width / 2, y: rect.size.height / 2)
        
        var p = Path()
        
        p.move(to: CGPoint(x: center.x, y: center.y ))
        // 반지름 - 30.  빗변 구하면
        p.addLine(to: CGPoint(x: p.currentPoint!.x, y: rect.minY + 30))
        p.move(to: CGPoint(x: center.x, y: center.y ))
        p.addLine(to: CGPoint(x: p.currentPoint!.x + 120, y: rect.minY + 30))
        //addLine 하면 나면 대입한 포지션이 currentPoint 최종값임
        // 18.5 높고 6.35 안쪽으로
//        p.addLine(to: CGPoint(x: p.currentPoint!.x + 6.35, y: p.currentPoint!.y - 18.5))
//        p.addQuadCurve(to: CGPoint(x: p.currentPoint!.x + 6.35, y: p.currentPoint!.y - 18.5),
//                       control: CGPoint(x: p.currentPoint!.x - 6.35, y: rect.minY + 16))//21.45))//p.currentPoint!.x - 6.35, y: rect.minY - 12.2))
//        p.addQuadCurve(to: CGPoint(x: p.., y: <#T##CGFloat#>), control: <#T##CGPoint#>)
        
//        p.addRoundedRect(in: CGRect(origin: p.currentPoint!, size: CGSize(width: 10, height: 10)), cornerSize: CGSize(width: 2, height: 2))
        
        return p.strokedPath(.init(lineWidth: 3))
    }
}

struct SpiroSquare: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let rotations = 1
        let amount = .pi / CGFloat(rotations)
        let transform = CGAffineTransform(rotationAngle: amount)

        for _ in 0 ..< rotations {
            path = path.applying(transform)

            path.addRect(CGRect(x: -rect.width / 2, y: -rect.height / 2, width: rect.width, height: rect.height))
        }

        return path
    }
}

struct RouletteView: View {
    
    // init 함수
    @Binding var count: Int
    
    @State private var isPressed = false
    //    @State private var
    
    var body: some View {
        ZStack {
//            ShapeSix1()
            
            SpiroSquare()
                .stroke()
                .frame(width: 200, height: 200)
//            ShapeTwoLeft()
//            ShapeTwoRight()
        }
    }
}




/*
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
 .hidden()
 
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
 */
