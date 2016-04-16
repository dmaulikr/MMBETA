//
//  SearchResults.swift
//  MMBETA
//
//  Created by Corbin Benally on 4/5/16.
//  Copyright © 2016 Munchie Meets. All rights reserved.
//
import UIKit

class SearchResults: UITableViewController{
    //Creates Backendless instance
    var backendless = Backendless.sharedInstance()
    
    
    //expensive array, will store search results from backendless collection REST API requests
    //Global declaration for usability in tableView function
    var resultArray = [String][""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //initializes backendless connection to BaaS
        //uses globally declared constants APP_ID, SECRET_KEY, & VERSION_NUM
        //Note: refactor line for improved object oriented methodologies
        backendless.initApp(APP_ID, secret:SECRET_KEY, version:VERSION_NUM)
        fetchingFirstPageAsync()
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ResultsTVCell") as UITableViewCell!
        
        cell.textLabel?.text = "Corbin TEST"
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //will return number of items stored in ResultArray
        return resultArray.count
    }

    func fetchingFirstPageAsync() {
        
        print("\n============ Fetching first page using the ASYNC API ============")
        
        let startTime = NSDate()
        
        let query = BackendlessDataQuery()
        backendless.persistenceService.of(nightclub_details.ofClass()).find(
            query,
            response: { ( nightclubs : BackendlessCollection!) -> () in
                let currentPage = nightclubs.getCurrentPage()
                print("Loaded \(currentPage.count) restaurant objects")
                print("Total restaurants in the Backendless starage - \(nightclubs.totalObjects)")
                
                for nightclub in currentPage as! [nightclub_details] {
                    print("Nightclub name = \(nightclub.name)")
                    //set up of expensive array
                    //gonna include th
                    //for index in 0...17 {
                    self.resultArray[1] = nightclub.name as String!
                    //}
                }
                
                print("Total time (ms) - \(1000*NSDate().timeIntervalSinceDate(startTime))")
            },
            error: { ( fault : Fault!) -> () in
                print("Server reported an error: \(fault)")
            }
        )
    }

}

