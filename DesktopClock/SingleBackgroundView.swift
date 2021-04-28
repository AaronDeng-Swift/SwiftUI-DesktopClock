//
//  SingleBackgroundView.swift
//  DesktopClock
//
//  Created by Aaron on 2021/4/27.
//  Copyright © 2021 AaronDeng. All rights reserved.
//

import SwiftUI

struct SingleBackgroundView: View {
    
    @Binding var timeNumber: String
    
    let onColor = [Color.purple, Color.orange]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 10)
//                    .frame(width: 60, height: 75)
                    .frame(width: geometry.size.width/520*60*6, height: geometry.size.height/185*90)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 4)
                            .background(LinearGradient(gradient: Gradient(colors: onColor), startPoint: .topLeading, endPoint: .bottomTrailing))
                    )
                    .cornerRadius(10)
                
                Text("\(timeNumber)")
//                    .font(.system(size: 22))
                    .font(.system(size: (geometry.size.width > geometry.size.height ? geometry.size.width : geometry.size.height)/185*25))
                    .foregroundColor(Color.white)
            }
            .shadow(radius: 10)
        }
//        .frame(width: 500, height: 100)
    }
}

struct SingleBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        SingleBackgroundView(timeNumber: .constant("5"))
//        DockClockView()
    }
}

struct DockClockView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.black)
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.black)
            }
//            .frame(width: 10, height: 30)
            .frame(width: geometry.size.width/520*10, height: geometry.size.height/185*30)
        }
    }
    
}
