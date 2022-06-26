//
//  SettingsView.swift
//  Symbolicator
//
//  Created by Russell Gordon on 2022-06-26.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("rendering") var rendering = "Automatic"
    @AppStorage("weight") var weight = "Regular"
    @AppStorage("variableValue") var variableValue = 1.0
    
    @AppStorage("color1") var color1 = Color.black
    @AppStorage("color2") var color2 = Color.blue
    @AppStorage("color3") var color3 = Color.mint

    let renderingModes = ["Automatic", "Hierarchical", "Monochrome", "Multicolor", "Palette"]
    let weights = ["Ultra Light", "Thin", "Light", "Regular", "Medium", "Semibold", "Bold", "Heavy", "Black"]
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
