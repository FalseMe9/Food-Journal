//
//  Item.swift
//  taskMana
//
//  Created by Billie H on 01/05/25.
//

import SwiftUI
import UIKit

struct Item: Identifiable, Codable {
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
}
