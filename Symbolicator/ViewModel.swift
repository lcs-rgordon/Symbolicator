//
//  ViewModel.swift
//  Symbolicator
//
//  Created by Russell Gordon on 2022-06-26.
//

import Foundation

class ViewModel: ObservableObject {
    
    let symbols: [Symbol]
    let specialCategories: [Category]
    let regularCategories: [Category]
    let releases: [String: [String: String]]
    
}
