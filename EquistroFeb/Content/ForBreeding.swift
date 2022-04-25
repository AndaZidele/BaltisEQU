//
//  ForBreeding.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 07/02/2022.
//

import Foundation

struct ForBreeding {
    
    var name: String
    var image: String
    var ingred: String
    var apraksts: String
    var urls: String
    var cena: Double
    
    static func createFBs() -> [ForBreeding] {
        var forBreedings: [ForBreeding] = []
        
        let names = ContentManager.shared.fbNames
        let images = ContentManager.shared.fbImages
        let ingreds = ContentManager.shared.fbComposition
        let apr = ContentManager.shared.fbApraksts
        let u = ContentManager.shared.fbUrl
        let d = ContentManager.shared.fbCena
        
        for i in 0..<names.count {
            let forBreeding = ForBreeding(name: names[i], image: images[i], ingred: ingreds[i], apraksts: apr[i], urls: u[i], cena: d[i])
            forBreedings.append(forBreeding)
        }
        return forBreedings
    }
    
}
