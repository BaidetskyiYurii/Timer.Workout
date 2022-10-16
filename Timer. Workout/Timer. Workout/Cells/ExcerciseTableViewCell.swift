//
//  ExcerciseTableViewCell.swift
//  Timer. Workout
//
//  Created by Baidetskyi Jurii on 27.09.2022.
//

import UIKit

class ExcerciseTableViewCell: UITableViewCell {
    
    // MARK: outlets
    
    @IBOutlet weak var labelNameExcercise: UILabel!
    @IBOutlet weak var labelTimeExcercise: UILabel!
    @IBOutlet weak var labelRest: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
