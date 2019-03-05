//
//  Game View Controller .swift
//  VR Journey
//
//  Created by Abby Martin on 2019-02-08.
//  Copyright © 2019 Abby Martin. All rights reserved.
//

import UIKit
import AVFoundation

class GameViewController: ViewController {
    //MARK: Properties
    var isBasicLevel = false
    var index: Int = 0
    var playerTurnsCount = 0
    let numberOfPlayers = 4
    //points which will correspond to each player
    var mentalPoints = [0,0,0,0]
    var enviromentalPoints = [0,0,0,0]
    var physicalPoints = [0,0,0,0]
    var societalPoints = [0,0,0,0]
    //UserDefaults.standard.integer(forKey: "NumberOfPlayers")
    let titleArray = ["Player One's Turn", "Player Two's Turn", "Player Three's Turn", "Player Four's Turn"]
    let descriptionText = ["You have to choose which type of product you wish to design. Products which have violence and mature material will be more exciting and appealing to users, however, you know your user base will ages 12 to 22. Your lead researcher informs you that since the user will have to actively participate in the violence, this causes the user to have aggressive action directly incorporated into their behaviour repertoire [1]. Do you choose to have violence and mature material in your game?", "Your lead researcher informs you that VR can have negative psychological effects on users who play for an extended period of time such as simulator sickness, disorientation, hallucination, and dissociation [12]. However, by encouraging users to keep playing the game you will gain more money from ads shown to the user. Do you choose to have a time limit warning for users?", "You have the option to raise awareness about an important social issue through your product. However, this will make your game less popular with the generic public. Do you choose to raise awareness?", "Your lead researcher informs you that VR can have negative psychological effects on users who play for an extended period of time such as strenuous posture demands, repetitive strain injuries, headset weight and fit [12]. However, by encouraging users to keep playing the game you will gain more money from ads shown to the user. Do you choose to have a time limit warning for users?", "Since you will be focussing on marketing your product to age groups 12 to 22, you have the option to put a parental lock on the device. This will make your product safer for younger users since parents could use it to block any inappropriate content, however older users will not like this feature and your sales may drop. Do you add a “parental lock” on the device?", "You have the option to manufacture your product locally or in a foreign country such as China. It will be much cheaper to outsource the manufacturing to a different country, however you know that this will be worse for the environment [2] and are aware of social implications such as labour laws in different countries [2]. Do you choose to manufacture Locally or in another country?", "You have the choice to implement an e-waste program where users could return your product once it is broken or unwanted and you would be in charge of properly recycling it. E-waste is made up of discarded electronic appliances such as computers and mobile telephones [3]. VR devices once discarded would be considered e-waste and could contain valuable metals such as copper and platinum as well as potential environmental contaminants including lead and nickel [3]. In order to implement this program it would cost you money but would be better for the environment. Do you choose to implement it?", "You have the opportunity to donate 6 of your systems to a local school who cannot afford technology. This will cost you money, however it will help your community. What do you choose to do?", "You have the option to globalize your product so you can sell it in other countries. In order to do this you must develop region specific versions by having your product’s text translated to different languages. This will cost money, however it would help you gain a global presence. Do you choose to globalize your product? "]
    let buttonOneArray = ["Yes", "Yes", "Yes", "Yes", "Yes", "Locally", "Yes", "Donate", "Yes"]
    let buttonTwoArray = ["No", "No", "No", "No", "No", "Non-Locally", "No", "Don't Donate", "No"]
    //these correspond to which points user will be gaining or losing for the question
    //if button1 = 1 (TRUE) then user gains points for selecting it, if button1 = 0 (FALSE) user loses points for selecting it
    let pointsPerQuestion = [["button1" : 0, "env": 0, "ment": 10, "soc" : 0, "phy": 0], ["button1" : 1, "env": 0, "ment": 10, "soc" : 0, "phy": 0], ["button1" : 1, "env": 0, "ment": 10, "soc" : 0, "phy": 0], ["button1" : 1, "env": 0, "ment": 0, "soc" : 10, "phy": 0], ["button1" : 1, "env": 0, "ment": 0, "soc" : 0, "phy": 10], ["button1" : 1, "env": 0, "ment": 10, "soc" : 0, "phy": 0], ["button1" : 1, "env": 0, "ment": 0, "soc" : 10, "phy": 0], ["button1" : 1, "env": 10, "ment": 0, "soc" : 0, "phy": 0], ["button1" : 1, "env": 0, "ment": 0, "soc" : 10, "phy": 0]]
    let backgroundColours = [#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1), #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1), #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)]
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "showScore") {
            guard let vc = segue.destination as? ScoreBoardPopoverViewController else {
                return
            }
            //pass in points to next view
            vc.enviromentalPoints = enviromentalPoints
            vc.mentalPoints = mentalPoints
            vc.societalPoints = societalPoints
            vc.physicalPoints = physicalPoints
        }
    }
    
    //MARK: Methods
    func setUpUI() {
        entireOptionStackView.layer.borderWidth = 3
        entireOptionStackView.layer.borderColor = UIColor.black.cgColor
        //page just loaded so set text to first option
        updateText()
    }
    
    func updateText() {
        if index + 1 > descriptionText.count {
            titleOfMessage.text = "End of Game"
            descriptionTextView.text = "Congrats! You have finished the game! View scores on main page."
            backgroundView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
            optionOneButton.isHidden = true
            optionTwoButton.isHidden = true
        } else {
            titleOfMessage.text = titleArray[playerTurnsCount]
            descriptionTextView.text = descriptionText[index]
            optionOneButton.setTitle(buttonOneArray[index], for: .normal)
            optionTwoButton.setTitle(buttonTwoArray[index], for: .normal)
            backgroundView.backgroundColor = backgroundColours[index]
        }
    }
    
    func readText() {
        let utterance = AVSpeechUtterance(string: descriptionText[index])
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        utterance.rate = 0.5
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
    
    func showScore() {
        //every player has played
        playerTurnsCount = 0
        updatePlayerName()
        //display score popover for that round
        performSegue(withIdentifier: "showScore", sender: nil)
    }
    
    func updatePlayerName() {
        if playerTurnsCount < numberOfPlayers {
            titleOfMessage.text = titleArray[playerTurnsCount];
        } else {
            showScore()
            index += 1
            updateText()
        }
    }
    
    func updatePoints(buttonOneSelected: Bool) {
        if buttonOneSelected {
            //button one selected
            if pointsPerQuestion[index]["button1"] == 0 {
                //if user is meant to lose points for button one selected
                mentalPoints[playerTurnsCount] -= pointsPerQuestion[index]["ment"] ?? 0
                enviromentalPoints[playerTurnsCount] -= pointsPerQuestion[index]["env"] ?? 0
                societalPoints[playerTurnsCount] -= pointsPerQuestion[index]["soc"] ?? 0
                physicalPoints[playerTurnsCount] -= pointsPerQuestion[index]["phy"] ?? 0
                
            } else {
                //otherwise user is meant to gain points for button one selected
                mentalPoints[playerTurnsCount] += pointsPerQuestion[index]["ment"] ?? 0
                enviromentalPoints[playerTurnsCount] += pointsPerQuestion[index]["env"] ?? 0
                societalPoints[playerTurnsCount] += pointsPerQuestion[index]["soc"] ?? 0
                physicalPoints[playerTurnsCount] += pointsPerQuestion[index]["phy"] ?? 0
            }
        } else {
            //button two selected
            if pointsPerQuestion[index]["button1"] == 0 {
                // user is meant to gain points for button two selected
                mentalPoints[playerTurnsCount] += pointsPerQuestion[index]["ment"] ?? 0
                enviromentalPoints[playerTurnsCount] += pointsPerQuestion[index]["env"] ?? 0
                societalPoints[playerTurnsCount] += pointsPerQuestion[index]["soc"] ?? 0
                physicalPoints[playerTurnsCount] += pointsPerQuestion[index]["phy"] ?? 0
                
            } else {
                //otherwise user is meant to lose points for button 2 selected
                mentalPoints[playerTurnsCount] -= pointsPerQuestion[index]["ment"] ?? 0
                enviromentalPoints[playerTurnsCount] -= pointsPerQuestion[index]["env"] ?? 0
                societalPoints[playerTurnsCount] -= pointsPerQuestion[index]["soc"] ?? 0
                physicalPoints[playerTurnsCount] -= pointsPerQuestion[index]["phy"] ?? 0
                
            }
            
        }
    }
    
    //MARK: Actions
    @IBAction func buttonOneClicked(_ sender: Any) {
        updatePoints(buttonOneSelected: true)
        playerTurnsCount += 1;
        updatePlayerName()
    }
    
    @IBAction func buttonTwoClicked(_ sender: Any) {
        updatePoints(buttonOneSelected: false)
        playerTurnsCount += 1;
        updatePlayerName()
    }
}
