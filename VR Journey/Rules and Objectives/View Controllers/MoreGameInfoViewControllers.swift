//
//  MoreGameInfoViewControllers.swift
//  VR Journey
//
//  Created by Abby Martin on 2019-03-19.
//  Copyright © 2019 Abby Martin. All rights reserved.
//

import Foundation
import UIKit

class MoreGameInfoViewController: UIViewController {
    //MARK: Properties
    var numberOfPhotosShown = 0
    let arrayOfImages = [#imageLiteral(resourceName: "welcome4"), #imageLiteral(resourceName: "welcome8"), #imageLiteral(resourceName: "welcome5"), #imageLiteral(resourceName: "welcome7"), #imageLiteral(resourceName: "welcome6")]
    
    //MARK: Outlets
    @IBOutlet var imageForQuestion: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updatePicture() {
        imageForQuestion.image = arrayOfImages[numberOfPhotosShown]
        numberOfPhotosShown += 1
    }
    
    @IBAction func continueButtonPressed(_ sender: Any) {
        if numberOfPhotosShown > arrayOfImages.count - 1{
            performSegue(withIdentifier: "showMenu", sender: nil)
        } else {
            updatePicture()
        }
    }
}
