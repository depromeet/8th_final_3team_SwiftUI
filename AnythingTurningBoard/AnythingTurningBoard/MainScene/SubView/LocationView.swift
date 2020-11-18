//
//  LocationView.swift
//  AnythingTurningBoard
//
//  Created by 이규현 on 2020/11/16.
//

import SwiftUI

struct LocationView: View {
    
    @StateObject private var locationManager = LocationManager()
//    private let currentLocation: 
    
    var body: some View {
        HStack {
            Image("logo")
                .frame(width: 32, height: 32, alignment: .center)
                .padding(.leading, 20.0)
            Spacer()
            
            Button(action: {
                //action
            }) {
                HStack(spacing: 4) {
                    Text("\(locationManager.placemark ?? "")")
                        .foregroundColor(.white)
                        .font(.custom("AppleSDGothicNeo-Medium", size: 16))
                        .lineLimit(1)
                        .border(Color.white, width: 1)
                    Image("icArrowDown")
                }
            }
            
            Spacer()
            NavigationLink(destination: BlackListView()) {
                Image("stop")
                    .frame(width: 32, height: 32, alignment: .center)
                    .padding(.trailing, 20.0)
            }
            
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
