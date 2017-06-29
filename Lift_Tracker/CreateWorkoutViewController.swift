//
//  CreateWorkoutViewController.swift
//  Lift_Tracker
//
//  Created by Daniel Robertson on 16/06/2017.
//  Copyright © 2017 Daniel Robertson. All rights reserved.
//

import UIKit

class CreateWorkoutViewController: UIViewController {

    @IBOutlet weak var workoutCreationTableView: UITableView!
    
    lazy var mySections: [SectionType] = {
        let section = WorkoutDetailsSection()
//        let detailsSection = SectionData(sectionTitle: "Workout Details", cells: ["textFieldCell","textFieldCell","textFieldCell"])
//        let workoutSection = SectionData(sectionTitle: "Add Exercise", cells: ["textFieldCell","textFieldCell","switchCell", "buttonCell"])
//        
        return [section]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // This view controller itself will provide the delegate methods and row data for the table view.
        workoutCreationTableView.delegate = self
        workoutCreationTableView.dataSource = self
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

extension CreateWorkoutViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mySections[section].sectionName
    }
    
    @objc(tableView:heightForRowAtIndexPath:) func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return mySections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySections[section].sectionCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = mySections[indexPath.section].sectionCells[indexPath.row]["cell"]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellType!, for: indexPath) as! CustomWorkoutCell
        return cell
    }
}

extension CreateWorkoutViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.section, indexPath.row).")
    }
}
