//
//  SymbolView.swift
//  Symbolicator
//
//  Created by Russell Gordon on 2022-06-26.
//

import SwiftUI

struct SymbolView: View {
    
    @EnvironmentObject var viewModel: ViewModel

    @AppStorage("rendering") var rendering = "Automatic"
    @AppStorage("weight") var weight = "Regular"
    @AppStorage("variableValue") var variableValue = 1.0
    
    @AppStorage("color1") var color1 = Color.black
    @AppStorage("color2") var color2 = Color.blue
    @AppStorage("color3") var color3 = Color.mint

    
    let symbol: Symbol
    
    // Closure to call when button is activated
    var showRestrctionsAction: () -> Void
    
    var body: some View {
        
        VStack {
            Image(systemName: symbol.name, variableValue: variableValue)
                .font(.system(size: 72))
                .frame(width: 150, height: 150) // ensure all icons use same amount of space
                .symbolRenderingMode(renderingMode)
                .foregroundStyle(rendering == "Automatic" ? .primary : color1, color2, color3)
                .fontWeight(fontWeight)
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
    
    var renderingMode: SymbolRenderingMode {
        switch rendering {
        case "Hierarchical":
            return .hierarchical
        case "Multicolor":
            return .multicolor
        case "Palette":
            return .palette
        default:
            return .monochrome
        }
    }
    
    var fontWeight: Font.Weight {
        switch weight {
        case "Ultra Light": return .ultraLight
        case "Thin": return .thin
        case "Light": return .light
        case "Medium": return .medium
        case "Semibold": return .semibold
        case "Body": return .bold
        case "Heavy": return .heavy
        case "Black": return .black
        default: return .regular
        }
    }
}

struct SymbolView_Previews: PreviewProvider {
    static var previews: some View {
        SymbolView(symbol: .example, showRestrctionsAction: { })
    }
}
