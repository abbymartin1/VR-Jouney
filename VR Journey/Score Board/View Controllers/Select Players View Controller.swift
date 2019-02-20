//
//  Select Players View Controller.swift
//  VR Journey
//
//  Created by Abby Martin on 2019-02-19.
//  Copyright © 2019 Abby Martin. All rights reserved.
//

import UIKit

class SelectPlayersViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet var selectNumberPlayersTextField: UITextField!
    @IBOutlet var playersCollectionView: UICollectionView!
    @IBOutlet var playerCollectionViewCell: UICollectionViewCell!
    
    //MARK: Properties
    let numberOfPickerElements = 3
    let playerCellArray = ["Player 1", "Player 2", "Player 3", "Player 4"]
    let playerDefaultImageArray = [#imageLiteral(resourceName: "VR Journey"), #imageLiteral(resourceName: "VR Journey"), #imageLiteral(resourceName: "VR Journey"), #imageLiteral(resourceName: "VR Journey")]
    let numberOfPlayerArray = ["2", "3", "4"]
    let numberPlayerPicker = UIPickerView()
    private let reuseIdentifier = "SelectPlayerCell"
    
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
    
    
    //MARK: Actions
    @IBAction func continueButtonTapped(_ sender: Any) {
        //save the user info and go back to menu
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
        cell.playersImage.image = playerDefaultImageArray[indexPath.row]
        cell.playersName.text = playerCellArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //TODO: Display popup allowing user to pick their player and set name
    }

}
