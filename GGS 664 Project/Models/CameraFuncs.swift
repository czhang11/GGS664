//
//  CameraFuncs.swift
//  GGS 664 Project
//
//  Created by Chen ZHANG on 5/2/16.
//  Copyright © 2016 CSISS. All rights reserved.
//
//


import Foundation
import MobileCoreServices

func captureVideoFromCamera(target: AnyObject)->UIImagePickerController{
    
    if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)){
        
    }
    
    let videoPicker = UIImagePickerController()
    videoPicker.sourceType = UIImagePickerControllerSourceType.Camera
    videoPicker.mediaTypes = [kUTTypeMovie as String]
    videoPicker.allowsEditing = false
    videoPicker.videoMaximumDuration = 30
    videoPicker.videoQuality = UIImagePickerControllerQualityType.Type640x480
    
    target.presentViewController(videoPicker, animated: true, completion: nil)
    
    return videoPicker
}


func captureVideoFromLibrary(target: AnyObject)->UIImagePickerController{
    
    let videoPicker = UIImagePickerController()
    videoPicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
    videoPicker.mediaTypes = [kUTTypeMovie as String]
    videoPicker.allowsEditing = false
    videoPicker.videoMaximumDuration = 30
    videoPicker.videoQuality = UIImagePickerControllerQualityType.Type640x480
    
    target.presentViewController(videoPicker, animated: true, completion: nil)
    
    return videoPicker
}


func captureImageFromCamera(target: AnyObject)->UIImagePickerController{
    
    let imagePicker = UIImagePickerController()
    imagePicker.allowsEditing = false
    imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
    imagePicker.showsCameraControls = true
    
    target.presentViewController(imagePicker, animated: true, completion: nil)
    
    return imagePicker
}


func captureImageFromPhotoLibrary(target: AnyObject)->UIImagePickerController{
    
    let imagePicker = UIImagePickerController()
    imagePicker.allowsEditing = false
    imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
    
    target.presentViewController(imagePicker, animated: true, completion: nil)
    
    return imagePicker
}


func reSizeImage(image: UIImage, reSize: NSInteger)->UIImage
{
    var scale = Float()
    
    if ((Int(image.size.width)>=Int(image.size.height)) && (Int(image.size.width)>reSize))
    {
        scale = Float(Int(image.size.width)/Int(reSize))
        var height = CGFloat(Float(image.size.height)/scale)
        
        UIGraphicsBeginImageContext(CGSizeMake(CGFloat(reSize), height))
        image.drawInRect(CGRectMake(0, 0, CGFloat(reSize), height))
        var reSizeImage = UIGraphicsGetImageFromCurrentImageContext() as UIImage
        UIGraphicsEndImageContext()
        
        return reSizeImage
    }
        
    else if ((Int(image.size.width)<Int(image.size.height) && (Int(image.size.height)>reSize)))
    {
        scale = Float(Int(image.size.height)/reSize)
        var width = CGFloat(Float(image.size.width)/scale)
        
        UIGraphicsBeginImageContext(CGSizeMake(width, CGFloat(reSize)))
        image.drawInRect(CGRectMake(0, 0, width, CGFloat(reSize)))
        var reSizeImage = UIGraphicsGetImageFromCurrentImageContext() as UIImage
        UIGraphicsEndImageContext();
        
        return reSizeImage
    }
        
    else
    {
        return image;
    }
}
