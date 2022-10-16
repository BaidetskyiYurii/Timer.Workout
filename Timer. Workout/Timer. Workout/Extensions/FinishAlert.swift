//
//  FinishAlert.swift
//  Timer. Workout
//
//  Created by Baidetskyi Jurii on 04.10.2022.
//

import Foundation
import UIKit

extension CountViewController {
    
    func youDidIt () {
        
        let alertController = UIAlertController(title: "Congratulation!", message: "You did it!", preferredStyle: .alert)

        present(alertController, animated: true)
    }
    
}
