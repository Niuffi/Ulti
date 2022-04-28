import SwiftUI

struct GamesView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var games: FetchedResults<Games>
    
    var body: some View {
        NavigationView{
            VStack{
                GamesViewTitle(teamName: "RJP")
                GamesViewNextGame()
                HStack{
                    NavigationLink(destination: AddGameView()){
                        HStack {
                            Image(systemName: "plus")
                            Text("ADD GAME")
                        }
                    }
                }
                List(games) { game in
                    Text(game.opponent ?? "Load Error")
                }
                
                Spacer()
            }
                .navigationBarHidden(true)
                .padding()
        }
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
            .preferredColorScheme(.dark)
    }
}
