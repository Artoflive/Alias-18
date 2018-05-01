//
//  ChooseViewController.swift
//  Alias 18
//
//  Created by Alexey Galkin on 09.04.18.
//  Copyright © 2018 Alexey Galkin. All rights reserved.
//

import UIKit

class ChooseViewController: UIViewController {
   
    var teamsArray = [Team]()
    var choosedTeamName = [String]()
    var settings = Settings()
    var sound = SoundPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Team choosing and add to ChosedTeamName
    @IBAction func team1Tap(_ sender: UIButton) {
        
        let key = sender.currentTitle!
        if choosedTeamName.count < 4 {
            if !choosedTeamName.contains(key) {
                sender.backgroundColor = UIColor.yellow
                sound.playSound("switch")
                choosedTeamName.append(key)
            }
            else {
                sender.backgroundColor = UIColor.brown
                sound.playSound("switch")
                if let i = choosedTeamName.index(of: key) {
                    choosedTeamName.remove(at: i)
                }
            }
            
        } else {
            if sender.backgroundColor == UIColor.yellow{
                sound.playSound("switch")
                sender.backgroundColor = UIColor.brown
                if let i = choosedTeamName.index(of: key) {
                    choosedTeamName.remove(at: i)
                }
            } else {
                sound.playSound("deny")
            }
            
        }
    }
    
    @IBAction func StartTaped(_ sender: UIButton) {
        sound.playSound("confirm")
        performSegue(withIdentifier: "toBegining", sender: self)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any? ) {
        if segue.identifier == "toBegining" {
            let beginingVC = segue.destination as! BeginingVC
            
            // Adding choosed teams to array and send
            for i in 0..<choosedTeamName.count {
                let newTeam = Team()
                newTeam.name = choosedTeamName[i]
                teamsArray.append(newTeam)
            }
            beginingVC.teamsArray = teamsArray
            beginingVC.settings = settings
        }
    }
}
