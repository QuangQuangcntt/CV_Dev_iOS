//
//  Color_Image_Manager.swift
//  CoreProgram
//
//  Created by BIN CG on 2/20/21.
//

import Foundation
import UIKit
import SwiftUI

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}


//op: opacity 

struct CIManager{
    
    func TextAttribute(_ op: Float) -> UIColor {
        return #colorLiteral(red: 0.137254902, green: 0.1215686275, blue: 0.1254901961, alpha: op)   //231F20
    }
  
    //gradient color for navigation
    func TextColor_Pink() -> UInt{
        return 0xFD7273
    }
    func TextColor_Brown() -> UInt{
        return 0x754951
    }
    
    func dotColor() -> UInt{
        return 0xb0143c
    }
    
    func LineTimeColor() -> UInt{
        return 0x707070
    }

    
    
    //Gradient color blue for segment button
    func segmentColor1() -> UIColor{
        return #colorLiteral(red: 0, green: 0.4470588235, blue: 1, alpha: 1)
    }
    func segmentColor2() -> UIColor{
        return #colorLiteral(red: 0, green: 0.7764705882, blue: 1, alpha: 1)
    }
  
}


//END set background Image

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}

