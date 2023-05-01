//
//  GuessView.swift
//  MyQuiz
//
//  Created by Pawel Swiderski on 06/08/2022.
//

import SwiftUI

struct GuessedIconView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var icon: Icon
    @ObservedObject var level: Level
    //@State private var guess: String = ""
    //@State private var disableTextField: Bool = false
    //@State private var guessColor = Color(.black)
    
    var body: some View {
        
        
        VStack(alignment: .leading) {
            CustomNavBar(left: {
                NavigationLink{
                    LevelView(level: level)
                        .environment(
                            \.managedObjectContext,
                             PersistenceController.preview.container.viewContext)
                } label: {
                    Image(systemName: "arrowshape.turn.up.backward.fill")
                        .foregroundColor(.black)
                        .scaleEffect(1.3)
                        .padding()
                }
            }, center: {}, right: {}
            )
            VStack{
                
                Spacer()
                
                Image(icon.imageName)
                    .resizable().scaledToFit()
                    .padding()
                    .padding(.horizontal)
                
                Spacer()
                
                Text(icon.answer)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(.green, lineWidth: 3)
                    )
                    .background(RoundedRectangle(cornerRadius: 14).fill(Color.white))
                    .padding()
                
                GuessedInfo()
                
                Spacer()
                
            }
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("AccentColor"))
        .navigationBarHidden(true)
    }
    
    func toggleGuessed() {
        icon.guessed.toggle()
        try? viewContext.save()
    }
}

struct GuessedIconView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            GuessedIconView(icon:appleLogo, level: level_1)
        }
        .environment(
            \.managedObjectContext,
             PersistenceController.preview.container.viewContext
        )
    }
}
