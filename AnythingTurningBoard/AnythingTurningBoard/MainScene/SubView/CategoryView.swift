//
//  CategoryView.swift
//  AnythingTurningBoard
//
//  Created by 이규현 on 2020/11/16.
//

import SwiftUI

struct CategoryView: View {
    
    @EnvironmentObject private var viewModel: SplashViewModel
    @StateObject private var locationManager = LocationManager()
    
    @State var isSheet = false
    @State var distance = 250
    
    var body: some View {
        Group {
            VStack {
                HStack {
                    Button(action: {
                        
                    }, label: {
                        Text("바로가기")
                            .foregroundColor(.white)
                            .font(.custom("AppleSDGothicNeo-Bold", size: 18))
                            .frame(height: 22)
                    })
                    
                    Spacer(minLength: 172)
                    
                    Button(action: {
                        self.isSheet = true
                    }, label: {
                        Text("도보 \(distanceToMin(distance)) 거리")
                            .foregroundColor(.white)
                            .underline(true, color: .white)
                            .font(.custom("AppleSDGothicNeo-Bold", size: 14))
                            .frame(height: 22)
                        Image("icDown")
                    })
                    .actionSheet(isPresented: $isSheet, content: actionSheet)
                }
                
                HStack(alignment: .center, spacing: .zero) {
                    Button(action: {
                        
                    }, label: {
                        Image("icKorea")
                            .padding(.top, 7)
                            .padding(.leading, 8)
                            .padding(.bottom, 7)
                        Text("\(viewModel.model[0].meta?.totalCount ?? 0)개")
                            .padding(.top, 8)
                            .padding(.trailing, 16)
                            .padding(.bottom, 8)
                            .foregroundColor(.white)
                            .font(.custom("AppleSDGothicNeo-Medium", size: 14))
                            .lineLimit(1)
                            .multilineTextAlignment(.trailing)
                            .frame(height: 24)
                    })
                    .padding(.leading, 0)
                    
                    .background(Color(red: 60/255, green: 60/255, blue: 60/255, opacity: 0.5))
                    .cornerRadius(8)
                    
                    //MARK:
                    Button(action: {
                        
                    }, label: {
                        Image("icChina")
                            .padding(.top, 7)
                            .padding(.leading, 8)
                            .padding(.bottom, 7)
                        Text("\(viewModel.model[1].meta?.totalCount ?? 0)개")
                            .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 16))
                            .foregroundColor(.white)
                            .font(.custom("AppleSDGothicNeo-Medium", size: 14))
                            .lineLimit(1)
                            .multilineTextAlignment(.trailing)
                            .frame(width: 43, height: 24)
                    })
                    .background(Color(red: 60/255, green: 60/255, blue: 60/255, opacity: 0.5))
                    .cornerRadius(8)
                    .padding(.leading, 10)
                    
                    Button(action: {
                        
                    }, label: {
                        Image("icJapan")
                            .padding(.top, 7)
                            .padding(.leading, 8)
                            .padding(.bottom, 7)
                        
                        Text("\(viewModel.model[2].meta?.totalCount ?? 0)개")
                            .padding(.top, 8)
                            .padding(.trailing, 16)
                            .padding(.bottom, 8)
                            .foregroundColor(.white)
                            .font(.custom("AppleSDGothicNeo-Medium", size: 14))
                            .lineLimit(1)
                            .multilineTextAlignment(.trailing)
                            .frame(height: 24)
                    })
                    .background(Color(red: 60/255, green: 60/255, blue: 60/255, opacity: 0.5))
                    .cornerRadius(8)
                    .padding(.leading, 10)
                    .padding(.trailing, 0)
                    
                    //                    .frame(width: 105, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                //                .padding(.top, 23)
                //                .frame(width: 335, height: 40, alignment: .center)
                
                
                HStack(alignment: .center, spacing: 10) {
                    Button(action: {
                        
                    }, label: {
                        Image("icWesturn")
                            .padding(.top, 7)
                            .padding(.leading, 8)
                            .padding(.bottom, 7)
                        
                        Text("\(viewModel.model[3].meta?.totalCount ?? 0)개")
                            .padding(.top, 8)
                            .padding(.trailing, 16)
                            .padding(.bottom, 8)
                            .foregroundColor(.white)
                            .font(.custom("AppleSDGothicNeo-Medium", size: 14))
                            .lineLimit(1)
                            .multilineTextAlignment(.trailing)
                            .frame(height: 24)
                    })
                    .background(Color(red: 60/255, green: 60/255, blue: 60/255, opacity: 0.5))
                    .cornerRadius(8)
                    .padding(.leading, 10)
                    .padding(.trailing, 0)
                    
                    //MARK:
                    Button(action: {
                        
                    }, label: {
                        Image("icSchollfood")
                            .padding(.top, 7)
                            .padding(.leading, 8)
                            .padding(.bottom, 7)
                        
                        Text("\(viewModel.model[4].meta?.totalCount ?? 0)개")
                            .padding(.top, 8)
                            .padding(.trailing, 16)
                            .padding(.bottom, 8)
                            .foregroundColor(.white)
                            .font(.custom("AppleSDGothicNeo-Medium", size: 14))
                            .lineLimit(1)
                            .multilineTextAlignment(.trailing)
                            .frame(height: 24)
                    })
                    .background(Color(red: 60/255, green: 60/255, blue: 60/255, opacity: 0.5))
                    .cornerRadius(8)
                    .padding(.leading, 10)
                    .padding(.trailing, 0)
                    
                    Button(action: {
                        
                    }, label: {
                        Image("icTaco")
                            .padding(.top, 7)
                            .padding(.leading, 8)
                            .padding(.bottom, 7)
                        
                        Text("\(viewModel.model[2].meta?.totalCount ?? 0)개")
                            .padding(.top, 8)
                            .padding(.trailing, 16)
                            .padding(.bottom, 8)
                            .foregroundColor(.white)
                            .font(.custom("AppleSDGothicNeo-Medium", size: 14))
                            .lineLimit(1)
                            .multilineTextAlignment(.trailing)
                            .frame(height: 24)
                    })
                    .background(Color(red: 60/255, green: 60/255, blue: 60/255, opacity: 0.5))
                    .cornerRadius(8)
                    .padding(.leading, 10)
                    .padding(.trailing, 0)
                }
            }
            .background(Color.black)
            
        }
    }
    
    private func distanceToMin(_ distance: Int) -> String {
        
        switch distance {
        case 250: return "5분"
        case 500: return "10분"
        case 1_000: return "20분"
        case 1_500: return "30분"
        default: return ""
        }
    }
    
    private func actionSheet() -> ActionSheet {
        
        let button1 = ActionSheet.Button.default(Text("도보 5분 거리")) {
            let lat = locationManager.coordinate?.latitude
            let lon = locationManager.coordinate?.longitude
            self.distance = 250
        }
        
        let button2 = ActionSheet.Button.default(Text("도보 10분 거리")) {
            self.distance = 500
        }
        
        let button3 = ActionSheet.Button.default(Text("도보 20분 거리")) {
            self.distance = 1_000
        }
        
        let button4 = ActionSheet.Button.default(Text("도보 30분 거리")) {
            self.distance = 1_500
        }
        
        let actionSheet = ActionSheet(title: Text(""),
                                      message: nil,
                                      buttons: [button1, button2, button3, button4])
        return actionSheet
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
