//
//  AppDelegate.swift
//  MMBETA
//
//  Created by Corbin Benally on 8/27/15.
//  Copyright (c) 2015 Munchie Meets. All rights reserved.
//

import UIKit

let APP_ID = "AA9D0225-3DF1-DC0F-FF91-2B1E67968100"
let SECRET_KEY = "3CF6B0FE-103B-3F22-FF4E-5671000E6900"
let VERSION_NUM = "v1"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var backendless = Backendless.sharedInstance()
    var window: UIWindow?
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        backendless.initApp(APP_ID, secret:SECRET_KEY, version:VERSION_NUM)
    
    return true
    }
    
}

