//
//  TimeFuncs.swift
//  GGS 664 Project
//
//  Created by Chen ZHANG on 5/5/16.
//  Copyright © 2016 CSISS. All rights reserved.
//

import Foundation

func timeIntervalToDate(timeInterval:NSTimeInterval) -> NSString {
    
    let sumSec = Int(timeInterval)
    var result = Int()
    
    if (sumSec/86400 > 0) {
        result = sumSec/86400
        return NSString(format:"%d Days Ago",result)
    }
    else if (sumSec/3600 > 0) {
        result = sumSec/3600
        return NSString(format:"%d Hours Ago",result)
    }
    else if (sumSec/60 > 0) {
        result = sumSec/60
        return NSString(format:"%d Minutes Ago",result)
    }
    else{
        return NSString(format:"Moments Ago")
    }
    
}