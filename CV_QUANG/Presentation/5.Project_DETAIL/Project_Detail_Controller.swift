//
//  OneIBC_Controller.swift
//  CV_Quang_IOS
//
//  Created by Quang Tran on 14/01/2023.
//

import Foundation
import SwiftUI

extension Project_Detail {
    
    func Animation_Project_Detail(value: CGFloat){
        
        let spacing = currentPos - value
        
//        print("SPACING: \(value)")
        
        yLabel += spacing*1.4
        
        print("SPACING: \(yLabel)")
        
        if value > 0 {
            
            xLabel -= spacing*2
            zoom += spacing/100
            
            let goToPos: CGFloat = 33

//            if value == goToPos {
//                txtSIZE = 40 * zoom
//            }
            if value > goToPos {
                showSmallTitle = true
            }
            if value < goToPos {
                withAnimation(.linear) {
                    showSmallTitle = false
                }
            }
        }
        else{
            xLabel = 16
            zoom = 1
            showSmallTitle = false
            
            if yLabel > 140 {
                yLabel = 140
            }
            else if yLabel < 80 {
                yLabel = 80
            }
        }
     
        currentPos = value
    }
}
