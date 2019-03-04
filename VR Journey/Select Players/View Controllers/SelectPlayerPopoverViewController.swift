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
    @IBOutlet var playerNameTextField: UITextField!
    @IBOutlet var personaImageCollectionView: UICollectionView!
    @IBOutlet var enterPlayerNameLabel: UILabel!
    
    //MARK: Properties
    private let reuseIdentifier = "selectPlayersPopoverCell"
    var selectedCell = 0;
    let playerTypes = ["Gaming Industry", "Travel Industry", "Medical Industry", "Other Industry"];
    let playerImages = [#imageLiteral(resourceName: "IMG_1878"), #imageLiteral(resourceName: "logo Orange "), #imageLiteral(resourceName: "Logo Grey"), #imageLiteral(resourceName: "Logo White")];
    
    //MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        personaImageCollectionView.delegate = self
        personaImageCollectionView.dataSource = self
        setUpUI()
    }
    
    //MARK: Methods
    
    func setUpUI() {
        //set title
        switch selectedCell {
        case 0:
            enterPlayerNameLabel.text = "Enter Player One's Name"
        case 1:
            enterPlayerNameLabel.text = "Enter Player Two's Name"
        case 2:
            enterPlayerNameLabel.text = "Enter Player Three's Name"
        case 3:
            enterPlayerNameLabel.text = "Enter Player Four's Name"
        default:
            enterPlayerNameLabel.text = "Enter Player's Name"
        }
    }
    
    //MARK: Actions
    @IBAction func doneButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension SelectPlayerPopoverViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = personaImageCollectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SelectPlayerPopoverCollectionViewCell
        cell.backgroundColor = .black
        cell.playersName.text = playerTypes[indexPath.row]
        cell.playersImage.image = playerImages[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //TODO: Display popup allowing user to pick their player and set name
    }
    
}
