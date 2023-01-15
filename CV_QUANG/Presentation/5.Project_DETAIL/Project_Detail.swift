//
//  Project_Detail.swift
//  CV_Quang_IOS
//
//  Created by Quang Tran on 14/01/2023.
//

import SwiftUI

struct Project_Detail: View {
    
    @Binding var project_detail: data_project
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    //ANIMATION
    
    @State var currentPos: CGFloat = 0.0
    
    @State var xLabel: CGFloat = 16
    
    @State var yLabel: CGFloat = 80
    
    @State var zoom: CGFloat = 1
    
    @State var showSmallTitle: Bool = false
    
    //@State var txtSIZE: CGFloat = 40
    
    @State var config_Base = dataConfig_BaseView(isShowDrag: true,
                                                 SwipeBackOption: .defaule)
    
    var body: some View {
        
        Base_View(content:
                    
            ZStack {
                
                ScrollView(.vertical) {
                  
                    Project_detail_Main_Content(project_detail: $project_detail)
                    .background(
                        GeometryReader { proxy in
                            Color.clear.preference(
                                key: preferenceKey.self,
                                value: -1 * proxy.frame(in: .named("Scroll_ProductDetail")).origin.y
                            )
                        }
                    )
                    .onPreferenceChange(
                        preferenceKey.self,
                        perform: { value in

                            //MARK: - for animation image at list
                            Animation_Project_Detail(value: value)
                        }
                    )
                }
                
            Project_detail_Top_Banner(project_detail: $project_detail,
                                      showSmallTitle: $showSmallTitle)
                
                //MARK: - LARGE TITLE (OR LOGO )
                
                VStack(alignment: .leading, spacing: 0){
                    
                    HStack(alignment: .center, spacing: 0){
                        
                        Text(project_detail.title)
                            .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                            .font(.custom(Font().Title(), size: 40))
                            .scaleEffect(zoom)
                            .opacity(showSmallTitle ? 0 : 1)
                        
                        Spacer()
                    }
 
                    Spacer()
                    
                }.offset(x: xLabel, y: yLabel)
            }
            //.animation(.linear, value: showSmallTitle)
            ,config_Base: $config_Base,
                func_Swipe_Back: {
            self.presentationMode.wrappedValue.dismiss() //tap anywhere outside view to close view
        })
    }
}
