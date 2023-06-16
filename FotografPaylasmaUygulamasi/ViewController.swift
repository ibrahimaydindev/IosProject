
//  ViewController.swift
//  FotografPaylasmaUygulamasi
//  Created by Texinsight on 2.06.2023.

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func girisYapButton(_ sender: Any) {
        if emailTextField.text != "" && passwordTextField.text != ""{
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { authdataresult, error in
                if error != nil{
                    
                    self.errorMessage(titleInput: "Hata", messageInput: error?.localizedDescription ?? "Hata, Tekrar Deneyiniz !")
                }else{
                    self.performSegue(withIdentifier: "toFeedVc", sender: nil)
                }
            }
            
            
        }else{
            errorMessage(titleInput: "Hata", messageInput: "Kullanıcı Adı ve Şifre Boş Olamaz !")
        }
            
    }
    
    @IBAction func kayitOlButton(_ sender: Any) {
        
        if emailTextField.text != "" && passwordTextField.text != ""{
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { authdataresult, error in
                if error != nil{
                    
                    self.errorMessage(titleInput: "Hata", messageInput: error?.localizedDescription ?? "Hata, Tekrar Deneyiniz !")
                }else{
                    self.performSegue(withIdentifier: "toFeedVc", sender: nil)
                }
            }
            
            
        }else{
            errorMessage(titleInput: "Hata", messageInput: "Kullanıcı Adı ve Şifre Boş Olamaz !")
        }
            

    }
    func errorMessage(titleInput:String , messageInput :String){
        let alert = UIAlertController(title : titleInput, message : messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton=UIAlertAction(title:"Tamam",style: UIAlertAction.Style.default,handler:nil)
        alert.addAction(okButton)
        self.present(alert,animated:true,completion:nil)
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

