//
//  TextFieldView.swift
//  Nano3
//
//  Created by Camila Spolador on 27/09/23.
//

import SwiftUI

struct TextFieldView: View {
    
    @Binding var artistName: String
    @Binding var ticketPrice: String
    @Binding var withWho: String
    @Binding var location: String
    @Binding var eventDate: Date
    @Binding var openingOfTheGates: Date
    
    var body: some View {
        Section {

            TextFieldWithIcon(icon: "music.mic", hintText: "Artist name", backgroundIconColor: .green, textInTheField: $artistName)
            
            TextFieldWithIcon(icon: "dollarsign.arrow.circlepath", hintText: "Ticket price", backgroundIconColor: .green, textInTheField: $ticketPrice)
            
            TextFieldWithIcon(icon: "figure.socialdance", hintText: "With who?", backgroundIconColor: .green, textInTheField: $withWho)
            
            TextFieldWithIcon(icon: "pin.fill", hintText: "Show location", backgroundIconColor: .green, textInTheField: $location)
            
            HStack {
                Image(systemName: "calendar")
                    .foregroundColor(.white)
                    .frame(minWidth: 30, minHeight: 30)
                    .background(.green)
                    .cornerRadius(7)
                DatePicker("Event date", selection: $eventDate, displayedComponents: .date)
            }
            HStack {
                Image(systemName: "clock.fill")
                    .foregroundColor(.white)
                    .frame(minWidth: 30, minHeight: 30)
                    .background(.green)
                    .cornerRadius(7)
                DatePicker("Gate opening", selection: $openingOfTheGates, displayedComponents: .hourAndMinute)
            }
            
            
            
            
        } header: {
            Text("General Information")
        }
    }
}
struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            TextFieldView(artistName: .constant(""), ticketPrice: .constant(""), withWho: .constant(""), location: .constant(""), eventDate: .constant(Date()), openingOfTheGates: .constant(Date()))
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
