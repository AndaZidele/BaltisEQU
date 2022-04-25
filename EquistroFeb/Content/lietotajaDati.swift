//
//  lietotajaDati.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 22/02/2022.
//

import Foundation

struct lietotajaDati: Hashable, Codable {
    var uid: String = UUID().uuidString
    var email: String
    var name: String
    var surname: String
    var produktiArray: [String]
    var orders: [String]
    var cena: Double
    var valsts: String
    var pakomataAdrese: String
    var telefons: String
    var cenuMasivs: [String]
}
