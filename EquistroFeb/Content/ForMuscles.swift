//
//  ForMuscles.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 07/02/2022.
//

import Foundation
import UIKit

struct ForMuscles {
    
    var name: String
    var image: String
    var ingred: String
    var apraksts: String
    var urls: String
    var cena: Double
    
    static func createFMs() -> [ForMuscles] {
        var forMuscles: [ForMuscles] = []
        
        let names = ContentManager.shared.fmuscNames
        let images = ContentManager.shared.fmuscImages
        let ingreds = ContentManager.shared.fmuscComposition
        let apr = ContentManager.shared.fmuscApraksts
        let u = ContentManager.shared.fmuscUrl
        let d = ContentManager.shared.fmuscCena
        
        for i in 0..<names.count {
            let forMuscle = ForMuscles(name: names[i], image: images[i], ingred: ingreds[i], apraksts: apr[i], urls: u[i], cena: d[i])
            forMuscles.append(forMuscle)
        }
        
        return forMuscles
    }
    
}
