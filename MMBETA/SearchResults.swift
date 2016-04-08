//
//  SearchResults.swift
//  MMBETA
//
//  Created by Corbin Benally on 4/5/16.
//  Copyright © 2016 Munchie Meets. All rights reserved.
//
import UIKit

class SearchResults: UITableViewController{
    
    
    //expensive array, will store search results from backendless collection REST API requests
    //Global declaration for usability in tableView function
    var resultArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell!
        
        cell.textLabel?.text = "Corbin TERST"
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //will return number of items stored in ResultArray
        return resultArray.count
    }



}
