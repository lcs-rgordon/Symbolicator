//
//  CategoryRow.swift
//  Symbolicator
//
//  Created by Russell Gordon on 2022-06-26.
//

import SwiftUI

// Handles one row in our list
struct CategoryRow: View {
    
    let category: Category
    
    var body: some View {
        // When I'm tapped, select that category
        NavigationLink(value: category) {
            // Show the category name and icon
            Label(category.name, systemImage: category.icon)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(category: .example)
    }
}
