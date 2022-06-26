//
//  ContentView.swift
//  Symbolicator
//
//  Created by Russell Gordon on 2022-06-26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
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
            .navigationTitle("Symbolicator")
        }
        .environmentObject(viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
