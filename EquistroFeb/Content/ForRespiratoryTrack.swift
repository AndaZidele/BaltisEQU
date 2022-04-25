//
//  ForRespiratoryTrack.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 15/02/2022.
//

import Foundation
import UIKit

struct ForRespiratoryTrack {
    var name: String
    var image: String
    var ingred: String
    var apraksts: String
    var urls: String
    var cena: Double
    
    static func createFRTs() -> [ForRespiratoryTrack] {
        var forRespTracks: [ForRespiratoryTrack] = []
        
        let names = ContentManager.shared.frtNames
        let images = ContentManager.shared.frtImages
        let ingreds = ContentManager.shared.frtComposition
        let apr = ContentManager.shared.frtApraksts
        let u = ContentManager.shared.frtUrl
        let d = ContentManager.shared.frtCena
        
        for i in 0..<names.count {
            let forRespTrack = ForRespiratoryTrack(name: names[i], image: images[i], ingred: ingreds[i], apraksts: apr[i], urls: u[i], cena: d[i])
            forRespTracks.append(forRespTrack)
        }
        return forRespTracks
    }
}
