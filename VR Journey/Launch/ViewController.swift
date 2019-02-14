//
//  ViewController.swift
//  VR Journey
//
//  Created by Abby Martin on 2019-02-08.
//  Copyright © 2019 Abby Martin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var levelSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backItem?.title = "Back"
        
    }
    
    @IBAction func didChooseLevel(_ sender: Any) {
        switch levelSegmentedControl.selectedSegmentIndex {
        case 0:
            //user chose basic level
            UserDefaults.standard.set(true, forKey: "isBasicLevel")
        case 1:
            //user chose advanced level
            UserDefaults.standard.set(false, forKey: "isBasicLevel")
        default:
            break
        }
    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
        //user pressed play
        //performSegue(withIdentifier: "showGame", sender: nil)
    }
    
}

