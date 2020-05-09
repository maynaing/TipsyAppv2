//
//  SignUpViewController.swift
//  Tipsy
//
//  Created by May Naing on 5/7/20.
//  Copyright © 2020 May Naing. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confPasswordTextField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        errorLabel.alpha = 0;
    }
    
    func validateFields() -> String? {
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || confPasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields"
        }
        
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let cleanedEmail = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(password: cleanedPassword) == false {
            return "Password must be at least 8 characters and must include a number and a special character."
        }
        
        if Utilities.isEmailValid(email: cleanedEmail) == false {
            return "Email is in invalid format."
        }
        
        return nil
    }

    
    @IBAction func signUpTapped(_ sender: Any) {
        let error = validateFields()
        
        if error != nil {
            showError(message: error!)
        }
        else {
            let name = nameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let confPassword = confPasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if (password == confPassword) {
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    if error != nil {
                        self.showError(message: "Error creating user")
                    }
                    else {
                        let db = Firestore.firestore()
                        db.collection("users").addDocument(data: ["name":name, "uid":result!.user.uid]) { (error) in
                            if error != nil {
                                self.showError(message: "Error saving user data.")
                            }
                        }
                        
                        self.transitionToLanding()
                    }
                }
            }
            else {
                self.showError(message: "Passwords must match.")
            }
        }
        
    }

    func showError(  message : String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToLanding() {
        let landingViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.landingViewController) as? LandingViewController
        
        view.window?.rootViewController = landingViewController
        view.window?.makeKeyAndVisible()
    }
    
    @IBAction func backTapped(_ sender: Any) {
    }

}
