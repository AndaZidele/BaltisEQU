//
//  MakeOrderViewController.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 01/04/2022.
//

import UIKit
import CoreData
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage
import MessageUI
import SafariServices

extension MakeOrderViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if let _ = error {
            print("neizdevās nosūtīt")
            controller.dismiss(animated: true, completion: nil)
            return
        }
        switch result {
        case .cancelled:
            print("atlikts")
            break
        case .failed:
            print("failed")
            break
        case .saved:
            print("izdevās saglabat")
            break
        case .sent:
            print("izdevās nosūtīt")
            //Te
            let pakNos = pakomataNosBtn.titleLabel?.text
            let valst = valstsNos.text!.uppercased()
           // print(valst)
            valstsTo = valst
            pakomatsTo = pakomataNosBtn.titleLabel?.text! ?? ""
            vardsUnUzvards = vardsLbl.text! + " " + uzvardsLb.text!
            epastsTo = epastsLbl.text!
            telefonsTo = telefonsLbl.text!
            priceTo = priceLbl.text!
            var sodienasGMD = "nav pagaidam"
            func datumsSodienai() {
            let datums = Date()
            let kalendars = Calendar.current
            let diena = kalendars.component(.day, from: datums)
            let menesis = kalendars.component(.month, from: datums)
            let gads = kalendars.component(.year, from: datums)
            sodienasGMD = "\(diena).\(menesis).\(gads)"
            //print(sodienasGMD)
            }
            datumsSodienai()
        
            var uidSimLietotajam = ""
            let db = Firestore.firestore()
            let sisLietotajs = db.collection("users").document(Auth.auth().currentUser!.email!)
            uidSimLietotajam = sisLietotajs.documentID
        //print(uidSimLietotajam)
            var boo: Bool = true
            db.collection("users").addSnapshotListener{ [self](querySn, err) in
                guard let documents = querySn?.documents else {
                    //print("Nav Šādu Dokumentu!!!")
                    return
                }
                self.userData = documents.map {(queryDocSn) -> lietotajaDati in
                    let snap = queryDocSn.data()
                    let lietUi = snap["uid"] as? String ?? ""
                    let email = snap["email"] as? String ?? ""
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
                            for i in 0..<produkti.count {
                                if produkti[i] != "" {
                                    datumsSodienai()
                                    masivs.insert(produkti[i] + " [" + sodienasGMD + "]", at: 0)
                                    //masivs.append(produkti[i] + " [" + sodienasGMD + "]")
                                }
                            }
                            
                           // let valsts = country.uppercased()
                           // valstsTo = valsts
                            for i in 0..<produkti.count {
                                if produkti[i] != "" {
                                    produktiTo.append(produkti[i])
                                }
                            }
                            
                            //produktiTo = produkti
                            
                            
                            //sutitIzplatitajam()
                            
                        //TE AIZSUTIT INFO UZ EPASTU UN SMS IZPALTITAJAM
                           // print(valstsTo)
                            //print(produktiTo)
                                var txtTo: String = ""
                                for i in 0..<produktiTo.count {
                                    txtTo = txtTo + produktiTo[i] + "<br>"
                                }
                            //print(txtTo)
                                
                                let teksts = "Name, Username: \(vardsUnUzvards)<br>Email: \(epastsTo)<br>Phone Number: \(telefonsTo)<br>Parcel Terminal: \(pakomatsTo)<br>Produkti: \(txtTo)"
                                print(teksts)
                            let tekstins = teksts
                            
                            
                            db.collection("users").document(email).updateData(["produkti": FieldValue.delete()])
                            db.collection("users").document(email).updateData(["orders": masivs])
                            db.collection("users").document(email).updateData(["pricePerOrder": 0.0])
                            db.collection("users").document(email).updateData(["pakomats": "..."])
                            //db.collection("users").document(email).updateData(["country": valstsNos.text!])
                            }
                        }
                
                    return lietotajaDati(uid: lietUi, email: email, name: name, surname: surname, produktiArray: produkti, orders: pasutijumi, cena: cenina, valsts: country, pakomataAdrese: pakomaAdr, telefons: telefons, cenuMasivs: cenuMas)
                }
            }

            
            ////////////
            
            let homeVContr = "HomeVContr"
            let homeWindow = storyboard?.instantiateViewController(identifier: homeVContr) as? HomeViewController
            homeWindow?.pazinojumsPecpasutijuma = "Izdevās!"
            self.view.window?.rootViewController = homeWindow
            self.view.window?.makeKeyAndVisible()
            break
        }
        controller.dismiss(animated: true, completion: nil)
    }
}

