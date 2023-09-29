//
//  ToggleView.swift
//  Nano3
//
//  Created by Camila Spolador on 27/09/23.
//

import SwiftUI

struct ToggleView: View {
    
    @Binding var toggleOnMainAttraction: Bool
    @Binding var toggleOnFestival: Bool
    
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
            ToggleView(toggleOnMainAttraction: .constant(false), toggleOnFestival: .constant(false))
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
