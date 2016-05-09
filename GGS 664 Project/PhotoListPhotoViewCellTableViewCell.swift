//
//  PhotoListPhotoViewCellTableViewCell.swift
//  GGS 664 Project
//
//  Created by Chen ZHANG on 5/3/16.
//  Copyright © 2016 CSISS. All rights reserved.
//

import UIKit

class PhotoListPhotoViewCellTableViewCell: UITableViewCell {

    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var locationLabel: UILabel!
    var post = AVObject()
    var selfView = PhotoListTableViewController()
    
    @IBAction func photoButtonFunc(sender: AnyObject) {
        
        let imageInfo = JTSImageInfo()
        imageInfo.image = UIImage(data: NSData(contentsOfURL: NSURL(string: post[AV_POSTS_IMAGE].url)!)!)
                      
        let imageViewer = JTSImageViewController(imageInfo: imageInfo, mode: JTSImageViewControllerMode.Image, backgroundStyle: JTSImageViewControllerBackgroundOptions.Scaled)
        imageViewer.showFromViewController(selfView, transition: JTSImageViewControllerTransition.FromOriginalPosition)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
