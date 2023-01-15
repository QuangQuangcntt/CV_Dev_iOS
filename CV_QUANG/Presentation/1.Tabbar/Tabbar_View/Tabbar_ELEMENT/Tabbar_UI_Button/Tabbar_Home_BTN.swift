//
//  Tabbar_Custom_Home.swift
//  CV_Dev_iOS
//
//  Created by Quang Tran on 21/03/2022.
//

import SwiftUI

struct Tabbar_Home_BTN: View {
    
    @ObservedObject var TABBAR: tabbarState
    
    @State var isHome: Bool = false
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0){
            
            //avoid bug fade UI when click again
            ZStack(alignment: .center){
                
                Image("Home_icon_Active")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 24, height: 24, alignment: .center)
                    .opacity(isHome ? 1 : 0)
                
                Image("Home_icon_inActive")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 24, height: 24, alignment: .center)
                    .opacity(isHome ? 0 : 1)
            }

            Text("Home_Tabbar", bundle: settings.bundle)
                .foregroundColor(Color(hex: isHome ? 0xF5B433 : 0x231f20))
                .font(.custom(isHome ? Font().Bold() : Font().Regular(), size: Font().Size11()))
                .padding(.top, 8)
        }.onReceive(self.TABBAR.$click, perform: { value in
            if value == .Home {
                isHome = true
            }
            else {
                isHome = false
            }
        })
        
        Spacer()
    }
}
