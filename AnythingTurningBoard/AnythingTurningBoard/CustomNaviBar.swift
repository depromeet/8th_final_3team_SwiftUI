//
//  CustomNaviBar.swift
//  AnythingTurningBoard
//
//  Created by 이규현 on 2020/11/18.
//

import SwiftUI

struct CustomNaviBar: View {
    
    @Environment(\.presentationMode) var presentation
    var title: String
    
    var body: some View {
        GeometryReader { container in
            
            ZStack {
                Color(.black)
                
                HStack {
                    Button(action: {
                        presentation.wrappedValue.dismiss()
                    }) {
                        Image("icArrowLeft24")
                    }.padding(.leading, 20)
                    
                    // 왼쪽 패딩으로 좌측정렬하고 남는 공간은 Spacer로 밀어줘야함.
                    Spacer()
                }
                
                // 가운데 정렬이 기본
                Text(title)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .frame(height: 16, alignment: .center)
                    .font(.custom("AppleSDGothicNeo-Medium", size: 16))
            }
            
        }
    }
}
