//
//  ProximityViewController.swift
//  Senses2Go
//
//  Created by Admin on 24.11.16.
//  Copyright © 2016 Tom Wieschalla. All rights reserved.
//

import UIKit

class ProximityViewController: UIViewController {
    
    @IBOutlet var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Entfernung"
        
        let device = UIDevice.current
        device.isProximityMonitoringEnabled = true
        if device.isProximityMonitoringEnabled {
            NotificationCenter.default.addObserver(self, selector: #selector(ProximityViewController.stateChanged(_:)), name: NSNotification.Name(rawValue: "UIDeviceProximityStateDidChangeNotification"), object: device)
        }
    }
    
    func stateChanged(_ notification: NSNotification) {
        if let device = notification.object as? UIDevice {
            if device.proximityState {
                self.view.backgroundColor = UIColor.green
            } else {
                self.view.backgroundColor = UIColor.white
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let device = UIDevice.current
        device.isProximityMonitoringEnabled = false
    }

}
