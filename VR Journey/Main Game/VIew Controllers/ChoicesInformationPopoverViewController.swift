//
//  ChoicesInformationPopover.swift
//  VR Journey
//
//  Created by Abby Martin on 2019-03-21.
//  Copyright © 2019 Abby Martin. All rights reserved.
//

import UIKit

class ChoicesInformationPopoverViewController: UIViewController {
    //MARK: Properties
    var titleArray = ["First Choice Information", "Second Choice Information"]
    let choiceOneArray = ["By choosing to have your product designed for less industry specific applications, you lost 5 societal points, but gain $1000 since you saved money.", "You chose to gear your product towards the general public and lost 6 societal points because of this, however you gained $1500 since you kept a large user base.", "You chose to have violence and mature material resulting in -5 mental points, -2 societal points, but an increase in $700 since this will make your game more appealing to many, however can cause increased violence in user’s daily lives.", "You chose to implement the e-waste program which resulted in an 8-point increase in environmental points and 4-point increase in societal points. You lost $600 however, since this was an expensive program to implement.", "By making your product portable you gained 1 mental point, 4 societal points, and 3 physical points since this impact will affect a user’s mental and physical health and make local societies a more inclusive place. You lost $2000 since this was an expensive development.", "You chose to model your graphics off the real world. This caused you to lose 8 mental points since when VR becomes too realistic users may have a hard time distinguishing between reality and virtual reality, but you gained $700 since you saved money on designers.", "You chose not to incorporate the system into the user’s phone. This caused you to gain 5 physical points and lost $4000 since many users will now chose your competition’s products who can connect to user’s phones over yours.", "You chose LCD screens for your product. This resulted in you gaining 10 environmental points and losing $600 since LCD screens are more expensive but are less toxic to dispose of.", "You chose to give your design team an additional three weeks to design the controller. This resulted in you gaining 8 physical points, but losing $2000.", "You chose to have a time limit warning for users. This resulted in gaining 9 mental points but losing $2000 on advertisement money.", "You chose to make two models. This resulted in gaining 7 physical points but losing $4000 since creating another product is expensive.", "You chose to spend more money researching materials. This resulted in gaining 4 environmental points and 2 societal points, but losing $1500 since you had to pay your researchers.", "You chose to manufacture locally which means you gained 4 societal points and 3 physical points. You lost $2000 however, because of the increased costs associated with local manufacturing.", "You chose to implement the plan. This caused you to gain 2 physical points since the plan could make work safer for your factory employees, however you lost $3000 since it was expensive to implement.", "You chose to integrate VR into your assembly line. This caused you to gain 8 physical points, however you lost $2000.", "You chose to use those materials which resulted in you losing 6 environmental points. However, you gained $1800 from the money you saved.", "You chose to use those materials which resulted in you losing 6 environmental points. However, you gained $800 by avoiding doing other research in potential other materials.", "You chose to donate 6 systems to schools who cannot afford technology. This caused you to gain 10 societal points, but lose $5000.", "You chose to donate 10 devices to participate in the company’s campaign. This caused you to lose $8000, but you gained 15 societal points.", "You chose to globalize your product. This resulted in 4 societal points, but you lost $500.", "You chose to help them. This resulted in 7 societal points but you lost $400 from time spent on the film which could have been spent elsewhere."]
    let choiceTwoArray = ["You chose to design your product for more industry specific applications. This caused you to gain 5 societal points, and lose $1000 since creating more products costs your company money.", "You chose to focus on designing a product to help people with disabilities. This caused you to gain 6 societal points although you lost $1500 by narrowing your user base.", "You chose to not include violence and mature material which caused you to gain 5 mental points and 2 societal points. You lost $700 since this makes your game less exciting to many of your users.", "You chose to not implement the e-waste program. This caused you to lose 8 environmental points and 4 societal points, but you gained $600 by saving your money.", "You chose not to make your product as accessible and this resulted in you losing 1 mental point, 4 societal points, and 3 physical points. You gained $2000, however, by saving money on development.", "You chose to model your graphics off a fictitious environment. This resulted in you gaining 8 mental points but losing $700 since it was expensive to hire designers to create your environment.", "You chose to incorporate the system into a user’s phone. This resulted in a loss of 5 physical points and a gain of $4000 since this made your product more competitive and you gained users.", "You chose OLED screens for your product. This caused you to lost 10 environmental points since they are more toxic to dispose of, and gain $600 from the money you saved.", "You chose to not give your design team an additional three weeks to design the controller. This caused you to lose 8 points, and gain $2000 from the money you saved paying the team.", "You chose to not have a time limit warning for users. This resulted in losing 9 mental points but gaining $2000 on advertisement money.", "You chose to make only one models. This resulted in losing 7 physical points but gaining $4000.", "You chose to not spend more money researching materials. This resulted in losing 4 environmental points and 2 societal points, but gaining $1500 since you saved money not having to pay your researchers more.", "You chose to manufacture in another country which means you lost 4 societal points and 3 physical points. However, you gained $2000 by the money you saved manufacturing in a foreign country.", "You chose to not implement the plan. This caused you to lose 2 physical points since the plan could have made work safer for your factory employees, however you gained $3000 by saving the money it would have cost to implement it.", "You chose not to integrate VR into your assembly line. This caused you to lose 8 physical points, however you gained $2000 from the money you saved.", "You chose to not use those materials which resulted in you gaining 6 environmental points. However, you lost $1800 from using alternative materials which took research and money to find.", "You chose to not use those materials which resulted in you gaining 6 environmental points. However, you lost $800 by having to research other potential other materials.", "You chose to not donate the systems to schools who cannot afford technology. This resulted in you losing 10 societal points, but gaining $5000.", "You chose to not donate devices. This caused you to gain $8000 from the money you saved, but you lost 15 societal points.", "You chose to not globalize your product. This resulted in losing 4 societal points, but you gained $500 from the money you saved.", "You chose to not help them. This resulted in a loss of 7 societal points but you gained $400 from money and time saved."]
    var currentScreenIndex = 0
    var index = 0
    
    //MARK: Outlets
    @IBOutlet var infoTitle: UILabel!
    @IBOutlet var infoTextView: UITextView!
    @IBOutlet var mainView: UIView!
    
    //MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        updateText()
    }
    
    //MARK: Methods
    func updateText() {
        if currentScreenIndex == 0 {
            infoTitle.text = titleArray[0]
            infoTextView.text = choiceOneArray[index - 1]
        } else {
            infoTitle.text = titleArray[1]
            infoTextView.text = choiceTwoArray[index - 1]
        }
    }
    
    //MARK: Actions
    @IBAction func okayButtonClicked(_ sender: Any) {
        if currentScreenIndex == 0 {
            //show second screen
            currentScreenIndex += 1
            updateText()
        } else {
            //have shown both screens so dismiss
            dismiss(animated: true, completion: nil)
        }
    }
}
