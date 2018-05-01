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
   
    var settings = Settings()
    var sound = SoundPlayer()
    
    @IBAction func soundSW(_ sender: UISwitch) {
        settings.soundOn = !settings.soundOn
        print ("Sound is \(settings.soundOn)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settings.soundOn ? soundSwitcher.setOn(true, animated: false) : soundSwitcher.setOn(false, animated: false)
        print ("Sound in ViewDidLoad is \(settings.soundOn)")
        

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
