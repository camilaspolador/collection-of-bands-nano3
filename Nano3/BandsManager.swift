//
//  BandsManager.swift
//  Nano3
//
//  Created by Camila Spolador on 28/09/23.
//

import Foundation

class BandsManager: ObservableObject {
    @Published var bands: [BandModel] = [
        BandModel(title: "Metallica", isChecked: true, stars: 4, date: Date.now, location: "Estádio Couto Pereira", withWho: "Carol and Gabriel", ticketPrice: "R$ 350", spot: PickerSpotView.Spot.box, mainAttraction: "Main attraction", observations: "Lorem ipsum dolor sit amet. Et similique veniam aut impedit minima sit ducimus excepturi et ipsa porro est delectus quae quo quia amet.", openingOfGates: Date.now),
        
        BandModel(title: "Red Hot Chilli Peppers", isChecked: true, stars: 4, date: Date.now, location: "Estádio Couto Pereira", withWho: "Carol and Gabriel", ticketPrice: "R$ 350", spot: PickerSpotView.Spot.box, mainAttraction: "Main attraction", observations: "Lorem ipsum dolor sit amet. Et similique veniam aut impedit minima sit ducimus excepturi et ipsa porro est delectus quae quo quia amet.", openingOfGates: Date.now)
    ]
    
    func addBand(_ band: BandModel) {
        bands.append(band)
    }
    
    @Published var currentBand: BandModel = BandModel(title: "Metallica", isChecked: true, stars: 4, date: Date.now, location: "Estádio Couto Pereira", withWho: "Carol and Gabriel", ticketPrice: "R$ 350", spot: PickerSpotView.Spot.box, mainAttraction: "Main attraction", observations: "Lorem ipsum dolor sit amet. Et similique veniam aut impedit minima sit ducimus excepturi et ipsa porro est delectus quae quo quia amet.", openingOfGates: Date.now)
}
