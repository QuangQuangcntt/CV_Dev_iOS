//
//  LostInternet_Controller.swift
//  
//
//  Created by Quang Tran on 01/03/2022.
//  Copyright © 2022 BIN iMac 02. All rights reserved.
//

import Foundation
import SwiftUI

extension LostInternetConnection{
    
    // MARK:- functions
    func getRotation(arcBoolean: Bool) -> Angle {
        if (self.isAnimating && arcBoolean) {
            return Angle.degrees(180)
        } else if (self.isAnimating && arcBoolean) {
            return Angle.degrees(-180)
        }
        return Angle.degrees(0)
    }
    
    func animate() {
        Timer.scheduledTimer(withTimeInterval: self.animationDuration, repeats: true) { (arcTimer) in
            if (self.isAnimating) {
                self.circleOffset += self.animationMovingUpwards ? -15 : 15
                self.smallArcOffset += self.moveArc ? -15 : 15
                if (self.circleOffset == -25) {
                    self.animationMovingUpwards = false
                } else if (self.circleOffset == 20) {
                    self.animationMovingUpwards = true
                }
                if (self.moveArc) {
                    self.mediumArcOffset += -15
                }
            } else {
                arcTimer.invalidate()
            }
        }
        
        Timer.scheduledTimer(withTimeInterval: (self.animationDuration) * 2, repeats: true) { (arcTimer) in
            if (self.isAnimating) {
                self.mediumArcOffset += 15
            } else {
                arcTimer.invalidate()
            }
        }
        
        Timer.scheduledTimer(withTimeInterval: (self.animationDuration) * 3, repeats: true) { (arcTimer) in
            if (self.isAnimating) {
                self.moveArc.toggle()
                self.smallArcOffset = !self.moveArc ? -15 : 8.5
                if (self.animationMovingUpwards) {
                    self.largeArcOffset = -19
                    self.mediumArcOffset = -5.5
                } else {
                    self.largeArcOffset = 14
                    self.mediumArcOffset = 0
                }
            } else {
                arcTimer.invalidate()
            }
        }
    }
    
    func restoreAnimation() {
        self.isAnimating = false
        self.animationMovingUpwards = true
        self.moveArc = true
        self.isConnected = false
        
        self.circleOffset = 20
        self.smallArcOffset = 16
        self.mediumArcOffset = 14.5
        self.largeArcOffset = 14
    }
    
    func resetValues() {
        self.isAnimating.toggle()
        self.wifiHeaderLabel = "Searching"
        self.smallArcOffset -= 7.5
        self.circleOffset -= 15
        self.mediumArcOffset = -5.5
        self.largeArcOffset = -19
        self.isConnected = false
        self.arcColor = Color.white
        self.shadowColor = Color.blue
    }
}
