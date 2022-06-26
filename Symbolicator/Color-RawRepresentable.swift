//
//  Color-RawRepresentable.swift
//  Symbolicator
//
//  Created by Russell Gordon on 2022-06-26.
//

import SwiftUI

extension Color: RawRepresentable {
    
    public init?(rawValue: String) {
        if let data = Data(base64Encoded: rawValue) {
            if let color = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? UIColor {
                self = Color(uiColor: color)
                return
            }
        }
        
        // If we fail, fall back to black
        self = .black
    }
    
    public var rawValue: String {
        do {
            return try NSKeyedArchiver.archivedData(withRootObject: UIColor(self), requiringSecureCoding: true).base64EncodedString()
        } catch {
            return ""
        }
    }
    
}

