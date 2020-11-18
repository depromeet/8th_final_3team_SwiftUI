//
//  BlackListView.swift
//  AnythingTurningBoard
//
//  Created by 이규현 on 2020/11/18.
//

import SwiftUI

struct BlackListItem: Identifiable {
    var id = UUID() // ??! ObjectIdentifier
    var name: String
}


struct BlackListRow: View {
    
    var model: BlackListItem
    
    var body: some View {
        ZStack {
            
            Color.init(red: 40/255, green: 40/255, blue: 40/255)
            
            HStack {
                Image("btnStart")
                    .frame(width: 64, height: 64)
                    .padding(.leading, 20)
                Spacer()
            }
            
            VStack {
                Text(model.name)
                Text(model.name)
            }
        }
        
    }
}

struct BlackListView: View {
    
    let list: [BlackListItem] = [BlackListItem(name: "111"), BlackListItem(name: "222"), BlackListItem(name: "333")]
    
    var body: some View {
        GeometryReader { container in
            // container height : 734.0 + top 44 + bottom 34 == xs
            ZStack {
                Color(.black)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    CustomNaviBar(title: "블랙리스트 가게")
                        .frame(height: 44, alignment: .center)
                    
                    Spacer()
                    
                    // Identifiable 이 타입이여야함.
                    List(list) { model in
//                        Section
                        BlackListRow(model: model).listRowBackground(Color.black)
                    }
//                    .contents
                    //.background(Color.black)
                    
                }
            }
            
        }
        .navigationBarHidden(true)
    }
}

struct BlackListView_Previews: PreviewProvider {
    static var previews: some View {
        BlackListView()
    }
}
