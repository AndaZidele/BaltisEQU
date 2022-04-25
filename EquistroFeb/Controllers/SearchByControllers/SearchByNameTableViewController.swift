//
//  SearchByNameTableViewController.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 28/03/2022.
//

import UIKit
import Firebase
import FirebaseFirestore

class SearchByNameTableViewController: UITableViewController {

    @IBOutlet weak var searchedName: UITextField!
    
    var visi = ForAllProducts.createVisi()
    var produktaNosaukums: String = ""
    var ingr = [ingrDati]()
    
    var masivs: [String] = []
    var newArray: [String] = []
    var masivsNavigation: [String] = []
    
    var part: Int = -1
    var skaits = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func findBtnTapped(_ sender: Any) {
        let db = Firestore.firestore()
        let ingNam: String = searchedName.text ?? ""
        var ingName: String = ingNam.lowercased()
        db.collection("ingredients").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents
            else {
                print("Nav sadu compositionu!")
                return
            }
            self.ingr = documents.map {(queryDocumentSnapshot) -> ingrDati in
                let nos = queryDocumentSnapshot.data()
                let sasta: String = nos["ProductName"] as? String ?? ""
                let sastavdalina: [String] = nos["analyticalConstituents"] as? [String] ?? [""]
                let nosaukumins = sasta.lowercased()
                if nosaukumins.contains(ingName) {
                    self.masivs.append(sasta)
                }
                
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
                //seit pārskata, vai neatkārtojas ==>Bufallo algoritms!!!
                func saturAtkartotiToPasuVertibu(_ masivs: [String]) -> Bool {
                    var vardnica = Set<String>()
                    
                    for i in masivs {
                        if vardnica.contains(i) {
                            return true
                        } else {
                            vardnica.insert(i)
                        }
                    }
                    return false
                }
                print(saturAtkartotiToPasuVertibu(jaunsMasivs))
                
                
                self.skaits = jaunsMasivs.count
                self.newArray = jaunsMasivs
                //print(self.newArray)
                if jaunsMasivs.count > 0 {
                    let elements = jaunsMasivs[0]
                    for i in 0..<self.visi.count {
                        let fmusc = self.visi[i]
                        if fmusc.name == elements {
                        } else {
                        }
                    }
                }
                
                return ingrDati(sast: sastavdalina)
            }
            
            if self.skaits == 0 {
                let pazinojums = UIAlertController(title: "", message: "Any product which name includes \(ingName) not found!", preferredStyle: .alert)
                pazinojums.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                self.present(pazinojums, animated: true, completion: nil)
            }
            
            ingName = "bumbulitis"
            self.tableView.reloadData()
            self.skaits = 0
            self.masivs = []
            
            
        }
        searchedName.text = ""
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return skaits
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "searchByName", for: indexPath) as? SearchByNameTableViewCell else {return UITableViewCell()}
        for i in 0..<self.newArray.count {
        //if self.newArray.count > 0 {
            for j in 0..<self.visi.count {
                if self.newArray[i] == self.visi[j].name {
                    cell.nameLabel.text = self.visi[j].name
                    cell.nameImage.image = UIImage(named: visi[j].image)
                    //print(self.visi[j].name)
                    //print(self.newArray[i])
                    self.masivsNavigation.append(self.newArray[i])
                    self.newArray[i] = ""
                    return cell
                }
            }
        }
        return cell
    }

     /*
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
    }*/

        
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
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
