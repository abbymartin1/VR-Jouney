//
//  Personas View Controller.swift
//  VR Journey
//
//  Created by Abby Martin on 2019-02-17.
//  Copyright © 2019 Abby Martin. All rights reserved.
//

import Foundation
import UIKit

class PersonasViewController: UIViewController {
    //MARK: Outlets
    @IBOutlet var personaTableView: UITableView!
    
    //MARK: Properties
    let personaTitleArray = ["Gaming", "Travel/Planning", "Medical", "Education"]
    let personaDescriptionArray = ["Gaming Description", "Travel/Planning Description", "Medical Description", "EDU Description"]
    let personaImageArray = [#imageLiteral(resourceName: "logo Orange "), #imageLiteral(resourceName: "Logo Grey"), #imageLiteral(resourceName: "IMG_1878"), #imageLiteral(resourceName: "Logo White")]
    let cellIdentifier = "PersonaTableViewCell";
    
    //MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        personaTableView.delegate = self
        personaTableView.dataSource = self
        personaTableView.backgroundColor = UIColor.darkGray;
    }
    
}

extension PersonasViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personaTitleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PersonaTableViewCell else {
            fatalError("The dequeued cell is not an instance of PersonaTableViewCell.")
        }
        cell.personaTitle.text = personaTitleArray[indexPath.row]
        cell.personImageView.image = personaImageArray[indexPath.row]
        cell.personaDescription.text = personaDescriptionArray[indexPath.row]
        if (indexPath.row % 2 == 0) {
            cell.backgroundColor = UIColor.lightGray
        } else {
            cell.backgroundColor = UIColor.gray
        }
        return cell;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

