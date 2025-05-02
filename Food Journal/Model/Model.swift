//
//  Model.swift
//  taskMana
//
//  Created by Billie H on 01/05/25.
//

import SwiftUI
@Observable
class Model {
    let url = URL.documentsDirectory.appending(path: "Items")
    var items : [Item] = []{
        didSet{save()}
    }
    var path = NavigationPath()
    
    init() {
        load()
    }
    func save(){
        do{
            let data = try JSONEncoder().encode(items)
            try data.write(to: url)
        }catch{
            print(error.localizedDescription)
        }
    }
    func load(){
        do{
            let data = try Data(contentsOf: url)
            items = try JSONDecoder().decode([Item].self, from: data)
        }catch{
            print(error.localizedDescription)
        }
    }
}
let model = Model()
