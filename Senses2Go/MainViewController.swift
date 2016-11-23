//
//  ViewController.swift
//  Senses2Go
//
//  Created by Admin on 22.11.16.
//  Copyright © 2016 Adesso. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var mikButton: SensorButton!
    @IBOutlet weak var lautsprecherButton: SensorButton!
    @IBOutlet weak var kameraButton: SensorButton!
    @IBOutlet weak var lichtButton: SensorButton!
    @IBOutlet weak var druckButton: SensorButton!
    @IBOutlet weak var feuchtButton: SensorButton!
    @IBOutlet weak var proxButton: SensorButton!
    @IBOutlet weak var beschButton: SensorButton!
    @IBOutlet weak var magnButton: SensorButton!
    @IBOutlet weak var gyroButton: SensorButton!
    @IBOutlet weak var gpsButton: SensorButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Wähle einen Sensor..."
    }
    
    override func viewWillAppear(_ animated: Bool) {
        startButtonAnimation(buttons: [mikButton,lautsprecherButton,kameraButton,lichtButton,druckButton,feuchtButton,proxButton,beschButton,magnButton,gyroButton,gpsButton])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startButtonAnimation(buttons: [SensorButton]) {
        for button in buttons {
            button.startAnimation()
        }
    }

    @IBAction func gpsButtonClicked(_ sender: Any) {
        let vc  = GPSViewController.init(nibName: "GPSViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func gyroskopButtonClicked(_ sender: Any) {
    }
    @IBAction func magnoButtonClicked(_ sender: Any) {
    }
    @IBAction func beschButtonClicked(_ sender: Any) {
    }
    @IBAction func proxButtonClicked(_ sender: Any) {
    }
    @IBAction func feuchtButtonClicked(_ sender: Any) {
    }
    @IBAction func druckButtonClicked(_ sender: Any) {
    }
    @IBAction func lichtButtonClicked(_ sender: Any) {
    }
    @IBAction func kameraButtonClicked(_ sender: Any) {
    }
    @IBAction func lautsprecherButtonClicked(_ sender: Any) {
    }
    @IBAction func mikrofonButtonClicked(_ sender: Any) {
    }
}

