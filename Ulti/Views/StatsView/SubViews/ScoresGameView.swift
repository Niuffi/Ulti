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
    @State var gameStart = Date()
    @State var start = false
    @State var players = [Player]()
    @State var line = [Player]()
    
    init() {
        @Environment(\.managedObjectContext) var moc
        @FetchRequest(
            entity: Players.entity(),
            sortDescriptors: [
                NSSortDescriptor(keyPath: \Players.number, ascending: true),
            ]
        ) var players: FetchedResults<Players>
        
        for player in players {
            let newPlayer = Player(id: player.id ?? UUID(), name: player.name ?? "", surname: player.surname ?? "", number: Int(player.number), gender: player.gender)
            self.players.append(newPlayer)
        }
        
    }
    
    var body: some View {
        VStack{
            HStack{
                Text(String(ourScore))
                    .padding()
                    .font(.title)
                Spacer()
                if start {
                    StatsViewTimer(gameStart: gameStart)
                }
                else {
                    Text("00:00").font(.title)
                }
                Spacer()
                Text(String(enemyScore))
                    .padding()
                    .font(.title)
            }
            List(players, id: \.number) { player in
                Text("\(player.number) \(player.name) \(player.surname)")
            }
            Button("Start Game"){
                gameStart = Date()
                start = true
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

class Player {
    let id: UUID
    let name: String
    let surname: String
    let number: Int
    let gender: Bool
    
    init(id: UUID, name: String, surname: String, number: Int, gender: Bool){
        self.id = id
        self.name = name
        self.surname = surname
        self.number = number
        self.gender = gender
    }
}
