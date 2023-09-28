//
//  TextFieldView.swift
//  Nano3
//
//  Created by Camila Spolador on 27/09/23.
//

import SwiftUI

struct TextFieldView: View {
    
    @State private var artistName: String = ""
    @State private var eventDate: String = ""
    @State private var openingOfTheGates: String = ""
    @State private var ticketPrice: String = ""
    @State private var withWho: String = ""
    @State private var location: String = ""
    
    var body: some View {
        Section {
            TextFieldWithIcon(icon: "music.mic", hintText: "Artist name", backgroundIconColor: .green, textInTheField: $artistName)
            TextFieldWithIcon(icon: "calendar", hintText: "Event date", backgroundIconColor: .green, textInTheField: $eventDate)
            TextFieldWithIcon(icon: "clock.fill", hintText: "Gate opening times", backgroundIconColor: .green, textInTheField: $eventDate)
            TextFieldWithIcon(icon: "dollarsign.arrow.circlepath", hintText: "Ticket price", backgroundIconColor: .green, textInTheField: $eventDate)
            TextFieldWithIcon(icon: "figure.socialdance", hintText: "With who?", backgroundIconColor: .green, textInTheField: $eventDate)
            TextFieldWithIcon(icon: "pin.fill", hintText: "Show location", backgroundIconColor: .green, textInTheField: $eventDate)
        } header: {
            Text("General Information")
        }
    }
}
struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            TextFieldView()
        }
    }
}

struct TextFieldWithIcon: View {
    
    var icon: String
    var hintText: String
    var backgroundIconColor: Color
    @Binding var textInTheField: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.white)
                .frame(minWidth: 30, minHeight: 30)
                .background(backgroundIconColor)
                .cornerRadius(7)
            
            TextField(text: $textInTheField) {
                Text(hintText)
            }
        }
    }
}
