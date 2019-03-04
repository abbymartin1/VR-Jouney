//
//  ScoreBoardPopoverViewController.swift
//  VR Journey
//
//  Created by Abby Martin on 2019-03-03.
//  Copyright © 2019 Abby Martin. All rights reserved.
//

import UIKit

class ScoreBoardPopoverViewController: UIViewController {
    //Outlets
    @IBOutlet var playerScoresTableView: UITableView!
    
    //Properties
    let playersNames = ["Player One", "Player Two", "Player Three", "Player Four"]
    let playersImages = [#imageLiteral(resourceName: "IMG_1878"), #imageLiteral(resourceName: "logo Orange "), #imageLiteral(resourceName: "Logo Grey"), #imageLiteral(resourceName: "Logo White")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerScoresTableView.delegate = self
        playerScoresTableView.dataSource = self
    }
    
    @IBAction func continueButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension ScoreBoardPopoverViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreCell", for: indexPath) as? ScoreBoardTableViewCell else {
            fatalError("The dequeued cell is not an instance of PersonaTableViewCell.")
        }
        cell.playerImage.image = playersImages[indexPath.row]
        cell.playerNameImage.text = playersNames[indexPath.row]
        //TODO: Add stuff for number of points player is getting
        return cell;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
