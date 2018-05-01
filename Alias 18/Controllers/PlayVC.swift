//
//  PlayVC.swift
//  Alias 18
//
//  Created by Alexey Galkin on 20.04.18.
//  Copyright © 2018 Alexey Galkin. All rights reserved.
//

import UIKit

class PlayVC: UIViewController {
    
    var settings = Settings()
    var teamsArray = [Team] ()
    var wordsArray : Array = [Word] ()
    var usedWords = [Word]()
//    var statusOfWord = [Bool]()
    var plusScore = 0
    var minusScore = 0
    var seconds = 5
    var timer = Timer()
    var arrayOfRnd = [Int]()
    var lastWordForAll = false
    var sound = SoundPlayer()
    var i = 0
    
    @IBOutlet var wordLabel: UILabel!
    @IBOutlet var teamLabel: UILabel!
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var plusLabel: UILabel!
    @IBOutlet var minusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getWords()
        showWord()
        teamLabel.text = teamsArray[settings.step].name
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(counterTo0)), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func counterTo0() {
        seconds -= 1
         // go to last word challenge
        if seconds == 0 {
            timer.invalidate()
            
            if lastWordForAll {
                performSegue(withIdentifier: "toLastWord", sender: self)
            } else {
                performSegue(withIdentifier: "toEndOfRound", sender: self)
            }
        }
        timerLabel.text = "0:\(seconds)"
    }
    func getWords () {
        for eachWord in WordThemes().list {
            let newWord = Word()
            newWord.word = eachWord
            wordsArray.append(newWord)
        }
    }

    func showWord () {
        wordLabel.text = wordsArray[exclusiveRnd(wordsArray.count-1)].word
    }
    
    func exclusiveRnd (_ maxValue : Int) -> Int {
        
        repeat{
            i = Int (arc4random_uniform(UInt32(maxValue)))
        }
            while arrayOfRnd.contains(i)
        arrayOfRnd.append(i)
        if arrayOfRnd.count == maxValue {
            arrayOfRnd.removeAll()// Clear when all indexes used
        }
        return i
        
    }
   
    @IBAction func plusBtn(_ sender: UIButton) {
        wordsArray[i].used = true
        wordsArray[i].quessed = true
        plusScore += 1
        sound.playSound("yes")
        plusLabel.text = "\(plusScore)"
        usedWords.append(wordsArray[i])
        print ("  +\(wordsArray[i].quessed)")
        showWord()
    }
    
    @IBAction func minusBtn(_ sender: UIButton) {
        wordsArray[i].used = true
        minusScore -= 1
        sound.playSound("no")
        minusLabel.text = "\(minusScore)"
        usedWords.append(wordsArray[i])
        print ("  -\(wordsArray[i].quessed)")
        showWord()
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toLastWord" {
            let lastWordVC = segue.destination as! LastWordVC
            lastWordVC.word = wordLabel.text!
        }
        if segue.identifier == "toEndOfRound" {
            let endOfRoundVC = segue.destination as! EndOfRoundVC
            endOfRoundVC.teamsArray = teamsArray
            endOfRoundVC.settings = settings
            endOfRoundVC.usedWords = usedWords
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
   

}
