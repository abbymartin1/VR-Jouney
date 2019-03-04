//
//  ScoreBoardTableViewCell.swift
//  VR Journey
//
//  Created by Abby Martin on 2019-03-03.
//  Copyright © 2019 Abby Martin. All rights reserved.
//

import UIKit

class ScoreBoardTableViewCell: UITableViewCell {

    @IBOutlet var playerImage: UIImageView!
    @IBOutlet var playerNameImage: UILabel!
    @IBOutlet var mentalPointsLabel: UILabel!
    @IBOutlet var enviromentalPointsLabel: UILabel!
    @IBOutlet var physicalPointslabel: UILabel!
    @IBOutlet var globalPointsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI() {
        //make image circular
        playerImage.layer.borderColor = UIColor.black.cgColor
        playerImage.layer.borderWidth = 1
        playerImage.layer.masksToBounds = false
        playerImage.layer.cornerRadius = playerImage.frame.height/2
        playerImage.clipsToBounds = true
    }
}
