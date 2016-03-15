//
//  MunchieSignUp.swift
//  MMBETA
//
//  Created by Corbin Benally on 8/28/15.
//  Copyright (c) 2015 Munchie Meets. All rights reserved.
//

import UIKit

class MunchieSignUp: UIViewController {

    var backendless = Backendless.sharedInstance()
    
    @IBOutlet weak var userSignUpEmail: UITextField!
    @IBOutlet weak var userSignUpPassword: UITextField!
    @IBOutlet weak var userSignUpFirstName: UITextField!
    @IBOutlet weak var userSignUpLastName: UITextField!
    @IBOutlet weak var userSignUpDateOfBirth: UITextField!
    
    @IBOutlet weak var userSignUpDOBPicked: UIDatePicker!
    
    @IBAction func clearTextFields(sender: AnyObject) {
        userSignUpEmail.text = ""
        userSignUpPassword.text = ""
        userSignUpFirstName.text = ""
        userSignUpLastName.text = ""
        userSignUpDateOfBirth.text = ""
    }
    

    @IBAction func createUser(sender: AnyObject) {
        registerUser(userSignUpEmail, userPass: userSignUpPassword, userFirstName: userSignUpFirstName, userLastName: userSignUpLastName, userDOB: userSignUpDOBPicked)
        
        registerUserAsync(userSignUpEmail, userPass: userSignUpPassword, userFirstName: userSignUpFirstName, userLastName: userSignUpLastName, userDOB: userSignUpDOBPicked)
        
        //dismissViewControllerAnimated(true, completion:nil)
    }

    
    override func viewDidLoad() {
        //        userSignUpEmail.resignFirstResponder()
        //        userSignUpPassword.resignFirstResponder()
        //        userSignUpFirstName.resignFirstResponder()
        //        userSignUpLastName.resignFirstResponder()
        //        userSignUpDateOfBirth.resignFirstResponder()
        super.viewDidLoad()

        //waits for single or multiple touch events
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)

        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Calls this function when the event is recognized.
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    
    //Registers users to Backendless.
    //PARAMETERS
    //userEmail - email users wish to log in with
    //userPass - password users wish to secure their account with
    //userFirstName - user's first name
    //userLastName - user's last name
    //userDOB - user's birthday
    func registerUser(userEmail: UITextField!, userPass: UITextField!, userFirstName: UITextField!, userLastName: UITextField!, userDOB: UIDatePicker!){
        Types.tryblock({ () -> Void in
            
            let user = BackendlessUser()
            let userDateOfBirth = "dateOfBirth"
            user.email = userEmail.text
            user.password = userPass.text
            user.name = userFirstName.text! + userLastName.text!
            user.setProperty(userDateOfBirth, object: userDOB.date)
            //user.setProperty("phoneNumber", object:"214-555-1212")
            
            let registeredUser = self.backendless.userService.registering(user)
            print("User has been registered (SYNC): \(registeredUser)")
            
            },
            
            catchblock: { (exception) -> Void in
                print("Server reported an error: \(exception as! Fault)")
                
        })

    }
    
    
    func registerUserAsync(userEmail: UITextField!, userPass: UITextField!, userFirstName: UITextField!, userLastName: UITextField!, userDOB: UIDatePicker!) {
        
        let user = BackendlessUser()
        user.email = userEmail.text
        user.password = userPass.text
        user.name = userFirstName.text! + userLastName.text!
        //user.setProperty("phoneNumber", object:"214-555-1212")
        
        backendless.userService.registering(user,
            response: { (let registeredUser : BackendlessUser!) -> () in
                print("User has been registered (ASYNC): \(registeredUser)")
            },
            error: { (let fault : Fault!) -> () in
                print("Server reported an error: \(fault)")
            }
        )
    }
    
    
    
    
    
    
    
}