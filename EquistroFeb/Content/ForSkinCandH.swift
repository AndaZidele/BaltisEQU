//
//  ForSkinCandH.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 07/02/2022.
//

import Foundation

struct ForSkinCandH {
    
    var name: String
    var image: String
    var ingred: String
    var apraksts: String
    var urls: String
    var cena: Double
    
    static func createFSkinCandH() -> [ForSkinCandH] {
        
        var forSkinCandHs: [ForSkinCandH] = []
        
        let names = ContentManager.shared.fschNames
        let images = ContentManager.shared.fschImages
        let ingreds = ContentManager.shared.fschComposition
        let apr = ContentManager.shared.fschApraksts
        let u = ContentManager.shared.fschUrl
        let d = ContentManager.shared.fschCena
        
        for i in 0..<names.count {
            let forSkinCandH = ForSkinCandH(name: names[i], image: images[i], ingred: ingreds[i], apraksts: apr[i], urls: u[i], cena: d[i])
            forSkinCandHs.append(forSkinCandH)
        }
        return forSkinCandHs
    }
    
}
