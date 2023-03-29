//
//  ImagePickerView.swift
//  testLindar
//
//  Created by Lindar Olostur on 29.03.2023.
//

import SwiftUI
import _PhotosUI_SwiftUI

struct ImagePickerView: View {
    @Binding var selectedItem: PhotosPickerItem?
    @Binding var selectedImageData: Data?
    
    var body: some View {
        VStack {
            if let selectedImageData = selectedImageData,
               let uiImage = UIImage(data: selectedImageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
            } else {
                Image("photo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
            }
            PhotosPicker(
                selection: $selectedItem,
                matching: .images,
                photoLibrary: .shared()) {
                    Text("Change photo")
                        .font(.custom("Montserrat-Regular", size: 13))
                        .foregroundColor(.gray)
                }
                .onChange(of: selectedItem) { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            selectedImageData = data
                        } else {
                            selectedImageData = nil
                        }
                    }
                }

        }
    }
}

struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView(selectedItem: .constant(nil), selectedImageData: .constant(nil))
    }
}
