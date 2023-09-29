//
//  PhotoPickerView.swift
//  Nano3
//
//  Created by Camila Spolador on 28/09/23.
//

import SwiftUI
import PhotosUI

struct PhotoPickerView: View {
    
    @State var selectedPhoto: PhotosPickerItem?
    @State var selectedPhotoData: Data?
    
    var body: some View {
        Section {
            
            if let selectedPhotoData,
               let uiImage = UIImage(data: selectedPhotoData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 300)
            }
            
            PhotosPicker(
                selection: $selectedPhoto,
                matching: .images,
                photoLibrary: .shared()
            ) {
                Label("Add image", systemImage: "photo")
            }
            
            if selectedPhotoData != nil {
                Button(role: .destructive) {
                    withAnimation {
                        selectedPhoto = nil
                        selectedPhotoData = nil
                    }
                } label : {
                    Label("Remove Image", systemImage: "xmark")
                        .foregroundStyle(.red)
                }
            }
        }
        .task(id: selectedPhoto) {
            if let data = try? await selectedPhoto?.loadTransferable(type: Data.self) {
                selectedPhotoData = data
            }
        }
    }
}

struct PhotoPickerView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPickerView()
    }
}
