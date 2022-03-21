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
    
    //---------------BLACK-----------------//
    func Black(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.137254902, green: 0.1215686275, blue: 0.1254901961, alpha: op)   //231F20
    }
    func BlackOriginal(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0, green: 0, blue: 0, alpha: op)    //000000
    }
    
    func BlackLight(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: op)    //333333
    }
    
    func Black2(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: op)      //310217
    }
    func Black3(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.03921568627, green: 0, blue: 0, alpha: op)       //0A0000
    }
    func Black4(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.137254902, green: 0.1215686275, blue: 0.137254902, alpha: op)        //231F23
    }
    func Black5(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.01568627451, green: 0.01568627451, blue: 0.05882352941, alpha: op)    //04040F
    }
    



    
    //---------------WHITE-----------------//
    func White(_ op: Float) -> UIColor{
        return #colorLiteral(red: 1, green: 1, blue: 1, alpha: op)   //FFFFFF
    }
    
    
    //---------------GREEN-----------------//
    func Green(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.231372549, green: 0.4588235294, blue: 0.2941176471, alpha: op)   //3B754B
    }
    
    func GreenLight(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.7529411765, green: 0.9058823529, blue: 0.7960784314, alpha: op)  //C0E7CB
    }
    
    func GreenMedium(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.3882352941, green: 0.7647058824, blue: 0.4941176471, alpha: op)      //63C37E
    }
    
    func GreenHeavy(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.2117647059, green: 0.3411764706, blue: 0.3843137255, alpha: op)      //365762
    }
    
    func Green2(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.1294117647, green: 0.6666666667, blue: 0.2784313725, alpha: op)      //21AA47
    }
    

    

    //---------------BLUE-----------------//
    func Blue(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.5333333333, green: 0.8588235294, blue: 0.9607843137, alpha: op)   //88DBF5
    }
    
    func BlueUnderLine(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.2, green: 0.5843137255, blue: 1, alpha: op)   //3395FF
    }
    
    func BlueLight(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.337254902, green: 0.8, blue: 0.9490196078, alpha: op)   //56CCF2
    }
    func BlueOriginal(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: op)    //007AFF
    }
    func BlueSuperLight(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.8392156863, green: 0.9176470588, blue: 1, alpha: op)    //D6EAFF
    }

    
    
    
    //---------------GRAY-----------------//
    func GrayHeavy(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.5254901961, green: 0.5254901961, blue: 0.5450980392, alpha: op)      //86868B
    }
    
    func GrayHeavy3(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.3568627451, green: 0.3568627451, blue: 0.3568627451, alpha: op)     //#5B5B5B33
    }
    
    func Gray(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: op)    //C4C4C4
    }

    func GrayLight(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.8823529412, green: 0.8823529412, blue: 0.8823529412, alpha: op)     //E1E1E1
    }
    
    func GraySuperLight(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: op)     //F2F2F2
    }
    
    func Gray2(_ op: Float) -> UIColor{
        return  #colorLiteral(red: 0.5254901961, green: 0.5254901961, blue: 0.5254901961, alpha: op)     //868686
    }
    func GrayHeavy2(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.3294117647, green: 0.3294117647, blue: 0.3294117647, alpha: op)     //545454
    }
    
    func GrayLight2(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.9452397227, green: 0.9453979135, blue: 0.9452188611, alpha: op)  //F1F1F1
    }
    


    
    //---------------BROWN-----------------//
    func Brown(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.568627451, green: 0.431372549, blue: 0.1764705882, alpha: op)    //916E2D
    }

    func browHeavy(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.537254902, green: 0.2823529412, blue: 0.2941176471, alpha: op)      //89484B
    }
    
    
    //---------------PINK-----------------//
    func PinkHeavy(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.8980392157, green: 0.4745098039, blue: 0.4941176471, alpha: op)     //E5797E
    }
    
    func Pink(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.9568627451, green: 0.7882352941, blue: 0.7960784314, alpha: op)     //F4C9CB
    }
    
    
    
    //---------------YELLOW-----------------//
    func Yellow(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.9764705882, green: 0.8862745098, blue: 0.7176470588, alpha: op)     //F9E2B7
    }
    
    
    //---------------RED-----------------//
    func Red(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.831372549, green: 0.1254901961, blue: 0.1607843137, alpha: op)       //D42029
    }

    //gradient color for navigation
    func navColor1() -> UIColor{
        return #colorLiteral(red: 0.9333333333, green: 0.03529411765, blue: 0.4745098039, alpha: 1)
    }
    func navColor2() -> UIColor{
        return #colorLiteral(red: 1, green: 0.4156862745, blue: 0, alpha: 1)
    }

    
    
    //Gradient color blue for segment button
    func segmentColor1() -> UIColor{
        return #colorLiteral(red: 0, green: 0.4470588235, blue: 1, alpha: 1)
    }
    func segmentColor2() -> UIColor{
        return #colorLiteral(red: 0, green: 0.7764705882, blue: 1, alpha: 1)
    }
    

    //-------------------------------OLD COLOR------------------------------//
    //---------------BLACK-----------------//
    func black(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0, green: 0, blue: 0, alpha: op)       //000000
    }
    func blackLight(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: op)       //C4C4C4
    }
    func blackRegular(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.2039215686, green: 0.2039215686, blue: 0.2039215686, alpha: op)       //343434
    }
    func blackHeavyLight(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.231372549, green: 0.2274509804, blue: 0.2352941176, alpha: op)       //3b3a3c
    }
    func blackHeavy(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.01960784314, green: 0.01960784314, blue: 0.01960784314, alpha: op)       //050505
    }
    func blackMedium(_ op: Float) -> UIColor {
        return #colorLiteral(red: 0.3098039216, green: 0.3098039216, blue: 0.3098039216, alpha: op)        //4F4F4F
    }
    
    
    //---------------GREEN-----------------//
    func green(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.3882352941, green: 0.7647058824, blue: 0.4941176471, alpha: op)       //63c37e
    }

    
    
    //---------------BLUE-----------------//
    func blueSuperLight(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.5333333333, green: 0.8588235294, blue: 0.9607843137, alpha: op)       //88DBF5
    }
    func blueHeavy(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.003921568627, green: 0.3294117647, blue: 0.7215686275, alpha: op)       //0154b8
    }
    func blueRegular(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.06274509804, green: 0.4862745098, blue: 0.9254901961, alpha: op)       //107cec
    }

    
    
    //---------------WHITE-----------------//
    func white(_ op: Float) -> UIColor{
        return #colorLiteral(red: 1, green: 1, blue: 1, alpha: op)       //ffffff
    }

    
    
    
    //---------------GRAY-----------------//
    func grayBlueLight(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.9490196078, green: 0.9647058824, blue: 0.9764705882, alpha: op)      //F2F6F9
    }
    func graySuperLight(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.9137254902, green: 0.9215686275, blue: 0.9294117647, alpha: op)       //E9EBED
    }
    func grayLight(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.8823529412, green: 0.8823529412, blue: 0.8823529412, alpha: op)       //E1E1E1
    }
    func grayMedium(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: op)       //E5E5E5
    }
    func grayHeavy(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.4196078431, green: 0.4196078431, blue: 0.4274509804, alpha: op)       //6B6B6D
    }
    func grayMediumLight(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.3921568627, green: 0.3921568627, blue: 0.3921568627, alpha: op)      //646464
    }
    
    
    
    //---------------RED-----------------//
    func red(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.8, green: 0.1215686275, blue: 0.1490196078, alpha: op)       //cc1f26
    }

    
    //---------------YELLOW-----------------//
    func yellow(_ op: Float) -> UIColor{
        return #colorLiteral(red: 1, green: 0.7843137255, blue: 0.2862745098, alpha: op)       //cc1f26
    }
    
    
    
    //---------------PURPLE-----------------//
    func purpleLight(_ op: Float) -> UIColor{
        return #colorLiteral(red: 0.9529411765, green: 0.9647058824, blue: 0.9921568627, alpha: op)       //F3F6FD
    }

    //-------------------X------------DONE OLD COLOR--------------X----------------//
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
