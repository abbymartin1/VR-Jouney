//
//  Select Players View Controller.swift
//  VR Journey
//
//  Created by Abby Martin on 2019-02-19.
//  Copyright © 2019 Abby Martin. All rights reserved.
//

import UIKit

enum categories {
    case gaming
    case education
    case tourism
    case medical
}

protocol playerInformationDelegate {
    func updatePlayerInfo(playerNames: [String], playerCategories: [categories], playerImages: [UIImage])
}

class SelectPlayersViewController: UIViewController {
    //MARK: Outlets
    @IBOutlet var selectNumberPlayersTextField: UITextField!
    @IBOutlet var playersCollectionView: UICollectionView!
    
    //MARK: Properties
    let numberOfPickerElements = 3
    var playerCellArray = ["Player 1", "Player 2", "Player 3", "Player 4"]
    var playerCategories: [categories] = [.gaming, .education, .tourism, .medical]
    var playerImageArray = [#imageLiteral(resourceName: "VR Journey"), #imageLiteral(resourceName: "VR Journey"), #imageLiteral(resourceName: "VR Journey"), #imageLiteral(resourceName: "VR Journey")]
    let numberOfPlayerArray = ["2", "3", "4"]
    let numberPlayerPicker = UIPickerView()
    private let reuseIdentifier = "SelectPlayerCell"
    private let numberPlayersIdentifier = "NumberOfPlayers"
    var selectedPlayer = 0
    var numberOfPlayersInfoEnteredFor = 0
    var delegate: playerInformationDelegate?
    
    //MARK: Overloads
    override func viewDidLoad() {
        super.viewDidLoad()
        numberPlayerPicker.delegate = self
        numberPlayerPicker.dataSource = self
        playersCollectionView.dataSource = self
        playersCollectionView.delegate = self
        selectNumberPlayersTextField.inputView = numberPlayerPicker
    }
    
    //MARK: Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "displayPopover") {
            let vc = segue.destination as! SelectPlayerPopoverViewController
            vc.selectedCell = selectedPlayer
            vc.delegate = self
        }
    }
    
    //MARK: Actions
    @IBAction func continueButtonTapped(_ sender: Any) {
        if numberOfPlayersInfoEnteredFor < 4 {
            let alert = UIAlertController(title: "Not All Players Selected", message: "Please click each player and enter their name and category to continue.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            self.delegate?.updatePlayerInfo(playerNames: playerCellArray, playerCategories: playerCategories, playerImages: playerImageArray)
        }
    }
}

extension SelectPlayersViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberOfPickerElements
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return numberOfPlayerArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectNumberPlayersTextField.text = numberOfPlayerArray[row]
        //TODO: set number of players into default and reload collection view to only show those players
        UserDefaults.standard.set(row, forKey: numberPlayersIdentifier)
        self.view.endEditing(true)
    }
}

extension SelectPlayersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = playersCollectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SelectPlayerCollectionViewCell
        cell.backgroundColor = .black
        cell.playersImage.image = playerImageArray[indexPath.row]
        cell.playersName.text = playerCellArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //TODO: Display popup allowing user to pick their player and set name
        switch indexPath.row{
        case 0:
            //player 1 selected
            selectedPlayer = 0;
        case 1:
            //player 2 selected
            selectedPlayer = 1;
        case 2:
            //player 3 selected
            selectedPlayer = 2;
        case 3:
            //player 4 selected
            selectedPlayer = 3;
        default:
            //no player selected/error
            selectedPlayer = 0;
        }
        performSegue(withIdentifier: "displayPopover", sender: nil)
    }
}

extension SelectPlayersViewController: selectPlayerDelegate {
    func updatePlayerNames(playerIndex: Int, playerName: String, playerCategory: categories, playerImage: UIImage) {
        numberOfPlayersInfoEnteredFor += 1;
        playerCellArray[playerIndex] = playerName
        playerImageArray[playerIndex] = playerImage
        playerCategories[playerIndex] = playerCategory
        playersCollectionView.reloadData()
    }
}
