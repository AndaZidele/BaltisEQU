//
//  ForAllProducts.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 10/03/2022.
//

import Foundation
import UIKit

struct ForAllProducts {
    var name: String
    var image: String
    var ingred: String
    var apraksts: String
    var urls: String
    var cena: Double
    
    static func createVisi() -> [ForAllProducts] {
        var forVisi: [ForAllProducts] = []
        let names = ContentManager.shared.visiNames
        let images = ContentManager.shared.visiImages
        let ingreds = ContentManager.shared.visiComposition
        let apr = ContentManager.shared.visiApraksts
        let u = ContentManager.shared.visiUrl
        let d = ContentManager.shared.cenaVisi
        
        for i in 0..<names.count {
            let forVis = ForAllProducts(name: names[i], image: images[i], ingred: ingreds[i], apraksts: apr[i], urls: u[i], cena: d[i])
            forVisi.append(forVis)
        }
        
        return forVisi
    }
    
}
