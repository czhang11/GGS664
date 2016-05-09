//
//  SettingViewController.swift
//  GGS 664 Project
//
//  Created by Chen ZHANG on 5/3/16.
//  Copyright © 2016 CSISS. All rights reserved.
//

import UIKit

class SettingViewController: UITableViewController, UIActionSheetDelegate, UIAlertViewDelegate {

    
    @IBOutlet weak var radiusSlider: UISlider!
    @IBOutlet weak var radiusLabel: UILabel!
    @IBOutlet weak var orderLabel: UILabel!
    
    @IBAction func raidusSliderFunc(sender: AnyObject) {
        
        if (radiusSlider.value != radiusSlider.maximumValue) {
            radiusLabel.text = String(Int(radiusSlider.value).description+"km")
            delegate.range = Int(radiusSlider.value)
        }
        else {
            radiusLabel.text = "Globe"
            delegate.range = -1
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        radiusSlider.value = Float(delegate.range)
        radiusLabel.text = String(Int(radiusSlider.value).description+"km")
    }
    

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return super.numberOfSectionsInTableView(tableView)
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return super.tableView(tableView, numberOfRowsInSection: section)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return super.tableView(tableView, heightForRowAtIndexPath:indexPath)
    }
    
    
    // MARK: - Delegates

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (indexPath.section == 1) {
            if (indexPath.row == 0) {
                let actionSheet = UIActionSheet(title: nil, delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: nil, otherButtonTitles: "Order by Date", "Order by Distance")
                actionSheet.tag = 1
                actionSheet.showInView(self.view)
            }
        }
        else if (indexPath.section == 2) {
            //orderLabel.text = "Order by Distance"
            let alert = UIAlertView(title: "GGS 664 - Project", message: "This app is developed by Chen Zhang, the full code and project can be downloaded from Github.", delegate: self, cancelButtonTitle: "Done", otherButtonTitles: "Go to Github")
            alert.tag = 1
            alert.show()
        }
    }
    

    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        
        //---------------------Gender---------------------
        if (actionSheet.tag == 1){
            if (buttonIndex == 1){
                orderLabel.text = "Order by Date"
            }
            else if (buttonIndex == 2){
                //orderLabel.text = "Order by Distance"
                let alert = UIAlertView(title: "Oops", message: "This function is still under developing", delegate: self, cancelButtonTitle: "Done")
                alert.show()
            }
            
        }
    }
    
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        
        //---------------------Github---------------------
        if alertView.tag == 1 {
            var url : NSURL
            url = NSURL(string: "https://github.com/czhang11/GGS664")!
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
}
