//
//  Contact_View.swift
//  CV_Dev_iOS
//
//  Created by Quang Tran on 20/03/2022.
//

import SwiftUI

struct Contact_View: View {
    
    //go to rootView
    @EnvironmentObject var appState: AppState
    
    //tabbar state
    @ObservedObject var selectType: tabbarState
    
    enum typeInfor {
        case phone
        case email
        case link
        case address
    }
    
    struct Infor: Hashable {
        var title: String = ""
        var content: String = ""
        var type: typeInfor = .phone
    }
    
    struct inforContact: Hashable {
        var title: String = ""
        var arrInfor_Data: [Infor] = []
    }
    
    @State var arrDataInfor: [inforContact] = []
    
    @Environment(\.openURL) var openURL
    
    var body: some View {

        ScrollView(.vertical, showsIndicators: false) {

            VStack(alignment: .leading, spacing: 24){
                
                //MARK: - BASIC INFOR
                
                ForEach(arrDataInfor, id: \.self){ item in
                    
                    HStack(alignment: .center, spacing: 0){
                        
                        Text(item.title)
                            .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                            .font(.custom(Font().Title(), size: Font().Size24()))
                        
                        Spacer()
                        
                    }.padding(.top, 16)
                    
                    ForEach(item.arrInfor_Data, id: \.self){ sub in
                        
                        HStack(alignment: .center, spacing: 16){
                          
                            if sub.type == .address{
                                Text(sub.title)
                                    .foregroundColor(Color(hex: CIManager().TextColor_Pink()))
                                    .font(.custom(Font().Bold(), size: Font().Size16()))
                                    
                            }
                            else{
                                Button{
                                    
                                    contactAction(type: sub)
                                    
                                }label:{
                                    Text(sub.title)
                                        .foregroundColor(Color.white)
                                        .font(.custom(Font().Italic(), size: Font().Size14()))
                                        .padding(.vertical, 8).padding(.horizontal, 12)
                                        .background(
                                            Color(hex: CIManager().TextColor_Pink())
                                        )
                                        .cornerRadius(20)
                                        .shadow(color: Color(hex: CIManager().TextColor_Pink(), alpha: 0.8), radius: 8, x: 4, y: 4)
                                        .padding(.vertical, 16)
                                }
                                
                            }

                            Spacer()

                            Text(sub.content)
                                .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                                .font(.custom(Font().Bold(), size: Font().Size16()))
                        }
                    }
                    
                }

                
            }.padding(.all, 16).padding(.leading, 8)
        }
        .frame(width: WV, alignment: .center)
        .background(Color(hex: 0xFCFAF7))
        .onAppear(perform: {
            onAppearContactView()
        })
    }
}
