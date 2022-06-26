//
//  ContentView.swift
//  Symbolicator
//
//  Created by Russell Gordon on 2022-06-26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            
            Group {
                if searchText.isEmpty {
                    List {
                        Section {
                            ForEach(viewModel.specialCategories) { category in
                                CategoryRow(category: category)
                            }
                        }
                        
                        Section {
                            ForEach(viewModel.regularCategories) { category in
                                CategoryRow(category: category)
                            }
                        }

                    }
                } else {
                    let category = Category(name: "Results", icon: "magnifiyingglass", isSpecial: false)
                    
                    CategoryView(category: category, symbols: viewModel.results(for: searchText))
                }
            }
            .navigationTitle("Symbolicator")
            .navigationDestination(for: Category.self) { selectedCategory in
                CategoryView(category: selectedCategory, symbols: viewModel.symbols(for: selectedCategory))
            }
        }
        .environmentObject(viewModel)
        .searchable(text: $searchText)
        .autocorrectionDisabled() // Don't try to fix typos for what the user search
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
