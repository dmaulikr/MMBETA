//
//  SetLocationName.swift
//  MMBETA
//
//  Created by Corbin Benally on 2/15/16.
//  Copyright © 2016 Munchie Meets. All rights reserved.
//

import Foundation

protocol SetLocationDelegate {
    func setLocationName(ResultCell: NSObject)
    
}

class SetLocationName {
    
    var delegate: SetLocationDelegate?
    
    
    func getLocation(ResultCell: NSObject){
        
        print("TEST: \(ResultCell)")
        
        if delegate != nil {
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.delegate?.setLocationName(ResultCell)
            })
            
            
            
            
        }
        
        
        
    }
}