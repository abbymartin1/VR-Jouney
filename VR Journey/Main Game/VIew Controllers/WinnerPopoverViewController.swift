//
//  WinnerPopoverViewController.swift
//  VR Journey
//
//  Created by Abby Martin on 2019-03-23.
//  Copyright © 2019 Abby Martin. All rights reserved.
//

import UIKit

class WinnerPopoverViewController: UIViewController {
    //MARK: Properties
    var winnerName = ""
    var winnerImage = #imageLiteral(resourceName: "winner")
    
    //MARK: Outlets
    @IBOutlet var winnerTitle: UILabel!
    @IBOutlet var winnerPhoto: UIImageView!
    
    //MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        createParticles()
    }
    
    //MARK: Methods
    func setupUI() {
        winnerTitle.text = winnerName
        winnerPhoto.image = winnerImage
    }
    
    func createParticles() {
        let particleEmitter = CAEmitterLayer()
        
        particleEmitter.emitterPosition = CGPoint(x: view.center.x, y: -96)
        particleEmitter.emitterShape = .line
        particleEmitter.emitterSize = CGSize(width: view.frame.size.width, height: 1)
        
        let red = makeEmitterCell(color: #colorLiteral(red: 0.6405746341, green: 0, blue: 0, alpha: 1))
        let pink = makeEmitterCell(color: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
        let yellow = makeEmitterCell(color: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))
        let orange = makeEmitterCell(color: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1))
        
        particleEmitter.emitterCells = [red, yellow, pink, orange]
        
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
    
    //MARK: Actions
    @IBAction func okayButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
