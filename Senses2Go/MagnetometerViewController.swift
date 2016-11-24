//
//  MagnetometerViewController.swift
//  Senses2Go
//
//  Created by Admin on 24.11.16.
//  Copyright © 2016 Tom Wieschalla. All rights reserved.
//

import UIKit
import CoreMotion

class MagnetometerViewController: UIViewController {
    
    let motionManager = CMMotionManager()

    @IBOutlet weak var xTextView: UITextField!
    @IBOutlet weak var yTextView: UITextField!
    @IBOutlet weak var zTextView: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Erdfeldstärke"
        
        motionManager.magnetometerUpdateInterval = 0.2
        motionManager.startDeviceMotionUpdates()
        motionManager.startMagnetometerUpdates(to: OperationQueue.current!, withHandler: {
            magData, error in
            self.setMagnoData(magnoData: magData!)
            
            if (error != nil) {
                print("error while reading magnometer data: \(error)")
            }
        })
    }
    
    private func setMagnoData(magnoData: CMMagnetometerData) {
        let xMag = magnoData.magneticField.x
        let yMag = magnoData.magneticField.y
        let zMag = magnoData.magneticField.z
        
        self.xTextView.text = "\(xMag)"
        self.yTextView.text = "\(yMag)"
        self.zTextView.text = "\(zMag)"
    }
}
