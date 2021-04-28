//
//  SettingView.swift
//  DesktopClock
//
//  Created by Aaron on 2021/4/27.
//  Copyright © 2021 AaronDeng. All rights reserved.
//

import SwiftUI

struct SettingView: View {  
    var body: some View {
        GeometryReader { geometry in
            Text("Hello, World!")
                .frame(width: geometry.size.width)
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

