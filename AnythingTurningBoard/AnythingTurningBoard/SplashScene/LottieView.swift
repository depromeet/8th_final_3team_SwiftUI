//
//  LottieView.swift
//  AnythingTurningBoard
//
//  Created by 이규현 on 2020/11/12.
//

import SwiftUI
import Lottie

//MARK: SwiftUI에서 UIView를 사용하려면 UIViewRepresentable 채택해야함
struct LottieView: UIViewRepresentable {
    // 자꾸 아래 뜨는데 패스하구
    // typealias UIViewType = <#type#>
    
    // SwiftUI에서 생성할 뷰 초기화 메소드?!
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        
        let animationView = AnimationView()
        let animation = Animation.named("sushi_belt")
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        animationView.loopMode = .loop
        
        // 오토레이아웃 설정
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
    // 생성된 LottieView 이놈이 업데이트 될 때마다 호출
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
    }
}
