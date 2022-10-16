//
//  ViewController.swift
//  Timer. Workout
//
//  Created by Baidetskyi Jurii on 27.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: cellIdentifier
    let cellIdentifier = "ExcerciseTableViewCell"
    
    // MARK: excercises array
    var excercises = [Excercise]()
    
    // MARK: outlets
    @IBOutlet weak var createNewSetButtonOutlet: UIButton!
    @IBOutlet weak var startButtonOutlet: UIButton!
    @IBOutlet weak var addButtonOutlet: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        createNewSetButtonOutlet.layer.cornerRadius = 20
        startButtonOutlet.layer.cornerRadius = 20
        addButtonOutlet.layer.cornerRadius = 20
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.cornerRadius = 20
        
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil),
                           forCellReuseIdentifier: cellIdentifier)
    }
    
    // MARK: @IBAction func
    @IBAction func createNewSetButtonPressed(_ sender: Any) {
        customAlert()
    }
    
    @IBAction func startButtonPressed(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "CountViewController") as? CountViewController else {
            return
        }
        vc.excercises = excercises
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func addMoreButtonPressed(_ sender: Any) {
        customAlert()
    }
}
    // MARK: UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 20))
        headerView.backgroundColor = .systemBlue
        headerView.layer.cornerRadius = 20
        
        let label = UILabel()
        label.frame = CGRect.init(x: 10, y: 15, width: headerView.frame.width-10, height: headerView.frame.height)
        label.text = "Excercise name      Excercise time      Rest time"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        
        headerView.addSubview(label)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 50
        }
}
    // MARK: UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        excercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ExcerciseTableViewCell else {
            return UITableViewCell()
        }
        
        let excercise = excercises[indexPath.row]
        
        cell.layer.cornerRadius = 20
        cell.labelNameExcercise.text = excercise.name
        cell.labelTimeExcercise.text = excercise.excerciseTime
        cell.labelRest.text = excercise.restTime
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        self.excercises.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
      }
    }
}
