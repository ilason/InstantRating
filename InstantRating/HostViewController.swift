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
    @IBOutlet weak var hostTableView: UITableView!
    
    let base = Firebase(url: "https://instant-rating.firebaseio.com/")
    static let sharedInstance = HostViewController()
    
    var myGroups: [Groups]?

    override func viewDidLoad() {
        super.viewDidLoad()
        GroupController.sharedInstance.fetchGroupsCreatedByUser("2131") { (groups) in
            self.myGroups = groups
            dispatch_async(dispatch_get_main_queue(), { 
                self.hostTableView.reloadData()
            })
           
        }
        
        
            // SET myGroups = groups
            // Reload your data
        

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
        if let myGroups = self.myGroups {
            let group = myGroups[indexPath.row]
            cell.textLabel!.text = group.groupName
            
        }
      
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroups?.count ?? 0
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let groups = myGroups![indexPath.row]
//            GroupController.sharedInstance.deleteGroupFromFirebase()
                FirebaseController.base.childByAppendingPath("groups").childByAppendingPath(groups.identifier!).removeValue()
            
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    

}













