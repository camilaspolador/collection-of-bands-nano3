//
//  CardBandView.swift
//  Nano3
//
//  Created by Camila Spolador on 26/09/23.
//

import SwiftUI

struct CardBandsView: View {
    let data: BandModel
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(maxWidth: 131)
            VStack(alignment: .leading, spacing: 8) {
                titleWithCheck
                StarsHStackView(starsCount: data.stars)
                HStack {
                    date
                    Text("•")
                    openingOfGates
                }
                location
            }
            .padding(16)
            
        }
        .frame(maxHeight: 131)
        .background(.thinMaterial)
        .cornerRadius(23)
    }
    
    var titleWithCheck: some View {
        HStack {
            Text(data.title)
                .frame(maxWidth: . infinity, alignment: .leading)
                .foregroundColor(.black)
            
            if data.isChecked {
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.green)
            }
        }
        .font(.headline)
    }
    
    
    
    var date: some View {
        Text(data.date)
            .font(.subheadline)
            .foregroundColor(.black)
    }
    
    var openingOfGates: some View {
        Text(data.openingOfGates)
            .font(.subheadline)
            .foregroundColor(.black)
    }
    var location: some View {
        Text(data.location)
            .font(.subheadline)
            .foregroundColor(.black)
    }
    
}

struct CardBandsView_Previews: PreviewProvider {
    static var previews: some View {
        CardBandsView(data: BandModel(title: "Metallica", isChecked: true, stars: 4, date: "25/05/2022", location: "Estádio Couto Pereira", withWho: "Carol and Gabriel", ticketPrice: "R$ 350", spot: "Track", mainAttraction: "Main attraction", observations: "Lorem ipsum dolor sit amet. Et similique veniam aut impedit minima sit ducimus excepturi et ipsa porro est delectus quae quo quia amet.", openingOfGates: "17:00"))
    }
}
