//
//  ToggleView.swift
//  Nano3
//
//  Created by Camila Spolador on 27/09/23.
//

import SwiftUI

struct ToggleView: View {
    
    @State private var toggleOnMainAttraction: Bool = false
    @State private var toggleOnFestival: Bool = false
    
    var body: some View {
        Section {
            Toggle(isOn: $toggleOnMainAttraction) {
                ToggleField(icon: "paperclip", text: "Main attraction", backgroundIconColor: .green)
            }
            
            Toggle(isOn: $toggleOnFestival) {
                ToggleField(icon: "party.popper.fill", text: "Festival", backgroundIconColor: .green)
            }
            
        } header: {
            Text("Secondary Information")
        }
    }
}

struct ToggleView_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            ToggleView()
        }
    }
}

struct ToggleField: View {
    
    var icon: String
    var text: String
    var backgroundIconColor: Color
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.white)
                .frame(minWidth: 30, minHeight: 30)
                .background(backgroundIconColor)
                .cornerRadius(7)
            Text(text)
        }
    }
}
