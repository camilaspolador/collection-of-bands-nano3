//
//  MainBandsView.swift
//  Nano3
//
//  Created by Camila Spolador on 26/09/23.
//

import SwiftUI

struct MainBandsView: View {
    @State var showingSheet: Bool = false
    @State var searchText: String = ""
    @State var currentBand: BandModel = BandModel(title: "Metallica", isChecked: true, stars: 4, date: "25/05/2022", location: "Estádio Couto Pereira", withWho: "Carol and Gabriel", ticketPrice: "R$ 350", spot: "Track", mainAttraction: "Main attraction", observations: "Lorem ipsum dolor sit amet. Et similique veniam aut impedit minima sit ducimus excepturi et ipsa porro est delectus quae quo quia amet.", openingOfGates: "17:00")
    
    var cards: [BandModel] = [
        BandModel(title: "Metallica", isChecked: true, stars: 4, date: "25/05/2022", location: "Estádio Couto Pereira", withWho: "Carol and Gabriel", ticketPrice: "R$ 350", spot: "Track", mainAttraction: "Main attraction", observations: "Lorem ipsum dolor sit amet. Et similique veniam aut impedit minima sit ducimus excepturi et ipsa porro est delectus quae quo quia amet.", openingOfGates: "17:00"),
        
        BandModel(title: "Red Hot Chilli Peppers", isChecked: true, stars: 4, date: "25/05/2022", location: "Estádio Couto Pereira", withWho: "Carol and Gabriel", ticketPrice: "R$ 350", spot: "Track", mainAttraction: "Main attraction", observations: "Lorem ipsum dolor sit amet. Et similique veniam aut impedit minima sit ducimus excepturi et ipsa porro est delectus quae quo quia amet.", openingOfGates: "17:00")
        
    ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            BandsListView(searchText: searchText, cards: cards, callback: { tappedCard in
                currentBand = tappedCard
                showingSheet.toggle()
            })
            .padding(16)
        }
        .sheet(isPresented: $showingSheet) {
            BandView(data: currentBand)
        }
        .navigationTitle("My concerts")
        .searchable(text: $searchText)
        .toolbar {
            HStack {
                Text("Add new")
                Image(systemName: "plus")
            }
            .foregroundColor(.blue)
        }
    }
}

struct MainBandsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MainBandsView()
        }
    }
}

struct BandsListView: View {
    let searchText: String
    let cards: [BandModel]
    
    var callback: (_ card: BandModel) -> Void
    
    var body: some View {
        VStack (spacing: 16) {
            ForEach(cards, id: \.self) { card in
                if card.title.contains(searchText) || searchText.isEmpty {
                    CardBandsView(data: card)
                        .onTapGesture {
                            callback(card)
                        }
                }
            }
        }
    }
}
