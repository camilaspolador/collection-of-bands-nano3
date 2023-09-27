//
//  Model.swift
//  Nano3
//
//  Created by Camila Spolador on 27/09/23.
//

import SwiftUI

struct BandModel: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var isChecked: Bool
    var stars: Int
    var date: String
    var location: String
    var withWho: String
    var ticketPrice: String
    var spot: String
    var mainAttraction: String
    var observations: String
    var openingOfGates: String
}
