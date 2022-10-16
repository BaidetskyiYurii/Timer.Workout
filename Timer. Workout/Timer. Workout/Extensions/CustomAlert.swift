//
//  Extension.swift
//  Timer. Workout
//
//  Created by Baidetskyi Jurii on 27.09.2022.
//

import Foundation
import UIKit

extension ViewController {
    
     func customAlert () {
         
         var nameTextField: UITextField?
         var timeExcerciseTextField: UITextField?
         var timeRestTextField: UITextField?
        //MARK: alertController
        
        let alertController = UIAlertController(
            title: "New Set",
            message: "Please fill in all fields",
            preferredStyle: .alert)
        
        //MARK: alertController actions
        
         let addAction = UIAlertAction(
            title: "Add",
            style: .default) {
                (action) -> Void in
                if let name = nameTextField?.text,
                   let timeForExcercise = timeExcerciseTextField?.text,
                   let timeForRest = timeRestTextField?.text {
                    self.excercises.append(Excercise(name: name,
                                                     excerciseTime: timeForExcercise,
                                                     restTime: timeForRest))
                    self.createNewSetButtonOutlet.isHidden = true
                    self.startButtonOutlet.isHidden = false
                    self.addButtonOutlet.isHidden = false
                    self.tableView.reloadData()
                }
                
                
            }
         
        let cancelAction = UIAlertAction(
            title: "Cancel", style: .destructive) {
                (action) -> Void in
            }
        
        //MARK: alertController text fields
        
        alertController.addTextField { excersisenameTextField in
            nameTextField = excersisenameTextField
            nameTextField?.placeholder = "Excersise name"
            nameTextField?.textContentType = .name
        }
        
        alertController.addTextField { timeForExcersiseTextField in
            timeExcerciseTextField = timeForExcersiseTextField
            timeForExcersiseTextField.placeholder = "Time for excersise"
        }
        
        alertController.addTextField { timeForRestTextField in
            timeRestTextField = timeForRestTextField
            timeForRestTextField.placeholder = "Time for rest"
        }
        
        //MARK: alertController add actions and present
        
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
}

