//
//  ModernWomanScene.swift
//  SpriteKitWatchFace WatchKit Extension
//
//  Created by Jacob Niedzwiecki on 2018-10-16.
//

import UIKit
import SpriteKit
import Foundation

@objc class ModernWomanScene: SKScene, SKSceneDelegate {
    var lblTime: SKLabelNode?
    var elapsedTime: Double?
    var startingTime: Date?
    var timerDuration: Double?
    
    @objc public func setup() -> Void {
        lblTime = childNode(withName: "lbl_time_1") as! SKLabelNode
        lblTime?.text = "0"
        startingTime = Date(timeInterval: 0.0, since: Date())
        elapsedTime = 0.0
        
        timerDuration = 10 * 60
    }
    
    override func update(_ currentTime: TimeInterval) {
        elapsedTime? += currentTime
        
        guard let elapsedSeconds = elapsedTime else { return }
        
        let remaining = timerDuration! - timeInSeconds(time: elapsedSeconds)
    
        let secondsRemaining = NumberFormatter.localizedString(from: NSNumber(value:remaining), number: .decimal)
        
        lblTime?.text = secondsRemaining
    }
    
    func timeInSeconds(time:Double) -> Double {
        var t = time
        t /= 10000000
        t = floor(t)
        return t
    }
}
