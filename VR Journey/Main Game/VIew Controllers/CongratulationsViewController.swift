//
//  CongratulationsViewController.swift
//  VR Journey
//
//  Created by Abby Martin on 2019-03-12.
//  Copyright © 2019 Abby Martin. All rights reserved.
//

import UIKit

class CongratulationsViewController: UIViewController {
    //MARK: Properties
    var sectionImages = [#imageLiteral(resourceName: "light"), #imageLiteral(resourceName: "205537"), #imageLiteral(resourceName: "factory"), #imageLiteral(resourceName: "globe"), #imageLiteral(resourceName: "winner")]
    var playerNames = ["","","",""]
    var currentUserIndex = 0;
    var currentUsersStageIndex = 0;
    
    //MARK: Outlets
    @IBOutlet var congratsLabel: UILabel!
    @IBOutlet var backgroundView: UIView!
    @IBOutlet var mainView: UIView!
    @IBOutlet var stageImageView: UIImageView!
    @IBOutlet var levelMessage: UILabel!
    
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
        levelMessage.text = "Congrats on making it to level \(currentUsersStageIndex + 1)!"
        congratsLabel.text = "Congrats!"
        stageImageView.image = sectionImages[currentUsersStageIndex]
    }
    
    //MARK: Actions
    @IBAction func okayButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
