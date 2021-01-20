//
//  ViewController.swift
//  BMI_Calculator
//
//  Created by Hanna Putiprawan on 1/18/21.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightNumberLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightNumberLabel: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var calculateButton: UIButton!
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightSlider.value = 1.5
        weightSlider.value = 100
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightNumberLabel.text = String(format: "%.2f", sender.value) + "m"
    }
    
    @IBAction func weightSliderChaged(_ sender: UISlider) {
        weightNumberLabel.text = String(format: "%.0f", sender.value) + "Kg"
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    // Run something before the segue initiated in preparation for the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController // as! = downcasting - narrow down to get some properties from ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.color()
        }
    }
    
}

