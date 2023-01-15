//
//  ArcView.swift
//  SwiftUI-Animations
//
//  Created by Shubham Singh on 11/08/20.
//  Copyright © 2020 Shubham Singh. All rights reserved.
//

import SwiftUI

struct ArcView: View {
    var radius: CGFloat
    @Binding var fillColor: Color
    @Binding var shadowColor: Color

    var body: some View {
        
        withAnimation(Animation.spring().speed(0.75)){
            ArcShape(radius: radius)
                .fill(fillColor)
                .shadow(color: shadowColor, radius: 5)
                .frame(height: radius)
                .onTapGesture {
                    self.fillColor = Color.wifiConnected
                }
        }
    }
}
