//
//  BeginingVC.swift
//  Alias 18
//
//  Created by Alexey Galkin on 20.04.18.
//  Copyright © 2018 Alexey Galkin. All rights reserved.
//

import UIKit

class BeginingVC: UIViewController {

    @IBOutlet var TeamName: UILabel!
    @IBOutlet var RoundNumber: UILabel!
    @IBOutlet var team1Score: UILabel!
    @IBOutlet var team2Score: UILabel!
    @IBOutlet var team3Score: UILabel!
    @IBOutlet var team4Score: UILabel!
    
    var teamsArray = [Team]()
    var settings = Settings()
    var sound = SoundPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("team count \(teamsArray)")
        TeamName.text = teamsArray[settings.step].name
        RoundNumber.text = "ROUND \(settings.round)"
        team1Score.text = "\(teamsArray[0].name)     \(teamsArray[0].score)"
        team2Score.text = "\(teamsArray[1].name)     \(teamsArray[1].score)"
        if teamsArray.count > 2 {
            team3Score.text = "\(teamsArray[2].name)     \(teamsArray[2].score)"
            
            if teamsArray.count > 3 {
                team4Score.text = "\(teamsArray[3].name)     \(teamsArray[3].score)"
            } else {
                team4Score.text = ""
            }
        } else {
            team3Score.text = ""
            team4Score.text = ""
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toPlay" {
            let playVC = segue.destination as! PlayVC
            playVC.settings = settings
            playVC.teamsArray = teamsArray
            sound.playSound("confirm")
            
        }
    }
    

}
