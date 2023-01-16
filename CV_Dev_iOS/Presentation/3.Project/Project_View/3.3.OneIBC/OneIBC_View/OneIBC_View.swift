//
//  OneIBC.swift
//  CV_Dev_iOS
//
//  Created by Quang Tran on 23/03/2022.
//

import SwiftUI

extension OneIBC {

    var body: some View {

        Base_View(content:
                    
            ZStack {
                
                ScrollView(.vertical) {
                  
                    mainContent
                    .background(
                        GeometryReader { proxy in
                            Color.clear.preference(
                                key: preferenceKey.self,
                                value: -1 * proxy.frame(in: .named("Scroll_OneIBC")).origin.y
                            )
                        }
                    )
                    .onPreferenceChange(
                        preferenceKey.self,
                        perform: { value in

                            //MARK: - for animation image at list
                           // Animation_OneIBC(value: value)
                        }
                    )
                }
                
                OneIBC_TopBanner
                
                //MARK: - LARGE TITLE (OR LOGO )
                
                VStack(alignment: .leading, spacing: 0){
                    
                    HStack(alignment: .center, spacing: 0){
                        
                        Text("OneIBC")
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
