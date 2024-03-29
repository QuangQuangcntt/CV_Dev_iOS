//
//  General_View_Header.swift
//  CV_Dev_iOS
//
//  Created by Quang Tran on 21/03/2022.
//

import SwiftUI

extension Home_View {

    var Home_View_Header: some View {
        
        HStack(alignment: .top, spacing: 24){
            
            AsyncImage_Advance(resizeFor: .universal,
                               isLazy: false,
                               url: URL(string: "https://i.imgur.com/yAWSSzv.jpeg") ?? URL(string: "-")!,
                               placeholder: {
                IMG_Indicator()
            })
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100, alignment: .center)
            .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 32){
                
                Text("Home_Name", bundle: settings.bundle)
                    .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                    .font(.custom(Font().Title(), size: Font().Size30()))
                
                Text("Home_Title", bundle: settings.bundle)
                    .foregroundColor(Color(hex: CIManager().TextColor_Pink()))
                    .font(.custom(Font().Bold(), size: Font().Size24()))
                
                //Basic infor
                
                HStack(alignment: .center, spacing: 16){
                    
            

                    VStack(alignment: .leading, spacing: 16) {

                        Text("Home_Birthday", bundle: settings.bundle)
                            .foregroundColor(Color(hex: CIManager().TextColor_Pink()))
                            .font(.custom(Font().Bold(), size: Font().Size16()))
                        
                        Text("Home_Nationality", bundle: settings.bundle)
                            .foregroundColor(Color(hex: CIManager().TextColor_Pink()))
                            .font(.custom(Font().Bold(), size: Font().Size16()))
                        
                        Text("Home_Status_Title", bundle: settings.bundle)
                            .foregroundColor(Color(hex: CIManager().TextColor_Pink()))
                            .font(.custom(Font().Bold(), size: Font().Size16()))

                    }.frame(width: 90, alignment: .leading)
                    
                    

                    VStack(alignment: .leading, spacing: 16) {

                        Text("10 .10 .1998")
                            .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                            .font(.custom(Font().Bold(), size: Font().Size16()))

                        Text("Home_Country", bundle: settings.bundle)
                            .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                            .font(.custom(Font().Bold(), size: Font().Size16()))

                        Text("Home_Status", bundle: settings.bundle)
                            .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                            .font(.custom(Font().Bold(), size: Font().Size16()))
                    }
                }
            }
            
            Spacer()
            
        }.padding(.leading, 16).padding(.vertical, 16)

    }
}
