//
//  CountViewController.swift
//  Timer. Workout
//
//  Created by Baidetskyi Jurii on 01.10.2022.
//

import UIKit

class CountViewController: UIViewController {
    
    // MARK: timer
    var timer: Timer?
    // MARK: excercises array
    var excercises: [Excercise]?
    
    // MARK: properties
    var index = 0
    var second = 0
    var excerciseSecond: String?
    var restSecond: String?
    
    // MARK: outlets
    @IBOutlet weak var excerciseNameLabel: UILabel!
    @IBOutlet weak var doOrRestLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var countView: UIImageView!
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        countView.layer.cornerRadius = countView.frame.height / 2
        
        guard let excercises = excercises else { return }
        startExcerciseTimer(excercise: excercises[index])
        
    }
    
    // MARK:  private func
    private func startExcerciseTimer (excercise: Excercise) {
        timer?.invalidate()
       
        excerciseSecond = excercise.excerciseTime
        restSecond = excercise.restTime
        second = 0
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerExcerciseFunc), userInfo: nil, repeats: true)
    }
    
    private func startRestTimer () {
        timer?.invalidate()
        second = 0
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerRestFunc), userInfo: nil, repeats: true)
        
    }
    
    // MARK:  @objc func
    @objc func timerExcerciseFunc() {
        second += 1
        doOrRestLabel.text = "Do the excercise!"
        countView.backgroundColor = .systemGreen
        excerciseNameLabel.text = excercises?[index].name
        countLabel.text = String(second)
        if String(second) == excerciseSecond {
            second = 0
            startRestTimer()
        }
    }
    
    @objc func timerRestFunc() {
        second += 1
        countView.backgroundColor = .red
        doOrRestLabel.text = "Rest!"
        countLabel.text = String(second)
        
        
        if String(second) == restSecond {
            timer?.invalidate()
            second = 0
            index += 1
            
            guard let excercises = excercises else { return }
            if index < excercises.count {
                startExcerciseTimer(excercise: excercises[index])
            } else {
                youDidIt()
                timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(previousScreen), userInfo: nil, repeats: true)
            }
        }
    }
    
    @objc func previousScreen () {
        second += 1
        
        if second == 5 {
            timer?.invalidate()
            second = 0
            dismiss(animated: true) {
                self.navigationController?.popToRootViewController(animated: true)
                
            }
        }
    }
}
