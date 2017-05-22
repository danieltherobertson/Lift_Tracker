//
//  MainMenuViewController.swift
//  Lift_Tracker
//
//  Created by Daniel Robertson on 12/05/2017.
//  Copyright © 2017 Daniel Robertson. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    @IBOutlet weak var workoutModeButton: UIView!
    @IBOutlet weak var performanceButton: UIView!
    @IBOutlet weak var myWorkoutsButton: UIView!
    @IBOutlet weak var settingsButton: UIView!
    
    var userName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        print(userName)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func mainMenuButtonPressed(_ sender: UITapGestureRecognizer) {
        let button = sender.view
        print(button)
        button?.backgroundColor = UIColor.black
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
