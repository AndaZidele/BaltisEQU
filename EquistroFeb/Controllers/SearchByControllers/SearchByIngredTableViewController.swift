//
//  SearchByIngredTableViewController.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 09/03/2022.
//

import UIKit
import Firebase
import FirebaseFirestore

class SearchByIngredTableViewController: UITableViewController {
    
    var visi = ForAllProducts.createVisi()
    var produktaNosaukums: String = ""
    
    var nosaukumsSearch = [searchTittle]()
    var ingr = [ingrDati]()
    @IBOutlet weak var searchingName: UITextField!
    var meklejVards: String = ""
    var skaititajs: Int = 0
    //var ingredName: String = ""
    var masivs: [String] = []
    var newArray: [String] = []
    var masivsNavigation: [String] = []
    
    //private var SearchByIngr: UITableView?
    var part: Int = -1
    var skaits = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        //tableView.dataSource = nil
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
    }

    
    @IBAction func findBtnTapped(_ sender: Any) {
        newArray = []
        print("Seit Seit: \(newArray)")
        let db = Firestore.firestore()
        let ingNam: String = searchingName.text ?? ""
        var ingName: String = ingNam.lowercased()
        db.collection("ingredients").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents
            else {
                print("Nav sadu compositionu!")
                return
            }
            self.ingr = documents.map {(queryDocumentSnapshot) -> ingrDati in
                let nos = queryDocumentSnapshot.data()
                let sasta = nos["ProductName"] as? String ?? ""
                let sastavdalina: [String] = nos["analyticalConstituents"] as? [String] ?? [""]
                let sastavd: [String] = nos["composition"] as? [String] ?? [""]
                let sastav: [String] = nos["additivesPerKG"] as? [String] ?? [""]
                for i in 0..<sastavdalina.count {
                    if sastavdalina[i].contains(ingName) {
                        self.masivs.append(sasta)
                    }
                }
                for i in 0..<sastavd.count {
                    if sastavd[i].contains(ingName) {
                        self.masivs.append(sasta)
                    }
                }
                for i in 0..<sastav.count {
                    if sastav[i].contains(ingName) {
                        self.masivs.append(sasta)
                    }
                }
                //Lai neatkārtojas nosaukumi!!!
                if self.masivs.count > 0{
                    for i in 0..<(self.masivs.count - 1) {
                        if self.masivs[i] == self.masivs[(i + 1)] {
                            self.masivs[i] = ""
                        }
                    }
                }
                var jaunsMasivs: [String] = []
                
                for i in 0..<(self.masivs.count) {
                    if self.masivs[i] != "" {
                        jaunsMasivs.append(self.masivs[i])
                    }
                }
                
                self.skaits = jaunsMasivs.count
                self.newArray = jaunsMasivs
                //print(self.newArray)
                //seit tgd!!!
                if jaunsMasivs.count > 0 {
                    let elements = jaunsMasivs[0]
                    //print(elements)
                    for i in 0..<self.visi.count {
                        let fmusc = self.visi[i]
                        if fmusc.name == elements {
                           // print("Sakrīt nosaukumi Te!!!")
                           // print(fmusc.image)
                            //self.newArray.append(elements)
                        } else {
                           // print("Nesakrīt")
                        }
                    }
                }
                //self.masivs = []
                //print(self.masivs)
                //print(jaunsMasivs)
                //print("Seit: \(self.newArray)")
                
                return ingrDati(sast: sastavdalina)
            }
            
            
            
            //te ir jaizdzes vecas cells
            if self.skaits == 0 {
                let pazinojums = UIAlertController(title: "", message: "Any product which ingredients include \(ingName) not found!", preferredStyle: .alert)
                pazinojums.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                self.present(pazinojums, animated: true, completion: nil)
            }
            ingName = "bumbulitis"
            //self.tableView.delete(self.findBtnTapped(_:))
            self.tableView.reloadData()
            self.skaits = 0
            //print("Te: \(self.masivs)")
            self.masivs = []
            
        }
        searchingName.text = ""
    }
    /*
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
    }*/
    
    
    // MARK: - Table view data source

    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }*/

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return skaits
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "searchByIngred", for: indexPath) as? SearchByIngredTableViewCell else {return UITableViewCell()}
        
        //Sis atgriez pareizi
        for i in 0..<self.newArray.count {
        //if self.newArray.count > 0 {
            for j in 0..<self.visi.count {
                if self.newArray[i] == self.visi[j].name {
                    cell.ingredName.text = self.visi[j].name
                    cell.ingredImage.image = UIImage(named: visi[j].image)
                    //print(self.visi[j].name)
                    //print(self.newArray[i])
                    self.masivsNavigation.append(self.newArray[i])
                    self.newArray[i] = ""
                    skaits = 0
                    return cell
                }
            }
            
            //tableView.dataSource = nil
        }
        
        //skaits = 0
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }


    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
        
        if let indexPath = tableView.indexPathForSelectedRow {
            
            var tekstsToNavigate: String = ""
            
            print(masivsNavigation[indexPath.row])
            tekstsToNavigate = masivsNavigation[indexPath.row]
            
            
            let oneProductView = segue.destination as! OneForMusculoskeletalSystemViewController
            oneProductView.skaitsForRow = tekstsToNavigate
            
        
            
        }
            
    }
    

}

