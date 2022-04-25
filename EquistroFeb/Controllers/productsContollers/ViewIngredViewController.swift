//
//  ViewIngredViewController.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 12/03/2022.
//

import UIKit

class ViewIngredViewController: UIViewController {

    var nosaukums: String!
    //var noVisiem: ForAllProducts!
    
    @IBOutlet weak var srlView: UIScrollView!
    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        srlView.maximumZoomScale = 4
        srlView.minimumZoomScale = 0.5
        srlView.delegate = self
        // Do any additional setup after loading the view.
        
        if nosaukums != nil {
            imgView.image = UIImage(named: nosaukums)
        } else {
            imgView.image = UIImage(named: "zirgs.imageset")
        }
        
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
extension ViewIngredViewController: UIScrollViewDelegate {
    func viewForZooming(in srlView: UIScrollView) -> UIView? {
        return imgView
    }
}
