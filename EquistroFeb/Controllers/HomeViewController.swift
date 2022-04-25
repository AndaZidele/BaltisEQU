//
//  HomeViewController.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 29/01/2022.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore
import SafariServices
import grpc

class HomeViewController: UIViewController {

    //var Te: String = ""
    var userData = [lietotajaDati]()
    var pazinojumsValsts: String!
    var pazinojumsPecpasutijuma: String!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if pazinojumsPecpasutijuma != nil {
            let pazinojumsValst = UIAlertController(title: "", message: "Your order has been sent successfully!", preferredStyle: .alert)
            pazinojumsValst.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            self.present(pazinojumsValst, animated: true, completion: nil)
            pazinojumsPecpasutijuma = nil
        }
        if pazinojumsValsts != nil {
            print(pazinojumsValsts!)
            pazinojumsValsts = ""
            let pazinojumsValst = UIAlertController(title: "", message: "Your account has been created successfully!", preferredStyle: .alert)
            pazinojumsValst.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            self.present(pazinojumsValst, animated: true, completion: nil)
            pazinojumsValsts = nil
            
        }
    }
    
    @IBOutlet weak var stackViewDisappiers: UIStackView!
    @IBOutlet weak var stackViewAppiers: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        
        /*MĒĢINU UZTAISĪT, LAI IZVADA VĀRDU!!!*/
        
        var nameEs = "Pagaidam ES"
        var uidEs = ""
        //name = LVCValue as! String
        //welcomeLabel.text = "Dear \(nameEs), we are happy to see You here!"
        
        
        
        let db = Firestore.firestore()
        let currentID = db.collection("users").document(Auth.auth().currentUser!.uid)
        print(currentID.documentID)//izprintē user id!!!
        uidEs = currentID.documentID
        
        //sis ir jaataisa!!!
        db.collection("users").addSnapshotListener{(querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("Nav sadu useru!!!")
                return
            }
            self.userData = documents.map {(queryDocumentSnapshot) -> lietotajaDati in
                let uidTrue = queryDocumentSnapshot.data()
                let ui = uidTrue["uid"] as? String ?? ""
                if ui == uidEs {
                    nameEs = uidTrue["firstName"] as? String ?? ""
                }
                let email = uidTrue["email"] as? String ?? ""
                let name = uidTrue["firstName"] as? String ?? ""
                let surname = uidTrue["lastName"] as? String ?? ""
                let produkti = uidTrue["produkti"] as? [String] ?? [""]
                let pasutijumi = uidTrue["orders"] as? [String] ?? [""]
                let cenina = uidTrue["pricePerOrder"] as? Double ?? 0.0
                let country = uidTrue["country"] as? String ?? ""
                let pakomaAdr = uidTrue["pakomats"] as? String ?? ""
                let telefons = uidTrue["telefons"] as? String ?? ""
                let cenuMas = uidTrue["cenuMas"] as? [String] ?? [""]
                return lietotajaDati(uid: ui, email: email, name: name, surname: surname, produktiArray: produkti, orders: pasutijumi, cena: cenina, valsts: country, pakomataAdrese: pakomaAdr, telefons: telefons, cenuMasivs: cenuMas)
            }
            print("Es: \(nameEs)")
            self.welcomeLabel.text = "Dear \(nameEs), we are happy to see You here!"
        }
        
        
        
        
    }
    
    @IBAction func showMenu(_ sender: Any) {
        stackViewAppiers.isHidden = false
        stackViewDisappiers.isHidden = true
    }
    
    @IBAction func hideMenu(_ sender: Any) {
        stackViewAppiers.isHidden = true
        stackViewDisappiers.isHidden = false
    }
    
    
    @IBAction func toHorseBtnTapped(_ sender: Any) {
        let horseWindow = storyboard?.instantiateViewController(withIdentifier: "horseView") as? HorseZoomingViewController
        self.view.window?.rootViewController = horseWindow
        self.view.window?.makeKeyAndVisible()
    }
    
    
    @IBAction func catalogButtonTapped(_ sender: Any) {
        guard let url = URL(string: "https://www.equistro.com/sites/corporate/files/documents/flippingbook/equistro/group/2019/2-3/#zoom=z") else {
            return
        }
        let emailVC = SFSafariViewController(url: url)
        present(emailVC, animated: true)
        
    }
    
    
    @IBAction func webBtnTapped(_ sender: Any) {
        
        guard let url = URL(string: "https://www.equistro.com") else {
            return
        }
        let emailVC = SFSafariViewController(url: url)
        present(emailVC, animated: true)
        
    }
    
    @IBAction func logoutBtnTapped(_ sender: Any) {
        let loginVC = "LoginVC"
        let loginWindow = storyboard?.instantiateViewController(withIdentifier: loginVC) as? LoginViewController
        self.view.window?.rootViewController = loginWindow
        self.view.window?.makeKeyAndVisible()
        
    }
    
    
    //ŠO VARBUT DZEST!!!
    @IBAction func toMyOrderTapped(_ sender: Any) {
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
