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
    @IBOutlet weak var messageLabel: UILabel!
    
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
        setMessageAndColor(fromValue: result)
    }
    
    @IBAction func closeInfo(_ sender: UIStoryboardSegue) {
        // No code needed, no need to connect the IBAction explicitely
    }
    
    func setMessageAndColor(fromValue result: Float) {
        switch result {
        case 0..<18.5:
            messageLabel.text = "Bajo peso"
            messageLabel.textColor = UIColor(named: "imc-result/under")
            resultLabel.textColor = UIColor(named: "imc-result/under")
        case 18.5..<25:
            messageLabel.text = "Peso normal"
            messageLabel.textColor = UIColor(named: "imc-result/normal")
            resultLabel.textColor = UIColor(named: "imc-result/normal")
        case 25..<30:
            messageLabel.text = "Sobrepeso"
            messageLabel.textColor = UIColor(named: "imc-result/over")
            resultLabel.textColor = UIColor(named: "imc-result/over")
        case 30..<35:
            messageLabel.text = "Obesidad"
            messageLabel.textColor = UIColor(named: "imc-result/obesity")
            resultLabel.textColor = UIColor(named: "imc-result/obesity")
        default:
            messageLabel.text = "Obesidad morbida"
            messageLabel.textColor = UIColor(named: "imc-result/morbid")
            resultLabel.textColor = UIColor(named: "imc-result/morbid")
        }
    }
}

