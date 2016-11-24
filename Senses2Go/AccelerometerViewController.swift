//
//  AccelerometerViewController.swift
//  Senses2Go
//
//  Created by Admin on 24.11.16.
//  Copyright © 2016 Tom Wieschalla. All rights reserved.
//

import UIKit
import CoreMotion

class AccelerometerViewController: UIViewController {

    @IBOutlet weak var xTextView: UITextField!
    @IBOutlet weak var yTextView: UITextField!
    @IBOutlet weak var zTextView: UITextField!
    
    let motionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Beschleunigung"

        motionManager.accelerometerUpdateInterval = 0.2
        motionManager.startDeviceMotionUpdates()
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!, withHandler: {
            accData, error in
            self.setAccelerometerData(accData: accData!)
            
            if (error != nil) {
                print("error while reading acceleration data: \(error)")
            }
        })
    }

    private func setAccelerometerData(accData: CMAccelerometerData) {
        let xAcc = accData.acceleration.x
        let yAcc = accData.acceleration.y
        let zAcc = accData.acceleration.z
        
        self.xTextView.text = "\(xAcc)"
        self.yTextView.text = "\(yAcc)"
        self.zTextView.text = "\(zAcc)"
    }

}
