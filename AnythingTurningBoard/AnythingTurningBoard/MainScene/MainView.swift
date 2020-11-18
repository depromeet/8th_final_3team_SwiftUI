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
    @State private var isTest: Bool = false
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                // 세이프 영역을 위 아래를 무시하고 전체를 블랙으로
//                Color.init(red: 20/255, green: 20/255, blue: 20/255)
//                    .background(Color.black).edgesIgnoringSafeArea([.top, .bottom])
                
                // View가 포함된 부모뷰(컨테이너)의 크기 반환 MainView의 경우 HostingController니깐 디바이스 사이즈
                // container.size == (375, 734) XS모델 safeArea 기준
                GeometryReader { container in
                    
                    VStack(spacing: 0) {
                        
                        LocationView()
                            .frame(height: 44)
                        
                        NamingView()
                            .frame(width: UIScreen.main.bounds.width, height: floor(UIScreen.main.bounds.width * 0.458666666666667))
                        
                        RouletteView() // 375, 325 여백은 21
                            .frame(width: UIScreen.main.bounds.width, height: floor(UIScreen.main.bounds.width * 0.866666666666667))
                        
                        Spacer(minLength: 21)
                        
                        CategoryView()
                            .frame(width: UIScreen.main.bounds.width, height: floor(UIScreen.main.bounds.width * 0.549333333333333))
                    }
                }
            }
            
            
            //TODO: Why? NavigationView {} 밖이 아니고 안에 선언해야 먹히는거지?
            .navigationBarHidden(true)
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
