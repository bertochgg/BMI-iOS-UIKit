//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Cesar Humberto Grifaldo Garcia on 06/12/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue: String?
    var advice: String?
    var color: UIColor?

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        resultLabel.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = color
    }
    
    @IBAction func reCalculateBtn(_ sender: UIButton){
        //Dismiss interface
        self.dismiss(animated: true, completion: nil)
    }

}
