//
//  ObservationFieldView.swift
//  Nano3
//
//  Created by Camila Spolador on 28/09/23.
//

import SwiftUI

struct ObservationFieldView: View {
    @Binding var observations: String
    
    var body: some View {
        Section {
            TextField("Observations", text: $observations, axis: .vertical)
                .lineLimit(4...4)
        }
    }
}

struct ObservationFieldView_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            ObservationFieldView(observations: .constant(""))
        }
    }
}
