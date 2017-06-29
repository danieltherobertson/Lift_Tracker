//
//  WorkoutDetailsSection.swift
//  Lift_Tracker
//
//  Created by Daniel Robertson on 29/06/2017.
//  Copyright © 2017 Daniel Robertson. All rights reserved.
//

import Foundation


protocol SectionType {
    var sectionName: String { get }
    var sectionCells: [[String:String]] { get }
}

extension SectionType {
    subscript(index: Int) -> [String:String] {
        return sectionCells[index]
    }
}

//struct WorkoutDetailsSection {
//    var sectionName = "Workout Details"
//    var workoutName = "textFieldCell"
//    var numberOfExercises = "textFieldCell"
//    var muscleGroup = "textFieldCell"
//    
//}

struct WorkoutDetailsSection: SectionType {
    var sectionName = "Workout Details"
    var sectionCells = [["cell" : "textFieldCell", "placeholder" : "Workout Name"], ["cell" : "textFieldCell", "placeholder" : "Muscle Group(s)"], ["cell" : "textFieldCell", "placeholder" : "Number of Exercises"]]    
}

