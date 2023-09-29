//
//  RegisterView.swift
//  Nano3
//
//  Created by Camila Spolador on 26/09/23.
//

import SwiftUI

struct RegisterView: View {

    @EnvironmentObject private var bandsManager: BandsManager
    @Environment(\.dismiss) private var dismiss
    
    @State var artistName: String = ""
    @State var ticketPrice: String = ""
    @State var withWho: String = ""
    @State var location: String = ""
    @State var eventDate = Date()
    @State var openingOfTheGates = Date()
    @State var observations: String = ""
    @State var selectedSpot: PickerSpotView.Spot = .track
    
    @State var toggleOnMainAttraction: Bool = false
    @State var toggleOnFestival: Bool = false
    
    var body: some View {
        Form {
            TextFieldView(artistName: $artistName, ticketPrice: $ticketPrice, withWho: $withWho, location: $location, eventDate: $eventDate, openingOfTheGates: $openingOfTheGates)
            
            StepperView()
            
            ToggleView(toggleOnMainAttraction: $toggleOnMainAttraction, toggleOnFestival: $toggleOnFestival)
            
            PickerSpotView(selectedSpot: $selectedSpot)
            
            ObservationFieldView(observations: $observations)
            
        }
        .navigationTitle("New concert")
        .toolbar {
            Button {
                bandsManager.addBand(BandModel(title: artistName, isChecked: true, stars: 2, date: eventDate, location: location, withWho: withWho, ticketPrice: ticketPrice, spot: selectedSpot, mainAttraction: toggleOnMainAttraction ? "Main attraction" : "opening band", observations: observations, openingOfGates: openingOfTheGates))
                dismiss()
            } label: {
                HStack {
                    Text("Save")
                }
                .foregroundColor(.blue)
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RegisterView()
        }
        .environmentObject(BandsManager())
    }
}
