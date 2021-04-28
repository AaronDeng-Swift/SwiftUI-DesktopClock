//
//  Home.swift
//  DesktopClock
//
//  Created by Aaron on 2021/4/27.
//  Copyright © 2021 AaronDeng. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    @State private var nowTime = Date()
    @State private var timeNumber: Int = 4
    @State private var timeShowingStyle: Int = 2    // [0: default(0,1,2,3...),  1: (一,二...), 2: (壹,贰...)]
    @State private var backgroundShowingStyle: Int = 2    //  detail please review: BackgroundColor.swift
    @State private var timerString = getTimerString(styleNumber: 0)
    @State private var isHovering: Bool = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
//    let timeShowingStyles = ["0", "一", "壹"]
    
    var body: some View {
            ZStack {
                GeometryReader { geometry in
                    HStack(spacing: 0) {
                        ForEach(0 ..< timerString.count) { number in
                            SingleBackgroundView(timeNumber: .constant(self.timerString[number]))
                                .offset(x: number%2 != 0 ? 0 : geometry.size.width/520*20,
                                        y: geometry.size.height/185*45)
                        }
                        .onReceive(timer) { _ in
                            self.timerString = getTimerString(styleNumber: self.timeShowingStyle)
                            self.nowTime = Date()
                        }
                    }
                }
                GeometryReader { geometry in
                    ZStack {
                        DockClockView().offset(x: geometry.size.width/520*165, y: geometry.size.height/185*75)
                        DockClockView().offset(x: geometry.size.width/520*340, y: geometry.size.height/185*75)
                    }
                }

                GeometryReader { geometry in
                    Picker("Choose TimeStyle", selection: $timeShowingStyle) {
                        ForEach(0 ..< 3, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .labelsHidden()
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 100)
                    .padding([.top, .leading], 5.0)
                    .opacity(self.isHovering ? 1 : 0)
                    .onHover(perform: { hovering in
                        self.isHovering = hovering
                    })
                }
                
                GeometryReader { geometry in
                    Picker("Choose TimeStyle", selection: $backgroundShowingStyle) {
                        ForEach(0 ..< 6, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .labelsHidden()
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 150)
                    .padding([.top, .leading], 5.0)
                    .opacity(self.isHovering ? 1 : 0)
                    .onHover(perform: { hovering in
                        self.isHovering = hovering
                    })
                }
                .offset(x: 120)
                
                
            }
        .frame(minWidth: 450, idealWidth: 520, maxWidth: maximumWindowWidth ,minHeight: 80, idealHeight: 185, maxHeight: maximumWindowHeight)
        .background(LinearGradient(gradient: Gradient(colors: backgroundColorItems[self.backgroundShowingStyle].backgroundColor),
                                   startPoint: .topTrailing,
                               endPoint: .bottomLeading))
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

func getTimer() -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    formatter.dateFormat = "HHmmss"
//    formatter.dateFormat = "hhmmss"
    return formatter.string(from: Date())
}


func getTimerString(styleNumber: Int) -> [String] {
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
