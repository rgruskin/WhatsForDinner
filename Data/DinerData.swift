//
//  DinerData.swift
//  WhatsForDinner
//
//  Created by Rich Gruskin on 4/20/21.
//

import Foundation

class Dinner :Identifiable, Decodable {
    var id:UUID??
    var name = ""
    var weight = ""
}
