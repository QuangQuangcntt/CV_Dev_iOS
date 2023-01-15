//
//  BaseView_View.swift
//  CV_Quang_IOS
//
//  Created by Quang Tran on 11/01/2023.
//

import SwiftUI

extension Base_View {

    var body : some View {
        
        ZStack {
            
            content
                .offset(x: offSetView, y: 0)
            
            //Cover bar
            
            VStack(alignment: .center, content: {
                
                Rectangle()
                    .frame(height: 40)
                    .foregroundColor(Color(hex: 0xFCFAF7))
                
                Spacer()
            })
            
            if config_Base.isShowDrag {
                //---------------- DRAG BUTTON-----------------//
                DragAbleButton(dragAmount: $dragAmount).position(x: WV*0.5, y: HV*0.5)
                //---------------------DONE DRAG BUTTON------------//
            }
            
            //MARK: - SWIPE BACK AT LEFT SIDE OF VIEW
            if config_Base.SwipeBackOption != .none {

                swipe_gesture_UI()
            }
        }.background(Color(hex: 0xFCFAF7))
        .navigationTitle("")
        .navigationBarHidden(true)
        .ignoresSafeArea(.all, edges: .vertical)
    }
}
