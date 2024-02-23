//
//  Register ViewController.swift
//  Hobby app
//
//  Created by 鈴木絢心 on 2024/02/09.
//

import UIKit
import FirebaseAuth

class Register_ViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //Registerボタンをクリック
    @IBAction func registerButton(_ sender: UIButton){
        
        if let email = emailTextField.text,
           let password = passwordTextField.text{
            
            
            Auth.auth().createUser(
                withEmail: email, password: password) { authResult, error in
                    
                    if let e = error{
                        print(e.localizedDescription)
                    }else{
                        
                    }
                    // ...
                }
            
            
            
            
        }
        
        
        func viewDidLoad() {
            super.viewDidLoad()
            
            // Do any additional setup after loading the view.
        }
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}
