//
//  SecureFieldCustom.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 05/11/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI

struct SecureFieldCustom: View {
    
    var placeholder: Text
    @Binding var text: String
    var commit: () -> Void = { }
    
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            SecureField("", text: $text, onCommit: commit)
        }
        
        
    }
}
