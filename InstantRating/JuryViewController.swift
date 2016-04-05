//
//  JuryHostViewController.swift
//  InstantRating
//
//  Created by Aaron Eliason on 3/30/16.
//  Copyright © 2016 IlasonApps. All rights reserved.
//

import UIKit

class JuryViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var myGroups: [Groups]?

    override func viewDidLoad() {
        super.viewDidLoad()
        GroupController.sharedInstance.fetchGroupForJudge() { (groups) in
            self.myGroups = groups
            dispatch_async(dispatch_get_main_queue(), {
                self.tableView.reloadData()
            })
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func joinGroupButtonTapped(sender: AnyObject) {
        
        var loginTextField: UITextField?
        let alertController = UIAlertController(title: "Join Group", message: "Please Enter Group ID Accurately.", preferredStyle: .Alert)
        let ok = UIAlertAction(title: "Join", style: .Default, handler: { (action) -> Void in
            
            //User can add themself to a group
            let addNewGroup = Groups(groupName: loginTextField!.text!, questionID: "12", hostUserID: "2131", userIDs: ["Aaron","James","Sepncer"])
            FirebaseController.base.childByAppendingPath("groups").childByAutoId().setValue(addNewGroup.jsonValue)
            print("Ok Button Pressed")
            
            
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
        let cell = tableView.dequeueReusableCellWithIdentifier("juryGroupCell", forIndexPath: indexPath)
        if let myGroups = self.myGroups {
            let group = myGroups[indexPath.row]
            cell.textLabel!.text = group.groupName
        }
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroups?.count ?? 0
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
