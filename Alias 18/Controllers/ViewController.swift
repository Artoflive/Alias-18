//
//  ViewController.swift
//  Alias 18
//
//  Created by Alexey Galkin on 08.04.18.
//  Copyright © 2018 Alexey Galkin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var sound = SoundPlayer()
    var settings = Settings()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "toSettings" {
            let settingsVC = segue.destination as! SettingsVC
            settingsVC.settings = settings
            sound.playSound("confirm")
            
        }
        if segue.identifier == "toChoose" {
            let chooseVC = segue.destination as! ChooseViewController
            chooseVC.settings = settings
            sound.playSound("confirm")
            
        }
        
    }

}

