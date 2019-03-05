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
    var mentalPoints = [0,0,0,0]
    var enviromentalPoints = [0,0,0,0]
    var physicalPoints = [0,0,0,0]
    var societalPoints = [0,0,0,0]
    
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
        cell.mentalPointsLabel.text = "🧠 : " + String(mentalPoints[indexPath.row])
        cell.enviromentalPointsLabel.text = "🍃: " + String(enviromentalPoints[indexPath.row])
        cell.physicalPointslabel.text = "🦴: " + String(physicalPoints[indexPath.row])
        cell.globalPointsLabel.text = "🌍: " + String(societalPoints[indexPath.row])
        return cell;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
