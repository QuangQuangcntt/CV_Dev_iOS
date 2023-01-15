//
//  Project_View.swift
//  CV_Quang_IOS
//
//  Created by Quang Tran on 13/01/2023.
//

import SwiftUI

extension Project_View {
    
    var body: some View {
       
        Base_View(content:
                    
            ZStack(alignment: .center){
                
               // snowSpriteKit()
                
                Project_View_GoToScreen(isSecretVault: $isSecretVault,
                                        isKoreanApp: $isKoreanApp,
                                        isDNBCnet: $isDNBCnet,
                                        isOneIBC: $isOneIBC)
                
                ScrollView(.vertical, showsIndicators: false) {

                    VStack(alignment: .leading, spacing: 0){
                        
                        Rectangle()
                            .foregroundColor(Color(hex: CIManager().LineTimeColor()))
                            .frame(width: 2, height: 32, alignment: .center)
                            .padding(.leading, 5)
                        
                        ForEach(arrExperience, id: \.self){ index in
                            
                            HStack(alignment: .center, spacing: 16){
                                
                                Circle()
                                    .foregroundColor(Color(hex: CIManager().dotColor()))
                                    .frame(width: 12, height: 12, alignment: .center)
                                
                                Text(index.time)
                                    .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                                    .font(.custom(Font().MediumItalic(), size: Font().Size16()))
                                    .multilineTextAlignment(.leading)
                                    .fixedSize(horizontal: false, vertical: true)
                                
                                Spacer()
                                
                            }.padding(.vertical, 4)
                            
                            
                            HStack(alignment: .center, spacing: 16){
                                
                                Rectangle()
                                    .foregroundColor(Color(hex: CIManager().LineTimeColor()))
                                    .frame(width: 2, alignment: .center)
                                
                                VStack(alignment: .leading, spacing: 28){
                                    
                                    Spacer()
                                        .frame(height: 4, alignment: .center)
                                    
                                    VStack(alignment: .leading, spacing: 8){
                                        
                                        Text("Company")
                                            .foregroundColor(Color(hex: CIManager().TextColor_Pink()))
                                            .font(.custom(Font().Bold(), size: Font().Size13()))
                                        
                                        Text(index.company)
                                            .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                                            .font(.custom(Font().Bold(), size: Font().Size14()))
                                            .multilineTextAlignment(.leading)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }
                                    
                                    
                                    VStack(alignment: .leading, spacing: 8){
                                        
                                        Text("Position")
                                            .foregroundColor(Color(hex: CIManager().TextColor_Pink()))
                                            .font(.custom(Font().Bold(), size: Font().Size13()))
                                        
                                        Text(index.position)
                                            .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                                            .font(.custom(Font().Bold(), size: Font().Size14()))
                                            .multilineTextAlignment(.leading)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }
                                    
                                    
                                    
                                    VStack(alignment: .leading, spacing: 8){
                                        
                                        Text("Project")
                                            .foregroundColor(Color(hex: CIManager().TextColor_Pink()))
                                            .font(.custom(Font().Bold(), size: Font().Size13()))
                                        
                                         Text(index.Project)
                                            .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                                            .font(.custom(Font().Bold(), size: Font().Size16()))
                                            .multilineTextAlignment(.leading)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }
                                    
                                    
                                    VStack(alignment: .leading, spacing: 8){
                                        
                                        Text("Description")
                                            .foregroundColor(Color(hex: CIManager().TextColor_Pink()))
                                            .font(.custom(Font().Bold(), size: Font().Size13()))
                                        
                                         Text(index.description)
                                            .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                                            .font(.custom(Font().Italic(), size: Font().Size14()))
                                            .multilineTextAlignment(.leading)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }

                                    
                                    Button{
                                        print("View detail project: \(index.Project)")
                                        
                                        goToScreen(project: index.Project)

                                    }label: {
                                        Text("View detail")
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

                                    Spacer()
                                }
                                
                                Spacer()
                                
                            }.padding(.leading, 5)
                        }
                        
                        //Last dot
                        
                        HStack(alignment: .center, spacing: 16){
                            
                            Circle()
                                .foregroundColor(Color(hex: CIManager().dotColor()))
                                .frame(width: 12, height: 12, alignment: .center)
                            
                            Spacer()
                            
                        }.padding(.vertical, 4)
                        
                        //add spacer for avoid tabbar when scroll to bottom
                        Spacer()
                            .frame(height: 100, alignment: .center)
                        
                    }.padding(.all, 16)
                }
                .padding(.top, 38)
                .background(Color(hex: 0xFCFAF7))
                .frame(width: WV, alignment: .center)
            }.onAppear(perform: {
                
                //avoid duplicate
                if arrExperience.isEmpty{
                    setupData()
                }
            })
            .onReceive(self.appState.$moveToDashboard, perform: { moveToDashboard in
                
                if TABBAR.click == .Project && moveToDashboard {
                    
                    print("Move to dashboard: \(moveToDashboard)")
                    
                    isDNBCnet = false   // go home from DNBC screen
                    
                    self.appState.moveToDashboard = false
                }

            }),config_Base: $config_Base,
                func_Swipe_Back: {})
    }
}
