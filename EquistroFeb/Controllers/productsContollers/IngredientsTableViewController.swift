//
//  IngredientsTableViewController.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 06/03/2022.
//

import UIKit
import Firebase
import FirebaseFirestore
import grpc

class IngredientsTableViewController: UITableViewController {

    var ingr = [ingrDati]()
    
    @IBOutlet weak var pagaidamVjgVelakDzestSoPogu: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    @IBAction func pevienotIngr(_ sender: Any) {
        
        /*
        let db = Firestore.firestore()
        db.collection("receptes").addDocument(data: ["steps": masivs, "ingredients": mas!, "category": selectCategory!, "class": selectKlase!, "title": nosaukums!]) {(err) in
            if err != nil {
                
            }
        }*/
        var masivs: [String] = []
        var mas: [String] = []
        var m: [String] = []
        var nosaukums: String
    
        //mas.append("magnesium oxide: 1.2%")
       // mas.append("sodium chloride: 40%")
      //  mas.append("lactose")
      //  mas.append("dextrose")
       // mas.append("sodium chloride")
       // mas.append("calcium carbonate 29%")
       // mas.append("calcified seaweed: 28%")
            //mas.append("barley flour: 2.2%")
      //  mas.append("ceratonia siliqua")
       // mas.append("yeast from dead cells of sacchromyces cerevisiae: 16.6%")
       // mas.append("lucerne dried at a high temperature")
       // mas.append("sucrose: 28.6%")
       // mas.append("magnesium chloride")
        //mas.append("magnesium oxide")
       // mas.append("dried carob")
        //mas.append("corn starch")
      //  mas.append("whey partially desugared")
       // mas.append("glycerol")
        //mas.append("dicalcium phosphate")
       // mas.append("calcified seaweed")
        //mas.append("lithothamn")
        //mas.append("di-calcium phosphate: 13.7%")
        //mas.append("molasses: 14%")
        //mas.append("lucerne dried at a high temperature")
       // mas.append("dried and micronised carob and meal")
       // mas.append("pimpinella anisum l.")
        //mas.append("equisetum arvense l.")
       // mas.append("glycyrrhiza glaba l.")
        mas.append("barley middlings")
        mas.append("carob meal: 25%")
        mas.append("lucerne: 15%")
        mas.append("sugar")
        mas.append("pregelatinised potato starch")
        mas.append("silibin/phospholipids: 3%")
        
      
        m.append("cellulose e 460: 40000mg")
       // m.append("calcium lactate: 200000mg")
        //m.append("zinc: 6650mg")
       //m.append("iron: 500mg")
        //m.append("copper: 1200mg")
     // m.append("copper as hydrated amino acid chelated iron: 1650mg")
       // m.append("copper as sulphate pentahydrate: 330mg")
       // m.append("manganese: 2000mg")
      //  m.append("selenium: 16mg")
       // m.append("l-lysine monohydrochloride: 89720mg")
      // m.append("dl-methionine technically pure: 334900mg")
        //m.append("Biotin: 1300mg")
        //m.append("iodine: 50mg")
        //m.append("cobalt: 22mg")
        //m.append("Ascorbyl palmitate: 9.9mg")
        //m.append("l-lysine technically pure: 300mg")
        //m.append("l-threonine technically pure: 290mg")
       // m.append("l-lysine monohydrochloride technically pure: 16000mg")
       // m.append("l-tryptophan: 100000mg")
        //m.append("vitamin b1: 1000mg")
       // m.append("vitamin b6: 300mg")
       //m.append("vitamin a: 200000IU")
       // m.append("beta-carotene: 1.39mg")
     //   m.append("vitamin e: 21400mg")
      //  m.append("Grape extract: 13.63mg")
       // m.append("nicotinic acid: 13500mg")
      //  m.append("calcium d pantothenate: 713mg")
       // m.append("vitamin d3: 10000IU")
       // m.append("vitamin e: 11000IU")
      //  m.append("sodium diacetate: 190000mg")
       // m.append("ascorbyl palmitate: 9900mg")
       // m.append("selenium as sodium selenite: 9mg")
      //  m.append("grape extract: 13630mg")
       // m.append("nicotinic acid: 460mg")
        //m.append("folic acid: 1740mg")
            //  m.append("vitamin c: 1000mg")
       // m.append("choline chloride: 2500mg")
       // m.append("pantothenic acid: 229mg")
     // m.append("glycine: 2570mg")
        //m.append("Copper as cupric chloride dihydrate: 800mg")
     //   m.append("bentonite: 12000mg")
       // m.append("niacin: 1000mg")
            // m.append("pantothenic acid: 500mg")
       // m.append("vitamin b2: 360mg")
     //   m.append("Folic acid: 400mg")
     //  m.append("vitamin K3: 76mg")
      // m.append("vitamin b12: 15mg")
      //  m.append("biotin: 1300mg")
        //m.append("glycine: 17000mg")
            // m.append("disodium inosinate: 160mg")
       // m.append("l-leucine: 59900mg")
        
        
        
        masivs.append("moisture: 8%")
        masivs.append("crude fibre: 12%")
        masivs.append("crude ash: 4%")
        masivs.append("crude protein: 9.4%")
        masivs.append("crude fat: 2.7%")
        masivs.append("ash insoluble in hcl: 3%")
        masivs.append("sodium: 0.2%")
       // masivs.append("calcium: 22%")
        masivs.append("starch: 25.4%")
       // masivs.append("magnesium: 0.6%")
        
        masivs.append("choline: 0.2%")
        masivs.append("dl-methionine: 0.15%")
       // masivs.append("hcl-insoluble ash: 4.8%")
       // masivs.append("calcium: 0.9%")
       // masivs.append("phosphorous: 3%")
       // masivs.append("cellulose: 1%")
        //masivs.append("potassium: 0.8%")
        //masivs.append("Fibre: 3%")
       // masivs.append("chloride: 5%")
        //masivs.append("potassium: 1.2%")
       // masivs.append("glucose: 0.8%")
        
        
        
        nosaukums = "Legaphyton"
       /* let db = Firestore.firestore()
        db.collection("ingredients").document(nosaukums).setData(["ProductName": nosaukums, "composition": mas, "additivesPerKG": m, "analyticalConstituents": masivs]) { (err) in
            if err != nil{
                
            }
        }*/
        
        
        
        //Dabūt no Firebase + partaisit ingrDati
        /*
        let db = Firestore.firestore()
        
        db.collection("ingredients").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents
            else {
                print("Nav sadu compositionu!")
                return
            }
            self.ingr = documents.map {(queryDocumentSnapshot) -> ingrDati in
                let nos = queryDocumentSnapshot.data()
                let sasta = nos["ProductName"] as? String ?? ""
                print(sasta)//nosaukums
                
                let sastavdalina: [String] = nos["analyticalConstituents"] as? [String] ?? [""]
                print(sastavdalina)//sastavadalu masivs
                for i in 0..<sastavdalina.count {
                    if sastavdalina[i] == "Crude ash: 17.5%" {
                        print("Ir \(sastavdalina[i])")
                    }
                    if sastavdalina[i].contains("Crude") {
                        print("Ir pusvards") //"Crude" vietā meklējamais vārds!!!
                    }
                }
                return ingrDati(sast: sastavdalina)
            }
        }*/
        
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
