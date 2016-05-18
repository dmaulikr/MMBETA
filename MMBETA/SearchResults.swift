//
//  SearchResults.swift
//  MMBETA
//
//  Created by Corbin Benally on 4/5/16.
//  Copyright © 2016 Munchie Meets. All rights reserved.
//
import UIKit

//trying to create an object within ViewController
//backendless support suggested
class LasVegasCoffee_details: NSObject {
    var name : String?
    var objectId : String?
    //var telephone : String?
    var address : String?
    var hours : String?
}

class SearchResults: UITableViewController{
    //Creates Backendless instance
    var backendless = Backendless.sharedInstance()
    
    
    //expensive array, will store search results from backendless collection REST API requests
    //Global declaration for usability in tableView function
//<<<<<<< HEAD
    //var resultArray = [String][""]
//=======
    //var resultArray: [NSObject] = []
//>>>>>>> origin/master
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //initializes backendless connection to BaaS
        //uses globally declared constants APP_ID, SECRET_KEY, & VERSION_NUM
        //Note: refactor line for improved object oriented methodologies
        //backendless.initApp(APP_ID, secret:SECRET_KEY, version:VERSION_NUM)
        //Looks like loading objects from backendless is causing the program to crash with memory error
        
        //fetchingFirstPageAsync()
        fetchingFirstPage()
        
        
        //tableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //try "cell" and delete references, and use default built in textLabel
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!
        
        cell.textLabel?.text = "Corbin Test"
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //will return number of items stored in ResultArray
        return 1
    }

    func fetchingFirstPageAsync() {
        
        print("\n============ Fetching first page using the ASYNC API ============")
        
        let startTime = NSDate()
        
        let query = BackendlessDataQuery()
        backendless.persistenceService.of(LasVegasCoffee_details.ofClass()).find(
            query,
            response: { (results : BackendlessCollection!) -> () in
                let currentPage = results.getCurrentPage()
                

                print("Loaded \(currentPage.count) restaurant objects")
                //print("Total restaurants in the Backendless starage - \(restaurants.totalObjects)")
                
                for result in currentPage as! [LasVegasCoffee_details] {
                    
                    print("Restaurant name = \(result.name)")
                    
                }
                
                print("Total time (ms) - \(1000*NSDate().timeIntervalSinceDate(startTime))")
            },
            error: { ( fault : Fault!) -> () in
                print("Server reported an error: \(fault)")
            }
        )
    }
    
    
    
    
    func fetchingFirstPage() {
        
        print("\n============ Fetching first page using the SYNC API ============")
        
        Types.tryblock({ () -> Void in
            
            let startTime = NSDate()
            
            let query = BackendlessDataQuery()
            let restaurants = self.backendless.persistenceService.of(LasVegasCoffee_details.ofClass()).find(query)
            
            let currentPage = restaurants.getCurrentPage()
            print("Loaded \(currentPage.count) restaurant objects")
            print("Total restaurants in the Backendless starage - \(restaurants.totalObjects)")
            
            for restaurant in currentPage as! [LasVegasCoffee_details] {
                print("Restaurant name = \(restaurant.name)")
            }
            
            print("Total time (ms) - \(1000*NSDate().timeIntervalSinceDate(startTime))")
            },
                       
                       catchblock: { (exception) -> Void in
                        print("Server reported an error: \(exception as! Fault)")
            }
        )
    }
    
}


