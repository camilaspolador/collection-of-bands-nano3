//
//  PickerSpotView.swift
//  Nano3
//
//  Created by Camila Spolador on 28/09/23.
//

import SwiftUI

struct PickerSpotView: View {
    
    @Binding var selectedSpot: Spot
    
    enum Spot: String, CaseIterable, Identifiable {
        case track, premiumTrack, box, grandstand, festival, other
        var id: Self { self }
    }
    
    var body: some View {
        Picker("Location at the concert", selection: $selectedSpot) {
            Text("Track").tag(Spot.track)
            Text("Premium Track").tag(Spot.premiumTrack)
            Text("Box").tag(Spot.box)
            Text("Grandstand").tag(Spot.grandstand)
            Text("Festival").tag(Spot.festival)
            Text("Other").tag(Spot.other)
        }
    }
}

struct PickerSpotView_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            PickerSpotView(selectedSpot: .constant(.track))
        }
    }
}
