//
//  ContentView.swift
//  taskMana
//
//  Created by Billie H on 01/05/25.
//

import SwiftUI

struct ContentView: View {
    @Bindable var m = model
    var body: some View {
        NavigationStack(path: $m.path){
            List{
                ForEach(m.items){
                    ItemCell(item: $0)
                }
                .onDelete(perform: delete)
            }
            .navigationTitle("Food Journal")
            .toolbar{
                Button("", systemImage: "plus", action: plus)
            }
            .navigationDestination(for: Item.self, destination: ItemView.init)
        }
    }
    func plus(){
        let new = Item(description: "")
        m.path.append(new)
    }
    func delete(at indexSet: IndexSet){
        m.items.remove(atOffsets: indexSet)
    }
}

#Preview {
    ContentView()
}
