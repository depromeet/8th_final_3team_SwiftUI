//
//  MainView.swift
//  AnythingTurningBoard
//
//  Created by 이규현 on 2020/11/09.
//

import SwiftUI
import Combine

struct MainView: View {
    
    @EnvironmentObject private var viewModel: SplashViewModel
    
    var body: some View {
//        self.background(Color.white)
        VStack(spacing: 0) {
            LocationView()
                .background(Color.black)
//                .edgesIgnoringSafeArea(.top)
                .frame(height: 88)
//                .edgesIgnoringSafeArea(.leading)
//                .edgesIgnoringSafeArea(.trailing)

            NamingView()
                .frame(height: 172)
            RouletteView()
                .frame(height: 325)
            CategoryView()
//                .edgesIgnoringSafeArea(.leading).offset(x: 20)
//                .edgesIgnoringSafeArea(.bottom)
//                .edgesIgnoringSafeArea(.trailing).offset(x: -20)
                .frame(height: 206)
        }
        .edgesIgnoringSafeArea(.all)
//        .foregroundColor(.black)
        
//        ProgressView()
    
//            .onAppear(perform: {
////                self.viewModel
//            })
//        NavigationView {
//            VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
//
//                HStack {
//                    Image(systemName: "square.and.pencil")
//                    Text("\(self.latitude)")
//                    Text("\(self.longitude)")
//                    Text("\(self.placemark)")
////                    Button(.) {
////                        print("버튼 액션")
////                    }
//                    .font(.custom("AppleSDGothicNeo-Medium", size: 16))
//                    .foregroundColor(.black)
//
//
//
//                }
//
//                KakaoMapView()
//
//            })
//        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
