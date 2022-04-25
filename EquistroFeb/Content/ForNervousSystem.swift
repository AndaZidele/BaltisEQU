//
//  ForNervousSystem.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 15/02/2022.
//

import Foundation
import UIKit

struct ForNervousSystem {
    var name: String
    var image: String
    var ingred: String
    var apraksts: String
    var urls: String
    var cena: Double
    
    static func createFNSs() -> [ForNervousSystem] {
        var forNervousSs: [ForNervousSystem] = []
        
        let names = ContentManager.shared.fnsNames
        let images = ContentManager.shared.fnsImages
        let ingreds = ContentManager.shared.fnsComposition
        let apr = ContentManager.shared.fnsApraksts
        let u = ContentManager.shared.fnsUrl
        let d = ContentManager.shared.fnsCena
        
        for i in 0..<names.count {
            let forNervousS = ForNervousSystem(name: names[i], image: images[i], ingred: ingreds[i], apraksts: apr[i], urls: u[i], cena: d[i])
            forNervousSs.append(forNervousS)
        }
        return forNervousSs
    }
}
