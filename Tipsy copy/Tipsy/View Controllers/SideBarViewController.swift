//
//  SideBarViewController.swift
//  Tipsy
//
//  Created by May Naing on 5/8/20.
//  Copyright © 2020 May Naing. All rights reserved.
//

import UIKit

enum MenuType: Int {
    case pass
    case profile
    case privacy
    case rate
}

class SideBarViewController: UITableViewController {

    @IBOutlet weak var changePassButton: UIButton!
    
    @IBOutlet weak var profileButton: UIButton!
    
    @IBOutlet weak var privacyButton: UIButton!
    
    @IBOutlet weak var rateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        dismiss(animated: true) {
            print("Dismissing: \(menuType)")
        }
    }

}
