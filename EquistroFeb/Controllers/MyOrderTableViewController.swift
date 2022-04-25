//
//  MyOrderTableViewController.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 16/03/2022.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage
import SafariServices
import MessageUI

class MyOrderTableViewController: UITableViewController, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {
    @IBOutlet weak var cenaPasutijumam: UILabel!
    @IBOutlet weak var produktuListe: UILabel!
    @IBOutlet weak var makeOrderBtn: UIButton!
    
    var userData = [lietotajaDati]()
    var masivs: [String] = []
    var allProducts = ForAllProducts.createVisi()
    var skaitinsCell: [String] = []
    var skaitins: Int = 0
    var cenaIzmainam: Double = 0.00
    
    //var jaunsMasivs: [String] = []
    var orderSaraksts = [orderSarakstam]()
    
    
    var cenaTe: Double = 0.0

    //var masivsNr1: [String] = []
    //var masivsSkaitaRedigesanai: [String] = []
    var masivaSkaiti: [String] = []
    var masivaSkaitiNr2: [String] = []
    var skaits = 0
    var newArray: [String] = []
    var newArrayForButtons: [String] = []
    
    var masivsNavigation: [String] = []
    
    //var jaunsMasivs: [String] = []
    
    /*override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        tableView.reloadData()
    }*/
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    
    }
    
    /*override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tableView.reloadData()
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.reloadData()
    
            //tableView.dataSource = self
        //tableView.delegate = self
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Screenshot 2022-03-28 at 16.49.22.imageset")!)
        
        var uidSimLietotajam = ""
        let db = Firestore.firestore()
        let sisLietotajs = db.collection("users").document(Auth.auth().currentUser!.email!)
        uidSimLietotajam = sisLietotajs.documentID
       // print(uidSimLietotajam)
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
                    
                    if boo == true {
                        boo = false
                        self.cenaPasutijumam.text = String(format: "%.2f", cenina) + " EUR"
                        var mas: [String] = []
                        mas = produkti
                        //self.
                        for i in 0..<mas.count {
                            if mas[i] != "" {
                                self.masivs.append(mas[i])
                                //self.skaitinsCell = self.skaitinsCell + 1
                                for j in 0..<self.skaitinsCell.count {
                                    if self.skaitinsCell[j] == mas[i] {
                                        
                                    }
                                }
                            }
                        }
                    }
                }
                
                /*
                for _ in 0..<self.masivs.count {
                    if self.masivaSkaiti.count < self.masivs.count {
                        self.masivaSkaiti.append("1")
                        
                    }
                    
                }*/
                for _ in 0..<self.masivs.count {
                    if self.masivaSkaiti.count < self.masivs.count {
                        self.masivaSkaiti.append("1")
                        //print("Mes te esam")
                    }
                    
                }
               // print(self.masivaSkaiti) //visur ir 1
                
                
                
                //Lai neatkārtojas nosaukumi!!!
             /*   for i in 0..<self.masivs.count {
                    //self.masivaSkaiti[i] = "1"
                    //self.masivaSkaiti[i] = String(Int(self.masivaSkaiti[i])! + 1)

                    for j in 0..<self.masivs.count {
                        
                        if i > j && i != j  && self.masivs[i] != ""{
                            if self.masivs[i] == self.masivs [j] {
                                self.masivs[j] = ""
                                self.masivaSkaiti[j] = String(Int(self.masivaSkaiti[j])! + 1)
                                self.masivaSkaiti[i] = "0"
                            }
                        }
                    }
                }*/
                for i in 0..<self.masivs.count {
                    for j in 1..<self.masivs.count {
                        if self.masivs[i] == self.masivs[j] && self.masivs[i] != "" && i < j {
                            self.masivs[j] = ""
                            self.masivaSkaiti[i] = String(Int(self.masivaSkaiti[i])! + 1)
                            self.masivaSkaiti[j] = "0"
                        }
                    }
                }
                //print(self.masivaSkaiti) //te nav pareizi!!!
                
                /*
                for i in 0..<self.masivs.count {
                    //self.masivaSkaiti[i] = "1"
                    //self.masivaSkaiti[i] = String(Int(self.masivaSkaiti[i])! + 1)

                    for j in 0..<self.masivs.count {
                        if self.masivs[i] == self.masivs [j] {
                            if i != j && i < j {
                                self.masivs[j] = ""
                                self.masivaSkaiti[i] = String(Int(self.masivaSkaiti[i])! + 1)
                                self.masivaSkaiti[j] = "0"
                            }
                        }
                    }
                }*/
                
                
                var jaunsMasivs: [String] = []
                
                for i in 0..<(self.masivs.count) {
                    if self.masivs[i] != "" {
                        jaunsMasivs.append(self.masivs[i])
                        //self.newArray.append(self.masivs[i])
                    }
                }
                
                self.skaits = jaunsMasivs.count
                self.newArray = jaunsMasivs
                //jaunsMasivs.removeAll()
                
                //for j in 0..<self.skaits {
                if self.masivaSkaitiNr2.count < self.skaits {
                    for i in 0..<self.masivaSkaiti.count {
                        if self.masivaSkaiti[i] != "0" {
                            self.masivaSkaitiNr2.append(self.masivaSkaiti[i])
                            self.masivaSkaiti[i] = "0"
                        }
                    }
                }
                //}
                //print(self.masivaSkaiti)//visi elementi ==0
                
               // print("TETETETETETE:")
               // print(self.skaits)
              //  print(self.masivaSkaitiNr2)
               // print(self.newArray)
                
                self.newArrayForButtons = self.newArray
                self.tableView.reloadData()
                //print("te jaunsMasivs:")
                //print(jaunsMasivs)
                jaunsMasivs.removeAll()
                //print(jaunsMasivs)
                //self.skaits = 0
                //self.masivs.removeAll()

                return lietotajaDati(uid: lietUi, email: email, name: name, surname: surname, produktiArray: produkti, orders: pasutijumi, cena: cenina, valsts: country, pakomataAdrese: pakomaAdr, telefons: telefons, cenuMasivs: cenuMas)
                
                            }
            
        }
        //self.masivs.removeAll()
        
    }
    
    /*
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Screenshot 2022-03-28 at 16.49.22.imageset")!)
        
        
        tableView.dataSource = self
        tableView.delegate = self
        //tableView.reloadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
                if email == uidSimLietotajam {
                    if boo == true {
                        boo = false
                        self.cenaPasutijumam.text = String(format: "%.2f", cenina) + " EUR"
                        var mas: [String] = []
                        mas = produkti
                        for i in 0..<mas.count {
                            if mas[i] != "" {
                                self.masivs.append(mas[i])
                                /*self.skaitinsCell = self.skaitinsCell + 1
                                for j in 0..<self.masivs.count {
                                    if self.masivs[j] == mas[i] {
                                        self.skaitinsCell = self.skaitinsCell - 1
                                    }
                                }*/
                            }
                        }
                        //var masivs: [String] = []
                        //masivs = produkti
                        //masivs.append(self.nameOne.text!)
                        //db.collection("users").document(email).updateData(["produkti": masivs])
                    }
                }
                print(self.masivs)
                self.masivsSkaitaRedigesanai = self.masivs
                return lietotajaDati(uid: lietUi, email: email, name: name, surname: surname, produktiArray: produkti, orders: pasutijumi, cena: cenina, valsts: country, pakomataAdrese: pakomaAdr, telefons: telefons)
            }
        }
        //self.tableView.reloadData()
        
    }*/
    

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func orderBtnTapped(_ sender: Any) {
        //sutit e-pastu, izveloties valsti!!!
      //  print("Sutit un izdzēst produktus arī no db!")
        
        //TE IR TAS KA PASUTIJUMS SAGLABAJAS PIE C=VEIKTAJIEM PASUTIJUMIEM:
        /*
        var sodienasGMD = "nav pagaidam"
        //te datums
        func datumsSodienai() {
            let datums = Date()
            let kalendars = Calendar.current
            let diena = kalendars.component(.day, from: datums)
            let menesis = kalendars.component(.month, from: datums)
            let gads = kalendars.component(.year, from: datums)
            sodienasGMD = "\(diena).\(menesis).\(gads)"
            print(sodienasGMD)
        }
        datumsSodienai()
        
        
        
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
                                masivs.append(produkti[i] + " [" + sodienasGMD + "]")
                            }
                        }
                        //te suta epastu ar sutijumu
                        if MFMailComposeViewController.canSendMail() {
                            let emailVC = MFMailComposeViewController()
                            emailVC.delegate = self
                            emailVC.setSubject("New Equistro order")
                            //te ievadit konkretas valsts e-pastu!!!
                            emailVC.setToRecipients(["zideleanda@gmail.com"])
                            //te pievieno pasutito produktu nosaukumus!!!
                            emailVC.setMessageBody("<h1>I would like to order these products!</h1>", isHTML: true)
                            self.present(UINavigationController(rootViewController: emailVC), animated: true)
                        } else {
                            //let url = URL(string: "https://www.google.com")
                            let emailVC = SFSafariViewController(url: URL(string: "https://www.google.com")!)
                            self.present(emailVC, animated: true)
                        }
                        

                        
                        //masivs.append(self.nameOne.text!)
                        db.collection("users").document(email).updateData(["produkti": FieldValue.delete()])
                        db.collection("users").document(email).updateData(["orders": masivs])
                        db.collection("users").document(email).updateData(["pricePerOrder": 0.0])
                    }
                }
                return lietotajaDati(uid: lietUi, email: email, name: name, surname: surname, produktiArray: produkti, orders: pasutijumi, cena: cenina, valsts: country, pakomataAdrese: pakomaAdr, telefons: telefons)
            }
        }
        
        tableView.reloadData()
        */
        
        
    }
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return self.skaits//self.masivs.count//self.skaitinsCell//self.masivs.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myOrder", for: indexPath) as? MyOrderTableViewCell else {return UITableViewCell()}

        
        // Configure the cell...
        for elementi in 0..<self.newArray.count {
            
            if newArray[elementi] != "" {
                
                cell.productName.text = self.newArray[elementi]
                cell.skaitsLabel.text = self.masivaSkaitiNr2[elementi]
                self.masivsNavigation.append(self.newArray[elementi])
                for i in 0..<allProducts.count {
                    if allProducts[i].name == self.newArray[elementi] {
                        cell.productImage.image = UIImage(named: allProducts[i].image)
                    }
                }
                self.newArray[elementi] = ""
                return cell
            }
            
        }
        
