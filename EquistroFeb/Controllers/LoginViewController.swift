//
//  LoginViewController.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 29/01/2022.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore
import grpc

class LoginViewController: UIViewController {

    var uidForUser: String = "Tu"
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    func goToHome() {
        
        let homeVContr = "HomeVContr"
        let homeWindow = storyboard?.instantiateViewController(identifier: homeVContr) as? HomeViewController
        
        self.view.window?.rootViewController = homeWindow
        self.view.window?.makeKeyAndVisible()
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
    }

    
    @IBAction func forgotPasswordTapped(_ sender: Any) {
        Auth.auth().sendPasswordReset(withEmail: emailTextField.text!){ (err) in
            if err == nil {
                print("Nav kludu")
            } else {
                print("Ir kludas")
            }
            
        }
    }
    
    @IBAction func loginButtonIsTapped(_ sender: Any) {
        
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" && passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != ""  {
            print("Visi lauki aizpildīti!!!")
        
        
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                let pazinojumsValsts = UIAlertController(title: "Invalid Email and/or Password!", message: "Please check, if Email and/or Password has been written corectly!", preferredStyle: .alert)
                pazinojumsValsts.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                self.present(pazinojumsValsts, animated: true, completion: nil)
            }
            else {
                self.uidForUser = "Es"
                
                //////////////////////////
                
                self.goToHome()
                
            }
            
        }
        }
            else {
                let pazinojumsValsts = UIAlertController(title: "Error Message", message: "Please fill in all fields!", preferredStyle: .alert)
                pazinojumsValsts.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                self.present(pazinojumsValsts, animated: true, completion: nil)
            }
    }
    
    
    // MARK: - Navigation
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        
    }*/
    
    
    
    
    
    
    
    

}
