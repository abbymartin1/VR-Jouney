//
//  CongratulationsViewController.swift
//  VR Journey
//
//  Created by Abby Martin on 2019-03-12.
//  Copyright © 2019 Abby Martin. All rights reserved.
//

import UIKit

protocol ScoreBoardDelegate {
    func forceShowScoreBoard()
}

class CongratulationsViewController: UIViewController {
    //MARK: Properties
    var sectionImages = [#imageLiteral(resourceName: "light"), #imageLiteral(resourceName: "205537"), #imageLiteral(resourceName: "factory"), #imageLiteral(resourceName: "globe"), #imageLiteral(resourceName: "winner")]
    var playerNames = ["","","",""]
    var currentUserIndex = 0;
    var currentUsersStageIndex = 0;
    var isCongrats = true
    var shouldShowScoreAfter = false
    var shouldShowRemovePlayer = false
    var delegate: ScoreBoardDelegate?
    
    //MARK: Outlets
    @IBOutlet var congratsLabel: UILabel!
    @IBOutlet var backgroundView: UIView!
    @IBOutlet var mainView: UIView!
    @IBOutlet var stageImageView: UIImageView!
    @IBOutlet var levelMessage: UILabel!
    @IBOutlet var rolldiceLabel: UILabel!
    
    //MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        createParticles()
    }
    
    //MARK: Methods
    func createParticles() {
        let particleEmitter = CAEmitterLayer()
        
        particleEmitter.emitterPosition = CGPoint(x: view.center.x, y: -96)
        particleEmitter.emitterShape = .line
        particleEmitter.emitterSize = CGSize(width: view.frame.size.width, height: 1)
        
        if !shouldShowRemovePlayer {
            let red = makeEmitterCell(color: UIColor.red)
            let yellow = makeEmitterCell(color: UIColor.yellow)
            let blue = makeEmitterCell(color: UIColor.blue)
            let orange = makeEmitterCell(color: UIColor.orange)
            particleEmitter.emitterCells = [red, yellow, blue, orange]
        } else {
            let lightBlue = makeEmitterCell(color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
            let darkBlue = makeEmitterCell(color: #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1))
            let blue = makeEmitterCell(color: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))
            let mediumBlue = makeEmitterCell(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))
            particleEmitter.emitterCells = [lightBlue, darkBlue, blue, mediumBlue]
        }
        
        view.layer.addSublayer(particleEmitter)
    }
    
    func makeEmitterCell(color: UIColor) -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.birthRate = 3
        cell.lifetime = 7.0
        cell.lifetimeRange = 0
        cell.color = color.cgColor
        cell.velocity = 200
        cell.velocityRange = 50
        cell.emissionLongitude = CGFloat.pi
        cell.emissionRange = CGFloat.pi / 4
        cell.spin = 2
        cell.spinRange = 3
        cell.scaleRange = 0.5
        cell.scaleSpeed = -0.05
        if !shouldShowRemovePlayer {
            cell.contents = #imageLiteral(resourceName: "swirl-blue-md").cgImage
        } else {
            cell.contents = #imageLiteral(resourceName: "raindrop").cgImage
        }
        return cell
    }
    
    func setUpUI() {
        if shouldShowRemovePlayer {
            //removing player
            levelMessage.text = "Sorry you didn't make it to the next section in time and have been removed."
            congratsLabel.text = "You Lost"
            stageImageView.image = #imageLiteral(resourceName: "sad")
            rolldiceLabel.text = "Good luck next time!"
            mainView.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        } else if isCongrats {
                levelMessage.text = "Congrats on making it to the next level!"
                congratsLabel.text = "Congrats!"
                stageImageView.image = #imageLiteral(resourceName: "dice")
                rolldiceLabel.text = "Roll the Dice to Continue"
                 mainView.backgroundColor = #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)
        } else {
            //player reached end of game
            levelMessage.text = "Congrats on making it to the end of the game!"
            congratsLabel.text = "Congrats!"
            stageImageView.image = #imageLiteral(resourceName: "winner")
            rolldiceLabel.text = "Roll the Dice to Continue"
            mainView.backgroundColor = #colorLiteral(red: 0.4635351896, green: 0, blue: 0.4425114095, alpha: 1)
        }
    }
    
    //MARK: Actions
    @IBAction func okayButtonPressed(_ sender: Any) {
        if shouldShowScoreAfter {
            dismiss(animated: true, completion: delegate?.forceShowScoreBoard)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
}
