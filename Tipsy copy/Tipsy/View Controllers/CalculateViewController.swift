//
//  CalculateViewController.swift
//  Tipsy
//
//  Created by May Naing on 5/8/20.
//  Copyright © 2020 May Naing. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var totalTextField: UITextField!
    @IBOutlet weak var tipTextField: UITextField!
    @IBOutlet weak var peopleTextField: UITextField!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var calButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    var total = ""
    var tipCal = ""
    var peopleCal = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        errorLabel.alpha = 0
    }
    
    func checkFields() -> String? {
        if totalTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || tipTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || peopleTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields"
        }
        
        return nil
    }
    
    @IBAction func calTapped(_ sender: Any) {
        let error = checkFields()
        
        if error != nil {
            showError(message: error!)
        }
        else {
            let totalNum:Float = Float(self.totalTextField.text!)!
            let tipNum:Float = Float(self.tipTextField.text!)!
            let peopleNum:Float = Float(self.peopleTextField.text!)!
            
            let tipTotal:Float = Float((tipNum * 0.01) * totalNum)
            
            let totalAmount:Float = Float(totalNum + tipTotal)
            let totalAmountPerPerson:Float = Float(totalAmount / peopleNum)
            
            total = String(format: "%.2f", totalAmount)
            tipCal = String(format: "%.2f", tipTotal)
            peopleCal = String(format: "%.2f", totalAmountPerPerson)
            
            performSegue(withIdentifier: "total", sender: self)
        }
    }
    
    @IBAction func backTapped(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "total" {
            let totalsViewController = segue.destination as! TotalsViewController
            totalsViewController.totalCalculated = self.total
            totalsViewController.tipCalculated = self.tipCal
            totalsViewController.personCalculated = self.peopleCal
        }
    }
    
    func showError(  message : String) {
        errorLabel.alpha = 1
        errorLabel.text = message
    }

    
    
}
