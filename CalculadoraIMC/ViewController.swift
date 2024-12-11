//
//  ViewController.swift
//  CalculadoraIMC
//
//  Created by Tardes on 10/12/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var height: Int = 160
    var weight: Float = 60.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func setHeight(_ sender: UISlider) {
        height = Int(sender.value)
        heightLabel.text = "\(height) cm"
    }
    
    @IBAction func setWeight(_ sender: UIStepper) {
        weight = Float(sender.value)
        weightLabel.text = "\(weight) Kg"
    }
    
    @IBAction func calculate(_ sender: Any) {
        // Calcular el IMC
        let heightInMeters = (Float(height) / 100.0)
        let result = weight / pow(heightInMeters, 2)
        resultLabel.text = String(format: "%.2f", result)
        print("El IMC es \(result)")
    }
}

