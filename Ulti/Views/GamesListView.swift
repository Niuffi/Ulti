//
//  GamesListView.swift
//  Ulti
//
//  Created by Kamil on 28/04/2022.
//

import SwiftUI


struct GamesListView: View {
    @FetchRequest(sortDescriptors: []) var games: FetchedResults<Games>
    var body: some View {
    
        List(games) { game in
            Text("\(game.opponent ?? "") \(game.ourPoints):\(game.enemyPoints)")
        }.navigationBarTitle(Text("Game List"))
    }
}

struct GamesListView_Previews: PreviewProvider {
    static var previews: some View {
        GamesListView()
    }
}


