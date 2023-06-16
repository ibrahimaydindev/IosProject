//
//  UploadViewController.swift
//  FotografPaylasmaUygulamasi
//
//  Created by Texinsight on 2.06.2023.
//

import UIKit
import Firebase

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    @IBOutlet weak var yorumText: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(gorselSec))
        imageView.addGestureRecognizer(gestureRecognizer)
        
    }
    @objc func gorselSec(){
        let pickerController  = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController,animated: true,completion: nil)
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func uploadBtn(_ sender: Any) {
        let storage = Storage.storage()
        let storageReference = storage.reference()
        let mediaFolder = storageReference.child("media")
        if let data = imageView.image?.jpegData(compressionQuality: 0.5){
            let uuid =  UUID().uuidString
        
            let imageReference = mediaFolder.child("\(uuid).jpg")
            imageReference.putData(data, metadata: nil ){ (storagemetadata, error ) in
                if error != nil {
                    self.errorMessage(title: "Hata", message: error?.localizedDescription ?? "Hata, Tekrar Deneyiniz !")
                }else{
                    imageReference.downloadURL { (url, error) in
                        if error == nil {
                            let imageUrl = url?.absoluteString
                            if let imageUrl = imageUrl {
                                let firestoreDatabase = Firestore.firestore()
                                let firestorePost = ["gorselUrl" : imageUrl, "yorum": self.yorumText.text!, "email": Auth.auth().currentUser!.email, "tarih" : FieldValue.serverTimestamp() ] as [String : Any]
                                firestoreDatabase.collection("Post").addDocument(data: firestorePost){
                                    (error) in
                                    if error != nil {
                                        self.errorMessage(title: "Hata", message: error?.localizedDescription ?? "Hata, Tekrar Deneyiniz !")
                                    }else{
                                        self.imageView.image = UIImage(named: "gorselsec")
                                        self.yorumText.text = ""
                                        self.tabBarController?.selectedIndex=0
                                        
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    func errorMessage(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }
    
 }
