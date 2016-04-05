//
//  ViewController.swift
//  InstantRating
//
//  Created by Aaron Eliason on 3/30/16.
//  Copyright © 2016 IlasonApps. All rights reserved.
//

import UIKit
import Firebase


class HostViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let base = Firebase(url: "https://instant-rating.firebaseio.com/")
    static let sharedInstance = HostViewController()
    
    var myGroups: [Groups]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        GroupController.fetchUserGroupsCreated("2131") { (groups) in
    
            // SET myGroups = groups
            // Reload your data
        }

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func createGroupButtonTapped(sender: AnyObject) {
        var loginTextField: UITextField?
        let alertController = UIAlertController(title: "Create Group", message: "Please Enter Group ID.", preferredStyle: .Alert)
        let ok = UIAlertAction(title: "Create", style: .Default, handler: { (action) -> Void in
            print("Create Button Pressed")
            
            let newGroup = Groups(groupName: loginTextField!.text!, questionID: "12", hostUserID: "2131", userIDs: ["Aaron","James","Sepncer"])
            FirebaseController.base.childByAppendingPath("groups").childByAutoId().setValue(newGroup.jsonValue)
        })
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
            print("Cancel Button Pressed")
        }
        alertController.addAction(ok)
        alertController.addAction(cancel)
        alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
            // Enter the textfiled customization code here.
            loginTextField = textField
            loginTextField?.placeholder = "Enter Group ID"
        }
        presentViewController(alertController, animated: true, completion: nil)
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("hostGroupsCell", forIndexPath: indexPath)
        cell.textLabel!.text = "devIos5"
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    

}













