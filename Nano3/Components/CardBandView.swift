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
                    .font(.callout)
                    .foregroundColor(.pink)
                HStack {
                    date
                    Text("•")
                    openingOfGates
                }
                location
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 8)
            
        }
        .frame(maxHeight: 131)
        .background(Color("Clear"))
        .cornerRadius(23)
    }
    
    var titleWithCheck: some View {
        HStack {
            Text(data.title)
                .frame(maxWidth: . infinity, alignment: .leading)
                .foregroundColor(.black)
            
            if data.date <= Date.now {
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.green)
            }
        }
        .font(.custom("Bonema", size: 18))
    }
    
    
    
    var date: some View {
        Text(data.date.formatted())
            .font(.subheadline)
            .foregroundColor(.black)
    }
    
    var openingOfGates: some View {
        Text(data.openingOfGates.formatted())
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
        CardBandsView(data: BandModel(title: "Metallica", isChecked: true, stars: 4, date: Date.now, location: "Estádio Couto Pereira", withWho: "Carol and Gabriel", ticketPrice: "R$ 350", spot: PickerSpotView.Spot.box, mainAttraction: "Main attraction", observations: "Lorem ipsum dolor sit amet. Et similique veniam aut impedit minima sit ducimus excepturi et ipsa porro est delectus quae quo quia amet.", openingOfGates: Date.now))
    }
}
