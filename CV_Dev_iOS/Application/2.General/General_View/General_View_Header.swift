//
//  General_View_Header.swift
//  CV_Dev_iOS
//
//  Created by Quang Tran on 21/03/2022.
//

import SwiftUI

struct General_View_Header: View {
    var body: some View {
        
        HStack(alignment: .center, spacing: 16){
            
            VStack(alignment: .center, spacing: 0){
                
                Image("CV_AVATAR")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 120, alignment: .center)
                
                Spacer()
            }
 
            Spacer()
            
            VStack(alignment: .leading, spacing: 32){
                
                Text("TRAN MINH QUANG")
                    .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                    .font(.custom(Font().Title(), size: Font().Size30()))
                
                Text("Mobile Developer")
                    .foregroundColor(Color(hex: CIManager().TextColor_Pink()))
                    .font(.custom(Font().Bold(), size: Font().Size24()))
                
                //Basic infor
                
                HStack(alignment: .center, spacing: 16){
                    
            

                    VStack(alignment: .leading, spacing: 16) {

                        Text("Birthday")
                            .foregroundColor(Color(hex: CIManager().TextColor_Pink()))
                            .font(.custom(Font().Bold(), size: Font().Size16()))
                        
                        Text("Nationality")
                            .foregroundColor(Color(hex: CIManager().TextColor_Pink()))
                            .font(.custom(Font().Bold(), size: Font().Size16()))
                        
                        Text("Status")
                            .foregroundColor(Color(hex: CIManager().TextColor_Pink()))
                            .font(.custom(Font().Bold(), size: Font().Size16()))

                    }.frame(width: 90, alignment: .leading)
                    
                    

                    VStack(alignment: .leading, spacing: 16) {

                        Text("10 .10 .1998")
                            .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                            .font(.custom(Font().Bold(), size: Font().Size16()))

                        Text("Viet Nam")
                            .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                            .font(.custom(Font().Bold(), size: Font().Size16()))

                        Text("Single")
                            .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                            .font(.custom(Font().Bold(), size: Font().Size16()))
                    }
                }
            }
            
            Spacer()
            
        }.padding(.all, 16)

    }
}
