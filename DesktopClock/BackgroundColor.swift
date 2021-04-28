//
//  BackgroundColor.swift
//  DesktopClock
//
//  Created by Aaron on 2021/4/27.
//  Copyright © 2021 AaronDeng. All rights reserved.
//

import SwiftUI

//struct BackgroundColor: View {
//    var body: some View {
//        Text("Hello, World!")
//    }
//}

//struct BackgroundColor_Previews: PreviewProvider {
//    static var previews: some View {
//        BackgroundColor()
//    }
//}

struct BackgroundColor {
    var backgroundName: Int
    var backgroundColor: [Color]
}

var backgroundColorItems: [BackgroundColor] = [
    BackgroundColor(backgroundName: 1, backgroundColor: [Color.blue, Color.purple]),
    BackgroundColor(backgroundName: 2, backgroundColor: [Color.white, Color.purple]),
    BackgroundColor(backgroundName: 3, backgroundColor: [Color.yellow, Color.purple]),
    BackgroundColor(backgroundName: 4, backgroundColor: [Color.red, Color.green]),
    BackgroundColor(backgroundName: 5, backgroundColor: [Color.yellow, Color.blue]),
    BackgroundColor(backgroundName: 6, backgroundColor: [Color.orange, Color.purple]),
]
