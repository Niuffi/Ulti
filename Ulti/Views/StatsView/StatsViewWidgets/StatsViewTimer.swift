//
//  StatsViewTimer.swift
//  Ulti
//
//  Created by Kamil on 30/04/2022.
//

import SwiftUI

struct StatsViewTimer: View {
    @State var gameStart = Date()
    @State var gameTime = TimeInterval()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        Text("\(gameTimeString(timeInterval: gameTime))")
            .onReceive(timer) { _ in
                gameTime = Date().timeIntervalSince(gameStart)
            }
            .font(.title)
    }
    
    public func startGame() {
        gameStart = Date()
    }
    
    private func gameTimeString(timeInterval: TimeInterval) -> String {
        let timeInt = Int(timeInterval)
        
        return addZero(timeInt/60) + ":" + addZero(timeInt%60)
    }
    
    private func addZero(_ x: Int) -> String {
        if x < 10 {
            return "0" + String(x)
        }
        else {
            return String(x)
        }
    }
}

struct StatsViewTimer_Previews: PreviewProvider {
    static var previews: some View {
        StatsViewTimer(gameStart: Date())
            .preferredColorScheme(.dark)
    }
}
