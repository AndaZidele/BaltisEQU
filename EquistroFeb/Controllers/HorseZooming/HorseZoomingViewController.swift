//
//  HorseZoomingViewController.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 11/03/2022.
//

import UIKit

class HorseZoomingViewController: UIViewController {

    var products: Int = -1
    
    @IBOutlet weak var vitamBtn: UIButton!
    @IBOutlet weak var nervBtn: UIButton!
    @IBOutlet weak var muscSystBtn: UIButton!
    @IBOutlet weak var musSystBtn: UIButton!
    @IBOutlet weak var hoovsBtn: UIButton!
    @IBOutlet weak var hovsBtn: UIButton!
    @IBOutlet weak var coatBtn: UIButton!
    @IBOutlet weak var breedBtn: UIButton!
    @IBOutlet weak var respTrBtn: UIButton!
    @IBOutlet weak var highPerfBtn: UIButton!
    @IBOutlet weak var metabBtn: UIButton!
    @IBOutlet weak var digSystBtn: UIButton!
    @IBOutlet weak var muscBtn: UIButton!
    @IBOutlet weak var musBtn: UIButton!
    
    
    @IBOutlet weak var kopView: UIView!
    @IBOutlet weak var scrolView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Screenshot 2022-03-28 at 16.49.22.imageset")!)
        //self.imageView.backgroundColor = UIColor.init(white: 18, alpha: 0.01)
        //self.imageView.isOpaque = false
        
        
        
        products = -1
        
        vitamBtn.titleLabel?.font = .systemFont(ofSize: 7)
        nervBtn.titleLabel?.font = .systemFont(ofSize: 7)
        muscSystBtn.titleLabel?.font = .systemFont(ofSize: 7)
        musSystBtn.titleLabel?.font = .systemFont(ofSize: 7)
        hoovsBtn.titleLabel?.font = .systemFont(ofSize: 7)
        hovsBtn.titleLabel?.font = .systemFont(ofSize: 7)
        coatBtn.titleLabel?.font = .systemFont(ofSize: 7)
        breedBtn.titleLabel?.font = .systemFont(ofSize: 7)
        muscBtn.titleLabel?.font = .systemFont(ofSize: 7)
        musBtn.titleLabel?.font = .systemFont(ofSize: 7)
        respTrBtn.titleLabel?.font = .systemFont(ofSize: 7)
        highPerfBtn.titleLabel?.font = .systemFont(ofSize: 7)
        metabBtn.titleLabel?.font = .systemFont(ofSize: 7)
        digSystBtn.titleLabel?.font = .systemFont(ofSize: 7)
        
        
        