class MakeOrderViewController: UIViewController, UINavigationControllerDelegate {
    
    
    var kontaktini = kontakti.createKontakti()
    var userData = [lietotajaDati]()
    var newMasivs: [String] = []
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var vardsLbl: UITextField!
    @IBOutlet weak var uzvardsLb: UITextField!
    @IBOutlet weak var epastsLbl: UITextField!
    @IBOutlet weak var telefonsLbl: UITextField!
    
    @IBOutlet weak var valstsNos: UITextField!
    @IBOutlet weak var pasutijumuSaraksts: UILabel!
    //var pakom = [Pakomats]()
    //var managedObjectCont: NSManagedObjectContext?

    var pakomataNos: String!
    @IBOutlet weak var pakomataNosBtn: UIButton!
    var valstsTo: String = ""
    var produktiTo: [String] = []
    var pakomatsTo: String = ""
    var vardsUnUzvards: String = ""
    var epastsTo: String = ""
    var telefonsTo: String = ""
    var priceTo: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pasutijumuSaraksts.text = ""
        
        var uidSimLietotajam = ""
        let db = Firestore.firestore()
        let sisLietotajs = db.collection("users").document(Auth.auth().currentUser!.email!)
        uidSimLietotajam = sisLietotajs.documentID
        //print(uidSimLietotajam)
        var boo: Bool = true
        db.collection("users").addSnapshotListener{ [self](querySn, err) in
            guard let documents = querySn?.documents else {
               // print("Nav Šādu Dokumentu!!!")
                return
            }
            self.userData = documents.map {(queryDocSn) -> lietotajaDati in
                let snap = queryDocSn.data()
                let lietUi = snap["uid"] as? String ?? ""
                let email = snap["email"] as? String ?? ""
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
                        self.vardsLbl!.text = name
                        self.uzvardsLb!.text = surname
                        self.epastsLbl!.text = email
                        self.telefonsLbl!.text = telefons
                        self.pakomataNosBtn!.setTitle(pakomaAdr, for: .normal)
                        self.valstsNos!.text = country
                        self.priceLbl!.text = "Price: " + String(cenina) + " Euro"
                        
                        var masivs: [String] = []
                        //masivs = pasutijumi
                        for i in 0..<produkti.count {
                            if produkti[i] != "" {
                                masivs.append(produkti[i])
                            }
                        }
                        for j in 0..<masivs.count {
                            //self.pasutijumuSarakstsLabel!.text = masivs[j] + "\n"
                            newMasivs.append(masivs[j])
                        }
                        for j in 0..<newMasivs.count {
                            self.pasutijumuSaraksts!.text = self.pasutijumuSaraksts!.text! + newMasivs[j] + "\n"
                            
                        }
                        //db.collection("users").document(email).updateData(["telefons": self.telefonsLbl!.text])
                    }
                }
                
                
                
