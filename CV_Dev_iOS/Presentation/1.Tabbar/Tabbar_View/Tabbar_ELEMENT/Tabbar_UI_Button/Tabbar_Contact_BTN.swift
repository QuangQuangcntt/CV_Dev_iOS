//
//  Tabbar_Custom_Contact.swift
//  CV_Dev_iOS
//
//  Created by Quang Tran on 21/03/2022.
//

import SwiftUI

struct Tabbar_Contact_BTN: View {
    
    @ObservedObject var TABBAR: tabbarState
    
    @State var isContact: Bool = false
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0){
            ZStack(alignment: .center){
                Image("Contact_icon_Active")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 24, height: 24, alignment: .center)
                    .padding(.bottom, 8)
                    .opacity(isContact ? 1 : 0)
                
                Image("Contact_icon_inActive")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 24, height: 24, alignment: .center)
                    .padding(.bottom, 8)
                    .opacity(isContact ? 0 : 1)
            }

            Text("Contact_Tabbar", bundle: settings.bundle)
                .foregroundColor(Color(hex: isContact ? 0xF5B433 : 0x231f20))
                .font(.custom(isContact ? Font().Bold() : Font().Regular(),
                              size: Font().Size11()))
            
        }
        .onReceive(self.TABBAR.$click, perform: { value in
            if value == .Contact {
                isContact = true
            }
            else {
                isContact = false
            }
        })
    }
}
