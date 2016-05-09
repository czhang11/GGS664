//
//  LocationFuncs.swift
//  GGS 664 Project
//
//  Created by Chen ZHANG on 5/3/16.
//  Copyright © 2016 CSISS. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit


func queryCurrentLocationFromGPS(locationManager: CLLocationManager) {
    
    locationManager.requestWhenInUseAuthorization()
    
    if(CLLocationManager.locationServicesEnabled()) {
        NSLog("Start Locating")
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    else{
        NSLog("Location service is not enabled");
    }
    
}


func setCurrentLocationOnMap(location: CLLocation, locationMapView: MKMapView){
    let region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpanMake(0.005, 0.005))
    locationMapView.setRegion(region, animated: true)
    let pin = MapPin(coordinate: location.coordinate, title: "My location", subtitle: "")
    locationMapView.addAnnotation(pin)
}


func userDistance(currentLocation: CLLocation, fromLocation: CLLocation) -> NSString{
    
    let distanceMeters = NSNumber(double: currentLocation.distanceFromLocation(fromLocation))
    
    if (distanceMeters.integerValue >= 10000) {
        return NSString(format: "%d km", distanceMeters.integerValue/1000)
    }
    else if (distanceMeters.integerValue>1000 && distanceMeters.integerValue<10000){
        return NSString(format: "%.1f km", Float(distanceMeters.floatValue/1000))
    }
    else{
        return NSString(format: "%d m", distanceMeters.integerValue)
    }
}