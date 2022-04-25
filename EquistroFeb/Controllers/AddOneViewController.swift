//
//  AddOneViewController.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 10/04/2022.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage
import SafariServices
import MessageUI

class AddOneViewController: UIViewController {
    
    var visiProdukti = ForAllProducts.createVisi()
    var pievienojamais: String!
    var userData = [lietotajaDati]()
    var cenaTe: Double = 0.0

    @IBOutlet weak var tekstinsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        print(pievienojamais!)
        tekstinsLabel.text = "Do You really want to add \(pievienojamais!) to Your order?"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func yesAddTapped(_ sender: Any) {
        
        var uidSimLietotajam = ""
        let db = Firestore.firestore()
        let sisLietotajs = db.collection("users").document(Auth.auth().currentUser!.email!)
        uidSimLietotajam = sisLietotajs.documentID
        print(uidSimLietotajam)
        var boo: Bool = true
        
        
        
        for i in 0..<visiProdukti.count {
            if visiProdukti[i].name == pievienojamais {
                cenaTe = visiProdukti[i].cena
            }
        }
        
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
                //var buuu: Bool = true
                if email == uidSimLietotajam {
                    //var mas: [String] = []
                    //var cenuM: [String] = []
                    //var cena: Double = 0.00
                    //var or: [String] = pasutijumi
                    if boo == true {
                        boo = false
                        var masivs: [String] = []
                        masivs = produkti
                        masivs.append(self.pievienojamais!)
                        var masi: [String] = []
                        masi = cenuMas
                        masi.append(String(self.cenaTe))
                        var maksa = cenina
                        maksa = maksa + (self.cenaTe)
                        /*
                        var buuu: Bool = true
                        var sk = produkti.count
                        sk = sk + 1
                       // mas = produkti
                        for i in 0..<sk {
                            //if buuu == true {
                            if self.pievienojamais == produkti[i] && buuu == true{
                                    buuu = false
                                    print("Šo produktu jāizdzēšs!!!")
                                
                                    mas.append(produkti[i])
                                    cenuM.append(cenuMas[i])
                                    let doubCena = Double(cenuMas[i])
                                    if doubCena != nil {
                                        cena = cena + (doubCena ?? 0.0)
                                    }
                                } else {
                                    mas.append(produkti[i])
                                    cenuM.append(cenuMas[i])
                                    let doubCena = Double(cenuMas[i])
                                    if doubCena != nil {
                                        cena = cena + (doubCena ?? 0.0)
                                    }
                                }
                            //}
                        }*/
                        print(produkti)
                        print("Šeit esam:")
                        //print(mas)
                        db.collection("users").document(email).updateData(["produkti": masivs])
                        db.collection("users").document(email).updateData(["cenuMas": masi])
                        db.collection("users").document(email).updateData(["pricePerOrder": maksa])
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
