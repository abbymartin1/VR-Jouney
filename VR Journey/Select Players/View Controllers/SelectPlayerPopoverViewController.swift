//
//  SelectPlayerPopover.swift
//  VR Journey
//
//  Created by Abby Martin on 2019-02-21.
//  Copyright © 2019 Abby Martin. All rights reserved.
//

import UIKit

class SelectPlayerPopoverViewController: UIViewController {
    //MARK: Outlets
    @IBOutlet var backgroundView: UIView!
    @IBOutlet var frontView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var playerNameTextField: UITextField!
    @IBOutlet var personaImageCollectionView: UICollectionView!
    
    //MARK: Properties
    private let reuseIdentifier = "SelectPlayerCell"
    
    //MARK: Overrides
    
    //MARK: Methods
    
    //MARK: Actions
    
}

extension SelectPlayerPopoverViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = personaImageCollectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SelectPlayerCollectionViewCell
        cell.backgroundColor = .black
        cell.playersImage.image = #imageLiteral(resourceName: "VR Journey")
        cell.playersName.text =  ""
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //TODO: Display popup allowing user to pick their player and set name
        performSegue(withIdentifier: "ShowPopover", sender: nil)
    }
    
}
