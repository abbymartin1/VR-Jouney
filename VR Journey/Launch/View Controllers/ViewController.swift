//
//  ViewController.swift
//  VR Journey
//
//  Created by Abby Martin on 2019-02-08.
//  Copyright © 2019 Abby Martin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backItem?.title = "Back"
    }
    
    @IBAction func scoreBoardTapped(_ sender: Any) {
        //segue to new page showing score board of past games 
    }
    
    @IBAction func selectPlayersTapped(_ sender: Any) {
        //Once players have been selected set a boolean in userDefaults
    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
        //check the set boolean in user defaults, if it has not been checked
        //then show a popup saying the user must select players first before playing
        //if players are set and they havent played the game yet, show popup asking
        //if selected players are okay or if you want to re-select players
    }
}
