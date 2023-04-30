//
//  ViewController.swift
//  Homework 6
//
//  Created by c.scherle on 4/25/23.
// 56.565106, 9.030866

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

 
    @IBAction func openSite(_ sender: Any) {
        if let url = URL (string: "https://www.tripadvisor.com",};  { UIApplication.shared.open(url, option: [:])
            
        }
    
    }
    
    @IBOutlet weak var distanceLabel: UILabel!
    let locMan: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!
    
    let kskiveLatitude: CLLocationDegrees = 56.565106
    let kskiveLongitude: CLLocationDegrees = 9.030866
    
                          func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            let newLocation: CLLocation=locations[0]
            NSLog("Something is happening")
            
            
            if newLocation.horizontalAccuracy >= 0 {
                let skive:CLLocation = CLLocation(latitude: kskiveLatitude,longitude: kskiveLongitude)
                let delta:CLLocationDistance = skive.distance(from: newLocation)
                let miles: Double = (delta * 0.00621371) + 0.5
                if miles < 3 {
                    locMan.stopUpdatingLocation()
                    distanceLabel.text = "Welcome to Skive!"
                } else {
                    let commaDelimited: NumberFormatter = NumberFormatter()
                    commaDelimited.numberStyle = NumberFormatter.Style.decimal
                    distanceLabel.text=commaDelimited.string(from: NSNumber(value: miles))!+" miles to Skive"
                }
            }
            
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locMan.delegate = self
        locMan.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locMan.distanceFilter = 1609;
        locMan.requestWhenInUseAuthorization()
        locMan.startUpdatingLocation()
        startLocation = nil
            
            let myURL = URL(string: "https://www.tripadvisor.com/")
            let myRequest = URLRequest (url: myURL!)
            webView.load(myRequest)
            
            
            
            
            
    }




