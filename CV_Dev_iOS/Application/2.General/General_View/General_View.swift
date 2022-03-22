//
//  GeneralView.swift
//  CV_Dev_iOS
//
//  Created by Quang Tran on 20/03/2022.
//

import SwiftUI

extension General_View: View {

    var body: some View {
       
        ScrollView(.vertical, showsIndicators: false) {
            
           
            VStack(alignment: .center, spacing: 0){
                
                //add spacer for avoid tabbar when scroll to bottom
                Spacer()
                    .frame(height: 50, alignment: .center)
                
                //MARK: - HEADER
                General_View_Header()
                
                //MARK: - MAIN SKILL
                
                ForEach(arrDataSkill, id: \.self) { item in
                    
                   
                    
                    HStack(alignment: .center, spacing: 0){
                        
                        Text(item.title)
                            .foregroundColor(Color(hex: 0x6F4B51))
                            .font(.custom(Font().Title(), size: Font().Size24()))
                        
                        Spacer()
                        
                    }.padding(.all, 16).padding(.top, 24)
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        
                        ForEach(item.mainData, id: \.self) { sub in
                            
                            VStack(alignment: .center, spacing: 8){
                                
                                //Image here
                                
                                Image(sub.icon)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 36, height: 36, alignment: .center)
                                    .cornerRadius(20)
                                
                                Text(sub.title)
                                    .foregroundColor(Color(hex: 0x6F4B51))
                                    .font(.custom(Font().Regular(), size: Font().Size14()))
                            }
                        }
                    }.padding(.vertical, 16)
                }

                
                //MARK: - PERSONAL PROFILE
                
                HStack(alignment: .center, spacing: 0){
                    
                    Text("Personal Profile")
                        .foregroundColor(Color(hex: 0x6F4B51))
                        .font(.custom(Font().Title(), size: Font().Size24()))
                    
                    Spacer()
                    
                }.padding(.all, 16).padding(.top, 24)
                
                Text(personalProfile)
                    .foregroundColor(Color(hex: 0x6F4B51))
                    .font(.custom(Font().LightItalic(), size: Font().Size14()))
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineSpacing(8)
                    .padding(.all, 16)
                

                Spacer()
                    .frame(height: 100, alignment: .center)
            }
        }
        .frame(width: WV, alignment: .center)// not set height: -> Auto height
        .navigationTitle("")
        .navigationBarHidden(true)
        .background(Color(hex: 0xFCFAF7))
        .onAppear(perform: {
            
            onAppearProcess()
        })
    }
}


var personalProfile = """
Swift developer, having 18 months of Swift experience. Fluent in english and strong knowledge of OOP, MVC. Searching information skills, communication skills, solid understanding of the full mobile development life cycle, RESTful API and SwiftUI. Loving mobile developer. Finding opportunity for studying and working.
"""
