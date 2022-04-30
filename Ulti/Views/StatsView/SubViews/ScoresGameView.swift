//
//  ScoresGameView.swift
//  Ulti
//
//  Created by Kamil on 30/04/2022.
//

import SwiftUI

struct ScoresGameView: View {
    @State var ourScore = 0
    @State var enemyScore = 0
    var body: some View {
        VStack{
            HStack{
                Text(String(ourScore))
                    .padding()
                    .font(.title)
                Spacer()
                StatsViewTimer(gameStart: Date())
                Spacer()
                Text(String(enemyScore))
                    .padding()
                    .font(.title)
            }
            
            Spacer()
        }
    }
}

struct ScoresGameView_Previews: PreviewProvider {
    static var previews: some View {
        ScoresGameView()
            .preferredColorScheme(.dark)
    }
}