                return lietotajaDati(uid: lietUi, email: email, name: name, surname: surname, produktiArray: produkti, orders: pasutijumi, cena: cenina, valsts: country, pakomataAdrese: pakomaAdr, telefons: telefons, cenuMasivs: cenuMas)
            }
        }
        
        
        
        
        
        //pakomataNosBtn.setTitle("", for: .normal)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        var uidSimLietotajam = ""
        let db = Firestore.firestore()
        let sisLietotajs = db.collection("users").document(Auth.auth().currentUser!.email!)
        uidSimLietotajam = sisLietotajs.documentID
        //print(uidSimLietotajam)
        var boo: Bool = true
        db.collection("users").addSnapshotListener{ [self](querySn, err) in
            guard let documents = querySn?.documents else {
                //print("Nav Šādu Dokumentu!!!")
                return
            }
            self.userData = documents.map {(queryDocSn) -> lietotajaDati in
                let snap = queryDocSn.data()
                let lietUi = snap["uid"] as? String ?? ""
                let email = snap["email"] as? String ?? ""
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
                        self.vardsLbl!.text = name
                        self.uzvardsLb!.text = surname
                        self.epastsLbl!.text = email
                        self.telefonsLbl!.text = telefons
                        self.pakomataNosBtn!.setTitle(pakomaAdr, for: .normal)
                        self.priceLbl!.text = "Price: " + String(cenina) + " Euro"
                        
                        var masivs: [String] = []
                        //masivs = pasutijumi
                        for i in 0..<produkti.count {
                            if produkti[i] != "" {
                                masivs.append(produkti[i])
                            }
                        }
                        for j in 0..<masivs.count {
                            //self.pasutijumuSarakstsLabel!.text = masivs[j] + "\n"
                            newMasivs.append(masivs[j])
                        }
                        //db.collection("users").document(email).updateData(["telefons": self.telefonsLbl!.text])
                    }
                }
                
                
                
                return lietotajaDati(uid: lietUi, email: email, name: name, surname: surname, produktiArray: produkti, orders: pasutijumi, cena: cenina, valsts: country, pakomataAdrese: pakomaAdr, telefons: telefons, cenuMasivs: cenuMas)
            }
        }
        
        
        
        
        
        //pakomataNosBtn.setTitle("", for: .normal)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func makeTheOrderTapped(_ sender: Any) {
        let pakNos = pakomataNosBtn.titleLabel?.text
        let valst = valstsNos.text!.uppercased()
       // print(valst)
        valstsTo = valst
        
        
        pakomatsTo = pakomataNosBtn.titleLabel?.text! ?? ""
        vardsUnUzvards = vardsLbl.text! + " " + uzvardsLb.text!
        epastsTo = epastsLbl.text!
        telefonsTo = telefonsLbl.text!
        priceTo = priceLbl.text!
        
        
        //print(pakNos!)
        if pakNos != "..." && telefonsLbl.text != "" {
            var sodienasGMD = "nav pagaidam"
            telefonsTo = telefonsLbl.text!
        //te datums
            func datumsSodienai() {
            let datums = Date()
            let kalendars = Calendar.current
            let diena = kalendars.component(.day, from: datums)
            let menesis = kalendars.component(.month, from: datums)
            let gads = kalendars.component(.year, from: datums)
            sodienasGMD = "\(diena).\(menesis).\(gads)"
            //print(sodienasGMD)
            }
            datumsSodienai()
        
            var uidSimLietotajam = ""
            let db = Firestore.firestore()
            let sisLietotajs = db.collection("users").document(Auth.auth().currentUser!.email!)
            uidSimLietotajam = sisLietotajs.documentID
        //print(uidSimLietotajam)
            var boo: Bool = true
            db.collection("users").addSnapshotListener{ [self](querySn, err) in
                guard let documents = querySn?.documents else {
                    //print("Nav Šādu Dokumentu!!!")
                    return
                }
                self.userData = documents.map {(queryDocSn) -> lietotajaDati in
                    let snap = queryDocSn.data()
                    let lietUi = snap["uid"] as? String ?? ""
                    let email = snap["email"] as? String ?? ""
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
                            for i in 0..<produkti.count {
                                if produkti[i] != "" {
                                    datumsSodienai()
                                    masivs.insert(produkti[i] + " [" + sodienasGMD + "]", at: 0)
                                    //masivs.append(produkti[i] + " [" + sodienasGMD + "]")
                                }
                            }
                            
                           // let valsts = country.uppercased()
                           // valstsTo = valsts
                            for i in 0..<produkti.count {
                                if produkti[i] != "" {
                                    produktiTo.append(produkti[i])
                                }
                            }
                            
                            //produktiTo = produkti
                            
                            
                            //sutitIzplatitajam()
                            
                        //TE AIZSUTIT INFO UZ EPASTU UN SMS IZPALTITAJAM
                           // print(valstsTo)
                            //print(produktiTo)
                                var txtTo: String = ""
                                for i in 0..<produktiTo.count {
                                    txtTo = txtTo + produktiTo[i] + "<br>"
                                }
                            //print(txtTo)
                                
                                let teksts = "Name, Username: \(vardsUnUzvards)<br>Email: \(epastsTo)<br>Phone Number: \(telefonsTo)<br>Parcel Terminal: \(pakomatsTo)<br>Produkti: \(txtTo)"
                                print(teksts)
                            let tekstins = teksts
                            //print(tekstins)
                            //print("Te esam!!!")
                            if valstsTo == "LV" {
                                let compVC = MFMailComposeViewController()
                                compVC.mailComposeDelegate = self
                                compVC.setToRecipients([kontaktini[0].epasts])
                                compVC.setSubject("New Equistro order")
                                compVC.setMessageBody(tekstins, isHTML: true)
                                present(compVC, animated: true)
                            } else if valstsTo == "EE"{
                                let compVC = MFMailComposeViewController()
                                compVC.mailComposeDelegate = self
                                compVC.setToRecipients([kontaktini[1].epasts])
                                compVC.setSubject("New Equistro order")
                                compVC.setMessageBody(tekstins, isHTML: true)
                                present(compVC, animated: true)
                                
                            } else {
                                let compVC = MFMailComposeViewController()
                                compVC.mailComposeDelegate = self
                                compVC.setToRecipients([kontaktini[2].epasts])
                                compVC.setSubject("New Equistro order")
                                compVC.setMessageBody(tekstins, isHTML: true)
                                present(compVC, animated: true)
                                
                            }
                            
                           // db.collection("users").document(email).updateData(["produkti": FieldValue.delete()])
                           // db.collection("users").document(email).updateData(["orders": masivs])
                           // db.collection("users").document(email).updateData(["pricePerOrder": 0.0])
                           // db.collection("users").document(email).updateData(["pakomats": "..."])
                            //db.collection("users").document(email).updateData(["country": valstsNos.text!])
                            }
                        }
                
                    return lietotajaDati(uid: lietUi, email: email, name: name, surname: surname, produktiArray: produkti, orders: pasutijumi, cena: cenina, valsts: country, pakomataAdrese: pakomaAdr, telefons: telefons, cenuMasivs: cenuMas)
                }
            }
        
        } else {
            let pazinojumsValst = UIAlertController(title: "", message: "Please fill all fields!", preferredStyle: .alert)
            pazinojumsValst.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            self.present(pazinojumsValst, animated: true, completion: nil)
        }
    }
    /*
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }*/
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
    }
    
   /* func sutitIzplatitajam() {
    print(valstsTo)
    print(produktiTo)
        var txtTo: String = ""
        for i in 0..<produktiTo.count {
            txtTo = txtTo + produktiTo[i] + "/n"
        }
        
        let teksts = "Name, Username: \(vardsUnUzvards)/nEmail: \(epastsTo)/nPhone Number: \(telefonsTo)/nParcel Terminal: \(pakomatsTo)/nProdukti: \(txtTo)"
        print(teksts)
    if valstsTo == "LV" {
        let compVC = MFMailComposeViewController()
        compVC.mailComposeDelegate = self
        compVC.setToRecipients([kontaktini[0].epasts])
        compVC.setSubject("New Equistro order")
        compVC.setMessageBody(teksts, isHTML: true)
        if MFMailComposeViewController.canSendMail() {
            self.present(compVC, animated: true, completion: nil)
            /*let emailVC = MFMailComposeViewController()
            emailVC.delegate = self
            emailVC.setSubject("New Equistro order")
            //emailVC.
            emailVC.setToRecipients(["zideleanda@gmail.com"])
            emailVC.setMessageBody("<h1>I would like to order these products!</h1>", isHTML: true)
            present(UINavigationController(rootViewController: emailVC), animated: true)
             */
        } /*else {
            guard let url = URL(string: "https://www.google.com") else {
                return
            }
            let emailVC = SFSafariViewController(url: url)
            present(emailVC, animated: true)
        }*/
    } else if valstsTo == "EE"{
        if MFMailComposeViewController.canSendMail() {
            let compVC = MFMailComposeViewController()
            compVC.mailComposeDelegate = self
            compVC.setToRecipients([kontaktini[1].epasts])
            compVC.setSubject("New Equistro order")
            compVC.setMessageBody("", isHTML: true)
            self.present(compVC, animated: true, completion: nil)
            //let compVCsend = NSURLSession.sharedSession().data
            //self.present(compVC, animated: true, completion: send(<#T##Int32#>, <#T##UnsafeRawPointer?#>, <#T##Int#>, <#T##Int32#>))
            //let request = NSMutableURLRequest = NSMutableURLRequest(URL: NSURL(string: "https://api.mailgun.net/v3/{YOUR SANDBOX DOMAIN}/messages")! as URL)
           // request.httpMethod = "POST"
            //let task = NSURLSession. sharedSession().dataTaskWithRequest(request, completionHandler: { (data, response, error ) -> Void in
                
            //})
            
          /*  let emailVC = MFMailComposeViewController()
            emailVC.delegate = self
            emailVC.setSubject("New Equistro order")
            //emailVC.
            emailVC.setToRecipients(["zideleanda@gmail.com"])
            emailVC.setMessageBody("<h1>I would like to order these products!</h1>", isHTML: true)
            present(UINavigationController(rootViewController: emailVC), animated: true) */
        } else {
            guard let url = URL(string: "https://www.google.com") else {
                return
            }
            let emailVC = SFSafariViewController(url: url)
            present(emailVC, animated: true)
        }
    } else {
        if MFMailComposeViewController.canSendMail() {
            let compVC = MFMailComposeViewController()
            compVC.mailComposeDelegate = self
            compVC.setToRecipients([kontaktini[2].epasts])
            compVC.setSubject("New Equistro order")
            compVC.setMessageBody("", isHTML: true)
            self.present(compVC, animated: true, completion: nil)
            /*let emailVC = MFMailComposeViewController()
            emailVC.delegate = self
            emailVC.setSubject("New Equistro order")
            //emailVC.
            emailVC.setToRecipients(["zideleanda@gmail.com"])
            emailVC.setMessageBody("<h1>I would like to order these products!</h1>", isHTML: true)
            present(UINavigationController(rootViewController: emailVC), animated: true)
            */
        } else {
            guard let url = URL(string: "https://www.google.com") else {
                return
            }
            let emailVC = SFSafariViewController(url: url)
            present(emailVC, animated: true)
        }
    }
    }*/
    
    
    @IBAction func pakomatsTapped(_ sender: Any) {
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
                        self.vardsLbl!.text = name
                        self.uzvardsLb!.text = surname
                        self.epastsLbl!.text = email
                        //self.telefonsLbl!.text = telefons
                        self.pakomataNosBtn!.setTitle(pakomaAdr, for: .normal)
                        self.priceLbl!.text = "Price: " + String("%2f, cenina") + " Euro"
                        
                        
                        db.collection("users").document(email).updateData(["telefons": self.telefonsLbl!.text!])
                        db.collection("users").document(email).updateData(["country": self.valstsNos!.text!])
                        //db.collection("users").document(email).updateData(["telefons": self.telefonsLbl!.text])
                       // db.collection("users").document(email).updateData(["telefons": self.telefonsLbl!.text])
                    }
                }
                
                
                
                return lietotajaDati(uid: lietUi, email: email, name: name, surname: surname, produktiArray: produkti, orders: pasutijumi, cena: cenina, valsts: country, pakomataAdrese: pakomaAdr, telefons: telefons, cenuMasivs: cenuMas)
            }
        }
       // viewDidAppear(true)
    }
    
    @IBAction func toMainViewTapped(_ sender: Any) {
        let homeVContr = "HomeVContr"
        let homeWindow = storyboard?.instantiateViewController(identifier: homeVContr) as? HomeViewController
        
        self.view.window?.rootViewController = homeWindow
        self.view.window?.makeKeyAndVisible()
        
    }
    
    @IBAction func toOrderList(_ sender: Any) {
        /*let sbOrder = storyboard?.instantiateViewController(withIdentifier: "myOrderLst") as? MyOrderTableViewController
        self.view.window?.rootViewController = sbOrder
        self.view.window?.makeKeyAndVisible()
        */
        let sbOrder = storyboard?.instantiateViewController(withIdentifier: "myOrderLst") as? MyOrderTableViewController
        //self.view.window?.rootViewController = sbOrder
        //self.view.window?.isHidden = true
        self.view.window?.rootViewController = sbOrder
        self.view.window?.makeKeyAndVisible()
        
    }
    
    
    @IBAction func pakomatsTappedNr2(_ sender: Any) {
        var uidSimLietotajam = ""
        let db = Firestore.firestore()
        let sisLietotajs = db.collection("users").document(Auth.auth().currentUser!.email!)
        uidSimLietotajam = sisLietotajs.documentID
        //print(uidSimLietotajam)
        var boo: Bool = true
        db.collection("users").addSnapshotListener{ [self](querySn, err) in
            guard let documents = querySn?.documents else {
                //print("Nav Šādu Dokumentu!!!")
                return
            }
            self.userData = documents.map {(queryDocSn) -> lietotajaDati in
                let snap = queryDocSn.data()
                let lietUi = snap["uid"] as? String ?? ""
                let email = snap["email"] as? String ?? ""
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
                        self.vardsLbl!.text = name
                        self.uzvardsLb!.text = surname
                        self.epastsLbl!.text = email
                        //self.telefonsLbl!.text = telefons
                        self.pakomataNosBtn!.setTitle(pakomaAdr, for: .normal)
                        self.priceLbl!.text = "Price: " + String(cenina) + " Euro"
                        
                        
                        db.collection("users").document(email).updateData(["telefons": self.telefonsLbl!.text!])
                        db.collection("users").document(email).updateData(["country": self.valstsNos!.text!])
                        //db.collection("users").document(email).updateData(["telefons": self.telefonsLbl!.text])
                       // db.collection("users").document(email).updateData(["telefons": self.telefonsLbl!.text])
                    }
                }
                
                
                
                return lietotajaDati(uid: lietUi, email: email, name: name, surname: surname, produktiArray: produkti, orders: pasutijumi, cena: cenina, valsts: country, pakomataAdrese: pakomaAdr, telefons: telefons, cenuMasivs: cenuMas)
            }
        }
       // viewDidAppear(true)
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