//productName
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    @IBAction func toMainViewTapped(_ sender: Any) {
        let homeVContr = "HomeVContr"
        let homeWindow = storyboard?.instantiateViewController(identifier: homeVContr) as? HomeViewController
        
        self.view.window?.rootViewController = homeWindow
        self.view.window?.makeKeyAndVisible()
    }
    
    
    @IBAction func addOneTapped(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: tableView)
        guard let indexPath = tableView.indexPathForRow(at: point) else {return}
        
        var uidSimLietotajam = ""
        let db = Firestore.firestore()
        let sisLietotajs = db.collection("users").document(Auth.auth().currentUser!.email!)
        uidSimLietotajam = sisLietotajs.documentID
      //  print(uidSimLietotajam)
        var boo: Bool = true
        
        
        for i in 0..<allProducts.count {
            if allProducts[i].name == self.newArrayForButtons[indexPath.row] {
                cenaTe = allProducts[i].cena
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
                        masivs.append(self.newArrayForButtons[indexPath.row])
                        var masi: [String] = []
                        masi = cenuMas
                        masi.append(String(self.cenaTe))
                        var maksa = cenina
                        maksa = maksa + (self.cenaTe)
                        db.collection("users").document(email).updateData(["produkti": masivs])
                        db.collection("users").document(email).updateData(["cenuMas": masi])
                        db.collection("users").document(email).updateData(["pricePerOrder": maksa])
                        self.cenaIzmainam = maksa
                        let cStr = String(format: "%.2f", self.cenaIzmainam)
                        //print("Te cenai jābūt: " + cStr)
                        self.cenaPasutijumam.text = cStr + " EUR"//String(format: "%.2f", self.cenaIzmainam) + " " + "EUR"

                    }
                    
                    
                }
                return lietotajaDati(uid: lietUi, email: email, name: name, surname: surname, produktiArray: produkti, orders: pasutijumi, cena: cenina, valsts: country, pakomataAdrese: pakomaAdr, telefons: telefons, cenuMasivs: cenuMas)
            }
        }
        
        
        
        
        //print("Te mainam skaitu tikai masīvasm: ")
        
        //self.masivaSkaitiNr2.[indexPath.row].
        var sk = Int(self.masivaSkaitiNr2[indexPath.row])
        sk = (sk ?? 0) + 1
        let ska: String = String(sk!)
        //print(ska)
        self.masivaSkaitiNr2.remove(at: indexPath.row)
        //self.masivaSkaiti.remove(at: indexPath.row)
        let nosau = self.newArrayForButtons[indexPath.row]
        //print(nosau)
        //print(self.newArrayForButtons)
        self.newArray.remove(at: indexPath.row)
        self.newArray.insert(nosau, at: indexPath.row)
        self.masivaSkaitiNr2.insert(ska, at: indexPath.row)
        //self.masivaSkaiti.insert(ska, at: indexPath.row)
        self.masivaSkaiti.append("0")
        tableView.beginUpdates()
        tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .right)
        tableView.insertRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .left)
        tableView.endUpdates()
        print("esam te!")
        print(self.newArrayForButtons)
        print(self.newArray)
        //self.masivaSkaiti = self.masivaSkaitiNr2

        /*masivaSkaiti.removeAll()
        
        for i in 0..<self.masivaSkaitiNr2.count {
            masivaSkaiti.append("0")
        }*/
        print(self.masivaSkaitiNr2)
        print(self.masivaSkaiti)
        //print(self.masivaSkaitiNr2)
        //print(self.masivaSkaiti)
        
        //let cStr = String(format: "%.2f", self.cenaIzmainam)
        //print(self.cenaIzmainam)
        //cenaPasutijumam.text = cStr + " " + "EUR"
        //LIDZ TE:
        //let navigateTo = "toAddProduct"
        //let navWindow = storyboard?.instantiateViewController(identifier: navigateTo) as? AddOneViewController
        //navWindow?.pievienojamais = self.newArrayForButtons[indexPath.row]
        
        //self.view.window?.rootViewController = navWindow
        //self.view.window?.makeKeyAndVisible()
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
    }

    
    @IBAction func deleteOneTapped(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: tableView)
        guard let indexPath = tableView.indexPathForRow(at: point) else {return}
        var sk = Int(self.masivaSkaitiNr2[indexPath.row])
        sk = (sk ?? 0) - 1
        //TE:
        //var cenaIzmainam = ""
        //print("Te dzēšam no lietotāja produktu saraksta!")
        
        
        
        
            var uidSimLietotajam = ""
            let db = Firestore.firestore()
            let sisLietotajs = db.collection("users").document(Auth.auth().currentUser!.email!)
            uidSimLietotajam = sisLietotajs.documentID
            //print(uidSimLietotajam)
            var boo: Bool = true
           
        if sk! > 0 {
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
                                if self.newArrayForButtons[indexPath.row] == produkti[i] && buuu == true{
                                        buuu = false
                                        //print("Šo produktu jāizdzēšs!!!")
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
                            //print(produkti)
                            //print("Šeit esam:")
                            //print(mas)
                            db.collection("users").document(email).updateData(["produkti": mas])
                            db.collection("users").document(email).updateData(["cenuMas": cenuM])
                            db.collection("users").document(email).updateData(["pricePerOrder": cena])
                            self.cenaIzmainam = cena
                            let cStr = String(format: "%.2f", self.cenaIzmainam)
                            //print("Te cenai jābūt: " + cStr)
                            self.cenaPasutijumam.text = cStr + " EUR"//String(format: "%.2f", self.cenaIzmainam) + " " + "EUR"
                            
                            

                        }
                        
                        
                    }
                    
                    
                    
                    return lietotajaDati(uid: lietUi, email: email, name: name, surname: surname, produktiArray: produkti, orders: pasutijumi, cena: cenina, valsts: country, pakomataAdrese: pakomaAdr, telefons: telefons, cenuMasivs: cenuMas)
                }
                
                
            }
            
        
            print(self.newArrayForButtons)
            print(self.newArray)
            //self.masivaSkaiti = self.masivaSkaitiNr2
            print(self.masivaSkaitiNr2)
            print(self.masivaSkaiti)
            let ska: String = String(sk!)
            //print(ska)
            self.masivaSkaitiNr2.remove(at: indexPath.row)
            self.masivaSkaiti.remove(at: indexPath.row)
            let nosau = self.newArrayForButtons[indexPath.row]
            print(nosau)
            self.newArray.remove(at: indexPath.row)
            self.newArray.insert(nosau, at: indexPath.row)
            self.masivaSkaitiNr2.insert(ska, at: indexPath.row)
            //self.masivaSkaiti.insert("0", at: indexPath.row)
            //self.masivaSkaiti.remove(at: <#T##Int#>)
            //self.masivaSkaiti.append("0")
                self.tableView.beginUpdates()
                self.tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .left)
                self.tableView.insertRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .right)
                self.tableView.endUpdates()
            print("esam te!")
            
            /*
            masivaSkaiti.removeAll()
            
            for i in 0..<self.masivaSkaitiNr2.count {
                masivaSkaiti.append("0")
            }*/
            
            print(self.newArrayForButtons)
            print(self.newArray)
            //self.masivaSkaiti = self.masivaSkaitiNr2
            print(self.masivaSkaitiNr2)
            print(self.masivaSkaiti)
        }
        else {
            
        var uidSimLietotajam = ""
            let db = Firestore.firestore()
            let sisLietotajs = db.collection("users").document(Auth.auth().currentUser!.email!)
            uidSimLietotajam = sisLietotajs.documentID
            //print(uidSimLietotajam)
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
                                if self.newArrayForButtons[indexPath.row] == produkti[i] && buuu == true{
                                        buuu = false
                                        //print("Šo produktu jāizdzēšs!!!")
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
                            //print(produkti)
                            //print("Šeit esam:")
                            //print(mas)
                            db.collection("users").document(email).updateData(["produkti": mas])
                            db.collection("users").document(email).updateData(["cenuMas": cenuM])
                            db.collection("users").document(email).updateData(["pricePerOrder": cena])
                            self.cenaIzmainam = cena
                            let cStr = String(format: "%.2f", self.cenaIzmainam)
                            //print("Te cenai jābūt: " + cStr)
                            self.cenaPasutijumam.text = cStr + " EUR"//String(format: "%.2f", self.cenaIzmainam) + " " + "EUR"
                        
                        
                        }
                        
                        
                        
                        /*
                        self.cenaIzmainam = cena
                        let cStr = String(format: "%.2f", self.cenaIzmainam)
                        //print("Te cenai jābūt: " + cStr)
                        self.cenaPasutijumam.text = cStr + " EUR"//String(format: "%.2f", self.cenaIzmainam) + " " + "EUR"
                        let ska: String = String(sk!)
                        print(ska)
                        print(self.masivaSkaitiNr2)
                        self.masivaSkaitiNr2.remove(at: indexPath.row)
                        self.masivaSkaiti.remove(at: indexPath.row)
                        let nosau = self.newArrayForButtons[indexPath.row]
                        print(nosau)
                        print(self.newArrayForButtons)
                        self.newArray.remove(at: indexPath.row)
                        self.skaits = self.skaits - 1
                        self.tableView.beginUpdates()
                        self.tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .left)
                        self.tableView.endUpdates()
                        */
                    }
                    
                    return lietotajaDati(uid: lietUi, email: email, name: name, surname: surname, produktiArray: produkti, orders: pasutijumi, cena: cenina, valsts: country, pakomataAdrese: pakomaAdr, telefons: telefons, cenuMasivs: cenuMas)
                }
                
                let ska: String = String(sk!)
                print(ska)
                print(self.masivaSkaitiNr2)
                self.masivaSkaitiNr2.remove(at: indexPath.row)
                self.masivaSkaiti.remove(at: indexPath.row)
                let nosau = self.newArrayForButtons[indexPath.row]
                print(nosau)
                print(self.newArrayForButtons)
                self.newArray.remove(at: indexPath.row)
                self.newArrayForButtons.remove(at: indexPath.row)
                print("esam te!")
                /*
                self.masivaSkaiti.removeAll()
                
                for i in 0..<self.masivaSkaitiNr2.count {
                    self.masivaSkaiti.append("0")
                }*/
                
                print(self.newArrayForButtons)
                print(self.newArray)
                //self.masivaSkaiti = self.masivaSkaitiNr2

                print(self.masivaSkaitiNr2)
                print(self.masivaSkaiti)
                self.skaits = self.skaits - 1
                self.tableView.beginUpdates()
                self.tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .left)
                self.tableView.endUpdates()

                
                
            }
            
            //seit dzes rindu
            //self.tableView.reloadData()
            //self.tableView.re
            
            
            //dzestTikaiDB(produktaNosa: self.newArrayForButtons[indexPath.row])
            //self.tableView.reloadData()
            //self.tableView.reloadData()
           /* let ska: String = String(sk!)
            print(ska)
            print(self.masivaSkaitiNr2)
            self.masivaSkaitiNr2.remove(at: indexPath.row)
            self.masivaSkaiti.remove(at: indexPath.row)
            let nosau = self.newArrayForButtons[indexPath.row]
            print(nosau)
            print(self.newArrayForButtons)
            self.newArray.remove(at: indexPath.row)
            //let nonjemt = self.newArrayForButtons[indexPath.row]
            self.skaits = self.skaits - 1
            //self.newArrayForButtons.remove(at: indexPath.row)
            self.tableView.beginUpdates()
            self.tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .left)
            
           // self.tableView.reloadData()
            self.tableView.endUpdates()
            */
            
        }
            
        //ŠITO VISU PIELIKT PRIEKŠĀ PIRMS DB REDIĢĒŠANAS!!!
       
        /*
        else {
            
            
            
            
            var uidSimLietotajam = ""
            let db = Firestore.firestore()
            let sisLietotajs = db.collection("users").document(Auth.auth().currentUser!.email!)
            uidSimLietotajam = sisLietotajs.documentID
            //print(uidSimLietotajam)
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
                            //var nenonjemtie: [String] = []
                            
                            for i in 0..<produkti.count {
                                //if buuu == true {
                                if self.newArrayForButtons[indexPath.row] == produkti[i] && buuu == true{
                                        buuu = false
                                        //print("Šo produktu jāizdzēšs!!!")
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
                            //print(produkti)
                            //print("Šeit esam:")
                            //print(mas)
                            db.collection("users").document(email).updateData(["produkti": mas])
                            db.collection("users").document(email).updateData(["cenuMas": cenuM])
                            db.collection("users").document(email).updateData(["pricePerOrder": cena])
                            self.cenaIzmainam = cena
                            let cStr = String(format: "%.2f", self.cenaIzmainam)
                            //print("Te cenai jābūt: " + cStr)
                            self.cenaPasutijumam.text = cStr + " EUR"//String(format: "%.2f", self.cenaIzmainam) + " " + "EUR"
                            
                            //self.tableView.reloadData()
                            let ska: String = String(sk!)
                            print(ska)
                            print(self.masivaSkaitiNr2)
                            self.masivaSkaitiNr2.remove(at: indexPath.row)
                            self.masivaSkaiti.remove(at: indexPath.row)
                            let nosau = self.newArrayForButtons[indexPath.row]
                            print(nosau)
                            print(self.newArrayForButtons)
                            self.newArray.remove(at: indexPath.row)
                            //let nonjemt = self.newArrayForButtons[indexPath.row]
                            self.skaits = self.skaits - 1
                            //self.newArrayForButtons.remove(at: indexPath.row)
                            self.tableView.beginUpdates()
                            self.tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .left)
                            
                           // self.tableView.reloadData()
                            self.tableView.endUpdates()
                            

                            
                            
                            //self.tableView.reloadData()
                        }
                        
                        
                    }
                    
                    
                    
                    return lietotajaDati(uid: lietUi, email: email, name: name, surname: surname, produktiArray: produkti, orders: pasutijumi, cena: cenina, valsts: country, pakomataAdrese: pakomaAdr, telefons: telefons, cenuMasivs: cenuMas)
                }
                
                
            }

            
            
            
            
            
        }*/
        
            
            //let navigateTo = "myOrderLst"
            //let navWindow = storyboard?.instantiateViewController(identifier: navigateTo) as? MyOrderTableViewController
            
          //  navWindow?.tableView.reloadData()
            //self.view.window?.rootViewController = navWindow
            //navWindow?.tableView.reloadData()
           // self.view.window?.makeKeyAndVisible()
            //navWindow?.tableView.reloadData()
        //Lidz sejienei ir db updeitošana
        
       // print("Te mainam skaitu tikai masīvasm: ")
        
        //self.masivaSkaitiNr2.[indexPath.row].
        
        
        //cenaPasutijumam.text = "Izmaiņas"
        //String(format: "%.2f", visiProdukti[i].cena)
        //let cStr = String(format: "%.2f", self.cenaIzmainam)
       // print("Te cenai jābūt: " + cStr)
        //cenaPasutijumam.text = String(self.cenaIzmainam) + " EUR"//String(format: "%.2f", self.cenaIzmainam) + " " + "EUR"
        //LIDZ TE:
        
        
        /*
        let navigateTo = "backToOrder"
        let navWindow = storyboard?.instantiateViewController(identifier: navigateTo) as? MyOrderDeleteOneViewController
        navWindow?.dzesamais = self.newArrayForButtons[indexPath.row]
        
        self.view.window?.rootViewController = navWindow
        self.view.window?.makeKeyAndVisible()
        */
        //self.tableView.reloadData()
        
        //print(self.newArray)
        //print(self.masivs)
        //print(self.newArrayForButtons)
        //print("pec dzesanas:")
        //self.newArray.removeAll()
        //self.masivs.removeAll()
        
        //self.masivs = self.newArrayForButtons
        //self.newArray = self.newArrayForButtons
        //print(self.newArray)
        //print(self.masivs)
        /*for i in 0..<self.newArrayForButtons.count {
            let indexPath = IndexPath(item: i, section: 0)
            tableView.reloadRows(at: [indexPath], with: .top)
        }*/
        //labāk izdomat kā aiziet no si loga un atnākt atpakaļ!!!
        //self.tableView.reloadData()
        //let productDeleteVC = destination as! MyOrderDeleteOneViewController
        
        //tableView.reloadData()
        //self.tableView.reloadData()//te vjg si vietā uz citu biew controller un tad atpakalj!!!
        /*let navigateTo = "backToOrder"
        let navWindow = storyboard?.instantiateViewController(identifier: navigateTo) as? MyOrderDeleteOneViewController
        navWindow?.dzesamais = self.newArrayForButtons[indexPath.row]
        
        self.view.window?.rootViewController = navWindow
        self.view.window?.makeKeyAndVisible()
         */
    }
    
    func dzestTikaiDB(produktaNosa: String) {
        
        //let point = UIButton.convert(CGPoint.zero, to: tableView)
        //guard let indexPath = tableView.indexPathForRow(at: point) else {return}
      //  var sk = Int(self.masivaSkaitiNr2[indexPath.row])
       // sk = (sk ?? 0) - 1
        
        
        
        

    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let indexPath = tableView.indexPathForSelectedRow {
            var tekstsToNavigate: String = ""
            tekstsToNavigate = masivsNavigation[indexPath.row]
            
            let oneProductViewC = segue.destination as! OneProdViewController
            oneProductViewC.skaitsForRow = tekstsToNavigate
            
            
        }
    }
    

}
