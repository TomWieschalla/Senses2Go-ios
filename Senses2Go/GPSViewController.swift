//
//  GPSViewController.swift
//  Senses2Go
//
//  Created by Admin on 23.11.16.
//  Copyright © 2016 Tom Wieschalla. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class GPSViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var positionMapView: MKMapView!
    @IBOutlet weak var breitengradTextView: UITextField!
    @IBOutlet weak var laengengradTextView: UITextField!
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "GPS Position"
    }

    override func viewWillAppear(_ animated: Bool) {
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        positionMapView.setUserTrackingMode(MKUserTrackingMode.follow, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lati = manager.location?.coordinate.latitude
        let longi = manager.location?.coordinate.longitude
        
        breitengradTextView.text = "\(lati!)"
        laengengradTextView.text = "\(longi!)"
        let center = CLLocationCoordinate2D(latitude: (manager.location?.coordinate.latitude)!, longitude: (manager.location?.coordinate.longitude)!)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        positionMapView.setRegion(region, animated: true)
    }

}
