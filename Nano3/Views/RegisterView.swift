//
//  RegisterView.swift
//  Nano3
//
//  Created by Camila Spolador on 26/09/23.
//

import SwiftUI

struct RegisterView: View {
    struct Spot: Identifiable, Hashable {
        let name: String
        let id = UUID()
    }
    
    
    private var spot = [
        Spot(name: "Track"),
        Spot(name: "Premium track"),
        Spot(name: "Box"),
        Spot(name: "Grandstand"),
        Spot(name: "Festival"),
        Spot(name: "Other")
    ]
    
    @State private var multiSelection = Set<UUID>()
    @State private var username: String = ""
    @State private var toggleOn: Bool = true
    
    var body: some View {
        VStack {
            
            Form {
                HStack {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .frame(minWidth: 30, minHeight: 30)
                        .background(.blue)
                        .cornerRadius(7)
                    
                    TextField(text: $username) {
                        Image(systemName: "plus")
                        Text("Artist name")
                        
                    }
                }
                
            }
            

            List {
                Toggle(isOn: $toggleOn) {
                    HStack {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .frame(minWidth: 30, minHeight: 30)
                            .background(.blue)
                            .cornerRadius(7)
                        Text("Main attraction")
                    }
                }
                
                
            }
            NavigationStack {
                
                List(spot, selection: $multiSelection) { ocean in
                    Text(ocean.name)
                    
                }
                .toolbar { EditButton() }
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        
        RegisterView()
    }
}
