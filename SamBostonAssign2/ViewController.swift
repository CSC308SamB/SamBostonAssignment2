//
//  ViewController.swift
//  SamBostonAssign2
//
//  Created by Boston, Samuel T. on 2/16/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mealInput: UITextField!
    @IBOutlet weak var snackInput: UITextField!
    @IBOutlet weak var stepInput: UITextField!
    @IBOutlet weak var activeInput: UITextField!
    
    @IBOutlet weak var eatingAmount: UILabel!
    @IBOutlet weak var weightGain: UILabel!
    @IBOutlet weak var stepsNeeded: UILabel!
    
    @IBOutlet weak var treadmill: UIImageView!
    @IBOutlet weak var blueText: UIView!
    @IBOutlet weak var redText: UIView!
    
    @IBAction func simulateButton(_ sender: Any) {
        
        let mealCal = Int(mealInput.text ?? "") ?? 0
        let snackCal = Int(snackInput.text ?? "") ?? 0
        let stepAmount = Int(stepInput.text ?? "") ?? 0
        let activeAmount = Int(activeInput.text ?? "") ?? 0
    
        
        let totalCal = mealCal + snackCal
        
        if (totalCal < 1800){
            eatingAmount.text = "Below Target!"
        } else if (totalCal == 1800){
            eatingAmount.text = "Right on the mark!"
        } else {
            eatingAmount.text = "Above Target!"
        }
        
        let totalBurn = Double(1800) + Double(stepAmount) * Double(0.05) + Double(activeAmount) * 8
        var diffKcal = Double(totalCal) - Double(totalBurn)
        let poundChange = diffKcal / 3500
        let formattedPound = String(format: "%.2f", poundChange)
        weightGain.text = "The weight change is \(formattedPound)."
        
        var stepsRequired = 0
        while diffKcal > 0{
            diffKcal -= 0.05
            stepsRequired += 1
        }
        let milesNeeded = Double(stepsRequired) / 2000
        let formattedMiles = String(format: "%.1f", milesNeeded)
        
        stepsNeeded.text = "Extra steps: \(stepsRequired) (\(formattedMiles))."
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


}

