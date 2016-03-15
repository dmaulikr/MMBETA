//
//  Search.swift
//  MMBETA
//
//  Created by Corbin Benally on 9/1/15.
//  Copyright (c) 2015 Munchie Meets. All rights reserved.
//

import UIKit
//import SwiftyJSON //Not needed after all

extension Search {
    //returns integer for how many rows
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return results.count
    }
    
    //displays content inside Table View Cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ResultCell") as! ResultCell
        let row = indexPath.row
        let startTime = NSDate()
        //let result = results[indexPath.row] as! [String: AnyObject]
        let resultOB = results[row] as NSObject
        //let result: AnyObject = result["name"] as! NSObject
        //backendless.initApp(APP_ID, secret:SECRET_KEY, version:VERSION_NUM)
        
    cell.textLabel?.text = "Corbin "
        
        //cell.delegate = self
        
        
        return cell
    }
 
    
}



//took SetLocationDelegate***
class Search: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //let locationService = SetLocationName()
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var results: [coffee_details]! = []
    
    let delegateService = CellInfoDelegate?.self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let startTime = NSDate()

        delegateService.delegate = self
        //
        
        
        self.tableView.reloadData()

        
    }
    
    func setLocationName(locationService: SetLocationName){
       
        dispatch_async(dispatch_get_main_queue(), { () -> Void in

            

            
        })
        
    }
    
    
    func processLocationLabel(theLocation: String){
        print("\(theLocation)")
        self.locationLabel.text = theLocation
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    //TableVIEW Code HERE
    
    

    //Corbin - 15-Feb-2016
    //Set Location Delegate
    func backendRequests (locationRequest: String){
        let backendless = Backendless.sharedInstance()
        let startTime = NSDate()
        
        
        //initializes Backendless BaaS
        //Need to implement in better object oriented structure
        backendless.initApp(APP_ID, secret:SECRET_KEY, version:VERSION_NUM)
        
        //REST API Requests
        //Asynchronous
        //
        backendless.persistenceService.of(coffee_details.ofClass()).find(
            BackendlessDataQuery(), response: { (results: BackendlessCollection!) -> () in
                let currentPage = results.getCurrentPage()
                
                //self.tableView.reloadData()
                //prints to console
                print("Loaded \(currentPage.count) results objects")
                print("Total results in the Backendless storage - \(results.totalObjects)")
                
                
                for result in currentPage {
                    
                    print("Results = \(result.name)")
                    //self.resultDispName.text = result.name as! String
                    
                    
                    //self.locationLabel.text = "\(result.name)"
                    //CellInfoDelegate.processLocationLabel("\(result.name)")
                    
                    //self.tableView.reloadData()
                    
                }
                
                print("Total time (ms) - \(1000*NSDate().timeIntervalSinceDate(startTime))")
            }
            ,
            
            error: { (fault : Fault!) -> () in
                print("Server reported an error: \(fault)")
        })
        
    }

}

