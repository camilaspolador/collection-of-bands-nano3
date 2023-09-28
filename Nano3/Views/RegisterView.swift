//
//  RegisterView.swift
//  Nano3
//
//  Created by Camila Spolador on 26/09/23.
//

import SwiftUI

struct RegisterView: View {
    struct Spot: Identifiable, Hashable {
        let id = UUID()
        let name: String
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
    
    var body: some View {
        Form {
            TextFieldView()
            
            StepperView()
            
            ToggleView()
            
            Section {
                    List(spot, selection: $multiSelection) { spot in
                        Text(spot.name)
                }
                    .toolbar { EditButton() }
            } header: {
                Text("Location at the concert")
            }
            
        }
    }
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        
        RegisterView()
    }
}





//                VStack {
//
//                    List {
//                        Toggle(isOn: $toggleOn) {
//                            HStack {
//                                Image(systemName: "plus")
//                                    .foregroundColor(.white)
//                                    .frame(minWidth: 30, minHeight: 30)
//                                    .background(.blue)
//                                    .cornerRadius(7)
//                                Text("Main attraction")
//                            }
//                        }
//                    }
//                }
//
//                NavigationStack {
//
//                    List(spot, selection: $multiSelection) { ocean in
//                        Text(ocean.name)
//
//                    }
//                    .toolbar { EditButton() }
//                }
