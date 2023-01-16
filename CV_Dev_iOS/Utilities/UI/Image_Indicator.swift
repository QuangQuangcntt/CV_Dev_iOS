//
//  ImageIndicator.swift
//  OneIBC
//
//  Created by Quang Tran on 01/10/2022.
//

import Foundation
import SwiftUI

struct IMG_Indicator: View {
    
    var body: some View {
            
      ProgressView()
         .progressViewStyle(CircularProgressViewStyle(tint: Color(hex: 0xff6a00)))
        
//        ProgressView()
//          .progressViewStyle(RingProgressViewStyle())
    }
}

public struct RingProgressViewStyle: ProgressViewStyle {
    
    @State var leftOffset_1: CGFloat = -20
    @State var leftOffset_2: CGFloat = -20
    @State var leftOffset_3: CGFloat = -20

  public func makeBody(configuration: ProgressViewStyleConfiguration) -> some View {
    
      ZStack {
          Circle()
              .fill(Color(hex: 0xff6a00))
              .frame(width: 10, height: 10)
              .offset(x: leftOffset_1)
              .opacity(0.7)

          Circle()
              .fill(Color(hex: 0xff6a00))
              .frame(width: 10, height: 10)
              .offset(x: leftOffset_2)
              .opacity(0.7)

          Circle()
              .fill(Color(hex: 0xff6a00))
              .frame(width: 10, height: 10)
              .offset(x: leftOffset_3)
              .opacity(0.7)
      }
      .onAppear(perform: {
          DispatchQueue.main.async {
              withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)){
                  leftOffset_1 = 20
              }
              withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true).delay(0.3)){
                  leftOffset_2 = 20
              }
              withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true).delay(0.5)){
                  leftOffset_3 = 20
              }
          }
      })
      .onDisappear(perform: {
          DispatchQueue.main.async {
              leftOffset_1 = -20
              leftOffset_2 = -20
              leftOffset_3 = -20
          }
      })
  }
}
