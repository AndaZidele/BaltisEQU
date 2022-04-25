//
//  SignUpViewController.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 29/01/2022.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore
import FirebaseStorage
import FirebaseCore
import grpc

class SignUpViewController: UIViewController {

    @IBOutlet weak var stackViewIsNotHidden: UIStackView!
    @IBOutlet weak var firstnameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var passwordAgainTextField: UITextField!
    @IBOutlet weak var lveeltTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    var epastinsjamaina: String = ""
    var userData = [lietotajaDati]()
    
    @IBOutlet weak var countryName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        stackViewIsNotHidden.isHidden = false
        // Do any additional setup after loading the view.
        //let tap = UITapGestureRecognizer(target: self, action:)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func isPasswordValid(_ password : String) -> Bool{
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        
        return passwordTest.evaluate(with: password)
    }
    
    /*func showError(_ message:String) {
        //konsolē parādās kļūda!!!
    }*/
    
    /*func isFieldsValid() -> String? {
        
        return nil
        
    }*/
    
    
    @IBAction func signUpButtonIsTapped(_ sender: Any) {
        
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let cleanedPasswordAgain = passwordAgainTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if firstnameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" && lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" && emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" && passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" && passwordAgainTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" && passwordAgainTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" && lveeltTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != ""{
            
            print("Visi lauki aizpildīti!!!")
            if cleanedPassword == cleanedPasswordAgain {
                print("Abas paroles vienādas!")
                if isPasswordValid(cleanedPassword) != false && isPasswordValid(cleanedPasswordAgain) != false {
                    //return "Please make sure Your password is at least 8 characters, contains a special character and a number."
                    print("Parole pietiekami droša!")
                    
                    ///////////////////////
                    let registreties = emailTextField.text
                    //epastinsjamaina = ""
                    let db = Firestore.firestore()
                    
                    var boole: Bool = true
                    if boole == true {
                        boole = false
                        print(boole)
                    
                    
                    db.collection("users").addSnapshotListener{(querySn, err) in
                        guard let documents = querySn?.documents else {
                            print("Nav sadu lietotāju!")
                            return
                        }
                        self.epastinsjamaina = ""
                        
                        for document in documents {
                            //print(document.documentID)
                            if document.documentID == registreties {
                                print("Te sakŗit!!!")
                                print(document.documentID)
                                self.epastinsjamaina = "jamaina"
                            } else {
                                //self.epastinsjamaina = ""
                            }
                        }
                    }
                        print("Te pēc salīdzināšsnas: ")
                        print(self.epastinsjamaina)
                        if self.epastinsjamaina == "" {
                            print("Epasts der!")
                            let valstsNos = self.lveeltTextField.text?.uppercased()
                            if valstsNos != "LV" && valstsNos != "EE" && valstsNos != "LT" {
                                let pazinojumsValsts = UIAlertController(title: "Error Message", message: "Lūdzu ievadiet LV - if You are living in Latvia, EE - if You are living in Estonia, vai LT - if You are living in Lithuania!", preferredStyle: .alert)
                                pazinojumsValsts.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                                self.present(pazinojumsValsts, animated: true, completion: nil)
                          
                            } else {
                                //TE
                                let fName = self.firstnameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                                let lName = self.lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                                let email = self.emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                                let password = self.passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                                let country = self.countryName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                                
                                Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                                    let db = Firestore.firestore()
                                        
                                    if result != nil {
                                        db.collection("users").document(email).setData(["firstName":fName, "lastName":lName, "uid": result!.user.uid, "email": email, "password": password, "produkti": "", "orders": "", "pricePerOrder": 0.0, "country": country, "pakomats": "...", "telefons": "", "cenuMas": ""]) { (err) in
                                            if err != nil {
                                                //self.showError("Error saving user data!")
                                            } else {
                                                let pazi = "turpināt!"
                                                let homeVContr = "HomeVContr"
                                                let homeWindow = self.storyboard?.instantiateViewController(identifier: homeVContr) as? HomeViewController
                                                homeWindow?.pazinojumsValsts = pazi
                                                self.view.window?.rootViewController = homeWindow
                                                self.view.window?.makeKeyAndVisible()
                                            }
                                            
                                        }
                                    } else {
                                        print("Error in adding user!!!")
                                    }
                                        
                                }
                            }
                        }
                        else {
                            self.epastinsjamaina = ""
                            let pazinojumsValsts = UIAlertController(title: "Invalid Email", message: "This email already has been used by other user. Please use other email!", preferredStyle: .alert)
                            pazinojumsValsts.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                            self.present(pazinojumsValsts, animated: true, completion: nil)
                        }

                  //  }
                        
                        /*
                        self.userData = documents.map {(queryDocSn) -> lietotajaDati in
                            let snap = queryDocSn.data()
                            let lietUi = snap["uid"] as? String ?? ""
                            let email = snap["email"] as? String ?? ""
                            let name = snap["firstname"] as? String ?? ""
                            let surname = snap["lastName"] as? String ?? ""
                            let produkti = snap["produkti"] as? [String] ?? [""]
                            let pasutijumi = snap["orders"] as? [String] ?? [""]
                            let cenina = snap["pricePerOrder"] as? Double ?? 0.0
                            let country = snap["country"] as? String ?? ""
                            let pakomaAdr = snap["pakomats"] as? String ?? ""
                            let telefons = snap["telefons"] as? String ?? ""
                            let cenuMas = snap["cenuMas"] as? [String] ?? [""]
                            if email == registreties {
                                //boole = false
                                //let pazinojumsValsts = UIAlertController(title: "Invalid Email", message: "This email already has been used by other user. Please use other email!", preferredStyle: .alert)
                               // pazinojumsValsts.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                               // self.present(pazinojumsValsts, animated: true, completion: nil)
                                self.epastinsjamaina = "neder!"
                                let pazinojumsValsts = UIAlertController(title: "Invalid Email", message: "This email already has been used by other user. Please use other email!", preferredStyle: .alert)
                                pazinojumsValsts.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                                self.present(pazinojumsValsts, animated: true, completion: nil)
                                
                                //return lietotajaDati(uid: lietUi, email: email, name: name, surname: surname, produktiArray: produkti, orders: pasutijumi, cena: cenina, valsts: country, pakomataAdrese: pakomaAdr, telefons: telefons, cenuMasivs: cenuMas)
                                //boole = true
                            }
                            
                            return lietotajaDati(uid: lietUi, email: email, name: name, surname: surname, produktiArray: produkti, orders: pasutijumi, cena: cenina, valsts: country, pakomataAdrese: pakomaAdr, telefons: telefons, cenuMasivs: cenuMas)
                        }
                        
                       
                    }*/
                        
                        
                        /*else {
                            let pazinojumsValsts = UIAlertController(title: "Invalid Email", message: "This email already has been used by other user. Please use other email!", preferredStyle: .alert)
                            pazinojumsValsts.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                            self.present(pazinojumsValsts, animated: true, completion: nil)
                            //epastinsjamaina = ""
                        }*/

                    }
                    //////////////////////////
                
                }
                
                else {
                    let pazinojumsValsts = UIAlertController(title: "Error message", message: "Please make sure Your password is at least 8 characters and contains a special character!", preferredStyle: .alert)
                    pazinojumsValsts.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                    self.present(pazinojumsValsts, animated: true, completion: nil)
                }
                
            }
            else {
                let pazinojumsValsts = UIAlertController(title: "Error message", message: "Please make sure if Your password has been written correctly second time!", preferredStyle: .alert)
                pazinojumsValsts.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                self.present(pazinojumsValsts, animated: true, completion: nil)
                //return "Please make sure if Your password has been written correctly second time."
            }
        }
        else {
            let pazinojumsValsts = UIAlertController(title: "Error Message", message: "Please fill in all fields!", preferredStyle: .alert)
            pazinojumsValsts.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            self.present(pazinojumsValsts, animated: true, completion: nil)
            
            //return "Please fill in all fields!"
        }
        
        /*
        else if cleanedPassword != cleanedPasswordAgain {
            let pazinojumsValsts = UIAlertController(title: "Error message", message: "Please make sure if Your password has been written correctly second time!", preferredStyle: .alert)
            pazinojumsValsts.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            self.present(pazinojumsValsts, animated: true, completion: nil)
            //return "Please make sure if Your password has been written correctly second time."
        } else if isPasswordValid(cleanedPassword) == false && isPasswordValid(cleanedPasswordAgain) == false {
            //return "Please make sure Your password is at least 8 characters, contains a special character and a number."
            let pazinojumsValsts = UIAlertController(title: "Error message", message: "Please make sure Your password is at least 8 characters, contains a special character and a number!", preferredStyle: .alert)
            pazinojumsValsts.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            self.present(pazinojumsValsts, animated: true, completion: nil)
        }*/
        /*
        else {
        
        let registreties = emailTextField.text
        let db = Firestore.firestore()
        
        var boole: Bool = true
        if boole == true {
            boole = false
        
        
        db.collection("users").addSnapshotListener{(querySn, err) in
            guard let documents = querySn?.documents else {
                print("Nav sadu lietotāju!")
                return
            }
            self.userData = documents.map {(queryDocSn) -> lietotajaDati in
                let snap = queryDocSn.data()
                let lietUi = snap["uid"] as? String ?? ""
                let email = snap["email"] as? String ?? ""
                let name = snap["firstname"] as? String ?? ""
                let surname = snap["lastName"] as? String ?? ""
                let produkti = snap["produkti"] as? [String] ?? [""]
                let pasutijumi = snap["orders"] as? [String] ?? [""]
                let cenina = snap["pricePerOrder"] as? Double ?? 0.0
                let country = snap["country"] as? String ?? ""
                let pakomaAdr = snap["pakomats"] as? String ?? ""
                let telefons = snap["telefons"] as? String ?? ""
                let cenuMas = snap["cenuMas"] as? [String] ?? [""]
                if email == registreties {
                    //boole = false
                    let pazinojumsValsts = UIAlertController(title: "Invalid Email", message: "This email already has been used by other user. Please use other email!", preferredStyle: .alert)
                    pazinojumsValsts.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                    self.present(pazinojumsValsts, animated: true, completion: nil)
                    self.epastinsjamaina = ""
                    
                    
                    return lietotajaDati(uid: lietUi, email: email, name: name, surname: surname, produktiArray: produkti, orders: pasutijumi, cena: cenina, valsts: country, pakomataAdrese: pakomaAdr, telefons: telefons, cenuMasivs: cenuMas)
                    //boole = true
                } else {
                    self.epastinsjamaina = "turpināt!"
                    //boole = false
                    //print("turpināt!")
                }
                
                return lietotajaDati(uid: lietUi, email: email, name: name, surname: surname, produktiArray: produkti, orders: pasutijumi, cena: cenina, valsts: country, pakomataAdrese: pakomaAdr, telefons: telefons, cenuMasivs: cenuMas)
            }
            
           
        }
          
        }
        
        if epastinsjamaina != "" {
        let valstsNos = lveeltTextField.text?.uppercased()
        if valstsNos != "LV" && valstsNos != "EE" && valstsNos != "LT" {
            let pazinojumsValsts = UIAlertController(title: "Error Message", message: "Lūdzu ievadiet LV - if You are living in Latvia, EE - if You are living in Estonia, vai LT - if You are living in Lithuania!", preferredStyle: .alert)
            pazinojumsValsts.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            self.present(pazinojumsValsts, animated: true, completion: nil)
        }
        else {
            let fName = firstnameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let country = countryName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                let db = Firestore.firestore()
                    
                    db.collection("users").document(email).setData(["firstName":fName, "lastName":lName, "uid": result!.user.uid, "email": email, "password": password, "produkti": "", "orders": "", "pricePerOrder": 0.0, "country": country, "pakomats": "...", "telefons": "", "cenuMas": ""]) { (err) in
                        if err != nil {
                            //self.showError("Error saving user data!")
                        } else {
                            //let pazi = "turpināt!"
                            let homeVContr = "HomeVContr"
                            let homeWindow = self.storyboard?.instantiateViewController(identifier: homeVContr) as? HomeViewController
                            //homeWindow?.pazinojumsValsts = pazi
                            self.view.window?.rootViewController = homeWindow
                            self.view.window?.makeKeyAndVisible()
                        }
                        
                    }
                    
            }
            
        }
            
            }
        }
         */
    }
}
