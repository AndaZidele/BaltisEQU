//
//  ForMetabolism.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 07/02/2022.
//

import Foundation

struct ForMetabolism {
    
    var name: String
    var image: String
    var ingred: String
    var apraksts: String
    var urls: String
    var cena: Double
    
    static func createFMet() -> [ForMetabolism] {
        var forMetabolisms: [ForMetabolism] = []
        
        let names = ContentManager.shared.fmetNames
        let images = ContentManager.shared.fmetImages
        let ingreds = ContentManager.shared.fmetComposition
        let apr = ContentManager.shared.fmetApraksts
        let u = ContentManager.shared.fmetUrl
        let d = ContentManager.shared.fmetCena
        
        for i in 0..<names.count {
            let forMetabolism = ForMetabolism(name: names[i], image: images[i], ingred: ingreds[i], apraksts: apr[i], urls: u[i], cena: d[i])
            forMetabolisms.append(forMetabolism)
        }
        return forMetabolisms
    }
    
}
