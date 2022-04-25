//
//  ForDigestiveSystem.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 15/02/2022.
//

import Foundation
import UIKit

struct ForDigestiveSystem {
    var name: String
    var image: String
    var ingred: String
    var apraksts: String
    var urls: String
    var cena: Double
    
    static func createFDSs() -> [ForDigestiveSystem] {
        var forDigestiveSs: [ForDigestiveSystem] = []
        
        let names = ContentManager.shared.fdsNames
        let images = ContentManager.shared.fdsImages
        let ingreds = ContentManager.shared.fdsComposition
        let apr = ContentManager.shared.fdsApraksts
        let u = ContentManager.shared.fdsUrl
        let d = ContentManager.shared.fdsCena
        
        for i in 0..<names.count {
            let forDigestiveS = ForDigestiveSystem(name: names[i], image: images[i], ingred: ingreds[i], apraksts: apr[i], urls: u[i], cena: d[i])
            forDigestiveSs.append(forDigestiveS)
        }
        return forDigestiveSs
    }
}
