//
//  BandView.swift
//  Nano3
//
//  Created by Camila Spolador on 26/09/23.
//

import SwiftUI

struct BandView: View {
    
    var data: BandModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 16) {
                Text(data.title)
                    .font(.custom("Bonema", size: 34))
                
                StarsHStackView(starsCount: data.stars)
                    .font(.headline)
                    .foregroundColor(.pink)
                
                Text(data.observations)
                HStack {
                    Text(data.date.formatted())
                        .padding(.horizontal, 12)
                        .padding(.vertical, 5)
                        .background(.gray)
                        .cornerRadius(7)
                        .font(.headline)
                    
                    Text(data.location)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 5)
                        .background(.gray)
                        .cornerRadius(7)
                        .font(.headline)
                }
                HStack {
                    
                    Text(data.withWho)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 5)
                        .background(.gray)
                        .cornerRadius(7)
                        .font(.headline)
                    
                    Text(data.ticketPrice)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 5)
                        .background(.gray)
                        .cornerRadius(7)
                        .font(.headline)
                }
                HStack {
                    
                    Text(data.spot.rawValue)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 5)
                        .background(.gray)
                        .cornerRadius(7)
                        .font(.headline)
                    
                    Text(data.mainAttraction)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 5)
                        .background(.gray)
                        .cornerRadius(7)
                        .font(.headline)
                }
            }
            .padding(16)
            ZStack(alignment: .topTrailing) {
                Rectangle()
                    .cornerRadius(23)
                    .ignoresSafeArea()
                
                if data.date <= Date.now {
                    Image(systemName: data.isChecked ? "checkmark.seal.fill" : "")
                        .foregroundColor(.green)
                        .font(.title)
                        .padding(16)
                }
            }
            
        }

    }
}

struct BandView_Previews: PreviewProvider {
    static var previews: some View {
        BandView(data: BandModel(title: "Metallica", isChecked: true, stars: 4, date: Date.now, location: "Estádio Couto Pereira", withWho: "Carol and Gabriel", ticketPrice: "R$ 350", spot: PickerSpotView.Spot.box, mainAttraction: "Main attraction", observations: "Lorem ipsum dolor sit amet. Et similique veniam aut impedit minima sit ducimus excepturi et ipsa porro est delectus quae quo quia amet.", openingOfGates: Date.now))
    }
}
