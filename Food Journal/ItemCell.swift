//
//  ItemCell.swift
//  taskMana
//
//  Created by Billie H on 01/05/25.
//

import SwiftUI

struct ItemCell: View {
    @State var item : Item
    var body: some View {
        HStack(alignment: .top){
            item.shownImage
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            Text(item.description)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 20)
        }
    }
}

#Preview {
    ItemCell(item: .example)
}
