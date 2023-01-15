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
        
        //print("SPACING: \(value)")
        
        yLabel += spacing*1
        
        if value > 0 {
            
            xLabel -= spacing*2.7
            zoom += spacing/180
            
            let goToPos: CGFloat = 46

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
        }
     
        currentPos = value
    }
}
