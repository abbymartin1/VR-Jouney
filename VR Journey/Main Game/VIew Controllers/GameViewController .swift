//
//  Game View Controller .swift
//  VR Journey
//
//  Created by Abby Martin on 2019-02-08.
//  Copyright © 2019 Abby Martin. All rights reserved.
//

import UIKit
import AVFoundation

class GameViewController: UIViewController {
    //MARK: Properties
    var isBasicLevel = false
    var index: Int = 0
    var playerTurnsCount = 0
    var currentlySelectedPlayerIndex = 0;
    let numberOfPlayers = 4
    var playerOriginalNames = ["Player 1","Player 2","Player 3","Player 4"]
    var playerOriginalCategories: [categories] = [.gaming, .education, .tourism, .medical]
    var playerOriginalImageArray = [#imageLiteral(resourceName: "VR Journey"), #imageLiteral(resourceName: "VR Journey"), #imageLiteral(resourceName: "VR Journey"), #imageLiteral(resourceName: "VR Journey")]
    //current players playing in that round
    var playerNames = ["Player 1","Player 2","Player 3","Player 4"]
    var playerCategories: [categories] = [.gaming, .education, .tourism, .medical]
    var playerImageArray = [#imageLiteral(resourceName: "VR Journey"), #imageLiteral(resourceName: "VR Journey"), #imageLiteral(resourceName: "VR Journey"), #imageLiteral(resourceName: "VR Journey")]
    var isCongrats = true
    var currentNumberOfPlayers = 3
    var shouldShowScoreBoard = false
    var shouldShowRemovePlayer = false
    var winnerName = ""
    var winnerImage = #imageLiteral(resourceName: "dice")
    
    //points which will correspond to each player
    var mentalPoints = [0,0,0,0]
    var enviromentalPoints = [0,0,0,0]
    var physicalPoints = [0,0,0,0]
    var societalPoints = [0,0,0,0]
    var moneyPoints = [0,0,0,0]
    var playerSpotsOnBoard = [0,0,0,0]
    var playerTotalSpotsOnBoard = [0,0,0,0]
    var playerSection = [0,0,0,0]
    var sectionSpots = [6,6,4,4]
    var playerTurnCount = [0,0,0,0]
    
    //intro
    let descriptionText = ["You are a founder who created a VR company. You will start with $25000 and can gain or lose money based on your choices. Choices you make could have potential impacts on society, users physical and mental health, and the environment. You will gain or lose points in different categories based on your choices. Each player must select 'Okay' once they are ready to begin.", "Virtual reality systems can be used by designers, architects and researchers to model and display situations. You need to decide how industry specific you want it to be. How many different applications do you want your product to be designed for?", "There is research that Virtual Reality can help improve motor functions in people with Cerebral Palsy, balance and locomotion in children with Down Syndrome and social skills in young adults with high functioning Autism. You have the choice to make a commercial product that is geared towards the general population, or you can develop a product that helps people with disabilities (PWD). How do you want to focus your product?", "As you are designing your product you have the idea to gamify it. Products that include violence and mature material will be more exciting and appealing to users. However, studies have shown that active participation in the violence leads to increased violence in other areas [1]. Do you choose to have violence and mature material in your game?", "You just finished reading a newspaper article about the lack of e-waste recycling programs that accept the electronic parts that your VR system will be made of. VR devices contain valuable metals such as copper and platinum, as well as potential environmental contaminants including lead and nickel [3]. You have the idea of creating your own e-waste program where users could return the product once it is broken or unwanted. Do you choose to implement it", "Making your VR product portable means that it can be used in a wider range of applications. However, a portable design will involve smaller, light weight and more expensive components. Will you increase the accessibility of your product by making it portable?", "As the concept for your VR product is starting to come together, you have to pick a theme for the graphics. You can choose to make them extremely realistic, or create a fictitious setting. It has been shown that realistic VR environments have caused decreased support for environmental preservation, as users no longer feel the need to go outside and experience nature [16]. Do you want to model your graphics off of the real world, or spend more time and money creating a fictitious environment for your users to interact with?", "You have come to a critical stage in the design process where you must decide if you are going to incorporate the user’s phone into your technology. All of your competitors are offering this feature but, allowing your headset to connect over wifi means that it will emit radiation. Cell phone radiation has been shown to affect the human reproductive system, disrupt sleep, cause mood swings and impose other long-term health risks such as cancer. Do you choose to connect the system to user’s phone?", "You are selecting the type of screen that will be used in your VR product. You have a choice between LCD or OLED screens. \n-OLED screens have a shorter lifespan, but they have better power efficiency, higher contrast and more brightness. LCD screens last longer and are less toxic to dispose of, but they provide a lower quality experience. Which screen do you choose?", "You have identified the need to include a hand-held controller with your VR product. Your design team has been working very hard to optimize the size and weight of the controller, but they are going to need a three-week extension in order to complete the design properly. Poorly designed controllers have been linked to upper limb disorders, and repetitive strain injury. Do you give the design team an additional three weeks to design the controller?", "You have been approached by a popular candy company who wants to strike an advertisement deal with you. They have offered to pay you a bonus for every time the ad is viewed within your VR product. You know that playing for too long can lead to simulator sickness, disorientation, hallucination, and dissociation, and have even considered adding warnings about excessive play time on your device. Do you choose to have a time limit warning for users?", "Your lead researcher informs you that your competitors have faced a problem where the dimensions of their products were made for adults, which has caused injuries in children. Your lead researcher recommends that you create two modes, one for adults and one that adjusts the set up for children. This will require extra time and money to produce. What do you do?", "You have arranged a meeting with your design team to select that materials that will be used for the display and shell of your VR product. You will be choosing between a less expensive, polyester based material that is non-breathable, and a high-tech composite material used in athletes running shoes. Do you wish to spend more money ($1500) to research these things?", "You have the option to manufacture your product locally or in a foreign country such as China. It will be much cheaper to outsource the manufacturing to a different country; however, you know that this will be worse for the environment [2] and are aware of social implications such as labor laws in different countries. Do you choose to manufacture locally or in another country?", "You are planning to invest into starting a production line of cast iron castings. By designing virtual plants, you can test production flows and how workers and robots perform tasks before changes are made in the physical world. However, as it sounds, it might not be cheap and will add additional costs into your plan. But it is crucial for productivity and efficiency. Do you plan to implement a virtual plant to plan your factory floor?", "Unfortunately, a laborer who works at your production unit was critically injured while working. You recently came across a research which discussed how VR identifies human movement captured through body motion sensors during equipment assembly with the goal of reengineering movement to decrease risk of injury and increase productivity. This has resulted in a 70% drop in employee injuries and 90% reduction in ergonomic issues. However, you have already planned and approved your company budget for the year. Do you think you will consider making an exception this time and adding the expense to integrate VR into your assembly line?", "VR technology is analogous to a smartphone in terms of hardware and is made up of 62 different types of metals on average. Some of these metals have significant negative, environmental impacts. Will you use these materials?", "You are creating a VR headset. It is evident that VR technology is analogous to a smartphone in terms of hardware. The typical VR Set is made up of an average 62 different types of metals. The rarest metals it uses are gold, scandium and yttrium. These are the most environmentally damaging materials in world. Will you use these materials?", "Virtual Reality technology has the potential to allow students to experience new learning opportunities, but it is expensive and not within the budget of most schools. You have the opportunity to donate 6 of your systems to a local school who cannot afford technology. This will cost you money, however it will help your community. What do you choose to do?", "You are approached by a company who wants to use your VR product to bring awareness to the effects of visual impairments. By participating in their campaign, you will obtain free advertising and press opportunities, however would be expected to donate 10 devices. Consider the following when you make your decision: 1. Would your main users see or be inspired by the advertising that would be created? 2.Can you afford to donate 10 devices? 3.How might this initiative impact people who have visual impairments? Do you choose to donate?", "You have been approached by the French government. They want to use your product to replace field trips in elementary schools while still providing a “direct experience”. In order to do this, you must translate your product into French. This will cost money; however, it would help you gain a global presence. Do you choose to globalize your product?", "UNICEF has approached your company and asked you to create VR film surrounding the current crisis in Syria. They’ve stressed that it is entirely non-profit and that while they can only pay you a quarter of what you expected, the film is meant to be viewed by millions of people around the world, and help 4 million refugees. Do you agree to help them?"]
    let buttonOneArray = ["Okay", "1-3", "Commercialize it!", "Yes", "Yes", "Yes", "Real World", "Yes", "LCD", "Yes", "Yes", "2 Models", "Yes", "Locally", "Yes", "Yes", "Yes", "Donate", "Yes", "Yes", "Yes"]
    let buttonTwoArray = ["", "4+", "Focus on helping PWD", "No", "No", "No", "Fictitious Environment", "No", "OLED", "No", "No", "1 Model", "No", "Non-Locally", "No", "No", "No", "Don't Donate", "No", "No", "No"]
    //these correspond to which points user will be gaining or losing for the question
    //if button1 = 1 (TRUE) then user gains points for selecting it, if button1 = 0 (FALSE) user loses points for selecting it
    let pointsPerQuestion = [["button1" : 0, "env": 0, "ment": 0, "soc" : 0, "phy": 0, "mon": 25000, "move": 0],
                             ["button1" : 0, "env": 0, "ment": 0, "soc" : 5, "phy": 0, "mon": 1000, "move": 1],
                             ["button1" : 0, "env": 0, "ment": 0, "soc" : 6, "phy": 0, "mon": 1500, "move": 2],
                             ["button1" : 0, "env": 0, "ment": 5, "soc" : 2, "phy": 0, "mon": 700, "move": 1],
                             ["button1" : 1, "env": 8, "ment": 0, "soc" : 4, "phy": 0, "mon": 600, "move": 2],
                             ["button1" : 1, "env": 0, "ment": 1, "soc" : 4, "phy": 3, "mon": 2000, "move": 1],
                             ["button1" : 0, "env": 0, "ment": 8, "soc" : 0, "phy": 0, "mon": 700, "move": 2],
                             ["button1" : 1, "env": 0, "ment": 0, "soc" : 0, "phy": 5, "mon": 4000, "move": 1],
                             ["button1" : 1, "env": 10, "ment": 0, "soc" : 0, "phy": 0, "mon": 6000, "move": 1],
                             ["button1" : 1, "env": 0, "ment": 0, "soc" : 0, "phy": 8, "mon": 2000, "move": 2],
                             ["button1" : 1, "env": 0, "ment": 9, "soc" : 3, "phy": 0, "mon": 2000, "move": 2],
                             ["button1" : 1, "env": 0, "ment": 0, "soc" : 0, "phy": 7, "mon": 4000, "move": 2],
                             ["button1" : 1, "env": 4, "ment": 0, "soc" : 2, "phy": 0, "mon": 1500, "move": 2],
                             ["button1" : 1, "env": 0, "ment": 0, "soc" : 4, "phy": 2, "mon": 2000, "move": 2],
                             ["button1" : 1, "env": 0, "ment": 0, "soc" : 0, "phy": 2, "mon": 3000, "move": 1],
                             ["button1" : 1, "env": 0, "ment": 0, "soc" : 0, "phy": 8, "mon": 2000, "move": 2],
                             ["button1" : 0, "env": 6, "ment": 0, "soc" : 0, "phy": 0, "mon": 1800, "move": 1],
                             ["button1" : 0, "env": 6, "ment": 0, "soc" : 0, "phy": 0, "mon": 800, "move": 1],
                             ["button1" : 1, "env": 0, "ment": 0, "soc" : 10, "phy": 0, "mon": 5000, "move": 2],
                             ["button1" : 0, "env": 0, "ment": 0, "soc" : 15, "phy": 0, "mon": 8000, "move": 2],
                             ["button1" : 1, "env": 0, "ment": 0, "soc" : 4, "phy": 0, "mon": 500, "move": 2],
                             ["button1" : 1, "env": 0, "ment": 0, "soc" : 7, "phy": 0, "mon": 400, "move": 2]]
    let backgroundColours = [#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1), #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1), #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1), #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1), #colorLiteral(red: 1, green: 0.5958040357, blue: 0.6052462459, alpha: 1), #colorLiteral(red: 0.8953360915, green: 0.2640661001, blue: 0.2817350626, alpha: 1), #colorLiteral(red: 0.7759842277, green: 0.2308575809, blue: 0.2465296984, alpha: 1), #colorLiteral(red: 0.6027598381, green: 0.1802979112, blue: 0.1918102503, alpha: 1), #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1), #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1), #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)]
    let emojiisForQuestion = ["", "🌍💵", "🌍💵", "🧠🌍💵", "🌍🌱💵", "🧠💪🌍💵", "🧠💵", "💪💵", "🌱💵", "💪💵", "🧠🌍💵", "💪💵", "🌱🌍💵","🌍💪💵", "💪💵", "💪💵", "🌱💵", "🌱💵", "🌍💵", "🌍💵", "🌍💵", "🌍💵"]
    //TODO: add challenge questions with codes in the future
    
    //MARK: Outlets
    @IBOutlet var entireOptionStackView: UIStackView!
    @IBOutlet var titleOfMessage: UILabel!
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var optionOneButton: UIButton!
    @IBOutlet var optionTwoButton: UIButton!
    @IBOutlet var backgroundView: UIView!
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var numberOfTurnsLeftLabel: UILabel!
    @IBOutlet var categoriesAffectedLabel: UILabel!
    
    //MARK: Overloads
    override func viewDidLoad() {
        super.viewDidLoad()
        //set the original players to the current ones since we are in 1st round
        playerOriginalNames = playerNames
        playerOriginalCategories = playerCategories
        playerOriginalImageArray = playerImageArray
        isBasicLevel = UserDefaults.standard.bool(forKey: "isBasicLevel")
        setUpUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showScore") {
            guard let vc = segue.destination as? ScoreBoardPopoverViewController else { return }
            //pass in points to next view
            vc.enviromentalPoints = enviromentalPoints
            vc.mentalPoints = mentalPoints
            vc.societalPoints = societalPoints
            vc.physicalPoints = physicalPoints
            vc.moneyPoints = moneyPoints
            vc.playersNames = playerNames
            vc.playersImages = playerOriginalImageArray
            vc.spotsToMove = playerSpotsOnBoard
            vc.index = index
        } else if (segue.identifier == "showCongrats") {
            guard let vc = segue.destination as? CongratulationsViewController else { return }
            vc.currentUserIndex = currentlySelectedPlayerIndex
            if currentlySelectedPlayerIndex == 0 {
                vc.currentUsersStageIndex = playerSection[currentlySelectedPlayerIndex]
            } else {
                vc.currentUsersStageIndex = playerSection[currentlySelectedPlayerIndex - 1]
            }
            vc.shouldShowRemovePlayer = shouldShowRemovePlayer
            vc.shouldShowScoreAfter = shouldShowScoreBoard
            vc.delegate = self
            vc.isCongrats = isCongrats
            vc.playerNames = playerNames
        } else if (segue.identifier == "showWinner") {
            guard let vc = segue.destination as? WinnerPopoverViewController else { return }
            vc.winnerImage = winnerImage
            vc.winnerName = winnerName
        }
    }
    
    //MARK: Methods
    func setUpUI() {
        userImageView.image = playerImageArray[0]
        entireOptionStackView.layer.borderWidth = 3
        entireOptionStackView.layer.borderColor = UIColor.black.cgColor
        //page just loaded so set text to first option
        updateText()
    }
    
    func updateText() {
        if index + 1 > descriptionText.count || currentNumberOfPlayers <= 0 {
            //if they still have levels to go through show congrats
            //otherwise show
            isCongrats = false
            shouldShowScoreBoard = true
            calculateWinner()
            performSegue(withIdentifier: "showWinner", sender: nil)
            titleOfMessage.text = "End of Game"
            descriptionTextView.text = "Congrats! You are at the end of the game. Press back to return to the menu."
            backgroundView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
            optionOneButton.isHidden = true
            optionTwoButton.isHidden = true
            categoriesAffectedLabel.text = ""
            numberOfTurnsLeftLabel.text = ""
            userImageView.isHidden = true
        } else {
            if index == 0 {
                optionTwoButton.isHidden = true
                numberOfTurnsLeftLabel.isHidden = true
            } else {
                optionTwoButton.isHidden = false
                numberOfTurnsLeftLabel.isHidden = false
            }
            titleOfMessage.text = playerNames[playerTurnsCount] + "'s Turn"
            userImageView.image = playerOriginalImageArray[playerTurnsCount]
            descriptionTextView.text = descriptionText[index]
            optionOneButton.setTitle(buttonOneArray[index], for: .normal)
            optionTwoButton.setTitle(buttonTwoArray[index], for: .normal)
            backgroundView.backgroundColor = backgroundColours[index]
            categoriesAffectedLabel.text = emojiisForQuestion[index]
            readText()
        }
    }
    
    func calculateWinner() {
        var totalPoints = 0
        //go through remaining players and find the one with most points
        for n in 0...currentlySelectedPlayerIndex {
            var totalPointsPlayer = 0
            totalPointsPlayer += moneyPoints[n] * 10
            totalPointsPlayer += enviromentalPoints[n] * 10
            totalPointsPlayer += societalPoints[n] * 10
            totalPointsPlayer += physicalPoints[n] * 10
            totalPointsPlayer += moneyPoints[n]
            if totalPointsPlayer > totalPoints {
                totalPoints = totalPointsPlayer
                winnerImage = playerImageArray[n]
                winnerName = playerNames[n]
            }
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
        if playerTurnsCount < currentNumberOfPlayers + 1 {
            titleOfMessage.text = playerNames[playerTurnsCount] + "'s Turn"
            userImageView.image = playerOriginalImageArray[playerTurnsCount]
            numberOfTurnsLeftLabel.text = "\(playerTurnCount[currentlySelectedPlayerIndex])" + "\\" +  "\(sectionSpots[playerSection[currentlySelectedPlayerIndex]])"
        } else {
            showScore()
            index += 1
            updateText()
        }
    }
    
    func updatePoints(buttonOneSelected: Bool) {
        playerTurnCount[currentlySelectedPlayerIndex] += 1
        if buttonOneSelected {
            //button one selected
            if pointsPerQuestion[index]["button1"] == 0 {
                //if user is meant to lose points for button one selected
                mentalPoints[playerTurnsCount] -= pointsPerQuestion[index]["ment"] ?? 0
                enviromentalPoints[playerTurnsCount] -= pointsPerQuestion[index]["env"] ?? 0
                societalPoints[playerTurnsCount] -= pointsPerQuestion[index]["soc"] ?? 0
                physicalPoints[playerTurnsCount] -= pointsPerQuestion[index]["phy"] ?? 0
                moneyPoints[playerTurnsCount] += pointsPerQuestion[index]["mon"] ?? 0
                playerSpotsOnBoard[playerTurnsCount] = 0
            } else {
                //otherwise user is meant to gain points for button one selected
                mentalPoints[playerTurnsCount] += pointsPerQuestion[index]["ment"] ?? 0
                enviromentalPoints[playerTurnsCount] += pointsPerQuestion[index]["env"] ?? 0
                societalPoints[playerTurnsCount] += pointsPerQuestion[index]["soc"] ?? 0
                physicalPoints[playerTurnsCount] += pointsPerQuestion[index]["phy"] ?? 0
                moneyPoints[playerTurnsCount] -= pointsPerQuestion[index]["mon"] ?? 0
                playerSpotsOnBoard[playerTurnsCount] = pointsPerQuestion[index]["move"] ?? 0
                playerTotalSpotsOnBoard[playerTurnsCount] += pointsPerQuestion[index]["move"] ?? 0
            }
        } else {
            //button two selected
            if pointsPerQuestion[index]["button1"] == 0 {
                // user is meant to gain points for button two selected
                mentalPoints[playerTurnsCount] += pointsPerQuestion[index]["ment"] ?? 0
                enviromentalPoints[playerTurnsCount] += pointsPerQuestion[index]["env"] ?? 0
                societalPoints[playerTurnsCount] += pointsPerQuestion[index]["soc"] ?? 0
                physicalPoints[playerTurnsCount] += pointsPerQuestion[index]["phy"] ?? 0
                moneyPoints[playerTurnsCount] -= pointsPerQuestion[index]["mon"] ?? 0
                playerSpotsOnBoard[playerTurnsCount] = pointsPerQuestion[index]["move"] ?? 0
                playerTotalSpotsOnBoard[playerTurnsCount] += pointsPerQuestion[index]["move"] ?? 0
            } else {
                //otherwise user is meant to lose points for button 2 selected
                mentalPoints[playerTurnsCount] -= pointsPerQuestion[index]["ment"] ?? 0
                enviromentalPoints[playerTurnsCount] -= pointsPerQuestion[index]["env"] ?? 0
                societalPoints[playerTurnsCount] -= pointsPerQuestion[index]["soc"] ?? 0
                physicalPoints[playerTurnsCount] -= pointsPerQuestion[index]["phy"] ?? 0
                moneyPoints[playerTurnsCount] += pointsPerQuestion[index]["mon"] ?? 0
                playerSpotsOnBoard[playerTurnsCount] = 0
            }
        }
        //check if should show congrats or remove player popups
        if (playerTotalSpotsOnBoard[playerTurnsCount] >= sectionSpots[playerSection[currentlySelectedPlayerIndex]]) {
            playerTurnCount[currentlySelectedPlayerIndex] = 0
            //player has reached the next level
            playerTotalSpotsOnBoard[playerTurnsCount] -= sectionSpots[playerSection[currentlySelectedPlayerIndex]];
            playerSection[currentlySelectedPlayerIndex] += 1
            isCongrats = true
            if playerSection[currentlySelectedPlayerIndex] == 3 {
                removePlayerFromGame()
                //set that they have finished game
                isCongrats = false
            } else {
                isCongrats = true
            }
            //issue where if it is the last player won't show score board bc of this and messes up whole game
            if currentlySelectedPlayerIndex == 3 {
                shouldShowScoreBoard = true
            } else {
                shouldShowScoreBoard = false
            }
            shouldShowRemovePlayer = false
            performSegue(withIdentifier: "showCongrats", sender: nil)
        } else if playerTurnCount[currentlySelectedPlayerIndex] > sectionSpots[playerSection[currentlySelectedPlayerIndex]] {
            //player has run out of turns let them know they are out and remove them
            shouldShowRemovePlayer = true
            isCongrats = false
            shouldShowScoreBoard = false
            performSegue(withIdentifier: "showCongrats", sender: nil)
            removePlayerFromGame()
        } else {
            shouldShowRemovePlayer = false
        }
        if currentlySelectedPlayerIndex < currentNumberOfPlayers {
            currentlySelectedPlayerIndex += 1
        } else {
            currentlySelectedPlayerIndex = 0
        }
    }
    
    func removePlayerFromGame() {
        //player has finished the game
        currentNumberOfPlayers -= 1;
        //add player to end of list then remove them from where they used to be
        mentalPoints.append(mentalPoints[currentlySelectedPlayerIndex])
        mentalPoints.remove(at: currentlySelectedPlayerIndex)
        enviromentalPoints.append(enviromentalPoints[currentlySelectedPlayerIndex])
        enviromentalPoints.remove(at: currentlySelectedPlayerIndex)
        physicalPoints.append(physicalPoints[currentlySelectedPlayerIndex])
        physicalPoints.remove(at: currentlySelectedPlayerIndex)
        societalPoints.append(societalPoints[currentlySelectedPlayerIndex])
        societalPoints.remove(at: currentlySelectedPlayerIndex)
        moneyPoints.append(moneyPoints[currentlySelectedPlayerIndex])
        moneyPoints.remove(at: currentlySelectedPlayerIndex)
        playerSpotsOnBoard.append(playerSpotsOnBoard[currentlySelectedPlayerIndex])
        playerSpotsOnBoard.remove(at: currentlySelectedPlayerIndex)
        playerOriginalImageArray.append(playerOriginalImageArray[currentlySelectedPlayerIndex])
        playerOriginalImageArray.remove(at: currentlySelectedPlayerIndex)
        
        //update original player names on new order
        playerOriginalNames.append(playerNames[currentlySelectedPlayerIndex])
        playerOriginalNames.remove(at: currentlySelectedPlayerIndex)
        playerOriginalCategories.append(playerCategories[currentlySelectedPlayerIndex])
        playerOriginalCategories.remove(at: currentlySelectedPlayerIndex)
        playerOriginalImageArray.append(playerImageArray[currentlySelectedPlayerIndex])
        playerOriginalImageArray.remove(at: currentlySelectedPlayerIndex)
        playerNames.remove(at: currentlySelectedPlayerIndex)
        playerSection.remove(at: currentlySelectedPlayerIndex)
        playerCategories.remove(at: currentlySelectedPlayerIndex)
        playerTurnCount.remove(at: currentlySelectedPlayerIndex)
        
        //set currently selected index to one before so player after still gets their turns
        currentlySelectedPlayerIndex -= 1
        playerTurnsCount -= 1
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

extension GameViewController: ScoreBoardDelegate {
    func forceShowScoreBoard() {
        performSegue(withIdentifier: "showScore", sender: nil)
    }
}
