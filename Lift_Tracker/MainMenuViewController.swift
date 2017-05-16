//
//  MainMenuViewController.swift
//  Lift_Tracker
//
//  Created by Daniel Robertson on 12/05/2017.
//  Copyright © 2017 Daniel Robertson. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    @IBOutlet var menuButtons: [UIButton]!
    @IBOutlet weak var menuGreeting: UILabel!
    
    var userName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        for button in menuButtons {
            button.layer.cornerRadius = 30
//            button.layer.borderWidth = 5
//            button.layer.borderColor = UIColor(red: 35/255, green: 198/255, blue: 255/255, alpha: 1.0).cgColor
        }
        
        print(userName)
        menuGreeting.text = "Welcome, \(userName)"
        
        // Do any additional setup after loading the view.
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
