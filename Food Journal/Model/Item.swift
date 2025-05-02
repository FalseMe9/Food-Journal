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
    var shownImage : Image{
        if let image{return Image(uiImage: image)}
        else{return Image("camera")}
    }
    static var example : Item{
        let image = UIImage(systemName: "camera")
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
