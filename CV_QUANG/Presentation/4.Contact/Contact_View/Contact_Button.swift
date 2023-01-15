//
//  Contact_Button.swift
//  CV_Quang_IOS
//
//  Created by Quang Tran on 13/01/2023.
//

import SwiftUI

struct Contact_Button: View {
    
    var text: String = ""
    
    init(text: String){
        self.text = text
    }
    
    var body: some View {
        
        Text(text)
            .foregroundColor(Color.white)
            .font(.custom(Font().Italic(), size: Font().Size14()))
            .padding(.vertical, 8).padding(.horizontal, 12)
            .background(
                Color(hex: CIManager().TextColor_Pink())
            )
            .cornerRadius(20)
            .shadow(color: Color(hex: CIManager().TextColor_Pink(), alpha: 0.8),
                    radius: 8, x: 4, y: 4)
            .padding(.vertical, 16)
    }
}
