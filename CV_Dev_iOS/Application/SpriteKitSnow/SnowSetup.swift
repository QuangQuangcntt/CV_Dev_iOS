//
//  SnowSetup.swift
//  DSBC
//
//  Created by Quang Tran on 22/03/2022.
//  Copyright © 2022 BIN iMac 02. All rights reserved.
//
//Tutorial: https://tanaschita.com/20211220-creating-particles-snow-effect-in-spritekit/


import Foundation
import SpriteKit
import SwiftUI

class SnowScene: SKScene {

    let snowEmitterNode = SKEmitterNode(fileNamed: "MyParticle.sks")

    override func didMove(to view: SKView) {
        guard let snowEmitterNode = snowEmitterNode else { return }
        snowEmitterNode.particleSize = CGSize(width: 50, height: 50)
        snowEmitterNode.particleLifetime = 2
        snowEmitterNode.particleLifetimeRange = 6
        addChild(snowEmitterNode)
    }

    override func didChangeSize(_ oldSize: CGSize) {
        guard let snowEmitterNode = snowEmitterNode else { return }
        snowEmitterNode.particlePosition = CGPoint(x: size.width/2, y: size.height)
        snowEmitterNode.particlePositionRange = CGVector(dx: size.width, dy: size.height)
    }
}

struct snowSpriteKit: View {
    var scene: SKScene {
        let scene = SnowScene()
        scene.scaleMode = .resizeFill
        scene.backgroundColor = .clear
        return scene
    }

    var body: some View {
        ZStack {
            
            Color(hex: 0xFCFAF7).ignoresSafeArea(.all, edges: .all)
            
            
              SpriteView(scene: scene, options: [.allowsTransparency])
                .ignoresSafeArea()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            }
    }
}
