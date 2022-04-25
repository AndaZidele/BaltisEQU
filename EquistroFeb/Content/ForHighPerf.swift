//
//  ForHighPerf.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 15/02/2022.
//

import Foundation
import UIKit

struct ForHighPerf {
    var name: String
    var image: String
    var ingred: String
    var apraksts: String
    var urls: String
    var cena: Double
    
    static func createFHPs() -> [ForHighPerf] {
        var forHighPs: [ForHighPerf] = []
        
        let names = ContentManager.shared.fhpNames
        let images = ContentManager.shared.fhpImages
        let ingreds = ContentManager.shared.fhpComposition
        let apr = ContentManager.shared.fhpApraksts
        let u = ContentManager.shared.fhpUrl
        let d = ContentManager.shared.fhpCena
        
        for i in 0..<names.count {
            let forHighP = ForHighPerf(name: names[i], image: images[i], ingred: ingreds[i], apraksts: apr[i], urls: u[i], cena: d[i])
            forHighPs.append(forHighP)
        }
        
        return forHighPs
    }
}
