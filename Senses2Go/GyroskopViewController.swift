//
//  GyroskopViewController.swift
//  Senses2Go
//
//  Created by Admin on 24.11.16.
//  Copyright © 2016 Tom Wieschalla. All rights reserved.
//

import UIKit
import CoreMotion

class GyroskopViewController: UIViewController {

    @IBOutlet weak var xTextView: UITextField!
    @IBOutlet weak var yTextView: UITextField!
    @IBOutlet weak var zTextView: UITextField!
    
    let motionManager = CMMotionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Rotation"
        
        motionManager.gyroUpdateInterval = 0.2
        motionManager.startDeviceMotionUpdates()
        motionManager.startGyroUpdates(to: OperationQueue.current!, withHandler: {
            gyroData, error in
            self.setRotationData(gyroData: gyroData!)
            
            if (error != nil) {
                print("error while reading gyro data: \(error)")
            }
        })
    }
    
    private func setRotationData(gyroData: CMGyroData) {
        let xRotation = gyroData.rotationRate.x
        let yRotation = gyroData.rotationRate.y
        let zRotation = gyroData.rotationRate.z
        
        self.xTextView.text = "\(xRotation)"
        self.yTextView.text = "\(yRotation)"
        self.zTextView.text = "\(zRotation)"
    }
    
    //TODO: Tilt Ball
}
