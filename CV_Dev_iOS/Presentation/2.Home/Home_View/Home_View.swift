//
//  Home_View.swift
//  CV_Quang_IOS
//
//  Created by Quang Tran on 11/01/2023.
//

import SwiftUI

extension Home_View {

    var body: some View {
        Base_View(content:
                    
            ScrollView(.vertical, showsIndicators: false) {

                VStack(alignment: .center, spacing: 0){

                    Home_View_Header()

                    //MARK: - PERSONAL PROFILE
                    
                    HStack(alignment: .center, spacing: 0){
                        
                        Text("Home_Profile", bundle: settings.bundle)
                            .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                            .font(.custom(Font().Title(), size: Font().Size24()))
                        
                        Spacer()
                        
                    }.padding(.all, 16).padding(.top, 24)
                    
                    Text("Home_profile_content", bundle: settings.bundle)
                        .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                        .font(.custom(Font().LightItalic(), size: Font().Size14()))
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineSpacing(8)
                        .padding(.all, 16)
                    
                    //MARK: - MAIN SKILL
                    
                    if arrDataSkill.count > 0 {
                        ForEach(arrDataSkill, id: \.ID) { item in

                            HStack(alignment: .center, spacing: 0){
                                
                                let localizedKey = LocalizedStringKey.init("\(item.title)")
                                
                                Text(localizedKey, bundle: settings.bundle)
                                    .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                                    .font(.custom(Font().Title(), size: Font().Size24()))
                                
                                Spacer()
                                
                            }.padding(.all, 16).padding(.top, 24)
                            
                            StaggeredGrid(columns: 3, spacing: 30, list: item.mainData, isLazy: false, content: { sub in
                                
                                VStack(alignment: .center, spacing: 8){
                                    
                                    //Image here
                                    
                                    AsyncImage_Advance(resizeFor: .universal,
                                                       isLazy: false,
                                                       url: URL(string: sub.icon) ?? URL(string: "-")!,
                                                       placeholder: {
                                        IMG_Indicator()
                                    })
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 36, height: 36, alignment: .center)
                                    .cornerRadius(20)

                                    let localizedKey = LocalizedStringKey.init("\(sub.title)")
                                    
                                    Text(localizedKey, bundle: settings.bundle)
                                        .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                                        .font(.custom(Font().Regular(), size: Font().Size14()))
                                        .multilineTextAlignment(.center)
                                }
                                .padding(.vertical, 12)

                            }).padding(.vertical, 4)
                        }
                    }
                }
                .padding(.bottom, 120)
            
            }.padding(.top, 38)
            .background(Color(hex: 0xFCFAF7))
            .onAppear(perform: {
                
                if arrDataSkill.isEmpty {
                    onAppearProcess()
                }
            }),config_Base: $config_Base,
            func_Swipe_Back: {})
    }
}
