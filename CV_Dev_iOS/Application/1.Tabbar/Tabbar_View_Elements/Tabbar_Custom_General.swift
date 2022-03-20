//
//  Tabbar_Custom_Home.swift
//  CV_Dev_iOS
//
//  Created by Quang Tran on 21/03/2022.
//

import SwiftUI

struct Tabbar_Custom_General: View {
    
    @ObservedObject var selectType: tabbarState
    
    @State var isGeneral: Bool = true
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0){
            
            //avoid bug fade UI when click again
            ZStack(alignment: .center){
                
                Image("Home_icon_Active")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 24, height: 24, alignment: .center)
                    .opacity(isGeneral ? 1 : 0)
                
                Image("Home_icon_inActive")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 24, height: 24, alignment: .center)
                    .opacity(isGeneral ? 0 : 1)
            }

            Text("General")
                .foregroundColor(Color(hex: isGeneral ? 0xF5B433 : 0x231f20))
                .font(.custom(Font().Regular(), size: Font().Size11()))
                .padding(.top, 8)
            
        }
        .onReceive(self.selectType.$click){ value in
            //ios 14 need this
            if value == .General{
                isGeneral = true
            }
            else{
                isGeneral = false
            }
        }
        
        Spacer()
    }
}
