//
//  CategoryView.swift
//  Symbolicator
//
//  Created by Russell Gordon on 2022-06-26.
//

import SwiftUI

struct CategoryView: View {
    
    let category: Category
    let symbols: [Symbol]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [.init(.adaptive(minimum: 200, maximum: 200))]) {
                ForEach(symbols) { symbol in
                    SymbolView(symbol: symbol)
                }
            }
        }
        .navigationTitle(category.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: .example, symbols: [.example])
    }
}
