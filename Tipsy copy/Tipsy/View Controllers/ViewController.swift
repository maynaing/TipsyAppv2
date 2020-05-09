//
//  ViewController.swift
//  Tipsy
//
//  Created by May Naing on 3/30/20.
//  Copyright © 2020 May Naing. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var googleSignUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        errorLabel.alpha = 0;
    }
    
    // MARK: Actions
    @IBAction func loginTapped(_ sender: Any) {
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else {
                let landingViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.landingViewController) as? LandingViewController
                
                self.view.window?.rootViewController = landingViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
    }
    @IBAction func googleSignUpTapped(_ sender: Any) {
    }
    
}