        scrolView.maximumZoomScale = 4
        scrolView.minimumZoomScale = 0.5
        scrolView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        vitamBtn.titleLabel?.font = .systemFont(ofSize: 7)
        nervBtn.titleLabel?.font = .systemFont(ofSize: 7)
        muscSystBtn.titleLabel?.font = .systemFont(ofSize: 7)
        musSystBtn.titleLabel?.font = .systemFont(ofSize: 7)
        hoovsBtn.titleLabel?.font = .systemFont(ofSize: 7)
        hovsBtn.titleLabel?.font = .systemFont(ofSize: 7)
        coatBtn.titleLabel?.font = .systemFont(ofSize: 7)
        breedBtn.titleLabel?.font = .systemFont(ofSize: 7)
        muscBtn.titleLabel?.font = .systemFont(ofSize: 7)
        musBtn.titleLabel?.font = .systemFont(ofSize: 7)
        respTrBtn.titleLabel?.font = .systemFont(ofSize: 7)
        highPerfBtn.titleLabel?.font = .systemFont(ofSize: 7)
        metabBtn.titleLabel?.font = .systemFont(ofSize: 7)
        digSystBtn.titleLabel?.font = .systemFont(ofSize: 7)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        vitamBtn.titleLabel?.font = .systemFont(ofSize: 7)
        nervBtn.titleLabel?.font = .systemFont(ofSize: 7)
        muscSystBtn.titleLabel?.font = .systemFont(ofSize: 7)
        musSystBtn.titleLabel?.font = .systemFont(ofSize: 7)
        hoovsBtn.titleLabel?.font = .systemFont(ofSize: 7)
        hovsBtn.titleLabel?.font = .systemFont(ofSize: 7)
        coatBtn.titleLabel?.font = .systemFont(ofSize: 7)
        breedBtn.titleLabel?.font = .systemFont(ofSize: 7)
        muscBtn.titleLabel?.font = .systemFont(ofSize: 7)
        musBtn.titleLabel?.font = .systemFont(ofSize: 7)
        respTrBtn.titleLabel?.font = .systemFont(ofSize: 7)
        highPerfBtn.titleLabel?.font = .systemFont(ofSize: 7)
        metabBtn.titleLabel?.font = .systemFont(ofSize: 7)
        digSystBtn.titleLabel?.font = .systemFont(ofSize: 7)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        vitamBtn.titleLabel?.font = .systemFont(ofSize: 7)
        nervBtn.titleLabel?.font = .systemFont(ofSize: 7)
        muscSystBtn.titleLabel?.font = .systemFont(ofSize: 7)
        musSystBtn.titleLabel?.font = .systemFont(ofSize: 7)
        hoovsBtn.titleLabel?.font = .systemFont(ofSize: 7)
        hovsBtn.titleLabel?.font = .systemFont(ofSize: 7)
        coatBtn.titleLabel?.font = .systemFont(ofSize: 7)
        breedBtn.titleLabel?.font = .systemFont(ofSize: 7)
        muscBtn.titleLabel?.font = .systemFont(ofSize: 7)
        musBtn.titleLabel?.font = .systemFont(ofSize: 7)
        respTrBtn.titleLabel?.font = .systemFont(ofSize: 7)
        highPerfBtn.titleLabel?.font = .systemFont(ofSize: 7)
        metabBtn.titleLabel?.font = .systemFont(ofSize: 7)
        digSystBtn.titleLabel?.font = .systemFont(ofSize: 7)
    }
    
    
    
    @IBAction func vitamBtnTapped(_ sender: Any) {
        //vitamBtn.titleLabel?.font = .systemFont(ofSize: 7)
        products = 9
        let navigateTo = "hzproducts"
        let navWindow = storyboard?.instantiateViewController(identifier: navigateTo) as? HZProductsTableViewController
        navWindow?.part = products
        self.view.window?.rootViewController = navWindow
        self.view.window?.makeKeyAndVisible()
        //self.viewWillDisappear(true)
        
        //self.viewWillAppear(true)
       // self.view.reloadInputViews()
        //viewWillAppear(self.viewDidLoad())
        //return self.viewDidLoad()
    }
    
    @IBAction func nervBtnTapped(_ sender: Any) {
        products = 7
        let navigateTo = "hzproducts"
        let navWindow = storyboard?.instantiateViewController(identifier: navigateTo) as? HZProductsTableViewController
        navWindow?.part = products
        self.view.window?.rootViewController = navWindow
        self.view.window?.makeKeyAndVisible()
    }
    @IBAction func respTraBtnTapped(_ sender: Any) {
        products = 5
        let navigateTo = "hzproducts"
        let navWindow = storyboard?.instantiateViewController(identifier: navigateTo) as? HZProductsTableViewController
        navWindow?.part = products
        self.view.window?.rootViewController = navWindow
        self.view.window?.makeKeyAndVisible()
    }
    
    @IBAction func highPerfBtnTapped(_ sender: Any) {
        products = 8
        let navigateTo = "hzproducts"
        let navWindow = storyboard?.instantiateViewController(identifier: navigateTo) as? HZProductsTableViewController
        navWindow?.part = products
        self.view.window?.rootViewController = navWindow
        self.view.window?.makeKeyAndVisible()
    }
    
    @IBAction func digSystBtnTapped(_ sender: Any) {
        products = 6
        let navigateTo = "hzproducts"
        let navWindow = storyboard?.instantiateViewController(identifier: navigateTo) as? HZProductsTableViewController
        navWindow?.part = products
        self.view.window?.rootViewController = navWindow
        self.view.window?.makeKeyAndVisible()
    }
    @IBAction func metabBtnTapped(_ sender: Any) {
        products = 3
        let navigateTo = "hzproducts"
        let navWindow = storyboard?.instantiateViewController(identifier: navigateTo) as? HZProductsTableViewController
        navWindow?.part = products
        self.view.window?.rootViewController = navWindow
        self.view.window?.makeKeyAndVisible()
    }
    
    @IBAction func muscSystBtnTapped(_ sender: Any) {
        products = 1
        //let point = sender.convert(CGPoint.zero, to: tableVi//)
        //let productDeleteVC = destination as! ForMusculoskeletalSystemTableViewController
        
        //tableView.reloadData()
        //self.tableView.reloadData()//te vjg si vietā uz citu biew controller un tad atpakalj!!!
        let navigateTo = "hzproducts"
        let navWindow = storyboard?.instantiateViewController(identifier: navigateTo) as? HZProductsTableViewController
        //navWindow?.dzesamais = self.newArrayForButtons[indexPath.row]
        navWindow?.part = products
        self.view.window?.rootViewController = navWindow
        self.view.window?.makeKeyAndVisible()
         
    }
    @IBAction func musSystBtnTapped(_ sender: Any) {
        products = 1
        let navigateTo = "hzproducts"
        let navWindow = storyboard?.instantiateViewController(identifier: navigateTo) as? HZProductsTableViewController
        navWindow?.part = products
        self.view.window?.rootViewController = navWindow
        self.view.window?.makeKeyAndVisible()
    }
    
    @IBAction func hoovsBtnTapped(_ sender: Any) {
        products = 2
        let navigateTo = "hzproducts"
        let navWindow = storyboard?.instantiateViewController(identifier: navigateTo) as? HZProductsTableViewController
        navWindow?.part = products
        self.view.window?.rootViewController = navWindow
        self.view.window?.makeKeyAndVisible()
    }
    @IBAction func hovsBtnTapped(_ sender: Any) {
        products = 2
        let navigateTo = "hzproducts"
        let navWindow = storyboard?.instantiateViewController(identifier: navigateTo) as? HZProductsTableViewController
        navWindow?.part = products
        self.view.window?.rootViewController = navWindow
        self.view.window?.makeKeyAndVisible()
    }
    @IBAction func coatBtnTapped(_ sender: Any) {
        products = 2
        let navigateTo = "hzproducts"
        let navWindow = storyboard?.instantiateViewController(identifier: navigateTo) as? HZProductsTableViewController
        navWindow?.part = products
        self.view.window?.rootViewController = navWindow
        self.view.window?.makeKeyAndVisible()
    }
    
    @IBAction func breedBtnTapped(_ sender: Any) {
        products = 4
        let navigateTo = "hzproducts"
        let navWindow = storyboard?.instantiateViewController(identifier: navigateTo) as? HZProductsTableViewController
        navWindow?.part = products
        self.view.window?.rootViewController = navWindow
        self.view.window?.makeKeyAndVisible()
    }
    
    @IBAction func musBtnTapped(_ sender: Any) {
        products = 0
        let navigateTo = "hzproducts"
        let navWindow = storyboard?.instantiateViewController(identifier: navigateTo) as? HZProductsTableViewController
        navWindow?.part = products
        self.view.window?.rootViewController = navWindow
        self.view.window?.makeKeyAndVisible()
    }
    @IBAction func muscBtnTapped(_ sender: Any) {
        products = 0
        let navigateTo = "hzproducts"
        let navWindow = storyboard?.instantiateViewController(identifier: navigateTo) as? HZProductsTableViewController
        navWindow?.part = products
        self.view.window?.rootViewController = navWindow
        self.view.window?.makeKeyAndVisible()
    }
    
    
    @IBAction func toMainViewTapped(_ sender: Any) {
        let homeVContr = "HomeVContr"
        let homeWindow = storyboard?.instantiateViewController(identifier: homeVContr) as? HomeViewController
        
        self.view.window?.rootViewController = homeWindow
        self.view.window?.makeKeyAndVisible()
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let toParts = segue.destination as! ForMusculoskeletalSystemTableViewController
        toParts.part = products
        //if let dest = segue.destination as? HorseZoomingViewController {
          //  dest.delegate = self
        //}
        /*if let dest = segue.destination as? ForMusculoskeletalSystemTableViewController {
            
        }*/
        
    }
    

}

extension HorseZoomingViewController: UIScrollViewDelegate {
    func viewForZooming(in scrolView: UIScrollView) -> UIView? {
        return kopView
    }
}
