//
//  OneProdViewController.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 10/04/2022.
//

import UIKit
import SafariServices
import FirebaseAuth
import Firebase
import FirebaseFirestore
import FirebaseStorage

class OneProdViewController: UIViewController {

    var userData = [lietotajaDati]()
    var skaitsForRow: String!
    var urlString: String = "https://www.google.com"
    var ingredientsNosaukums: String = ""
    var nosaukumis: String!
    var visiProdukti = ForAllProducts.createVisi()
    
    
    @IBOutlet weak var nosaukums: UILabel!
    @IBOutlet weak var bildite: UIImageView!
    @IBOutlet weak var apraksts: UILabel!
    
    
    @IBOutlet weak var cenalabel: UILabel!
    @IBOutlet weak var cenaRadit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if skaitsForRow != nil {
            print(skaitsForRow ?? "nav")
            for i in 0..<visiProdukti.count {
                if visiProdukti[i].name == skaitsForRow {
                    nosaukums.text = visiProdukti[i].name
                    bildite.image = UIImage(named: visiProdukti[i].image)
                    ingredientsNosaukums = visiProdukti[i].ingred
                    apraksts.text = visiProdukti[i].apraksts
                    urlString = visiProdukti[i].urls
                    cenalabel.text = String(format: "%.2f", visiProdukti[i].cena)
                }
            }
        }
        
        
        cenaRadit.text = "Price:" + " " + cenalabel.text! + " EUR"
        cenalabel.isHidden = true

        
        
        
        
    }
    

    @IBAction func toWebTapped(_ sender: Any) {
        guard let url = URL(string: urlString) else {
            return
        }
        let emailVC = SFSafariViewController(url: url)
        present(emailVC, animated: true)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ingredVC = segue.destination as! ViewIngredViewController
        ingredVC.nosaukums = ingredientsNosaukums
    }
    

}
