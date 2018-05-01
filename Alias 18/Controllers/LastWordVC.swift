//
//  LastWordVC.swift
//  Alias 18
//
//  Created by Alexey Galkin on 20.04.18.
//  Copyright © 2018 Alexey Galkin. All rights reserved.
//

import UIKit

class LastWordVC: UIViewController {
    
    var settings = Settings()
    var word = ""

    @IBOutlet var wordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wordLabel.text = word
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
