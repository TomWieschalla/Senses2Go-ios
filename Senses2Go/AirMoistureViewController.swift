//
//  AirMoistureViewController.swift
//  Senses2Go
//
//  Created by Admin on 24.11.16.
//  Copyright © 2016 Tom Wieschalla. All rights reserved.
//

import UIKit

class AirMoistureViewController: UIViewController {

    @IBOutlet weak var textView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Luftfeuchtigkeit"
        textView.text = "Dieser Sensor ist in diesem Gerät leider nicht verbaut"
    }

}
