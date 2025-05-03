//
//  ImagePicker.swift
//  taskMana
//
//  Created by Billie H on 03/05/25.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    var sourceType : UIImagePickerController.SourceType = .photoLibrary
    @Binding var showImagePicker: Bool
    @Binding var image: Image
    func makeUIViewController(context: Context) -> some UIViewController {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    func makeCoordinator() -> ImagePickerCoordinator {
        return ImagePickerCoordinator(isShown: $showImagePicker, image: $image)
    }
}
class ImagePickerCoordinator :NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @Binding var isShown: Bool
    @Binding var image: Image
    init(isShown: Binding<Bool>, image: Binding<Image>) {
        _isShown = isShown
        _image = image
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        image = Image(uiImage: uiImage)
        isShown = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShown = false
    }
}

#Preview {
    ImagePicker(showImagePicker: .constant(true), image: .constant(Image(systemName: "photo.fill")))
}
