//
//  KaKaoMap.swift
//  AnythingTurningBoard
//
//  Created by 이규현 on 2020/11/09.
//

import SwiftUI
import UIKit

struct KakaoMapView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> MTMapView {
        let view = MTMapView(frame: .zero)
        view.setZoomLevel(MTMapZoomLevel(1.0), animated: false)
        view.showCurrentLocationMarker = true
        view.currentLocationTrackingMode = .onWithoutHeading
//        view.addCircle(circle())
        
        return view
    }
    
    func circle() -> MTMapCircle {
        let circ = MTMapCircle()
        circ.circleCenterPoint = MTMapPoint(geoCoord:
            MTMapPointGeo(latitude: 37.537229, longitude: 127.005515)
        )
        circ.circleRadius = 500.0
        circ.circleLineColor = UIColor.red
        circ.circleLineWidth = 5
        circ.circleFillColor = UIColor.yellow
        circ.tag = 1
        
        return circ
    }
    
    func updateUIView(_ uiView: MTMapView, context: Context) {}
    
    func test() {
        
        print("24kl23kl2k3")
        
    }
}
