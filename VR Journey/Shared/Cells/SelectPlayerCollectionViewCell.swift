//
//  SelectPlayerCollectionViewCell.swift
//  VR Journey
//
//  Created by Abby Martin on 2019-02-19.
//  Copyright © 2019 Abby Martin. All rights reserved.
//

import UIKit

class SelectPlayerCollectionViewCell: UICollectionViewCell {
    @IBOutlet var playersImage: UIImageView!
    @IBOutlet var playersName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI() {
        //make image circular
        playersImage.layer.borderColor = UIColor.black.cgColor
        playersImage.layer.borderWidth = 1
        playersImage.layer.masksToBounds = false
        playersImage.layer.cornerRadius = playersImage.frame.height/2
        playersImage.clipsToBounds = true
    }
}

class SelectPlayerPopoverCollectionViewCell: UICollectionViewCell {
    @IBOutlet var playersImage: UIImageView!
    @IBOutlet var playersName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI() {
        //make image circular
        playersImage.layer.borderColor = UIColor.black.cgColor
        playersImage.layer.borderWidth = 1
        playersImage.layer.masksToBounds = false
        playersImage.layer.cornerRadius = playersImage.frame.height/2
        playersImage.clipsToBounds = true
    }
    
}
