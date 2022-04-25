//
//  OmnivaViewController.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 01/04/2022.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

class OmnivaViewController: UIViewController {
    
    
    @IBOutlet weak var lv1: UIButton!
    @IBOutlet weak var lv2: UIButton!
    @IBOutlet weak var lv3: UIButton!
    @IBOutlet weak var lv4: UIButton!
    @IBOutlet weak var lv5: UIButton!
    @IBOutlet weak var lv6: UIButton!
    @IBOutlet weak var lv7: UIButton!
    
    @IBOutlet weak var lv8: UIButton!
    @IBOutlet weak var lv9: UIButton!
    @IBOutlet weak var lv10: UIButton!
    @IBOutlet weak var lv11: UIButton!
    @IBOutlet weak var lv12: UIButton!
    @IBOutlet weak var lv13: UIButton!
    @IBOutlet weak var lv14: UIButton!
    @IBOutlet weak var lv15: UIButton!
    
    @IBOutlet weak var lv16: UIButton!
    @IBOutlet weak var lv17: UIButton!
    
    @IBOutlet weak var lv18: UIButton!
    @IBOutlet weak var lv19: UIButton!
    @IBOutlet weak var lv20: UIButton!
    @IBOutlet weak var lv21: UIButton!
    @IBOutlet weak var lv22: UIButton!
    @IBOutlet weak var lv23: UIButton!
    @IBOutlet weak var lv24: UIButton!
    @IBOutlet weak var lv25: UIButton!
    @IBOutlet weak var lv26: UIButton!
    @IBOutlet weak var lv27: UIButton!
    
    @IBOutlet weak var lv28: UIButton!
    @IBOutlet weak var lv29: UIButton!
    @IBOutlet weak var lv30: UIButton!
    
    
    @IBOutlet weak var ee1: UIButton!
    @IBOutlet weak var ee2: UIButton!
    @IBOutlet weak var ee3: UIButton!
    @IBOutlet weak var ee4: UIButton!
    @IBOutlet weak var ee5: UIButton!
    @IBOutlet weak var ee6: UIButton!
    @IBOutlet weak var ee7: UIButton!
    @IBOutlet weak var ee8: UIButton!
    @IBOutlet weak var ee9: UIButton!
    @IBOutlet weak var ee10: UIButton!
    @IBOutlet weak var ee11: UIButton!
    @IBOutlet weak var ee12: UIButton!
    @IBOutlet weak var ee13: UIButton!
    @IBOutlet weak var ee14: UIButton!
    @IBOutlet weak var ee15: UIButton!
    @IBOutlet weak var ee16: UIButton!
    @IBOutlet weak var ee17: UIButton!
    @IBOutlet weak var ee18: UIButton!
    @IBOutlet weak var ee19: UIButton!
    @IBOutlet weak var ee20: UIButton!
    @IBOutlet weak var ee21: UIButton!
    @IBOutlet weak var ee22: UIButton!
    @IBOutlet weak var ee23: UIButton!
    @IBOutlet weak var ee24: UIButton!
    @IBOutlet weak var ee25: UIButton!
    @IBOutlet weak var ee26: UIButton!
    @IBOutlet weak var ee27: UIButton!
    @IBOutlet weak var ee28: UIButton!
    @IBOutlet weak var ee29: UIButton!
    @IBOutlet weak var ee30: UIButton!
    
    
    @IBOutlet weak var lt1: UIButton!
    @IBOutlet weak var lt2: UIButton!
    @IBOutlet weak var lt3: UIButton!
    @IBOutlet weak var lt4: UIButton!
    @IBOutlet weak var lt5: UIButton!
    @IBOutlet weak var lt6: UIButton!
    @IBOutlet weak var lt7: UIButton!
    @IBOutlet weak var lt8: UIButton!
    @IBOutlet weak var lt9: UIButton!
    @IBOutlet weak var lt10: UIButton!
    @IBOutlet weak var lt11: UIButton!
    @IBOutlet weak var lt12: UIButton!
    @IBOutlet weak var lt13: UIButton!
    
