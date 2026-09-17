//
//  Extensions.swift
//  DHLModalHelper
//
//  Created by Daniel Hernandez on 17/09/2026.
//

import Foundation
import SwiftUI

extension View {
    
    @ViewBuilder
    func `if`<Content: View>( _ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
