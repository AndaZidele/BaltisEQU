//
//  OneForMusculoskeletalSystemViewController.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 04/02/2022.
//

import UIKit
import SafariServices
import FirebaseAuth
import Firebase
import FirebaseFirestore
import FirebaseStorage

class OneForMusculoskeletalSystemViewController: UIViewController {
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
    
    
    @IBOutlet weak var cenaRadit: UILabel!
    //static var Cena: Double = 0.0
    @IBOutlet weak var cenaLabel: UILabel!
    var userData = [lietotajaDati]()
    var skaitsForRow: String!
    var urlString: String = "https://www.google.com"
    var ingredientsNosaukums: String = ""
    var nosaukums: String!
    var visiProdukti = ForAllProducts.createVisi()
    
    @IBOutlet weak var aprakstsLabel: UIStackView!
    @IBOutlet weak var nameOne: UILabel!
    @IBOutlet weak var imageOne: UIImageView!
    
    @IBOutlet weak var aprakstsLab: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
      /*  if fmsystemOne != nil {
       //sie neiet!!!
            nameOne.text = fmsystemOne.name
            imageOne.image = UIImage(named: fmsystemOne.image)
        }*/
        
        if fskin != nil {
            nameOne.text = fskin.name
            imageOne.image = UIImage(named: fskin.image)
            ingredientsNosaukums = fskin.ingred
            aprakstsLab.text = fskin.apraksts
            urlString = fskin.urls
            cenaLabel.text = String(format: "%.2f", fskin.cena)
        }
        if fmetabolism != nil {
            nameOne.text = fmetabolism.name
            imageOne.image = UIImage(named: fmetabolism.image)
            ingredientsNosaukums = fmetabolism.ingred
            aprakstsLab.text = fmetabolism.apraksts
            urlString = fmetabolism.urls
            cenaLabel.text = String(format: "%.2f", fmetabolism.cena)
        }
        if fbreeding != nil {
            nameOne.text = fbreeding.name
            imageOne.image = UIImage(named: fbreeding.image)
            ingredientsNosaukums = fbreeding.ingred
            aprakstsLab.text = fbreeding.apraksts
            urlString = fbreeding.urls
            cenaLabel.text = String(format: "%.2f", fbreeding.cena)
        }
        if fresptrack != nil {
            nameOne.text = fresptrack.name
            imageOne.image = UIImage(named: fresptrack.image)
            ingredientsNosaukums = fresptrack.ingred
            aprakstsLab.text = fresptrack.apraksts
            urlString = fresptrack.urls
            cenaLabel.text = String(format: "%.2f", fresptrack.cena)
        }
        if fdigsystem != nil {
            nameOne.text = fdigsystem.name
            imageOne.image = UIImage(named: fdigsystem.image)
            ingredientsNosaukums = fdigsystem.ingred
            aprakstsLab.text = fdigsystem.apraksts
            urlString = fdigsystem.urls
            cenaLabel.text = String(format: "%.2f", fdigsystem.cena)
        }
        if fnervsystem != nil {
            nameOne.text = fnervsystem.name
            imageOne.image = UIImage(named: fnervsystem.image)
            ingredientsNosaukums = fnervsystem.ingred
            aprakstsLab.text = fnervsystem.apraksts
            urlString = fnervsystem.urls
            cenaLabel.text = String(format: "%.2f", fnervsystem.cena)
        }
        if fhperformance != nil {
            nameOne.text = fhperformance.name
            imageOne.image = UIImage(named: fhperformance.image)
            ingredientsNosaukums = fhperformance.ingred
            aprakstsLab.text = fhperformance.apraksts
            urlString = fhperformance.urls
            cenaLabel.text = String(format: "%.2f", fhperformance.cena)
        }
        if minvit != nil {
            nameOne.text = minvit.name
            imageOne.image = UIImage(named: minvit.image)
            ingredientsNosaukums = minvit.ingred
            aprakstsLab.text = minvit.apraksts
            urlString = minvit.urls
            cenaLabel.text = String(format: "%.2f", minvit.cena)
        }
        if fmuscles != nil {
            nameOne.text = fmuscles.name
            imageOne.image = UIImage(named: fmuscles.image)
            ingredientsNosaukums = fmuscles.ingred
            aprakstsLab.text = fmuscles.apraksts
            urlString = fmuscles.urls
            cenaLabel.text = String(format: "%.2f", fmuscles.cena)
        }
        if fmsystemOne != nil {
            nameOne.text = fmsystemOne.name
            imageOne.image = UIImage(named: fmsystemOne.image)
            ingredientsNosaukums = fmsystemOne.ingred
            aprakstsLab.text = fmsystemOne.apraksts
            urlString = fmsystemOne.urls
            cenaLabel.text = String(format: "%.2f", fmsystemOne.cena)
        }
        
        /*
        if noVisiem != nil {
            nameOne.text = noVisiem.name
            imageOne.image = UIImage(named: noVisiem.image)
        }*/
        if skaitsForRow != nil {
            print(skaitsForRow ?? "nav")
            for i in 0..<visiProdukti.count {
                if visiProdukti[i].name == skaitsForRow {
                    nameOne.text = visiProdukti[i].name
                    imageOne.image = UIImage(named: visiProdukti[i].image)
                    ingredientsNosaukums = visiProdukti[i].ingred
                    aprakstsLab.text = visiProdukti[i].apraksts
                    urlString = visiProdukti[i].urls
                    cenaLabel.text = String(format: "%.2f", visiProdukti[i].cena)
                }
            }
        }
        
        
        cenaRadit.text = "Price:" + " " + cenaLabel.text! + " EUR"
        cenaLabel.isHidden = true
        
    }
    
    
    @IBAction func goToCatalogTapped(_ sender: Any) {
        guard let url = URL(string: urlString) else {
            return
        }
        let emailVC = SFSafariViewController(url: url)
        present(emailVC, animated: true)
    }
    
    
    @IBAction func addToArrayTapped(_ sender: Any) {
        
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
                        masivs.append(self.nameOne.text!)
                        var masi: [String] = []
                        masi = cenuMas
                        masi.append(self.cenaLabel.text!)
                        var maksa = cenina
                        maksa = maksa + (Double(self.cenaLabel.text!) ?? 0.0)
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
        //print("Es te: " + ingredientsNosaukums)
    }
    

}
