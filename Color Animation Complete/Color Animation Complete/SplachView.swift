//
//  SplachView.swift
//  Color Animation Complete
//
//  Created by 中筋淳朗 on 2020/12/02.
//

import SwiftUI

struct SplachView: View {
    
    // MARK: - Property
    
    var animationType: SplashShape.AnimationType
    
    @ObservedObject var manager: ColorManager
    
    @State var layers: [(LinearGradient, CGFloat)] = [] // (色, progress)
    
    
    // MARK: - Body
    
    var body: some View {
        Rectangle()
            .overlay(
                ZStack {
                    ForEach(layers.indices, id: \.self) { x in
                        SplashShape(progress: layers[x].1, animationType: animationType)
                            .fill(layers[x].0)
                    } //: ForEach
                } //: ZStack
            ) //: overlay
            .onReceive(manager.$linear, perform: { linear in
                layers.append((linear, 0))
                withAnimation(.easeInOut(duration: 0.5)) {
                    layers[layers.count - 1].1 = 1.0
                    
                    //アニメーションが終わったら layers配列から最初のものを取り除く(配列内の要素が2つ以上になれば)
                    // これがないと無限にoverlayされて死ぬほど重くなる
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        if layers.count >= 2 {
                            self.layers.remove(at: 0)
                        }
                    }
                }
            })
    }
}

struct SplachView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
