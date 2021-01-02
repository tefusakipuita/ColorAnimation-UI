//
//  Extension.swift
//  Color Animation Complete
//
//  Created by 中筋淳朗 on 2020/12/02.
//

import SwiftUI



extension Color {
    
    static let linear1 = LinearGradient(gradient: Gradient(colors: [Color("Color1"), Color("Color2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    static let linear2 = LinearGradient(gradient: Gradient(colors: [Color("Color3"), Color("Color4")]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    static let linear3 = LinearGradient(gradient: Gradient(colors: [Color("Color5"), Color("Color6")]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    static let linear4 = LinearGradient(gradient: Gradient(colors: [Color("Color7"), Color("Color8")]), startPoint: .topLeading, endPoint: .bottomTrailing)
}
