//
//  ViewController.swift
//  IOSFuelSelector
//
//  Created by Mozart Sousa on 09/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var alcoolField: UITextField!
    @IBOutlet weak var gasField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    var alcoolValue: Double = 0
    var gasValue: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func calcuteButton(_ sender: Any) {
        if let alcoolValue = alcoolField.text, let gasValue = gasField.text {
            convertFuelsToDouble(with: alcoolValue, and: gasValue)
            calculateFuel()
        } else {
            setInvalidLabel()
        }
    }
    
    private func convertFuelsToDouble(with alcool: String, and gas: String) {
        let alcool = alcool.replacingOccurrences(of: ",", with: ".")
        let gas = gas.replacingOccurrences(of: ",", with: ".")
        
        if let alcoolValue = Double(alcool), let gasValue = Double(gas) {
            self.alcoolValue = alcoolValue
            self.gasValue = gasValue
        } else {
            self.alcoolValue = 0
            self.gasValue = 0
        }
    }
    
    private func calculateFuel() {
        if alcoolValue == 0 || gasValue == 0 {
            setInvalidLabel()
        } else {
            
            if alcoolValue/gasValue >= 0.7 {
                resultLabel.text = "Melhor utilizar gasolina!"
            } else {
                resultLabel.text = "Melhor utilizar alcool!"
            }
            
            dismissKeyboard()
        }
    }
    
    func setInvalidLabel() {
        resultLabel.text = "Insira valores válidos nos respectivos campos!"
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
