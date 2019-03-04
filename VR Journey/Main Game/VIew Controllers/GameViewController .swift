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
    var isBasicLevel = false
    var index: Int = 0
    var playerTurnsCount = 0
    let numberOfPlayers = 4
    //UserDefaults.standard.integer(forKey: "NumberOfPlayers")
    let basicTitleArray = ["Player One's Turn", "Player Two's Turn", "Player Three's Turn", "Player Four's Turn"]
    let advancedTitleArray = ["Welcome to VR Journey! - A", "Pick a Choice"]
    let basicDescription = ["Welcome to the game. You are the CTO (Chief Technology Official) of a startup called 'VR Journey'. You will be asked to choose between different options and your choices will affect how your life plays out.", "123u24u"]
    let basicButtonOneArray = ["Let's Go!", "Basic 1"]
    let basicButtonTwoArray = ["Tell me more!", "Basic 2"]
    let backgroundColours = [UIColor.green, UIColor.red, UIColor.blue]
    
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
        if index + 1 > advancedTitleArray.count {
            //END OF GAME - do something here
            titleOfMessage.text = "End of Game"
            descriptionTextView.text = "You have finished the game, congrats. See scores on main page."
            backgroundView.backgroundColor = UIColor.orange
        } else {
            titleOfMessage.text = basicTitleArray[index]
            descriptionTextView.text = basicDescription[index]
            optionOneButton.setTitle(basicButtonOneArray[index], for: .normal)
            optionTwoButton.setTitle(basicButtonTwoArray[index], for: .normal)
            backgroundView.backgroundColor = backgroundColours[index]
        }
    }
    
    func showScore() {
        //every player has played
        playerTurnsCount = 0;
        //display score popover for that round
        performSegue(withIdentifier: "showScore", sender: nil)
    }
    
    func updatePlayerName() {
        if playerTurnsCount < numberOfPlayers {
            titleOfMessage.text = basicTitleArray[playerTurnsCount];
        } else {
            showScore()
            updateText()
            index += 1
        }
    }
    
    //MARK: Actions
    @IBAction func buttonOneClicked(_ sender: Any) {
        playerTurnsCount += 1;
        updatePlayerName()
    }
    
    @IBAction func buttonTwoClicked(_ sender: Any) {
        playerTurnsCount += 1;
        updatePlayerName()
    }
    
}
