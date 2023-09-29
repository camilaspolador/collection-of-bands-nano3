//
//  MainBandsView.swift
//  Nano3
//
//  Created by Camila Spolador on 26/09/23.
//

import SwiftUI

struct MainBandsView: View {
    @EnvironmentObject private var bandsManager: BandsManager
    
    @State var showingSheet: Bool = false
    @State var searchText: String = ""
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            BandsListView(searchText: searchText, cards: bandsManager.bands, callback: { tappedCard in
                bandsManager.currentBand = tappedCard
                showingSheet.toggle()
            })
            .padding(16)
        }
        .navigationTitle("My concerts")
        .searchable(text: $searchText)
        .toolbar {
            NavigationLink {
                RegisterView()
            } label: {
                HStack {
                    Text("Add new")
                    Image(systemName: "plus")
                }
                .foregroundColor(.blue)
            }
        }
        .sheet(isPresented: $showingSheet) {
            BandView(data: bandsManager.currentBand)
        }

    }
}

struct MainBandsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MainBandsView()
        }
        .environmentObject(BandsManager())
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
