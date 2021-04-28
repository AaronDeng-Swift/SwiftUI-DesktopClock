//
//  AnimationScaleView.swift
//  DesktopClock
//
//  Created by Aaron on 2021/4/27.
//  Copyright © 2021 AaronDeng. All rights reserved.
//

import SwiftUI

struct AnimationScaleView: View {
    
    @State private var showingAnimation: Bool = false
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 60, height: 80)
                .onTapGesture {
                    self.showingAnimation.toggle()
                }
            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
        
        }
        .frame(width: 300, height: 200)
    }
}

struct AnimationScaleView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationScaleView()
    }
}
