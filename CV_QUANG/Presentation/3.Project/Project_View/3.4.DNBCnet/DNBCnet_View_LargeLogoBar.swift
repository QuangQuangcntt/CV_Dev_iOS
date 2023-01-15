//
//  DNBCnet_View2.swift
//  CV_Dev_iOS
//
//  Created by Quang Tran on 24/03/2022.
//

import SwiftUI

struct DNBCnet_View_LargeLogoBar: View {
    
    @State var isShow: Bool = false
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack(alignment: .center, spacing: 0){
            
            ZStack(alignment: .bottom){
                
                Rectangle()
                    .frame(width: WV, height: 100, alignment: .center)
                    .foregroundColor(Color(hex: 0xFCFAF7))
                    .animation(.linear)
                
                if isShow {
                    //MARK: - inline icon title
                    Image("Background_Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 103, height: 30, alignment: .center)
                        .padding(.bottom, 8)
                }
                
                //back button
                
                Button{
                    self.presentationMode.wrappedValue.dismiss()
                }label: {
                    HStack(alignment: .center, spacing: 0){
                        
                        Image("vector-2")
                        
                        Text(" Back")
                            .foregroundColor(Color(hex: 0x231f20))
                            .font(.custom(Font().Light(), size: Font().Size15()))
                        
                        Spacer()
                    }
                }.padding(.bottom, 16).padding(.leading, 16)
            }
            
            
            ScrollView{
                
                VStack(alignment: .center, spacing: 0){
                    Spacer().frame(height: 16, alignment: .center)
                    
                    //MARK: - large title bar
                    
                    HStack(alignment: .center, spacing: 0){
                        
                        //MARK: - MAIN icon title
                        Image("Background_Logo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 207, height: 60, alignment: .center)
                            
                        
                        Spacer()
                    }.padding(.leading, 16)
                    
                    //MARK: - MAIN CONTENT
                    DNBCnet_View()
                    
                    Spacer()
                        .frame(height: 50, alignment: .center)
                }
                .background(GeometryReader {
                                Color.clear.preference(key: ViewOffsetKey.self,
                                    value: -$0.frame(in: .named("scroll")).origin.y)
                            })
                .onPreferenceChange(ViewOffsetKey.self) {
                    //print("offset >> \($0)")
                    
                    if $0 > 104 {
                        isShow = true
                    }
                    else{
                        isShow = false
                    }
                }

            }.coordinateSpace(name: "scroll")

            Spacer()
            
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .animation(.linear)
        .ignoresSafeArea(.all, edges: .vertical)
        .background(Color(hex: 0xFCFAF7))

    }
}

