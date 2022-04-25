//
//  MineralsVitamins.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 15/02/2022.
//

import Foundation
import UIKit

struct MineralsVitamins {
    var name: String
    var image: String
    var ingred: String
    var apraksts: String
    var urls: String
    var cena: Double
    
    static func createMinVits() -> [MineralsVitamins] {
        var minerals: [MineralsVitamins] = []
        
        let names = ContentManager.shared.vmNames
        let images = ContentManager.shared.vmImages
        let ingreds = ContentManager.shared.vmComposition
        let apr = ContentManager.shared.vmApraksts
        let u = ContentManager.shared.vmUrl
        let d = ContentManager.shared.vmCena
        
        for i in 0..<names.count {
            let mineral = MineralsVitamins(name: names[i], image: images[i], ingred: ingreds[i], apraksts: apr[i], urls: u[i], cena: d[i])
            minerals.append(mineral)
        }
        
        return minerals
    }
}
