//
//  SettingsViewController.swift
//  FotografPaylasmaUygulamasi
//
//  Created by Texinsight on 2.06.2023.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func settingsButton(_ sender: Any) {
        do{
            try Auth.auth().signOut()
            performSegue(withIdentifier: "toViewController", sender: nil)

        }catch{
            print("Hata")
        }
    }
    

}
