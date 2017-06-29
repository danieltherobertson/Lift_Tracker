//
//  AddWorkoutViewController.swift
//  Lift_Tracker
//
//  Created by Daniel Robertson on 12/05/2017.
//  Copyright © 2017 Daniel Robertson. All rights reserved.
//
/*
import UIKit

class AddWorkoutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CustomCellDelegate {

    @IBOutlet weak var expandableTable: UITableView!
    var cellDescriptors: NSMutableArray! //Arrray from plist, contains descriptors for each cell, array of arrays of dictionaries
    var visibleRowsPerSection = [[Int]]() //Array of array of ints, contains the row index values for cells marked as visible

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureTableView()
        loadCellDescriptors()
      //  print(cellDescriptors)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadCellDescriptors() {
        if let path = Bundle.main.path(forResource: "AddWorkoutCellDescriptors", ofType: "plist") {
            cellDescriptors = NSMutableArray(contentsOfFile: path)
            getIndicesOfVisibleRows()
            expandableTable.reloadData()
            print(cellDescriptors)
        }
    }

    func configureTableView() {
        expandableTable.delegate = self
        expandableTable.dataSource = self
        expandableTable.tableFooterView = UIView(frame: CGRect.zero)
        
        expandableTable.register(UINib(nibName: "NormalCell", bundle: nil), forCellReuseIdentifier: "idCellNormal")
        expandableTable.register(UINib(nibName: "TextfieldCell", bundle: nil), forCellReuseIdentifier: "idCellTextfield")
        expandableTable.register(UINib(nibName: "DatePickerCell", bundle: nil), forCellReuseIdentifier: "idCellDatePicker")
        expandableTable.register(UINib(nibName: "SwitchCell", bundle: nil), forCellReuseIdentifier: "idCellSwitch")
        expandableTable.register(UINib(nibName: "ValuePickerCell", bundle: nil), forCellReuseIdentifier: "idCellValuePicker")
        expandableTable.register(UINib(nibName: "SliderCell", bundle: nil), forCellReuseIdentifier: "idCellSlider")
    }
    
    func getIndicesOfVisibleRows() {
        visibleRowsPerSection.removeAll()
        
        for currentSectionCells in cellDescriptors {
            var visibleRows = [Int]()
            
            for row in 0...((currentSectionCells as! [[String: AnyObject]]).count - 1) { //for 0 to the length of each inner array containing a dictionary -1, so looping through each dictionary
                var currentSectionCellsAtRow = currentSectionCells as! [[String: AnyObject]]
                let isVisible = currentSectionCellsAtRow[row]["isVisible"] as! Bool
                if isVisible {
                   // print(isVisible)
                    visibleRows.append(row)
                }
            }
            
            visibleRowsPerSection.append(visibleRows)
        }
      //  print(visibleRowsPerSection)
    }
    
    func getCellDescriptorForIndexPath(_ indexPath: IndexPath) -> [String:AnyObject] {
        let indexOfVisibleRow = visibleRowsPerSection[indexPath.section][indexPath.row]
        let cellDescriptor = (cellDescriptors[indexPath.section] as! Array)[indexOfVisibleRow] as [String: AnyObject]
        
        return cellDescriptor
        
    }
    
    func maritalStatusSwitchChangedState(isOn: Bool) {
        let maritalSwitchCellSection = 1
        let maritalSwitchCellRow = 2
        
        var mutableDescriptors = cellDescriptors[maritalSwitchCellSection] as! [[String: Any]]
        
        if isOn {
            mutableDescriptors[maritalSwitchCellRow + 1].updateValue(true, forKey: "isVisible")
            mutableDescriptors[maritalSwitchCellRow].updateValue(true, forKey: "isExpanded")
            mutableDescriptors[maritalSwitchCellRow].updateValue("Yes", forKey: "value")

        } else {
            
        }

      
        
        
        
        //LOGIC TO INSERT NEW ROWS GOES HERE
     //   mutableDescriptors[maritalSwitchCellRow + 1].updateValue(valueToDisplay, forKey: "primaryTitle")
        cellDescriptors[maritalSwitchCellSection] = mutableDescriptors
       // expandableTable.reloadData()
    }
    
    // MARK: UITableView Delegate and Datasource Functions
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        guard cellDescriptors != nil else {
            return 0
        }
        
        return cellDescriptors.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return visibleRowsPerSection[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Workout Setup"
            
        default:
            return "Create Exercise"
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let currentCellDescriptor = getCellDescriptorForIndexPath(indexPath)
        
        switch currentCellDescriptor["cellIdentifier"] as! String {
        case "idCellNormal":
            return 60.0
            
        case "idCellDatePicker":
            return 270.0
            
        default:
            return 44.0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentCellDescriptor = getCellDescriptorForIndexPath(indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: currentCellDescriptor["cellIdentifier"] as! String, for: indexPath) as! CustomCell
        
        if currentCellDescriptor["cellIdentifier"] as! String == "idCellNormal" {
            if let primaryTitle = currentCellDescriptor["primaryTitle"] {
                cell.textLabel?.text = primaryTitle as? String
            }
            
            if let secondaryTitle = currentCellDescriptor["secondaryTitle"] {
                cell.detailTextLabel?.text = secondaryTitle as? String
            }
        }
        else if currentCellDescriptor["cellIdentifier"] as! String == "idCellTextfield" {
            cell.textField.placeholder = currentCellDescriptor["primaryTitle"] as? String
        }
        else if currentCellDescriptor["cellIdentifier"] as! String == "idCellSwitch" {
            cell.lblSwitchLabel.text = currentCellDescriptor["primaryTitle"] as? String
            
            let value = currentCellDescriptor["value"] as? String
            cell.swMaritalStatus.isOn = (value == "true") ? true : false
        }
        else if currentCellDescriptor["cellIdentifier"] as! String == "idCellValuePicker" {
            cell.textLabel?.text = currentCellDescriptor["primaryTitle"] as? String
        }
        else if currentCellDescriptor["cellIdentifier"] as! String == "idCellSlider" {
            let value = currentCellDescriptor["value"] as! String
            cell.slExperienceLevel.value = (value as NSString).floatValue
        }
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexOfTappedRow = visibleRowsPerSection[indexPath.section][indexPath.row]
        
        var mutableDescriptors = cellDescriptors[indexPath.section] as! [[String: Any]]
        
        if mutableDescriptors[indexOfTappedRow]["isExpandable"] as! Bool == true {
            var shouldExpandAndShowSubRows = false
            if mutableDescriptors[indexOfTappedRow]["isExpanded"] as! Bool == false {
                shouldExpandAndShowSubRows = true
            }
        
            mutableDescriptors[indexOfTappedRow].updateValue(shouldExpandAndShowSubRows, forKey: "isExpanded")
            
            for i in (indexOfTappedRow + 1)...(indexOfTappedRow + (mutableDescriptors[indexOfTappedRow]["additionalRows"] as! Int)) {
                mutableDescriptors[i].updateValue(shouldExpandAndShowSubRows, forKey: "isVisible")
            }
        } else {
           // print("not expandable")
            if (mutableDescriptors[indexOfTappedRow] as [String:Any])["cellIdentifier"] as! String == "idCellValuePicker" {
                //If cell is a value picker...
                var indexOfParentCell: Int!
                //Loop through starting at the indexOfTappedRow down to zero, until we find the first parent cell descriptor where isExpandable is true, then store that parent cell's index
                for i in (0...indexOfTappedRow).reversed() {
                    if mutableDescriptors[i]["isExpandable"] as! Bool == true {
                        indexOfParentCell = i
                        break
                    }
                }
                //Update the cellDescriptor for the first parent cell to set it's primaryTitle to be the text label of the cell at indexPath (the tapped cell)
                mutableDescriptors[indexOfParentCell].updateValue((expandableTable.cellForRow(at: indexPath) as! CustomCell).textLabel?.text, forKey: "primaryTitle")
               //Then update the first parent cell to not be expanded anymore
                mutableDescriptors[indexOfParentCell].updateValue(false, forKey: "isExpanded")
                
                //Loop through all the child cells of the tapped parent cell and change them to invisible, as the parent cell is no longer expanded
                for i in (indexOfParentCell + 1/*The first child cell...*/)...(/*...to the last child cell*/indexOfParentCell + (mutableDescriptors[indexOfParentCell]["additionalRows"] as! Int)) {
                    mutableDescriptors[i].updateValue(false, forKey: "isVisible")
                }
                
        }
    }
        cellDescriptors[indexPath.section] = mutableDescriptors
        getIndicesOfVisibleRows()
        expandableTable.reloadSections(NSIndexSet(index: indexPath.section) as IndexSet, with: UITableViewRowAnimation.fade)
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
 */
