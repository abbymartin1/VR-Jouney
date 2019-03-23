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
    @IBOutlet var entireView: UIStackView!
    
    //Properties
    var playersNames = ["Player One", "Player Two", "Player Three", "Player Four"]
    var playersImages = [#imageLiteral(resourceName: "IMG_1878"), #imageLiteral(resourceName: "logo Orange "), #imageLiteral(resourceName: "Logo Grey"), #imageLiteral(resourceName: "Logo White")]
    var mentalPoints = [0,0,0,0]
    var enviromentalPoints = [0,0,0,0]
    var physicalPoints = [0,0,0,0]
    var societalPoints = [0,0,0,0]
    var moneyPoints = [0,0,0,0]
    var spotsToMove = [0,0,0,0]
    var hasShownDetailedInfo = false
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerScoresTableView.delegate = self
        playerScoresTableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showPointsDetails") {
            let vc = segue.destination as! ChoicesInformationPopoverViewController
            vc.index = index
        }
    }
    
    @IBAction func continueButtonTapped(_ sender: Any) {
        if hasShownDetailedInfo == false && index != 0 {
            performSegue(withIdentifier: "showPointsDetails", sender: nil)
            hasShownDetailedInfo = true
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
}

extension ScoreBoardPopoverViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playersNames.count
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
        cell.moneyPointsLabel.text = "💵: $" + String(moneyPoints[indexPath.row])
        cell.spotsToMoveLabel.text = String(spotsToMove[indexPath.row])
        return cell;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }
}
