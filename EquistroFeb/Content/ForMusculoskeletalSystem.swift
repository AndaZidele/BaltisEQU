//
//  ForMusculoskeletalSystem.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 05/02/2022.
//

import Foundation

struct ForMusculoskeletalSystem {
    
    var name: String
    var image: String
    var ingred: String
    var apraksts: String
    var urls: String
    var cena: Double
    
    static func createFMSs() -> [ForMusculoskeletalSystem] {
        var forMusculoskeletalSystems: [ForMusculoskeletalSystem] = []
        
        let names = ContentManager.shared.fmsNames
        let images = ContentManager.shared.fmsImages
        let ingreds = ContentManager.shared.fmsComposition
        let apr = ContentManager.shared.fmsApraksts
        let u = ContentManager.shared.fmsUrl
        let d = ContentManager.shared.fmsCena
        
        for i in 0..<names.count {
            let forMusculoskeletalSystem = ForMusculoskeletalSystem(name: names[i], image: images[i], ingred: ingreds[i], apraksts: apr[i], urls: u[i], cena: d[i]) //,image: images[i],...
            forMusculoskeletalSystems.append(forMusculoskeletalSystem)
        }
        return forMusculoskeletalSystems
        
    }
    
    
}

