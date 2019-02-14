//
//  Game View Controller .swift
//  VR Journey
//
//  Created by Abby Martin on 2019-02-08.
//  Copyright © 2019 Abby Martin. All rights reserved.
//

import UIKit

class GameViewController: ViewController {
    //MARK: Properties
    var isBasicLevel = false;
    var index: Int = 0;
    let basicTitleArray = ["Welcome to VR Journey!", "Pick a Choice"]
    let advancedTitleArray = ["Welcome to VR Journey! - A", "Pick a Choice"]
    let basicDescription = ["Welcome to the game. You are the CTO (Chief Technology Official) of a startup called 'VR Journey'. You will be asked to choose between different options and your choices will affect how your life plays out.", "123u24u"]
    let advancedDescription = ["Welcome to the game. You are a ....(advanced)", "8923429u209"]
    let basicButtonOneArray = ["Let's Go!", "Basic 1"]
    let advancedButtonOneArray = ["Click Me Advanced", "Adv 1"]
    let basicButtonTwoArray = ["Tell me more!", "Basic 2"]
    let advancedButtonTwoArray = ["Click Me 2 Adv", "Advanced 2"]
    let backgroundColours = [UIColor.blue, UIColor.yellow, UIColor.orange]
    
    //MARK: Outlets
    @IBOutlet var entireOptionStackView: UIStackView!
    @IBOutlet var titleOfMessage: UILabel!
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var optionOneButton: UIButton!
    @IBOutlet var optionTwoButton: UIButton!
    @IBOutlet var backgroundView: UIView!
    
    //MARK: Overloads
    override func viewDidLoad() {
        super.viewDidLoad()
        isBasicLevel = UserDefaults.standard.bool(forKey: "isBasicLevel")
        setUpUI()
    }
    
    //MARK: Methods
    func setUpUI() {
        entireOptionStackView.layer.borderWidth = 3
        entireOptionStackView.layer.borderColor = UIColor.black.cgColor
        //page just loaded so set text to first option
        updateText()
    }
    
    func updateText() {
        if isBasicLevel {
            if index + 1 > advancedTitleArray.count {
                //END OF GAME - do something here
                titleOfMessage.text = "End of Game (basic)"
                backgroundView.backgroundColor = UIColor.orange
            } else {
                titleOfMessage.text = basicTitleArray[index]
                descriptionTextView.text = basicDescription[index]
                optionOneButton.setTitle(basicButtonOneArray[index], for: .normal)
                optionTwoButton.setTitle(basicButtonTwoArray[index], for: .normal)
                backgroundView.backgroundColor = backgroundColours[index]
            }
        } else {
            if index + 1 > advancedButtonTwoArray.count {
                //END OF GAME - DO something here
                titleOfMessage.text = "End of Game (advanced)"
                backgroundView.backgroundColor = UIColor.orange
            } else {
                titleOfMessage.text = advancedTitleArray[index]
                descriptionTextView.text = advancedDescription[index]
                optionOneButton.setTitle(advancedButtonOneArray[index], for: .normal)
                optionTwoButton.setTitle(advancedButtonTwoArray[index], for: .normal)
                backgroundView.backgroundColor = backgroundColours[index]
            }
        }
    }
    
    //MARK: Actions
    @IBAction func buttonOneClicked(_ sender: Any) {
        index += 1;
        updateText()
    }
    
    @IBAction func buttonTwoClicked(_ sender: Any) {
        index += 1;
        updateText()
    }
    
}
