//
//  SelectPlayerPopover.swift
//  VR Journey
//
//  Created by Abby Martin on 2019-02-21.
//  Copyright © 2019 Abby Martin. All rights reserved.
//

protocol selectPlayerDelegate {
    func updatePlayerNames(playerIndex: Int, playerName: String, playerCategory: categories, playerImage: UIImage)
}

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
    let playerTypes = ["Gaming", "Travel", "Medical", "Education"];
    let playerImages = [#imageLiteral(resourceName: "game icon"), #imageLiteral(resourceName: "plane icon"), #imageLiteral(resourceName: "medical icon"), #imageLiteral(resourceName: "edu icon")];
    var delegate: selectPlayerDelegate?
    var selectedImage: UIImage?
    var selectedCategory: categories?
    
    //MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        personaImageCollectionView.delegate = self
        personaImageCollectionView.dataSource = self
        setUpUI()
        //will cause to tap notinterfere and cancel other interactions.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        playerNameTextField.resignFirstResponder()
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
        //save name for player pod
        if (playerNameTextField.text != "" && selectedImage != nil && selectedCategory != nil) {
            self.delegate?.updatePlayerNames(playerIndex: selectedCell, playerName: playerNameTextField.text ?? "", playerCategory: selectedCategory!, playerImage: selectedImage ?? #imageLiteral(resourceName: "Logo Grey"))
            dismiss(animated: true, completion: nil)
        } else {
            //show popover telling user to enter name and select category
            var alertTitle = ""
            var alertMessage = ""
            if (playerNameTextField.text == "") {
                alertTitle = "No Name Entered"
                alertMessage = "Please enter a name to continue"
            } else if (selectedImage == nil) {
                alertTitle = "No Category Selected"
                alertMessage = "Please select a categoy for user to continue."
            }
            let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelSelected(_ sender: Any) {
        //just dismiss don't pass any info back
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
//        if cell.isSelected {
//            cell.layer.borderWidth = 2.0
//            cell.layer.borderColor = UIColor.yellow.cgColor
//        } else {
//            cell.layer.borderWidth = 0
//        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            selectedImage = #imageLiteral(resourceName: "game icon")
            selectedCategory = .gaming
        case 1:
            selectedImage = #imageLiteral(resourceName: "plane icon")
            selectedCategory = .tourism
        case 2:
            selectedImage = #imageLiteral(resourceName: "medical icon")
            selectedCategory = .medical
        case 3:
            selectedImage = #imageLiteral(resourceName: "edu icon")
            selectedCategory = .education
        default:
            return
        }
        for index in 0...3 {
            //remove border of all other cells
            if index != indexPath.row {
                let cell = collectionView.cellForItem(at: IndexPath(row: index, section: 0))
                cell?.layer.borderWidth = 0
            } else {
                let cell = collectionView.cellForItem(at: indexPath)
                cell?.layer.borderWidth = 2.0
                cell?.layer.borderColor = UIColor.yellow.cgColor
            }
        }
    }
    
}
