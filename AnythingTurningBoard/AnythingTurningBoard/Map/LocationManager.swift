//
//  LocationManager.swift
//  AnythingTurningBoard
//
//  Created by 이규현 on 2020/11/09.
//

import Foundation
import CoreLocation
import Combine

final class LocationManager: NSObject, ObservableObject {
    
    @Published var status: CLAuthorizationStatus? = nil
    @Published var coordinate: CLLocationCoordinate2D? = nil
    @Published var placemark: String? = nil
    private let geocoder = CLGeocoder()
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.status = status
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.coordinate = location.coordinate
        geocoder.reverseGeocodeLocation(location, completionHandler: { (places, error) in
            if error == nil {
                
//                self.placemark =
                guard let state = places?.first?.administrativeArea, let city = places?.first?.locality, let addr1 = places?.first?.name else { return }
                
                self.placemark = "\(state) \(city) \(addr1)"
                
            } else {
                self.placemark = nil
            }
        })
    }
}
