//
//  PostTableViewController.swift
//  GGS 664 Project
//
//  Created by Chen ZHANG on 4/18/16.
//  Copyright © 2016 CSISS. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import AVFoundation


class MapPin: NSObject, MKAnnotation {

    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?

    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}


class PostTableViewController: UITableViewController, UIActionSheetDelegate, MKMapViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var file = AVFile()
    var thumbnail = AVFile()
    var imageTag = 0
    
    
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var tagTextField: UITextField!
    @IBOutlet weak var locationMapView: MKMapView!
    @IBOutlet weak var locationNameTextView: UITextView!
    @IBOutlet weak var postButton: UIButton!
    
    @IBAction func cancelButtonFunc(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func postButton(sender: AnyObject) {
        
        let post = AVObject(className: AV_POSTS_CLASS_NAME)
        post[AV_POSTS_SENDER] = nameTextField.text
        post[AV_POSTS_POSTCONTENT] = descriptionTextView.text
        post[AV_POSTS_TAG] = tagTextField.text
        post[AV_POSTS_IMAGE] = file
        post[AV_POSTS_THUMBNAIL] = thumbnail
        post[AV_POSTS_GEOPOINT] = AVGeoPoint(location: delegate.currentLocation)
        
        if imageTag == 0 {
            let alert = UIAlertView(title: "Please select a photo", message: nil, delegate: self, cancelButtonTitle: "Done")
            alert.show()
        }
        else {
            post.saveInBackgroundWithBlock { (succeeded, error: NSError!) -> Void in
                if(error == nil){
                    let alert = UIAlertView(title: "Successfully", message: nil, delegate: self, cancelButtonTitle: "Done")
                    alert.show()
                }
                else{
                    let alert = UIAlertView(title: "Failed to post", message: nil, delegate: self, cancelButtonTitle: "Done")
                    alert.show()
                    self.postButton.alpha = 0.5
                    self.postButton.enabled = false
                }
            }
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    
    @IBAction func imageButtonFunc(sender: AnyObject) {
        
        let actionSheet = UIActionSheet(title: nil, delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: "Take a photo", otherButtonTitles: "Select photo from library","Remove")
        actionSheet.tag = 1
        actionSheet.showInView(self.view)
        
    }
    
    
    
    // MARK: - View Load
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setCurrentLocationOnMap(delegate.currentLocation, locationMapView: locationMapView)
        
        CLGeocoder().reverseGeocodeLocation(delegate.currentLocation) { (placemarks, error) -> Void in
            
            if((error == nil) && (placemarks!.count>0)){
                let currentPlacemark = placemarks![0] as CLPlacemark
                let formattedAddress = NSDictionary(dictionary: currentPlacemark.addressDictionary!).objectForKey("FormattedAddressLines") as! NSArray
                
                if formattedAddress.count == 0 {
                    self.locationNameTextView.text = String("Address info unavailable")
                }
                else if formattedAddress.count<2 {
                    self.locationNameTextView.text = String(format:"%@", formattedAddress[0] as! String)
                }
                else if formattedAddress.count<3 {
                    self.locationNameTextView.text = String(format:"%@ \n%@", formattedAddress[0] as! String, formattedAddress[1] as! String)
                }
            }
            else{
                //NSLog("Reverse Geocode location Error: %@", error)
            }
        }
    }

    
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }
        else if section == 1 {
            return 2
        }
        else if section == 2{
            return 4
        }
        else {
            return 0
        }
    }

    
    
    // MARK - Delegates
    override func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        self.view.endEditing(true)
    } 
    
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        let pinAnnotationView = MKPinAnnotationView()
        pinAnnotationView.annotation = annotation
        pinAnnotationView.pinColor = MKPinAnnotationColor.Green
        pinAnnotationView.animatesDrop = true
        
        return pinAnnotationView
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let thumbnailImage = reSizeImage(info[UIImagePickerControllerOriginalImage] as! UIImage, reSize: 256)
        file = AVFile.init(name: "picture.jpg", data: UIImageJPEGRepresentation(reSizeImage(info[UIImagePickerControllerOriginalImage] as! UIImage, reSize: 1024), 0.5))
        thumbnail = AVFile.init(name: "thumbnail.jpg", data: UIImageJPEGRepresentation(thumbnailImage, 0.5)) as AVFile
        
        imageButton.setBackgroundImage(thumbnailImage, forState: UIControlState.Normal)
        imageTag = 1
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        
        //-----------------------Upload Media-----------------------
        if(actionSheet.tag == 1){
            
            var imagePicker = UIImagePickerController()
            
            //-----------------------Photo-----------------------
            if (buttonIndex == actionSheet.destructiveButtonIndex){
                imagePicker = captureImageFromCamera(self)
            }
            //-----------------------Photo Library-----------------------
            else if (buttonIndex == 2){
                imagePicker = captureImageFromPhotoLibrary(self)
            }
                
            //-----------------------Remove-----------------------
            else if (buttonIndex == 3){
                imageButton.setBackgroundImage(UIImage(named: "bubble_photo.png"), forState: UIControlState.Normal)
                imageTag = 0
            }
            
            imagePicker.delegate = self
        }
    }

}
