//
//  LevelView.swift
//  MyQuiz
//
//  Created by Pawel Swiderski on 04/08/2022.
//

import SwiftUI

struct ChooseLevelView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.levelNumber)]) var levels: FetchedResults<Level>
    
    var body: some View {
        VStack {
            Spacer()
            CustomNavBar(left: {
                NavigationLink {
                    ContentView()
                } label: {
                    Image(systemName: "arrowshape.turn.up.backward.fill")
                        .foregroundColor(.black)
                        .scaleEffect(1.3)
                        .padding()
                }
            }, center: {
                Text("Choose level")
                    .font(.title)
                    .fontWeight(.heavy)
            }, right: {}
            )
            //Spacer()
            ScrollView {
                Spacer()
                VStack (spacing: 20) {
                    ForEach(levels, id: \.self) { level in
                        NavigationLink {
                            LevelView(level: level)
                        } label: {
                            LevelRow(level: level, totalGuessed: guessedTotal(levels))
                               
                        }
                        .disabled(!unlocked(guessedTotal(levels), level))
                    }
                }
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("AccentColor"))
        .navigationBarHidden(true)
        
    }
}

func guessedTotal (_ levels: FetchedResults<Level>) -> Int {
    var counter: Int = 0
    for level in levels{
        counter += level.progress
    }
    return counter
}

func unlocked (_ guessedTotal: Int,_ level: Level) -> Bool {

    return guessedTotal >= Int(Double(12*(level.levelNumber - 1))*0.8)
}

struct ChooseLevelView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChooseLevelView()
        }
        .buttonStyle(PlainButtonStyle())
        .environment(
          \.managedObjectContext,
          PersistenceController.preview.container.viewContext
        )
    }
}
