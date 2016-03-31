//
//  CurrentQuestionViewController.swift
//  InstantRating
//
//  Created by Aaron Eliason on 3/30/16.
//  Copyright © 2016 IlasonApps. All rights reserved.
//

import UIKit

class CurrentQuestionViewController: UIViewController {

    @IBOutlet weak var starOne: UIButton!
    
    @IBOutlet weak var starTwo: UIButton!
    
    @IBOutlet weak var starThree: UIButton!
    
    @IBOutlet weak var starFour: UIButton!
    
    @IBOutlet weak var starFive: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func starTapped(sender: AnyObject) {
        switch sender.tag {
        case 1 :
            starOne.selected = true
            starFive.selected = false
            starFour.selected = false
            starThree.selected = false
            starTwo.selected = false
            
        case 2:
            starTwo.selected = true
            starOne.selected = true
            starFive.selected = false
            starFour.selected = false
            starThree.selected = false
        case 3:
            starThree.selected = true
        starTwo.selected = true
        starOne.selected = true
            starFive.selected = false
            starFour.selected = false
        case 4:
        starFour.selected = true
        starThree.selected = true
        starTwo.selected = true
        starOne.selected = true
        starFive.selected = false

            
        default:
        starFive.selected = true
        starFour.selected = true
        starThree.selected = true
        starTwo.selected = true
        starOne.selected = true

            
            
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
