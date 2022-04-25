//
//  kontakti.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 28/03/2022.
//

import Foundation
import UIKit

struct kontakti {
    
    var valsts: String
    var telefons: String
    var epasts: String
    var karogs: String
    
    static func createKontakti() -> [kontakti] {
        var Kontakti: [kontakti] = []
        
        let valstis = ContentManager.shared.valstis
        let telefoni = ContentManager.shared.telefoni
        let epasti = ContentManager.shared.epasti
        let karogi = ContentManager.shared.valstisImg
        
        for i in 0..<valstis.count {
            let Kontakts = kontakti(valsts: valstis[i], telefons: telefoni[i], epasts: epasti[i], karogs: karogi[i])
            Kontakti.append(Kontakts)
        }
        
        return Kontakti
    }
    
}
