//
//  StarsHStackView.swift
//  Nano3
//
//  Created by Camila Spolador on 27/09/23.
//

import SwiftUI

struct StarsHStackView: View {
    let starsCount: Int
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(1...5, id: \.self) { i in
                Image(systemName: i <= starsCount ? "star.fill" : "star")
            }
            
        }
        .font(.callout)
        .foregroundColor(.pink)
    }
}

struct StarsHStackView_Previews: PreviewProvider {
    static var previews: some View {
        StarsHStackView(starsCount: 5)
    }
}
