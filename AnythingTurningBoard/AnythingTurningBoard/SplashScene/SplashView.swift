//
//  SplashView.swift
//  AnythingTurningBoard
//
//  Created by 이규현 on 2020/11/10.
//

import SwiftUI
import UIKit
import Combine

struct SplashView: View {
    
    // View의 라이프 사이클에 의존 @ObservedObject, 의존 X 싱글톤개념 비스꾸리? @StateObject
    //    @ObservedObject var viewModel = SplashViewModel()
    //EnvironmentObject 모든 뷰에서 접근 가능
    //        @EnvironmentObject var locationManager: LocationManager
    //    @State private var isLocation = false
    
    //    @ObservedObject private var locationManager = LocationManager()
    @EnvironmentObject private var locationManager: LocationManager
    @EnvironmentObject private var viewModel: SplashViewModel
    
    var body: some View {
        
        LottieView()
            .edgesIgnoringSafeArea(.all)
            .frame(
                width: UIScreen.main.bounds.width,
                height: UIScreen.main.bounds.height,
                alignment: .center
            )
            .onReceive(locationManager.$coordinate, perform: { coordinate in
                guard let coordinate = coordinate else { return }
                viewModel.get주변음식점목록(lat: "\(coordinate.latitude)", lng: "\(coordinate.longitude)", radius: 250) { model in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        let window = UIApplication.shared.windows.first
                        window?.rootViewController = UIHostingController(rootView: MainView().environmentObject(viewModel))
                    }
                }
            })
    }
    
    //            if locationManager.location?.coordinate != nil {
    //                print(321031)
    //            }
    
    //                .onAppear(perform: {
    //                    print(latitude)
    //                    print(longitude)
    //
    //                    /*
    //                     - 250m 5분
    //                     - 500m 10분
    //                     - 1,000m 20분
    //                     - 1,500m 30분
    //                     */
    //
    //                    viewModel.get주변음식점목록(lat: latitude, lng: longitude, radius: 500)
    //
    //                    //
    //                    //                    viewModel.nextAction = {
    //                    //                        print("nextAction")
    //
    //                    //                            FullScreenCover(item: $test) {
    //                    //                                MainView(locationManager: nil, viewModel: MainViewModel())
    //                    //                            }
    //
    //                    //                        MainView()
    //
    //                })
    //                .onReceive(viewModel.$nextAction) { b in
    //                    print(b)
    //                }
    
    /*
     .fullScreenCover(isPresented: viewModel.$nextAction) {
     print("dismiss")
     } content: {
     MainView()
     }
     */
    
    //
    //        }
    //    }
    //
    //    func get한식(lng: String, lat: String) -> AnyPublisher<Data, Never> {
    //        let url = URL(string: "https://dapi.kakao.com/v2/local/search/category.json?category_group_code=FD6&page=1&size=15&sort=accuracy&radius=500&x=\(lng)&y=\(lat)")!
    //
    //        let request = URLRequest(url: url)
    //
    //        let cancellable = viewModel.apiSession.request(with: request as! RequestBuilder)
    //            .eraseToAnyPublisher()
    ////
    ////            self.getPokemon(pokemonURL: pokemonListItem.url)
    ////            .sink(receiveCompletion: { (result) in
    ////                print(result)
    ////            }) { (pokemon) in
    ////                self.pokemon = pokemon
    ////                self.getPokemonSprites()
    ////        }
    ////        cancellables.insert(cancellable)
    //
    //
    //        /*
    //         https://dapi.kakao.com/v2/local/search/category.json?category_group_code=FD6&page=1&size=15&sort=accuracy&radius=500&x=126.9786962993293&y=37.5568321698673"
    //         */
    //        return URLSession.shared.dataTaskPublisher(for: url)
    //            .eraseToAnyPublisher()
    //            .map(p)
    //    }
    
    func getPokemon() { }
    
    func LaunchLoginView(){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let appDelegate = UIApplication.shared.windows.first
            print(appDelegate)
            appDelegate?.rootViewController = UIHostingController(rootView: MainView())
        }
        
        //            MainView()
        //        let vContoller = UIHostingController(rootView: MainView())
        //        appDelegate.loadNewRootSwiftUIView(rootViewController: vContoller)
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
