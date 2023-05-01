//
//  LevelRow.swift
//  MyQuiz
//
//  Created by Pawel Swiderski on 04/08/2022.
//

import SwiftUI

struct LevelRow: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var level: Level
    
    var progressWidth: Int {
        return (350/12) * level.progress
    }
    
    var totalGuessed: Int
    
    var guessesToUnlock: Int {
        Int(Double(12*(level.levelNumber - 1))*0.8) - totalGuessed
    }
    
    var unlocked: Bool {
        return guessesToUnlock <= 0
    }
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack(alignment: .center, spacing: 10) {
                Text("Level \(level.levelNumber)")
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                
                if unlocked {
                    Text("You guessed \(level.progress) out of 12 in this level")
                    
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 50)
                            .frame(maxWidth: 350, maxHeight: 10)
                            .foregroundColor(Color (hue: 1.0, saturation: 0.9, brightness: 0.564, opacity: 0.327))
                        
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: CGFloat(progressWidth), height: 10)
                        
                    }
                } else {
                    Text("You need \(guessesToUnlock) more correct guesses")
                }
                    
                
            }
            .frame(maxWidth: .infinity)
            .padding()
            .padding(.horizontal)
            .background(.brown)
            .cornerRadius(20)
            
            Spacer()
        }
        
    }
    
}

struct LevelRow_Previews: PreviewProvider {
    static var previews: some View {
        LevelRow(level: level_1, totalGuessed: 100)
            .environment(
                \.managedObjectContext,
                 PersistenceController.preview.container.viewContext
            )
    }
}
