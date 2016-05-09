//
//  PhotoListTableViewController.swift
//  GGS 664 Project
//
//  Created by Chen ZHANG on 4/18/16.
//  Copyright © 2016 CSISS. All rights reserved.
//

import UIKit
import CoreLocation

var delegate = UIApplication.sharedApplication().delegate as! AppDelegate

class PhotoListTableViewController: UITableViewController, CLLocationManagerDelegate {

    var postsList = NSMutableArray()
    var indexPathAtRow = NSIndexPath()
    var refresh = UIRefreshControl()
    
    
    
    // MARK: - View load
    
    override func viewDidLoad() {
        
        //---------------------Updated Location---------------------
        delegate.locationManager.delegate = self
        queryCurrentLocationFromGPS(delegate.locationManager)
        
        super.viewDidLoad()
    }
    
    

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return postsList.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let post = postsList[indexPath.section] as! AVObject

        let postCell = tableView.dequeueReusableCellWithIdentifier("postCell", forIndexPath: indexPath) as! PhotoListPhotoViewCellTableViewCell
        postCell.photoButton.setBackgroundImage(UIImage(data: NSData(contentsOfURL: NSURL(string: post[AV_POSTS_THUMBNAIL].url)!)!), forState: UIControlState.Normal)
        postCell.descriptionTextView.text = post[AV_POSTS_POSTCONTENT] as! String
        postCell.locationLabel.text = String(format: "%@ away",userDistance(delegate.currentLocation, fromLocation: CLLocation(latitude: post[AV_POSTS_GEOPOINT].latitude, longitude: post[AV_POSTS_GEOPOINT].longitude)))
        postCell.post = post
        postCell.selfView = self
    
        return postCell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 100
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        //---------------------Near---------------------
        if (delegate.orderType == POST_ORDER_TYPE_DATE){
            
            let post = postsList[section] as! AVObject
            let postDate = post[AV_POSTS_CREATEDAT] as! NSDate
            
            if (section - 1 >= 0)
            {
                let previousPost = postsList[section-1] as! AVObject
                let previousPostDate = previousPost[AV_POSTS_CREATEDAT] as! NSDate
                
                if (timeIntervalToDate(NSDate().timeIntervalSinceDate(postDate)).isEqualToString(timeIntervalToDate(NSDate().timeIntervalSinceDate(previousPostDate)) as String)) {
                    return nil
                }
            }
            
            return timeIntervalToDate(NSDate().timeIntervalSinceDate(postDate)) as String
        }
        
        return nil
    }
    
    
    
    //MARK: - Delegates
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        delegate.currentLocation = locations.last! as CLLocation
        delegate.locationManager.stopUpdatingLocation()

        if (delegate.isLocated == false){
            
            NSLog("currentLocation: %@",delegate.currentLocation)
            
            CLGeocoder().reverseGeocodeLocation(delegate.currentLocation) { (placemarks, error) -> Void in
                
                if((error == nil) && (placemarks!.count>0)){
                    let currentPlacemark = placemarks![0] as CLPlacemark
                    delegate.currentLocationName = currentPlacemark.name!
                    print("currentPlacemark: %@", currentPlacemark.name)
                }
                else{
                    print("Reverse Geocode location Error: %@", error)
                }
            }
            delegate.isLocated = true
            
            
            if delegate.orderType == POST_ORDER_TYPE_DATE {
                queryPostsByDate()
            }
            else if delegate.orderType == POST_ORDER_TYPE_DISTANCE {
                queryPostsByDistance()
            }
        }
        
    }
    
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        
        NSLog("Location Query Error: %@", error)
        delegate.isLocated = false
        
        if delegate.orderType == POST_ORDER_TYPE_DATE {
            queryPostsByDate()
        }
        else if delegate.orderType == POST_ORDER_TYPE_DISTANCE {
            queryPostsByDistance()
        }
    }
    
    
    
    // MARK: - Funcs

    func queryPostsByDate() {
        
        //---------------------Set refreshing---------------------
        refresh.addTarget(self, action: #selector(PhotoListTableViewController.queryPostsByDate), forControlEvents: UIControlEvents.ValueChanged)
        
        //refresh.attributedTitle = NSAttributedString(string: "Refresh")
        self.view.addSubview(refresh)
        
        
        //---------------------Query from server---------------------
        let query = AVQuery(className: AV_POSTS_CLASS_NAME)
        query.addDescendingOrder(AV_POSTS_CREATEDAT)
        if delegate.isLocated {
            if (delegate.range != -1){
                query.whereKey(AV_POSTS_GEOPOINT, nearGeoPoint: AVGeoPoint(location: delegate.currentLocation), withinKilometers: Double(delegate.range))
            }
        }
        
        query.limit = 30
        
        query.findObjectsInBackgroundWithBlock { (objects: [AnyObject]!, error: NSError!) -> Void in
            if(error == nil){
                self.postsList.removeAllObjects()
                for object in objects{
                    let post = object as! AVObject
                    self.postsList.addObject(post)
                }
                NSLog("posts: %@", objects)
                self.tableView.reloadData()
                self.refresh.endRefreshing()
            }
        }
    }
    
    
    func queryPostsByDistance() {
        
    }
    
    
}
