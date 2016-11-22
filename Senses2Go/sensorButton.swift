//
//  sensorButton.swift
//  Senses2Go
//
//  Created by Tom Wieschalla on 22.11.16.
//  Copyright © 2016 Adesso. All rights reserved.
//

import UIKit

public class sensorButton: UIButton {
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 20;
        
        let transformAnim  = CAKeyframeAnimation(keyPath:"transform")
        transformAnim.values  = [NSValue(caTransform3D: CATransform3DMakeRotation(0.04, 0.0, 0.0, 1.0)),NSValue(caTransform3D: CATransform3DMakeRotation(-0.04 , 0, 0, 1))]
        transformAnim.autoreverses = true
        transformAnim.duration = 0.1
        transformAnim.repeatCount = Float.infinity
        self.layer.add(transformAnim, forKey: "transform")
        
    }
}
