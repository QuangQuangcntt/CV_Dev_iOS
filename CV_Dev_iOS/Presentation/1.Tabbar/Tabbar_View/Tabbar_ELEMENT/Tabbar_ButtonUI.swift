//
//  Tabbar_ButtonUI.swift
//  CV_Quang_IOS
//
//  Created by Quang Tran on 11/01/2023.
//

import SwiftUI

struct Tabbar_ButtonUI: View {
    
    @ObservedObject var TABBAR: tabbarState
    
    @EnvironmentObject var monitor: Monitor_Internet
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0){
            
            Spacer()
            
            ZStack(alignment: .center){
                
                CustomShape()
                    .foregroundColor(Color(hex: 0xf2f2f2))
                    .background(Color.clear)
                    .frame(width: WV, height: 80, alignment: .center)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                    .shadow(color: .gray, radius: 5)
                
                Tabbar_Project_UI()

                HStack(alignment: .center, spacing: 0){
                    
                    Spacer()
                        .frame(width: WV / 6, alignment: .center)

                    //MARK: - HOME
                    Button{
                        withAnimation(.linear) {
                            TABBAR.click = .Home
                        }
                    }label: {
                        Tabbar_Home_BTN(TABBAR: TABBAR)
                    }


                    //MARK: - PROJECT
                    Button{
                        withAnimation(.linear) {
                            TABBAR.click = .Project
                        }
                    }label: {
                        Tabbar_Project_BTN(TABBAR: TABBAR)
                    }
                    
            

                    //MARK: - CONTACT
                    Button{
                        withAnimation(.linear) {
                            TABBAR.click = .Contact
                        }
                    }label: {
                        Tabbar_Contact_BTN(TABBAR: TABBAR)
                    }

                    Spacer()
                        .frame(width: WV / 6, alignment: .center)

                }.padding(.top, 12).padding(.bottom, 20)
                .frame(width: WV, height: 76, alignment: .center)
                .background(Color.clear)
                .cornerRadius(20, corners: [.topLeft, .topRight])

            }
        }
    }
}

