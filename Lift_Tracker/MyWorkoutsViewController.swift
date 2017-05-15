//
//  MyWorkoutsViewController.swift
//  Lift_Tracker
//
//  Created by Daniel Robertson on 12/05/2017.
//  Copyright © 2017 Daniel Robertson. All rights reserved.
//

import UIKit

class MyWorkoutsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let addWorkoutbutton = UIBarButtonItem.init(title: "Add Workout", style: .plain, target: self, action: #selector(addWorkout))
        self.navigationItem.rightBarButtonItem = addWorkoutbutton
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addWorkout() {
        performSegue(withIdentifier: "segueToAddWorkout", sender: nil)
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