//
//  ProductsViewController.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 03/02/2022.
//

import UIKit

class ProductsViewController: UIViewController {

    
    //Sis tgd strādā!!!!!
    var products: Int = -1
    //pagaidam sos nevajag
    
    override func viewDidLoad() {
        super.viewDidLoad()

        products = -1
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func musclesTapped(_ sender: Any) {
        products = 0
    }
    
    @IBAction func musculoSystemTapped(_ sender: Any) {
        products = 1
    }
    
    
    @IBAction func skinTapped(_ sender: Any) {
        products = 2
    }
    
    @IBAction func metabolismTapped(_ sender: Any) {
        products = 3
    }
    
    @IBAction func breedingTapped(_ sender: Any) {
        products = 4
    }
    @IBAction func highPerfTapped(_ sender: Any) {
        products = 5
    }
    @IBAction func digestiveSystTapped(_ sender: Any) {
        products = 6
    }
    @IBAction func nervousSystTapped(_ sender: Any) {
        products = 7
    }
    
    @IBAction func respiratTrackTapped(_ sender: Any) {
        products = 8
    }
    @IBAction func vitaminsMineralsTapped(_ sender: Any) {
        products = 9
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let toParts = segue.destination as! ForMusculoskeletalSystemTableViewController
        //toParts.
            toParts.part = products
        print(products)
            products = -1
    }
    

}
