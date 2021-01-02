//
//  ColorManager.swift
//  Color Animation Complete
//
//  Created by 中筋淳朗 on 2020/12/02.
//

import SwiftUI

class ColorManager: ObservableObject {
    
    @Published var linear: LinearGradient
    
    init(linear: LinearGradient) {
        self.linear = linear
    }
}
