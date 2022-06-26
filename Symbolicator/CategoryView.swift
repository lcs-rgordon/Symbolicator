//
//  CategoryView.swift
//  Symbolicator
//
//  Created by Russell Gordon on 2022-06-26.
//

import SwiftUI

struct CategoryView: View {
    
    @State private var restrictions: String?
    @State private var showingRestrictions = false
    
    let category: Category
    let symbols: [Symbol]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [.init(.adaptive(minimum: 200, maximum: 200))]) {
                ForEach(symbols) { symbol in
                    SymbolView(symbol: symbol) {
                        restrictions = symbol.restrictions
                        showingRestrictions = true
                    }
                }
            }
        }
        .navigationTitle(category.name)
        .navigationBarTitleDisplayMode(.inline)
        .alert("Restricted Use", isPresented: $showingRestrictions, presenting: restrictions) { restriction in
            
            Button("OK") { }
            
        } message: { restriction in
            Text(restriction)
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: .example, symbols: [.example])
    }
}
