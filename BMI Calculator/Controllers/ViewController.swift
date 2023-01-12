//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChange(_ sender: UISlider) {
        print(String(format: "%.2f", sender.value))
        heightLabel.text = "\(String(format: "%.2f", sender.value))m"
    }
    
    @IBAction func weightSliderChange(_ sender: UISlider) {
        print(String(format: "%.0f", sender.value))
        weightLabel.text = "\(String(format: "%.0f", sender.value))Kg"
    }
    
    @IBAction func calculateBMI(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        //Change between screen
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    
    //Pass values from this ViewController to ResultViewController
    //Function that works every time a Segue is performed
    //The function works with 2 parameters, the segue which is the property that contains info about where the navigation is going, and sender it only specifies which VC is going to start de Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //When we have more than 1 segue, a condition has to be made so we can know if the segue identifier is the one we want
        if segue.identifier == "goToResult"{
            //Here is where we can access and pass data from this VC to ResultVC
            //segue.destination contains the access to the VC we are interested in
            //At first look segue.destination is of type UIViewController, so it does not reach the ResultViewController
            //To do it, we need to implement DOWNCASTING, it means we change the type of segue.destination
            //Once downcasting is done the type of the segue will change to ResultViewControler and we will get access to this VC
            let destinationVC = segue.destination as! ResultViewController
            //With the access to ResultVC now we can access to bmiValue
            destinationVC.bmiValue = calculatorBrain.getBMIValue() //CHALLENGE: Get the result from calculate BMI to this block of code
            
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}

