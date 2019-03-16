//
//  ViewController.swift
//  VR Journey
//
//  Created by Abby Martin on 2019-02-08.
//  Copyright © 2019 Abby Martin. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    //MARK: Properties
    var playerNameArray = ["Player 1", "Player 2", "Player 3", "Player 4"]
    var playerCategoriesArray: [categories] =  [.gaming, .education, .tourism, .medical]
    var playerImageArray = [#imageLiteral(resourceName: "VR Journey"), #imageLiteral(resourceName: "VR Journey"), #imageLiteral(resourceName: "VR Journey"), #imageLiteral(resourceName: "VR Journey")]
    var hasSetPlayers: Bool?
    static let sharedInstance = MenuViewController()
    
    //MARK: Overloads
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "back_image")
        self.navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "back_image")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "selectPlayers") {
            //going to select players
            guard let vc = segue.destination as? SelectPlayersViewController else { return }
            vc.delegate = self
        } else if (segue.identifier == "playGame"){
            //going to play game
            guard let vc = segue.destination as? GameViewController else { return }
            vc.playerNames = MenuViewController.sharedInstance.playerNameArray
            vc.playerImageArray = MenuViewController.sharedInstance.playerImageArray
            vc.playerCategories = MenuViewController.sharedInstance.playerCategoriesArray
        }
    }
    
    //MARK: Actions
    @IBAction func selectPlayersPressed(_ sender: Any) {
        performSegue(withIdentifier: "selectPlayers", sender: nil)
    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
        if MenuViewController.sharedInstance.hasSetPlayers ?? false {
            performSegue(withIdentifier: "playGame", sender: nil)
        } else {
            //must first select players
            let alert = UIAlertController(title: "Players Not Set", message: "Please click 'Select Players' and choose players before you begin.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension MenuViewController: playerInformationDelegate {
    func updatePlayerInfo(playerNames: [String], playerCategories: [categories], playerImages: [UIImage]) {
        MenuViewController.sharedInstance.playerNameArray = playerNames
        MenuViewController.sharedInstance.playerCategoriesArray = playerCategories
        MenuViewController.sharedInstance.playerImageArray = playerImages
        MenuViewController.sharedInstance.hasSetPlayers = true
    }
}
