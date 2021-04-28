//
//  ContentView.swift
//  DesktopClock
//
//  Created by Aaron on 2021/4/27.
//  Copyright © 2021 AaronDeng. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var nowTime = Date()
    @State private var timeNumber: Int = 4
    @State private var timeShowingStyle: Int = 3    // [0: default(0,1,2,3...),  1: (一,二...), 2: (壹,贰...)]
    @State private var backgroundShowingStyle: Int = 2    //  detail please review: BackgroundColor.swift
    @State private var timerString = getTimerString(styleNumber: 0)
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            HStack {
                ForEach(0 ..< timerString.count) { number in
                    SingleBackgroundView(timeNumber: .constant(self.timerString[number]))
                        .padding(.leading, number%2 != 0 || number == 0 ? 0 : 20)
//                        .padding(.leading, number%2 != 0 || number == 0 ? 0 : maximumWindowWidth/520*20)
                }
                .onReceive(timer) { _ in
                    self.timerString = getTimerString(styleNumber: self.timeShowingStyle)
                    self.nowTime = Date()
                }
            }
            DockClockView().offset(x: -77)
            DockClockView().offset(x: 77)
        }
        .frame(minWidth: 450, idealWidth: 520, maxWidth: maximumWindowWidth ,minHeight: 80, idealHeight: 185, maxHeight: maximumWindowHeight)
        .background(LinearGradient(gradient: Gradient(colors: backgroundColorItems[self.backgroundShowingStyle].backgroundColor),
                                   startPoint: .topTrailing,
                               endPoint: .bottomLeading))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func getTimer0() -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    formatter.dateFormat = "HHmmss"
//    formatter.dateFormat = "hhmmss"
    return formatter.string(from: Date())
}


func getTimerString0(styleNumber: Int) -> [String] {
    let timerString = getTimer()
    var timerStringArray = [String]()
    
    if styleNumber == 0 {
        for character in timerString {
            timerStringArray.append("\(character)")
        }
    } else if styleNumber == 1 {
        for character in timerString {
            switch character {
            case "0": timerStringArray.append("零")
            case "1": timerStringArray.append("一")
            case "2": timerStringArray.append("二")
            case "3": timerStringArray.append("三")
            case "4": timerStringArray.append("四")
            case "5": timerStringArray.append("五")
            case "6": timerStringArray.append("六")
            case "7": timerStringArray.append("七")
            case "8": timerStringArray.append("八")
            case "9": timerStringArray.append("九")
            default:
                timerStringArray.append("零")
            }
        }
    } else {
        for character in timerString {
            switch character {
            case "0": timerStringArray.append("零")
            case "1": timerStringArray.append("壹")
            case "2": timerStringArray.append("贰")
            case "3": timerStringArray.append("叁")
            case "4": timerStringArray.append("肆")
            case "5": timerStringArray.append("伍")
            case "6": timerStringArray.append("陆")
            case "7": timerStringArray.append("柒")
            case "8": timerStringArray.append("捌")
            case "9": timerStringArray.append("玖")
            default:
                timerStringArray.append("零")
            }
        }
    }
    
    return timerStringArray
}
