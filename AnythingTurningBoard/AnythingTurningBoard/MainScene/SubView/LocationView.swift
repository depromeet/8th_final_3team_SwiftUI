//
//  LocationView.swift
//  AnythingTurningBoard
//
//  Created by 이규현 on 2020/11/16.
//

import SwiftUI

struct LocationView: View {
    
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        HStack {
            Button(action: {
                //action
            }) {
                Text("네모")
            }
            
            Spacer(minLength: 55)
            
            Button(action: {
                //action
            }) {
                Text("\(locationManager.placemark ?? "")")
                    .foregroundColor(.white)
                    .font(.custom("AppleSDGothicNeo-Medium", size: 16))
//                    .fontWeight(.medium)
                    .lineLimit(3)
                    .multilineTextAlignment(.center)
            }
//            frame(width: .infinity, height: 24, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Spacer(minLength: 55)
            
            Button(action: {
                //action
            }) {
                Text("네모")
            }
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
