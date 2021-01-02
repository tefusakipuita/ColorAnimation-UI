//
//  ContentView.swift
//  Color Animation Complete
//
//  Created by 中筋淳朗 on 2020/12/02.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Property
    
    var screenWidth = UIScreen.main.bounds.width
    var screenHeight = UIScreen.main.bounds.height
    
    var scrollCardWidth = UIScreen.main.bounds.width * 0.54
    var horizontalSpace = UIScreen.main.bounds.width / 2 - UIScreen.main.bounds.width * 0.54 / 2
    
    var colors: [LinearGradient] = [Color.linear1, Color.linear2, Color.linear3, Color.linear4]
    @State var index: Int = 0
    @State var progress: CGFloat = 0
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            // MARK: - Animation Background
            SplachView(animationType: .customAngle(angle: Angle(degrees: 30)), manager: ColorManager(linear: colors[index]))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                // MARK: - Scroll Card
                    
                    ScrollView (.horizontal, showsIndicators: false) {
                        GeometryReader(content: { geometry in
                            let minX = geometry.frame(in: .global).minX
                            
                            HStack (spacing: 20) {
                                ForEach(0..<4) { i in
                                    Rectangle()
                                        .fill(
                                            colors[i]
                                        )
                                        .frame(width: scrollCardWidth, height: 140)
                                        .cornerRadius(24)
                                        .shadow(color: Color.gray.opacity(0.4), radius: 6)
                                } //: ForEach
                            } //: HStack
                            .padding(.horizontal, horizontalSpace)
                            .padding(.vertical, 15)
                            .onChange(of: minX, perform: { value in
                                scrollCard(minX: value)
                            })
                        }) //: GeometryReader
                        .frame(width: scrollCardWidth * 4 + 60 + horizontalSpace * 2)
                    } //: Scroll
                    .padding(.top, 60)
                
                Spacer()
                
                // MARK: - 固定カード
                SplachView(animationType: .circle, manager: ColorManager(linear: colors[index]))
//                    .fill(
//                        // LinearGradient
//                    )
                    .frame(width: screenWidth - 160, height: screenWidth - 160)
                    .cornerRadius(24)
                    .shadow(color: Color.gray.opacity(0.4), radius: 6)
                    .padding(.bottom, 80)
            }  //: VStack
        } //: ZStack
    }
    
    
    // MARK: - Function
    
    func scrollCard(minX: CGFloat) {
        let widthPerCard = scrollCardWidth + 20
        
        if -widthPerCard / 2 < minX && minX <= 0 {  // 1枚目
            index = 0
        }
        else if -widthPerCard / 2 - widthPerCard < minX && minX <= -widthPerCard / 2 {  // 2枚目
            index = 1
        }
        else if -widthPerCard / 2 - widthPerCard * 2 < minX && minX <= -widthPerCard / 2 - widthPerCard {  // 3枚目
            index = 2
        }
        else if -widthPerCard / 2 - widthPerCard * 3 < minX && minX <= -widthPerCard / 2  - widthPerCard * 2 {  // 4枚目
            index = 3
        }
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
