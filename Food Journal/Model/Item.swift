//
//  Item.swift
//  taskMana
//
//  Created by Billie H on 01/05/25.
//

import SwiftUI
import UIKit

@Observable
class Item: Identifiable, Hashable, Codable {
    var id : String = UUID().uuidString
    var description : String = ""
    var data : Data?
    var image : UIImage?{
        get{
            if let data{UIImage(data: data)}
            else{nil}
        }
        set{
            data = newValue?.pngData()
        }
    }
    @MainActor
    var shownImage : Image{
        get{
            if let image{return Image(uiImage: image)}
            else{return Image(systemName: "photo.fill")}
        }set{
           image = ImageRenderer(content: newValue).uiImage
        }
    }
    static var example : Item{
        let image = UIImage(systemName: "photo.fill")
        return Item(description: "Test", image: image)
    }
    init(description: String="", data: Data? = nil) {
        self.description = description
        self.data = data
    }
    init(description : String="", image : UIImage?){
        self.description = description
        self.image = image
    }
    enum CodingKeys: String, CodingKey {
        case _id = "id"
        case _description = "description"
        case _data = "data"
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func == (lhs: Item, rhs: Item) -> Bool {
        lhs.id == rhs.id
    }
}
