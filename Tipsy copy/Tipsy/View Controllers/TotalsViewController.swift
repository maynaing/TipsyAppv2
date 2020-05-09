//
//  TotalsViewController.swift
//  Tipsy
//
//  Created by May Naing on 5/8/20.
//  Copyright © 2020 May Naing. All rights reserved.
//

import UIKit
import FirebaseDatabase

class TotalsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var personLabel: UILabel!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    var totalCalculated = ""
    var tipCalculated = ""
    var personCalculated = ""
    
    var ref:DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        showTotal()
        ref = Database.database().reference()
    }

    func showTotal() {
        totalLabel.text = totalCalculated
        tipLabel.text = tipCalculated
        personLabel.text = personCalculated
    }
    
    @IBAction func backTapped(_ sender: Any) {
    }
    
    @IBAction func doneTapped(_ sender: Any) {
        ref?.child("Totals").child("Calculated Tip").setValue(tipCalculated)
        ref?.child("Totals").child("Calculated Total").setValue(totalCalculated)
        ref?.child("Totals").child("Per Person").setValue(personCalculated)
    }
}
