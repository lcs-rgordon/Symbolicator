//
//  SymbolView.swift
//  Symbolicator
//
//  Created by Russell Gordon on 2022-06-26.
//

import SwiftUI

struct SymbolView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    let symbol: Symbol
    
    // Closure to call when button is activated
    var showRestrctionsAction: () -> Void
    
    var body: some View {
        
        VStack {
            Image(systemName: symbol.name)
                .font(.system(size: 72))
                .frame(width: 150, height: 150) // ensure all icons use same amount of space
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(.quaternary))
                .overlay(alignment: .bottomLeading) {
                    if let version = viewModel.iOSVersion(for: symbol) {
                        Text(version)
                            .foregroundColor(.secondary)
                            .font(.caption)
                            .padding(5)
                    }
                }
                .overlay(alignment: .bottomTrailing) {
                    if symbol.restrictions != nil {
                        Button(action: showRestrctionsAction) {
                            Image(systemName: "applelogo")
                                .foregroundColor(.secondary)
                                .padding(5)
                        }
                        .buttonStyle(.plain)
                    }
                }
            
            Text(symbol.name)
                .multilineTextAlignment(.center)
                .lineLimit(2...2) // Always exactly two lines of text, so the text views all line up, even there is only one line of text
            
        }
        .padding()
        .contentShape(Rectangle())  // Make the whole area tappable
        .contextMenu {
            Button {
                UIPasteboard.general.string = symbol.name
            } label: {
                Label("Copy name", systemImage: "doc.on.doc")
            }
        }
    }
}

struct SymbolView_Previews: PreviewProvider {
    static var previews: some View {
        SymbolView(symbol: .example, showRestrctionsAction: { })
    }
}
