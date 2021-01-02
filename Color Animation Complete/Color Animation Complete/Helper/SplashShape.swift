//
//  SplashShape.swift
//  Color Animation Complete
//
//  Created by 中筋淳朗 on 2020/12/02.
//

import SwiftUI

struct SplashShape: Shape {
    
    // MARK: - Enum
    
    enum AnimationType {
        case circle
        case customAngle(angle: Angle)
    }
    
    // MARK: - Property
    
    var progress: CGFloat // 0 ~ 1
    var animationType: AnimationType
    
    var animatableData: CGFloat {  // アニメーション用
        get {progress}
        set {progress = newValue}
    }
    
    // MARK: - Main
    
    func path(in rect: CGRect) -> Path {
        
        switch animationType {
        case .circle:
            return circle(rect: rect)
        case .customAngle(let angle):
            return customAngle(rect: rect, angle: angle)
        }
    }
    
    // MARK: - Function
    
    func circle(rect: CGRect) -> Path {
        let minWidth = rect.width / 2
        let minHeight = rect.height / 2
        
        // 最終の半径 (長方形rectの中心から角までの距離) (a^2 + b^2 の平方根を取る)   c^2 = a^2 + b^2
        let maxRadius = pow(pow(minHeight, 2) + pow(minWidth, 2), 0.5)
        
        // progress に合わせた半径
        let radius = progress * maxRadius
        
        // MARK: - Path
        var path = Path()
        path.addArc(center: CGPoint(x: minWidth, y: minHeight), radius: radius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360), clockwise: true)
        
        return path
    }
    
    
    // 0° ~ 90° まで対応
    func customAngle(rect: CGRect, angle: Angle) -> Path {

        let width = rect.width
        let height = rect.height

        // 引数の angle から tan を取る
        let m = CGFloat(tan(angle.radians))

        // progressがマックス(progress == 1)の時のy  ちょうどangleの斜線がrectを埋めるタイミング
        // m = width / α  ->  α = width / m
        // maxY = height + α
        // maxY = height + width / m
        let maxY = height + width / m

        // x の方を tan倍だけ大きくする
        let x = progress * maxY * m
        let y = progress * maxY

        // MARK: - Path
        var path = Path()

        path.move(to: CGPoint(x: 0, y: 0))

        path.addLine(to: CGPoint(x: x, y: 0))
        path.addLine(to: CGPoint(x: 0, y: y))
        path.closeSubpath()

        return path
    }
}
