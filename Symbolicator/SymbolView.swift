//
//  SymbolView.swift
//  Symbolicator
//
//  Created by Russell Gordon on 2022-06-26.
//

import SwiftUI

struct SymbolView: View {
    
    let symbol: Symbol
    
    var body: some View {
        
        VStack {
            Image(systemName: symbol.name)
                .font(.system(size: 72))
                .frame(width: 150, height: 150) // ensure all icons use same amount of space
            
            Text(symbol.name)
                .multilineTextAlignment(.center)
                .lineLimit(2)
            
        }
        .padding()
        
    }
}

struct SymbolView_Previews: PreviewProvider {
    static var previews: some View {
        SymbolView(symbol: .example)
    }
}
