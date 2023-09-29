//
//  PhotosView.swift
//  Nano3
//
//  Created by Camila Spolador on 28/09/23.
//
import SwiftUI
import PhotosUI

struct PhotosView: View {
    @State var selectedItems: [PhotosPickerItem] = []
    @State var data: Data?
    
    var body: some View {
        VStack {
            if let data = data, let uiimage = UIImage(data: data) {
                Image(uiImage: uiimage)
                    .resizable()
            }
            Spacer()
            PhotosPicker(selection: $selectedItems, maxSelectionCount: 1, matching: .images)
            {
                Text("Pick Photo")
            }
            .onChange(of: selectedItems) { newValue in
                guard let item = selectedItems.first else {
                    return
                }
                item.loadTransferable(type: Data.self) { result in
                    switch result {
                    case .success(let data):
                        if let data = data {
                            self.data = data
                        } else {
                            print("data is nil")
                        }
                    case .failure(let failure ):
                        print("whyyyyyy")
                        fatalError("\(failure)")
                    }
                }
            }
        }
    }
}

struct PhotosView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosView()
    }
}
