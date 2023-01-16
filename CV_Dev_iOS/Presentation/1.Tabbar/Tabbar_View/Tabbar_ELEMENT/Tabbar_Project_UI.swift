//
//  Tabbar_Project_UI.swift
//  CV_Dev_iOS
//
//  Created by Quang Tran on 20/03/2022.
//

import SwiftUI

struct Tabbar_Project_UI: View {
    
    @State var isRotate = false
    
    @State var goUp: Bool = false
    
    @State var runOnceTime = true
    
    var body: some View {

            
//    Image("Project_icon")
//            .resizable()
//            .aspectRatio(contentMode: .fill)
        
        Text("</>")
            .foregroundColor(Color.black)
            .font(.custom(Font().Medium(), size: Font().Size16()))
        .padding(.all, 16)
        .background(Circle()
                        .fill(LinearGradient(
                              gradient: .init(colors: [Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)), Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1))]),
                              startPoint: .init(x: 0, y: 0),
                              endPoint: .init(x: 1, y: 0)
                            ))
                        .rotationEffect(.degrees(isRotate ? 0 : 360), anchor: .center)
        )
        .padding(.all, 4)
        //.frame(width: 46, height: 46, alignment: .center)
        .background(
            Circle()
                .foregroundColor(Color(hex: 0xeeeeee, alpha: 1))
                //.frame(width: 54, height: 54, alignment: .center)
        )
        .onAppear(perform: {
            
            if runOnceTime {
                
                //not having notification
                runOnceTime = false // not shake bell when user pressed
                
                //DispatchQueue.main.async ---> avoid affect animation to navigation view
                DispatchQueue.main.async {
                    //must set animation onAppear
                    withAnimation(Animation.linear(duration: 1.6)
                                    .repeatForever(autoreverses: false)){
                        isRotate.toggle()
                    }

                    withAnimation(Animation.linear(duration: 2.4)
                                    .repeatForever(autoreverses: true)){
                        goUp.toggle()
                    }
                }
            }
        })
        .offset(x: 0, y: goUp ? -42 : -36)
    }
}
