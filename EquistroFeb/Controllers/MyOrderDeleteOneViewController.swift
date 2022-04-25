//
//  MyOrderDeleteOneViewController.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 03/04/2022.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage
import SafariServices
import MessageUI

class MyOrderDeleteOneViewController: UIViewController {

    var userData = [lietotajaDati]()
    var dzesamais: String!
    override func viewDidLoad() {
        super.viewDidLoad()

        print(dzesamais!)
        //goBack()
        /*if dzesamais != "" {
            self.goBack()
        }*/
        
        // Do any additional setup after loading the view.
    }
    
    /*func goBack() {
        let navigateTo = "myOrderLst"
        let navWindow = storyboard?.instantiateViewController(identifier: navigateTo) as? MyOrderTableViewController
        
        self.view.window?.rootViewController = navWindow
        self.view.window?.makeKeyAndVisible()
    }*/
    
    @IBAction func yesTapped(_ sender: Any) {
        
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
                if email == uidSimLietotajam {
                    var mas: [String] = []
                    var cenuM: [String] = []
                    var cena: Double = 0.00
                    //var or: [String] = pasutijumi
                    if boo == true {
                        boo = false
                        var buuu: Bool = true
                       // mas = produkti
                        for i in 0..<produkti.count {
                            //if buuu == true {
                            if self.dzesamais == produkti[i] && buuu == true{
                                    buuu = false
                                    print("Šo produktu jāizdzēšs!!!")
                                //or.append(produkti[i])
                                
                                //
                                } else {
                                    mas.append(produkti[i])
                                    cenuM.append(cenuMas[i])
                                    let doubCena = Double(cenuMas[i])
                                    if doubCena != nil {
                                        cena = cena + (doubCena ?? 0.0)
                                    }
                                }
                            //}
                        }
                        print(produkti)
                        print("Šeit esam:")
                        print(mas)
                        db.collection("users").document(email).updateData(["produkti": mas])
                        db.collection("users").document(email).updateData(["cenuMas": cenuM])
                        db.collection("users").document(email).updateData(["pricePerOrder": cena])
                    }
                    
                    
                }
                return lietotajaDati(uid: lietUi, email: email, name: name, surname: surname, produktiArray: produkti, orders: pasutijumi, cena: cenina, valsts: country, pakomataAdrese: pakomaAdr, telefons: telefons, cenuMasivs: cenuMas)
            }
        }
        
        
        let navigateTo = "myOrderLst"
        let navWindow = storyboard?.instantiateViewController(identifier: navigateTo) as? MyOrderTableViewController
        
      //  navWindow?.tableView.reloadData()
        self.view.window?.rootViewController = navWindow
        //navWindow?.tableView.reloadData()
        self.view.window?.makeKeyAndVisible()
        //navWindow?.tableView.reloadData()
    }
    
    @IBAction func noTapped(_ sender: Any) {
        
        let navigateTo = "myOrderLst"
        let navWindow = storyboard?.instantiateViewController(identifier: navigateTo) as? MyOrderTableViewController
        
        self.view.window?.rootViewController = navWindow
        //self.view.window?.tableView 
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
