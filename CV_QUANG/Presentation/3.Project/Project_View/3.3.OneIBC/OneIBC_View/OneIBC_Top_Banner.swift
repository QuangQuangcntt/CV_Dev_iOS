//
//  Top_Banner.swift
//  Animation_Large_titleBar
//
//  Created by Quang Tran on 14/01/2023.
//

import SwiftUI

extension OneIBC {
    
    var OneIBC_TopBanner: some View {
        
        VStack(alignment: .center, spacing: 0){
         
            ZStack {
                Rectangle()
                    .foregroundColor(Color.white)
                    .frame(height: 80)
                
                Text("OneIBC")
//                    .font(.custom("", size: txtSIZE))
                    .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                    .font(.custom(Font().Title(), size: 28))
                    .offset(y: 16)
                    .opacity(showSmallTitle ? 1 : 0)

            }
           
            
            
            Spacer()
        }
    }
}
