//
//  Persona Table View Cell.swift
//  VR Journey
//
//  Created by Abby Martin on 2019-02-18.
//  Copyright © 2019 Abby Martin. All rights reserved.
//

import UIKit

class PersonaTableViewCell: UITableViewCell {
    @IBOutlet var personImageView: UIImageView!
    @IBOutlet var personaTitle: UILabel!
    @IBOutlet var personaDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        //cell has been selected
    }
    
    func setupUI() {
        //make image circular
        personImageView.layer.borderColor = UIColor.black.cgColor
        personImageView.layer.borderWidth = 1
        personImageView.layer.masksToBounds = false
        personImageView.layer.cornerRadius = personImageView.frame.height/2
        personImageView.clipsToBounds = true
    }
}
