//
//  HZProductViewController.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 05/04/2022.
//

import UIKit
import SafariServices
import FirebaseAuth
import Firebase
import FirebaseFirestore
import FirebaseStorage

class HZProductViewController: UIViewController {

    var fmuscles: ForMuscles!
    var fmsystemOne: ForMusculoskeletalSystem!
    var fskin: ForSkinCandH!
    var fmetabolism: ForMetabolism!
    var fbreeding: ForBreeding!
    var fresptrack: ForRespiratoryTrack!
    var fdigsystem: ForDigestiveSystem!
    var fnervsystem: ForNervousSystem!
    var fhperformance: ForHighPerf!
    var minvit: MineralsVitamins!
    
    var userData = [lietotajaDati]()
    var urlString: String = "https://www.google.com"
    var ingredientsNosaukums: String = ""
    var nosaukums: String!
    
    @IBOutlet weak var nosaukumsLab: UILabel!
    @IBOutlet weak var produktaImg: UIImageView!
    @IBOutlet weak var aprakstsLab: UILabel!
    @IBOutlet weak var cenaLab: UILabel!
    
    @IBOutlet weak var cenaTeksts: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        if fskin != nil {
            nosaukumsLab.text = fskin.name
            produktaImg.image = UIImage(named: fskin.image)
            ingredientsNosaukums = fskin.ingred
            aprakstsLab.text = fskin.apraksts
            urlString = fskin.urls
            cenaLab.text = String(format: "%.2f", fskin.cena)
        }
        
        if fmetabolism != nil {
            nosaukumsLab.text = fmetabolism.name
            produktaImg.image = UIImage(named: fmetabolism.image)
            ingredientsNosaukums = fmetabolism.ingred
            aprakstsLab.text = fmetabolism.apraksts
            urlString = fmetabolism.urls
            cenaLab.text = String(format: "%.2f", fmetabolism.cena)
        }
        
        if fbreeding != nil {
            nosaukumsLab.text = fbreeding.name
            produktaImg.image = UIImage(named: fbreeding.image)
            ingredientsNosaukums = fbreeding.ingred
            aprakstsLab.text = fbreeding.apraksts
            urlString = fbreeding.urls
            cenaLab.text = String(format: "%.2f", fbreeding.cena)
        }
        if fresptrack != nil {
            nosaukumsLab.text = fresptrack.name
            produktaImg.image = UIImage(named: fresptrack.image)
            ingredientsNosaukums = fresptrack.ingred
            aprakstsLab.text = fresptrack.apraksts
            urlString = fresptrack.urls
            cenaLab.text = String(format: "%.2f", fresptrack.cena)
        }
        
        if fdigsystem != nil {
            nosaukumsLab.text = fdigsystem.name
            produktaImg.image = UIImage(named: fdigsystem.image)
            ingredientsNosaukums = fdigsystem.ingred
            aprakstsLab.text = fdigsystem.apraksts
            urlString = fdigsystem.urls
            cenaLab.text = String(format: "%.2f", fdigsystem.cena)
        }
        
        if fnervsystem != nil {
            nosaukumsLab.text = fnervsystem.name
            produktaImg.image = UIImage(named: fnervsystem.image)
            ingredientsNosaukums = fnervsystem.ingred
            aprakstsLab.text = fnervsystem.apraksts
            urlString = fnervsystem.urls
            cenaLab.text = String(format: "%.2f", fnervsystem.cena)
        }
        
        if fhperformance != nil {
            nosaukumsLab.text = fhperformance.name
            produktaImg.image = UIImage(named: fhperformance.image)
            ingredientsNosaukums = fhperformance.ingred
            aprakstsLab.text = fhperformance.apraksts
            urlString = fhperformance.urls
            cenaLab.text = String(format: "%.2f", fhperformance.cena)
        }
        
        if minvit != nil {
            nosaukumsLab.text = minvit.name
            produktaImg.image = UIImage(named: minvit.image)
            ingredientsNosaukums = minvit.ingred
            aprakstsLab.text = minvit.apraksts
            urlString = minvit.urls
            cenaLab.text = String(format: "%.2f", minvit.cena)
        }
        
        if fmuscles != nil {
            nosaukumsLab.text = fmuscles.name
            produktaImg.image = UIImage(named: fmuscles.image)
            ingredientsNosaukums = fmuscles.ingred
            aprakstsLab.text = fmuscles.apraksts
            urlString = fmuscles.urls
            cenaLab.text = String(format: "%.2f", fmuscles.cena)
        }
        
        if fmsystemOne != nil {
            nosaukumsLab.text = fmsystemOne.name
            produktaImg.image = UIImage(named: fmsystemOne.image)
            ingredientsNosaukums = fmsystemOne.ingred
            aprakstsLab.text = fmsystemOne.apraksts
            urlString = fmsystemOne.urls
            cenaLab.text = String(format: "%.2f", fmsystemOne.cena)
        }
        
        
        cenaTeksts.text = "Price:" + " " + cenaLab.text! + " EUR"
        cenaLab.isHidden = true
        //print(cenaLab.text!)
        //if skaitsForRow ... Šo nemaz šeit nevajag!!!
        
    }
    
    //go to catalog tapped
    
    
    @IBAction func viewUrlTapped(_ sender: Any) {
        guard let url = URL(string: urlString) else {
            return
        }
        let emailVC = SFSafariViewController(url: url)
        present(emailVC, animated: true)
    }
    
    @IBAction func addProductTapped(_ sender: Any) {
        
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
                    if boo == true {
                        boo = false
                        var masivs: [String] = []
                        masivs = produkti
                        masivs.append(self.nosaukumsLab.text!)
                        var masi: [String] = []
                        masi = cenuMas
                        masi.append(self.cenaLab.text!)
                        var maksa = cenina
                        maksa = maksa + (Double(self.cenaLab.text!) ?? 0.0)
                        db.collection("users").document(email).updateData(["produkti": masivs])
                        db.collection("users").document(email).updateData(["pricePerOrder": maksa])
                        db.collection("users").document(email).updateData(["cenuMas": masi])
                    }
                }
                return lietotajaDati(uid: lietUi, email: email, name: name, surname: surname, produktiArray: produkti, orders: pasutijumi, cena: cenina, valsts: country, pakomataAdrese: pakomaAdr, telefons: telefons, cenuMasivs: cenuMas)
            }
        }
        let pazinojumsValst = UIAlertController(title: "", message: "Product has been successfully added to Your order list!", preferredStyle: .alert)
        pazinojumsValst.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.present(pazinojumsValst, animated: true, completion: nil)
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let ingredVC = segue.destination as! ViewIngredViewController
        ingredVC.nosaukums = ingredientsNosaukums
    }
    

}
