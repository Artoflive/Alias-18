//
//  EndOfRoundVC.swift
//  Alias 18
//
//  Created by Alexey Galkin on 20.04.18.
//  Copyright © 2018 Alexey Galkin. All rights reserved.
//

import UIKit

class EndOfRoundVC: UIViewController {
    
    
    
    
    var settings = Settings()
    var teamsArray = [Team]()
    var usedWords = [Word]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //usedWords = wordsArray.filter({$0.used == true}) - NOT work
        //        (childViewControllers[0] as? WordTableVC)?.words = usedWords
        //        (childViewControllers[0] as? WordTableVC)?.sets = statusOfWord
        //        (childViewControllers[0] as? WordTableVC)?.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toTable" {
            let wordTableVC = segue.destination as! WordTableVC
            wordTableVC.usedWords = usedWords
            
        }
        
        if segue.identifier == "nextStep" {
            let nextStepVC = segue.destination as! BeginingVC
            nextStepVC.settings = settings
            nextStepVC.teamsArray = teamsArray
        }
        if segue.identifier == "toEnd" {
            let endVC = segue.destination as! EndOfGameVC
            endVC.teamsArray = teamsArray
        }
    }
    
    @IBAction func AllRightPressed(_ sender: UIButton) {
        for element in usedWords {
            if element.quessed {
                teamsArray[settings.step].score += 1
            } else {
                teamsArray[settings.step].score -= 1
            }
        }
        
        if settings.step < teamsArray.count - 1 {
            settings.step += 1
            performSegue(withIdentifier: "nextStep", sender: self)
        } else {
            if settings.round == 3 {
                performSegue(withIdentifier: "toEnd", sender: self)
            } else {
                settings.step = 0
                settings.round += 1
                performSegue(withIdentifier: "nextStep", sender: self)
            }
            
        }
    }
    
}
