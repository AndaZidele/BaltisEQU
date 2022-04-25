//
//  MyProfileViewController.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 28/03/2022.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage

class MyProfileViewController: UIViewController {

    @IBOutlet weak var myEmailLabel: UILabel!
    @IBOutlet weak var myNameLabel: UILabel!
    var epasts: String = ""
    @IBOutlet weak var pasutijumuSarakstsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.black
        
        var newMasivs: [String] = []
        var userData = [lietotajaDati]()
        var uidSimLietotajam = ""
        let db = Firestore.firestore()
        let sisLietotajs = db.collection("users").document(Auth.auth().currentUser!.email!)
        uidSimLietotajam = sisLietotajs.documentID
        print(uidSimLietotajam)
        var boo: Bool = true
        
        db.collection("users").addSnapshotListener{(querySn, err) in
            guard let documents = querySn?.documents else {
                print("Nav sadu lietotāju!")
                return
            }
            
            
            userData = documents.map {(queryDocSn) -> lietotajaDati in
                let snap = queryDocSn.data()
                let lietUi = snap["uid"] as? String ?? ""
                let email = snap["email"] as? String ?? ""
                self.epasts = email
                let name = snap["firstName"] as? String ?? ""
                let surname = snap["lastName"] as? String ?? ""
                let produkti = snap["produkti"] as? [String] ?? [""]
                let pasutijumi = snap["orders"] as? [String] ?? [""]
                let cenina = snap["pricePerOrder"] as? Double ?? 0.0
                let country = snap["country"] as? String ?? ""
                let pakomaAdr = snap["pakomats"] as? String ?? ""
                let telefons = snap["telefons"] as? String ?? ""
                let cenuMas = snap["cenuMas"] as? [String] ?? [""]
                if email == uidSimLietotajam {
                    if boo == true {
                        boo = false
                        var masivs: [String] = []
                        //masivs = pasutijumi
                        for i in 0..<pasutijumi.count {
                            if pasutijumi[i] != "" {
                                masivs.append(pasutijumi[i])
                            }
                        }
                        for j in 0..<masivs.count {
                            //self.pasutijumuSarakstsLabel!.text = masivs[j] + "\n"
                            newMasivs.append(masivs[j])
                        }
                        for j in 0..<newMasivs.count {
                            self.pasutijumuSarakstsLabel!.text = self.pasutijumuSarakstsLabel!.text! + newMasivs[j] + "\n"
                            
                        }
                        self.myNameLabel!.text = "\(name)  \(surname)"
                        self.myEmailLabel!.text = email
                    }
                }
                
                return lietotajaDati(uid: lietUi, email: email, name: name, surname: surname, produktiArray: produkti, orders: pasutijumi, cena: cenina, valsts: country, pakomataAdrese: pakomaAdr, telefons: telefons, cenuMasivs: cenuMas)
            }
            
        }
    }
    
    
    @IBAction func changePasswordTapped(_ sender: Any) {
        Auth.auth().sendPasswordReset(withEmail: epasts){ (err) in
            if err == nil {
                print("Nav kludu")
            } else {
                print("Ir kludas")
            }
            
        }

    }
    
    @IBAction func tiMainViewTapped(_ sender: Any) {
        let homeVContr = "HomeVContr"
        let homeWindow = storyboard?.instantiateViewController(identifier: homeVContr) as? HomeViewController
        
        self.view.window?.rootViewController = homeWindow
        self.view.window?.makeKeyAndVisible()
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
