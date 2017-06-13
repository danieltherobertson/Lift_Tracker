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
        let addWorkoutbutton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addWorkout))
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

extension MyWorkoutsViewController: UICollectionViewDataSource {

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "workoutCell", for: indexPath)
        
        return cell
    }


    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 0
    }
}

extension MyWorkoutsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 4, height: 4)
    }
}

extension MyWorkoutsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}
