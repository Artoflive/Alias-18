//
//  Sound.swift
//  Alias 18
//
//  Created by Alexey Galkin on 30.04.18.
//  Copyright © 2018 Alexey Galkin. All rights reserved.
//

import Foundation
import AVFoundation

class SoundPlayer {
    
    var player : AVAudioPlayer!
//    var soundOn = true
    
//    func soundSwitch (){
//        soundOn = !soundOn
//        print("ha ha ha \(soundOn)")
//    }
    func playSound(_ file : String) -> Void {
        
        let url = Bundle.main.url(forResource: file, withExtension: "wav")
        do{
            try player = AVAudioPlayer(contentsOf: url!)
        }
        catch {
            print (error)
        }
        player.play()
    }
    
    
}
