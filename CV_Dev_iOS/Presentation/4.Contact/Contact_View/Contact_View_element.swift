//
//  Contact_View_element.swift
//  CV_QUANG
//
//  Created by Quang Tran on 15/01/2023.
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

struct Contact_View_TXT: View {
            
    @Binding var txt: String
    

    var body: some View {
        
        let localizedKey = LocalizedStringKey.init("\(self.txt)")
        
        Text(localizedKey, bundle: settings.bundle)
            .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
            .font(.custom(Font().LightItalic(), size: Font().Size14()))
            .multilineTextAlignment(.leading)
            .fixedSize(horizontal: false, vertical: true)
            .lineSpacing(8)
    }
}

struct Contact_View_TXT_WithNumber: View {
            
    @Binding var txt: String
    
    @Binding var num: Int

    var body: some View {
        
        HStack(alignment: .top, spacing: 0){
            
            Text("\(self.num). ")
                .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                .font(.custom(Font().LightItalic(), size: Font().Size14()))
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
                .lineSpacing(8)
            
            let localizedKey = LocalizedStringKey.init("\(self.txt)")
            
            Text(localizedKey, bundle: settings.bundle)
                .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                .font(.custom(Font().LightItalic(), size: Font().Size14()))
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
                .lineSpacing(8)
        }
        
    }
}
