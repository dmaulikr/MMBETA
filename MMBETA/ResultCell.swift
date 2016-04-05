//
//  ResultCell.swift
//  MMBETA
//
//  Created by Corbin Benally on 9/1/15.
//  Copyright (c) 2015 Munchie Meets. All rights reserved.
//

import UIKit
import Foundation

protocol CellInfoDelegate {
    //theLocation: String
    //func init()
    
}

//protocol CellInfoDelegate {
//    //theLocation: String
//        func processThatLocation()
//
//}

class ResultCell: UITableViewCell {
    //created delegate
    @IBOutlet weak var customLocation: UILabel!
    var delegate: CellInfoDelegate?
    

    //request data to pass in?
//02-March-2016
    //if delegate = self.delegate {
    
    
    }
    

    

