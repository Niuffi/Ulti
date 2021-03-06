//
//  TeamView.swift
//  Ulti
//
//  Created by Kamil on 26/04/2022.
//

import SwiftUI

struct TeamView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(
        entity: Players.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Players.number, ascending: true),
        ]
    ) var players: FetchedResults<Players>
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(players, id: \.self) { player in
                        Text("\(playerNumberToString(number: player.number)) \(player.name ?? "") \(player.surname ?? "")")
                    }.onDelete(perform: removePlayer)
                }
                NavigationLink(destination: AddPlayerView()){
                    HStack {
                    Image(systemName: "plus")
                    Text("ADD PLAYER")
                    }.padding()
                }
            }
                .navigationBarHidden(true)
                
        }
    }
    
    func removePlayer(at offsets: IndexSet) {
        for index in offsets {
            let player = players[index]
            moc.delete(player)
            do {
                try moc.save()
            } catch {
                // handle the Core Data error
            }
        }
    }
    
    func playerNumberToString(number: Int16) -> String{
        if number < 10 {
            return "#0\(number)"
        }
        else {
            return "#\(number)"
        }
    }
}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView()
            .preferredColorScheme(.dark)
    }
}
