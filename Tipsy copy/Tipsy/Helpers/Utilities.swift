//
//  Utilities.swift
//  Tipsy
//
//  Created by May Naing on 5/7/20.
//  Copyright © 2020 May Naing. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    static func isPasswordValid(  password : String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    static func isEmailValid(  email : String) -> Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        return emailTest.evaluate(with: email)
    }
}
