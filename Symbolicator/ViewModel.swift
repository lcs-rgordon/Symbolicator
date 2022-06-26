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
    
    init() {
        
        // temporary data model to get the data from disk
        struct DataModel: Decodable {
            let categories: [Category]
            let symbols: [Symbol]
            let releases: [String: [String: String]]
        }
        
        // fatal error use OK – if this file is missing things are REALLY broken
        guard let url = Bundle.main.url(forResource: "symbols", withExtension: "json") else {
            fatalError("Couldn't find symbols.json in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Couldn't load symbols.json from bundle.")
        }
        
        guard let model = try? JSONDecoder().decode(DataModel.self, from: data) else {
            fatalError("Couldn't parse symbols.json from bundle.")
        }
        
        // We now need to filter categories based on special or not special
        var specialCategories = [Category]()
        var regularCategories = [Category]()
        
        for category in model.categories {
            if category.isSpecial {
                specialCategories.append(category)
            } else {
                regularCategories.append(category)
            }
        }
        
        // Set the properties of the view model itself
        symbols = model.symbols
        releases = model.releases
        self.specialCategories = specialCategories
        self.regularCategories = regularCategories
    }
    
    func symbols(for category: Category) -> [Symbol] {
        let result = symbols.filter { currentSymbol in
            currentSymbol.categories.contains(category.name)
        }
        
        if result.isEmpty {
            return symbols
        } else {
            return result
        }
    }
    
    // Find what iOS version a given symbol was introduced within
    func iOSVersion(for symbol: Symbol) -> String? {
        if let introductionYear = symbol.availability["base"] {
            if introductionYear != "2019" {
                if let version = releases[introductionYear]?["iOS"] {
                    return "\(version)+"
                }
            }
        }
        
        return nil
    }
}
