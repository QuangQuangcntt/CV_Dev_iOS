//
//  Tabbar_ButtonUI.swift
//  CV_Dev_iOS
//
//  Created by Quang Tran on 20/03/2022.
//

import SwiftUI

struct Tabbar_ButtonUI: View {
    
    @ObservedObject var selectType: tabbarState
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0){
            
            Spacer()
            
            ZStack(alignment: .center){
                
                CustomShape()
                    .foregroundColor(Color(hex: 0xf2f2f2))
                    .background(Color.clear)
                    .frame(width: WV, height: 80, alignment: .center)
                    .cornerRadius(radius: 20, corners: [.topLeft, .topRight])
                    .shadow(color: .gray, radius: 5)
                
                Tabbar_Project_UI()

                HStack(alignment: .center, spacing: 0){
                    
                    Spacer()
                        .frame(width: WV / 6, alignment: .center)

                    //MARK: - HOME
                    Button{
                        DispatchQueue.main.async {
                            withAnimation(.linear(duration: 0.5)){
                                selectType.click = .General
                            }
                        }
                    }label: {
                        Tabbar_Custom_General(selectType: selectType)
                    }
                    
                   

                    //MARK: - PROJECT
                    Button{
                        DispatchQueue.main.async {
                            withAnimation(.linear(duration: 0.5)){
                                selectType.click = .Project
                            }
                        }

                    }label: {
                        Tabbar_Custom_Project(selectType: selectType)
                    }
                    
            

                    //MARK: - CONTACT
                    Button{
                        DispatchQueue.main.async {
                            withAnimation(.linear(duration: 0.5)){
                                selectType.click = .Contact
                            }
                            
                        }
                    }label: {
                        Tabbar_Custom_Contact(selectType: selectType)
                    }

                    Spacer()
                        .frame(width: WV / 6, alignment: .center)

                }.padding(.top, 12).padding(.bottom, 20)
                .frame(width: WV, height: 76, alignment: .center)
                .background(Color.clear)
                .cornerRadius(radius: 20, corners: [.topLeft, .topRight])

            }
        }
    }
}
