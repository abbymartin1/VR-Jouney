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
        if !shouldShowRemovePlayer {
            createParticles()
        }
    }
    
    //MARK: Methods
    func createParticles() {
        let particleEmitter = CAEmitterLayer()
        
        particleEmitter.emitterPosition = CGPoint(x: view.center.x, y: -96)
        particleEmitter.emitterShape = .line
        particleEmitter.emitterSize = CGSize(width: view.frame.size.width, height: 1)
        
        let red = makeEmitterCell(color: UIColor.red)
        let yellow = makeEmitterCell(color: UIColor.yellow)
        let blue = makeEmitterCell(color: UIColor.blue)
        let orange = makeEmitterCell(color: UIColor.orange)
        
        particleEmitter.emitterCells = [red, yellow, blue, orange]
        
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
        cell.contents = #imageLiteral(resourceName: "swirl-blue-md").cgImage
        return cell
    }
    
    func setUpUI() {
        if shouldShowRemovePlayer {
            //removing player
            levelMessage.text = "Sorry you didn't make it to the next section in time and have been removed."
            congratsLabel.text = "You Lost"
            stageImageView.image = #imageLiteral(resourceName: "sad")
            rolldiceLabel.text = "Better Luck Next Time!"
            mainView.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        } else if isCongrats {
            if currentUsersStageIndex > 3 {
                //user has finished the game
                levelMessage.text = "Congrats on making it to the end of the game!"
                congratsLabel.text = "Congrats!"
                stageImageView.image = sectionImages[4]
                rolldiceLabel.text = "Roll the Dice to Continue"
                 mainView.backgroundColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
            } else {
                levelMessage.text = "Congrats on making it to the next level!"
                congratsLabel.text = "Congrats!"
                stageImageView.image = #imageLiteral(resourceName: "dice")
                rolldiceLabel.text = "Roll the Dice to Continue"
                 mainView.backgroundColor = #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)
            }
        } else {
            //player reached end of game
            levelMessage.text = "Congrats on making it to the end of the game!"
            congratsLabel.text = "Congrats!"
            stageImageView.image = #imageLiteral(resourceName: "winner")
            rolldiceLabel.text = "Roll the Dice to Continue"
            mainView.backgroundColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
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
