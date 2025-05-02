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
    @State private var photoItem : PhotosPickerItem?
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            PhotosPicker(selection: $photoItem){
                item.shownImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
            }
            TextEditor(text: $item.description)
        }
        .padding(5)
        .onChange(of: photoItem){
            Task{
                do{
                    let image = try await photoItem?.loadTransferable(type: Image.self)
                    item.image = ImageRenderer(content: image).uiImage
                }catch{
                    print(error.localizedDescription)
                }
            }
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
