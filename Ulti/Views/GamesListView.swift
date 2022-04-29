//
//  GamesListView.swift
//  Ulti
//
//  Created by Kamil on 28/04/2022.
//

import SwiftUI


struct GamesListView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(
        entity: Games.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Games.opponent, ascending: true),
        ]
    ) var games: FetchedResults<Games>
    
    
    var body: some View {
    
        List{
            ForEach(games, id: \.self) { game in
                Text("\(game.opponent ?? "") \(game.ourPoints):\(game.enemyPoints)")
            }.onDelete(perform: removeGame)
        }
            
            .navigationBarTitle(Text("Game List"))
    }
    
    func removeGame(at offsets: IndexSet) {
        for index in offsets {
            let game = games[index]
            moc.delete(game)
            do {
                try moc.save()
            } catch {
                // handle the Core Data error
            }
        }
    }
}

struct GamesListView_Previews: PreviewProvider {
    static var previews: some View {
        GamesListView()
    }
}



