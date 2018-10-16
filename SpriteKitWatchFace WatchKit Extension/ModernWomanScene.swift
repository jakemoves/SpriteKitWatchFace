//
//  ModernWomanScene.swift
//  SpriteKitWatchFace WatchKit Extension
//
//  Created by Jacob Niedzwiecki on 2018-10-16.
//

import UIKit
import SpriteKit

@objc class ModernWomanScene: SKScene, SKSceneDelegate {
    var lblTime: SKLabelNode?
    var elapsedTime: Double?
    
    @objc public func setup() -> Void {
        lblTime = childNode(withName: "lbl_time_1") as! SKLabelNode
        lblTime?.text = "0"
        elapsedTime = 0.0
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        elapsedTime? += currentTime
        lblTime?.text = NumberFormatter.localizedString(from: NSNumber(value:elapsedTime!), number: .decimal)
    }
}
