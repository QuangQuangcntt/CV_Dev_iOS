//
//  Tabbar_Custom_Contact.swift
//  CV_Dev_iOS
//
//  Created by Quang Tran on 21/03/2022.
//

import SwiftUI

struct Tabbar_Custom_Contact: View {
    
    @ObservedObject var selectType: tabbarState
    
    @State var isContact: Bool = false
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0){
            if isContact {
                Image("Contact_icon_Active")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 24, height: 24, alignment: .center)
                    .padding(.bottom, 8)
            }
            else{
                Image("Contact_icon_inActive")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 24, height: 24, alignment: .center)
                    .padding(.bottom, 8)
            }
            
            Text("Contact")
                .foregroundColor(Color(hex: isContact ? 0xF5B433 : 0x231f20))
                .font(.custom(isContact ? Font().Bold() : Font().Regular(), size: Font().Size11()))
            
        }
        .onReceive(self.selectType.$click){ value in
            //ios 14 need this
            if value == .Contact{
                isContact = true
            }
            else{
                isContact = false
            }
        }
    }
}