    @IBOutlet weak var lt14: UIButton!
    @IBOutlet weak var lt15: UIButton!
    @IBOutlet weak var lt16: UIButton!
    @IBOutlet weak var lt17: UIButton!
    @IBOutlet weak var lt18: UIButton!
    @IBOutlet weak var lt19: UIButton!
    @IBOutlet weak var lt20: UIButton!
    @IBOutlet weak var lt21: UIButton!
    
    @IBOutlet weak var lt22: UIButton!
    @IBOutlet weak var lt23: UIButton!
    @IBOutlet weak var lt24: UIButton!
    @IBOutlet weak var lt25: UIButton!
    @IBOutlet weak var lt26: UIButton!
    @IBOutlet weak var lt27: UIButton!
    @IBOutlet weak var lt28: UIButton!
    @IBOutlet weak var lt29: UIButton!
    
    
    
    
    
    var pakomataNosaukumins: String = "nav"
    
    var userData = [lietotajaDati]()
    @IBOutlet weak var lvPakomati: UIScrollView!
    
    @IBOutlet weak var ltPakomati: UIScrollView!
    
    @IBOutlet weak var eePakomati: UIScrollView!
    
    var redzamaisScrollV: String = ""
    
    @IBOutlet weak var bXX: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Neprintē!!!")
        var uidSimLietotajam = ""
        let db = Firestore.firestore()
        let sisLietotajs = db.collection("users").document(Auth.auth().currentUser!.email!)
        uidSimLietotajam = sisLietotajs.documentID
        print(uidSimLietotajam)
        db.collection("users").addSnapshotListener{ [self](querySn, err) in
            guard let documents = querySn?.documents else {
                print("Nav Šādu Dokumentu!!!")
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
                    //db.collection("users").document(email).updateData(["pakomats": pakomataNosaukumins])
                    let redzesim = country
                    self.redzamaisScrollV = redzesim.uppercased()
                    
                    print(country)
                    print("Jāredz šīs valsts pakomāti: " + self.redzamaisScrollV)
                    if redzamaisScrollV == "EE" {
                        eePakomati.isHidden = false
                        ltPakomati.isHidden = true
                        lvPakomati.isHidden = true
                    }
                    else if redzamaisScrollV == "LT" {
                        ltPakomati.isHidden = false
                        lvPakomati.isHidden = true
                        eePakomati.isHidden = true
                    }
                    else {
                        lvPakomati.isHidden = false
                        eePakomati.isHidden = true
                        ltPakomati.isHidden = true
                    }
                    //self.viewDidLoad()
                }
                
                return lietotajaDati(uid: lietUi, email: email, name: name, surname: surname, produktiArray: produkti, orders: pasutijumi, cena: cenina, valsts: country, pakomataAdrese: pakomaAdr, telefons: telefons, cenuMasivs: cenuMas)
            }
        }
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func pievienoPakomatuLietotājam() {
        var uidSimLietotajam = ""
        let db = Firestore.firestore()
        let sisLietotajs = db.collection("users").document(Auth.auth().currentUser!.email!)
        uidSimLietotajam = sisLietotajs.documentID
        //print(uidSimLietotajam)
        var boo: Bool = true
        db.collection("users").addSnapshotListener{ [self](querySn, err) in
            guard let documents = querySn?.documents else {
                print("Nav Šādu Dokumentu!!!")
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
                    if boo == true {
                        boo = false
                        db.collection("users").document(email).updateData(["pakomats": pakomataNosaukumins])
                    }
                }
                
                
                
                return lietotajaDati(uid: lietUi, email: email, name: name, surname: surname, produktiArray: produkti, orders: pasutijumi, cena: cenina, valsts: country, pakomataAdrese: pakomaAdr, telefons: telefons, cenuMasivs: cenuMas)
            }
        }
        
        let toVC = "myOrder"
        let toWindow = storyboard?.instantiateViewController(withIdentifier: toVC) as? MakeOrderViewController
        self.view.window?.rootViewController = toWindow
        self.view.window?.makeKeyAndVisible()
    }
    
    @IBAction func lv1t(_ sender: Any) {
        pakomataNosaukumins = lv1.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func lv2t(_ sender: Any) {
        pakomataNosaukumins = lv2.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func lv3t(_ sender: Any) {
        pakomataNosaukumins = lv3.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func lv4t(_ sender: Any) {
        pakomataNosaukumins = lv4.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    @IBAction func lv5t(_ sender: Any) {
        pakomataNosaukumins = lv5.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    @IBAction func lv6t(_ sender: Any) {
        pakomataNosaukumins = lv6.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func lv7t(_ sender: Any) {
        pakomataNosaukumins = lv7.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    

    @IBAction func lv8t(_ sender: Any) {
        pakomataNosaukumins = lv8.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    

    @IBAction func lv9t(_ sender: Any) {
        pakomataNosaukumins = lv9.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    

    @IBAction func lv10t(_ sender: Any) {
        pakomataNosaukumins = lv10.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    

    @IBAction func lv11t(_ sender: Any) {
        pakomataNosaukumins = lv11.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func lv12t(_ sender: Any) {
        pakomataNosaukumins = lv12.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    

    @IBAction func lv13t(_ sender: Any) {
        pakomataNosaukumins = lv13.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func lv14t(_ sender: Any) {
        pakomataNosaukumins = lv14.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    
    @IBAction func lv15t(_ sender: Any) {
        pakomataNosaukumins = lv15.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func lv16t(_ sender: Any) {
        pakomataNosaukumins = lv16.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func lv17t(_ sender: Any) {
        pakomataNosaukumins = lv17.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func lv18t(_ sender: Any) {
        pakomataNosaukumins = lv18.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    
    @IBAction func lv19t(_ sender: Any) {
        pakomataNosaukumins = lv19.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func lv20t(_ sender: Any) {
        pakomataNosaukumins = lv20.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func lv21t(_ sender: Any) {
        pakomataNosaukumins = lv21.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func lv22t(_ sender: Any) {
        pakomataNosaukumins = lv22.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func lv23t(_ sender: Any) {
        pakomataNosaukumins = lv23.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func lv24t(_ sender: Any) {
        pakomataNosaukumins = lv24.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    
    @IBAction func lv25t(_ sender: Any) {
        pakomataNosaukumins = lv25.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    
    @IBAction func lv26t(_ sender: Any) {
        pakomataNosaukumins = lv26.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    
    @IBAction func lv27t(_ sender: Any) {
        pakomataNosaukumins = lv27.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    
    @IBAction func lv28t(_ sender: Any) {
        pakomataNosaukumins = lv28.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func lv29t(_ sender: Any) {
        pakomataNosaukumins = lv29.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func b4Tapped(_ sender: Any) {
        //pakomataNosaukumins = "Ozolnieku Pakomats"
        pakomataNosaukumins = bXX.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
        
    }
    
    @IBAction func lv30t(_ sender: Any) {
        pakomataNosaukumins = lv30.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    
    
    @IBAction func lt1t(_ sender: Any) {
        pakomataNosaukumins = lt1.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func lt2t(_ sender: Any) {
        pakomataNosaukumins = lt2.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func lt3t(_ sender: Any) {
        pakomataNosaukumins = lt3.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func lt4t(_ sender: Any) {
        pakomataNosaukumins = lt4.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func lt5t(_ sender: Any) {
        pakomataNosaukumins = lt5.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func lt6t(_ sender: Any) {
        pakomataNosaukumins = lt6.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func lt7t(_ sender: Any) {
        pakomataNosaukumins = lt7.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func lt8t(_ sender: Any) {
        pakomataNosaukumins = lt8.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func lt9t(_ sender: Any) {
        pakomataNosaukumins = lt9.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func lt10t(_ sender: Any) {
        pakomataNosaukumins = lt10.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func lt11t(_ sender: Any) {
        pakomataNosaukumins = lt11.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func lt12t(_ sender: Any) {
        pakomataNosaukumins = lt12.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func lt13t(_ sender: Any) {
        pakomataNosaukumins = lt13.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func lt14t(_ sender: Any) {
        pakomataNosaukumins = lt14.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func lt15t(_ sender: Any) {
        pakomataNosaukumins = lt15.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func lt16t(_ sender: Any) {
        pakomataNosaukumins = lt16.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    @IBAction func lt17t(_ sender: Any) {
        pakomataNosaukumins = lt17.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func lt18t(_ sender: Any) {
        pakomataNosaukumins = lt18.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func lt19t(_ sender: Any) {
        pakomataNosaukumins = lt19.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func lt20t(_ sender: Any) {
        pakomataNosaukumins = lt20.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    @IBAction func lt21t(_ sender: Any) {
        pakomataNosaukumins = lt21.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    @IBAction func lt22t(_ sender: Any) {
        pakomataNosaukumins = lt22.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    @IBAction func lt23t(_ sender: Any) {
        pakomataNosaukumins = lt23.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    @IBAction func lt24t(_ sender: Any) {
        pakomataNosaukumins = lt24.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    @IBAction func lt25t(_ sender: Any) {
        pakomataNosaukumins = lt25.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    @IBAction func lt26t(_ sender: Any) {
            pakomataNosaukumins = lt26.titleLabel!.text ?? "..."
            pievienoPakomatuLietotājam()
    }
    @IBAction func lt27t(_ sender: Any) {
        pakomataNosaukumins = lt27.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    @IBAction func lt28t(_ sender: Any) {
        pakomataNosaukumins = lt28.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    @IBAction func lt29t(_ sender: Any) {
        pakomataNosaukumins = lt29.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func ee1t(_ sender: Any) {
        pakomataNosaukumins = ee1.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func ee2t(_ sender: Any) {
        pakomataNosaukumins = ee2.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func ee3t(_ sender: Any) {
        pakomataNosaukumins = ee3.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func ee4t(_ sender: Any) {
        pakomataNosaukumins = ee4.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func ee5t(_ sender: Any) {
        pakomataNosaukumins = ee5.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    
    @IBAction func ee6t(_ sender: Any) {
        pakomataNosaukumins = ee6.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func ee7t(_ sender: Any) {
        pakomataNosaukumins = ee7.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func ee8t(_ sender: Any) {
        pakomataNosaukumins = ee8.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func ee9t(_ sender: Any) {
        pakomataNosaukumins = ee9.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func ee10t(_ sender: Any) {
        pakomataNosaukumins = ee10.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func ee11t(_ sender: Any) {
        pakomataNosaukumins = ee11.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func ee12t(_ sender: Any) {
        pakomataNosaukumins = ee12.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func ee13t(_ sender: Any) {
        pakomataNosaukumins = ee13.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func ee14t(_ sender: Any) {
        pakomataNosaukumins = ee14.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func ee15t(_ sender: Any) {
        pakomataNosaukumins = ee15.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func ee16t(_ sender: Any) {
        pakomataNosaukumins = ee16.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func ee17t(_ sender: Any) {
        pakomataNosaukumins = ee17.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func ee18t(_ sender: Any) {
        pakomataNosaukumins = ee18.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    
    @IBAction func ee19t(_ sender: Any) {
        pakomataNosaukumins = ee19.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func ee20t(_ sender: Any) {
        pakomataNosaukumins = ee20.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func ee21t(_ sender: Any) {
        pakomataNosaukumins = ee21.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func ee22t(_ sender: Any) {
        pakomataNosaukumins = ee22.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func ee23t(_ sender: Any) {
        pakomataNosaukumins = ee23.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func ee24t(_ sender: Any) {
        pakomataNosaukumins = ee24.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func ee25t(_ sender: Any) {
        pakomataNosaukumins = ee25.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    
    @IBAction func ee26t(_ sender: Any) {
        pakomataNosaukumins = ee26.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func ee27t(_ sender: Any) {
        pakomataNosaukumins = ee27.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func ee28t(_ sender: Any) {
        pakomataNosaukumins = ee28.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    @IBAction func ee29t(_ sender: Any) {
        pakomataNosaukumins = ee29.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
    
    
    @IBAction func ee30t(_ sender: Any) {
        pakomataNosaukumins = ee30.titleLabel!.text ?? "..."
        pievienoPakomatuLietotājam()
    }
   
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let makeOrderVC = segue.destination as! MakeOrderViewController
        makeOrderVC.pakomataNos = pakomataNosaukumins
    }
    

}
