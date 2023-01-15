//
//  Contact_View.swift
//  CV_Quang_IOS
//
//  Created by Quang Tran on 13/01/2023.
//

import SwiftUI

extension Contact_View {

    var body: some View {
        
        Base_View(content:
                    
            ScrollView(.vertical, showsIndicators: false) {

                VStack(alignment: .leading, spacing: 24){

                    //MARK: - BASIC INFOR
                    ForEach(arrDataInfor, id: \.self){ item in
                        
                        HStack(alignment: .center, spacing: 0){
                            
                            Text(item.title)
                                .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                                .font(.custom(Font().Title(), size: Font().Size24()))
                            
                            Spacer()
                            
                        }.padding(.top, 16)
                        
                        ForEach(item.arrInfor_Data, id: \.self){ sub in
                            
                            HStack(alignment: .center, spacing: 16){
                              
                                if sub.type == .address{
                                    Text(sub.title)
                                        .foregroundColor(Color(hex: CIManager().TextColor_Pink()))
                                        .font(.custom(Font().Bold(), size: Font().Size16()))
                                }
                                else{
                                    Button{
                                        contactAction(type: sub)
                                    }label:{
                                        Contact_Button(text: sub.title)
                                    }
                                }

                                Spacer()

                                Text(sub.content)
                                    .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                                    .font(.custom(Font().Bold(), size: Font().Size16()))
                            }
                        }
                    }
                    
                    Divider()
                    
                    Text("Setting")
                        .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                        .font(.custom(Font().Title(), size: Font().Size24()))
                        .padding(.top, 16)
  
                    //LANGUAGEA
                    HStack(alignment: .center){
                        
                        Spacer()
                        
                        Button(action: {
                            isLanguage = true
                        }) {
                            Contact_Button(text: "Change language")
                        }
                        
                        Spacer()
                    }
                    
                    Divider()
                    
                    Text("Introducing the CV app")
                        .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                        .font(.custom(Font().Title(), size: Font().Size24()))
                        .padding(.top, 16)
                    
                    Contact_View_TXT(txt: "This app is all customization, all animation and download image function is custom. \nOnly once framework using for supporting download SVG image (Swift package dependencies).")
                        
                    Contact_View_TXT(txt: "List of features and technologies:")
                        .padding(.top, 8)

                        ForEach(Array(arrFeatures.enumerated()), id: \.offset) { item, columnsData in

                        Contact_View_TXT(txt: "\(item + 1). \(columnsData)")
                            .padding(.horizontal, 16)
                    }
                    
                }.padding(.all, 16).padding(.leading, 8).padding(.bottom, 150)
            
            }.padding(.top, 38)
            .fullScreenCover(isPresented: $isLanguage) {
                LanguageView(TABBAR: TABBAR).background(BackgroundView())   //set this for remove white default background
                
            }
            .background(Color(hex: 0xFCFAF7))
            .onAppear(perform: {
                if arrDataInfor.isEmpty {
                    onAppearContactView()
                }
                
            }),config_Base: $config_Base,
                  func_Swipe_Back: {})
    }
}

