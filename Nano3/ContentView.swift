//
//  ContentView.swift
//  Nano3
//
//  Created by Camila Spolador on 26/09/23.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @StateObject private var bandsManager = BandsManager()
    
    var body: some View {
        NavigationStack {
            MainBandsView()
        }
        .environmentObject(bandsManager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
