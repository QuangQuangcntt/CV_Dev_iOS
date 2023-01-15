//
//  BaseView_Swipe_Gesture.swift
//
//  Created by Quang Tran on 12/12/2022.
//

import SwiftUI

extension Base_View {
    
    func swipe_gesture_UI() -> some View {
        
        HStack(alignment: .center, spacing: 0){
            
            Rectangle()
                .foregroundColor(Color.white.opacity(0.01))
                .frame(maxWidth: 16, maxHeight: HV*0.8, alignment: .center)
                .gesture(DragGesture()
                    .onChanged({ (value) in

                        DispatchQueue.main.async {
                            //print(value)
                                
                            offSetView = value.translation.width
                        }
                    })
                    .onEnded({ (value) in
                        
                        DispatchQueue.main.async {
                            //offSetView >= WV * 0.2 -> width from left to right with width WV * 0.2
                            if offSetView >= WV * 0.2{

                                withAnimation(.linear){
                                    offSetView = 0
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    if config_Base.SwipeBackOption == .defaule{
                                        self.presentationMode.wrappedValue.dismiss()
                                    }
                                    else{
                                        func_Swipe_Back()
                                    }
                                }
                            }
                            else{
                                //alway set to default
                                withAnimation(.linear){
                                    offSetView = 0
                                }
                            }
                        }
                    })
                )
            Spacer()
        }
    }
}
