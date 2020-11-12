//
//  MainView.swift
//  AnythingTurningBoard
//
//  Created by 이규현 on 2020/11/09.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var locationManager = LocationManager()
    //MARK: viewModel
//    @ObservedObject var viewModel = PokemonListViewModel()
    var latitude: String  { return("\(locationManager.location?.coordinate.latitude ?? 0)") }
    var longitude: String { return("\(locationManager.location?.coordinate.longitude ?? 0)") }
    var placemark: String { return("\(locationManager.placemark?.description ?? "XXX")") }
    var status: String    { return("\(locationManager.status)") }
    
    var body: some View {
        
        
        ProgressView()
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
