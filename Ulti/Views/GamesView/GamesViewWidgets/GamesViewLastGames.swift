//
//  GamesViewLastGames.swift
//  Ulti
//
//  Created by Kamil on 28/04/2022.
//

import SwiftUI

struct GamesViewLastGames: View {
    @FetchRequest(sortDescriptors: []) var games: FetchedResults<Games>
    
    var body: some View {
        VStack {
            HStack{
                Text("Last Games")
                    .padding(.leading, 20.0)
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(games, id: \.id) { game in
                        CircleView(opponent: game.opponent ?? "", ourScore: Int(game.ourPoints), enemyScore: Int(game.enemyPoints))
                    }
                }
            }
        }
    }
}

struct CircleView: View {
    @State var opponent: String
    @State var ourScore: Int
    @State var enemyScore: Int
    
    
    var body: some View {
        ZStack {
            VStack{
                    Text("\(ourScore):\(enemyScore)")
                    Text("\(opponent)")
                    
            }.padding(.all)
                .frame(width: 150.0, height: 50.0)
                .background(Color.blue)
                .cornerRadius(20)
        }
    }
}


struct GamesViewLastGames_Previews: PreviewProvider {
    static var previews: some View {
        GamesViewLastGames()
    }
}
