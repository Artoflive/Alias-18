//
//  SettingsVC.swift
//  Alias 18
//
//  Created by Alexey Galkin on 28.04.18.
//  Copyright © 2018 Alexey Galkin. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    @IBOutlet var timePV: UIPickerView!
    @IBOutlet var roundsPV: UIPickerView!
    
    @IBOutlet var soundSwitcher: UISwitch!
    @IBOutlet var lastWordSwitcher: UISwitch!
   
    var defaults = UserDefaults.standard
    var settings = Settings()
    var sound = SoundPlayer()
    
    @IBAction func soundSW(_ sender: UISwitch) {
        soundSwitcher.isOn ? defaults.set(true, forKey: "SoundOn") : defaults.set(false, forKey: "SoundOn")
        settings.soundOn = defaults.bool(forKey: "SoundOn")
        print ("  +++\(settings.soundOn)+++  ")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settings.soundOn = defaults.bool(forKey: "SoundOn")
        print (settings.soundOn)
        settings.soundOn ? soundSwitcher.setOn(true, animated: false) : soundSwitcher.setOn(false, animated: false)
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toStart" {
            let startVC = segue.destination as! ViewController
            startVC.settings = settings
            print ("Segue to Start")
        }
        
    }
  

}
