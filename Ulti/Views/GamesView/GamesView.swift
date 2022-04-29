import SwiftUI

struct GamesView: View {
    
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
                    Spacer()
                        .frame(width: 40.0)
                    NavigationLink(destination: GamesListView()){
                        HStack {
                        Image(systemName: "list.bullet")
                        Text("GAME LIST")
                        }
                    }
                }.padding()
                GamesViewLastGames()
                
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
