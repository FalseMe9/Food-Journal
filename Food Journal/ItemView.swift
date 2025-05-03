//
//  ItemView.swift
//  taskMana
//
//  Created by Billie H on 01/05/25.
//

import SwiftUI
import PhotosUI
struct ItemView:View {
    @State var item : Item
    @State var sourceType : UIImagePickerController.SourceType = .photoLibrary
    @State private var showSheet = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            item.shownImage
                .resizable()
                .scaledToFit()
                .frame(minWidth: 0, maxWidth: .infinity)
            HStack{
                Button("Camera"){
                    sourceType = .camera
                    showSheet = true
                }
                Button("Picture"){
                    sourceType = .photoLibrary
                    showSheet = true
                }
            }
            TextEditor(text: $item.description)
        }
        .padding(5)
        .sheet(isPresented: $showSheet){
            ImagePicker(sourceType: sourceType, showImagePicker: $showSheet, image: $item.shownImage)
                .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Done", action: done)
            }
        }
    }
    init(item: Item) {
        _item = State(initialValue: item)
    }
    func done(){
        if !model.items.contains(item){
            model.items.append(item)
        }
        model.save()
        dismiss()
    }
}
#Preview {
    NavigationStack{
        ItemView(item: .example)
    }
}
