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
    }
}
#Preview {
    ItemView(item: .example)
}
