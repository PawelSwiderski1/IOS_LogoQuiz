//
//  GuessView.swift
//  MyQuiz
//
//  Created by Pawel Swiderski on 06/08/2022.
//

import SwiftUI

struct GuessView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var icon: Icon
    @ObservedObject var level: Level
    @State private var guess: String = ""
    @State private var disableTextField: Bool = false
    @State private var guessColor = Color(.black)
    
    var body: some View {
        
        
        VStack(alignment: .leading) {
            Spacer()
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
            Spacer()
            
            VStack{
                
                Spacer()
                
                Image(icon.imageName)
                    .resizable().scaledToFit()
                    .padding()
                    .padding(.horizontal)
                
                Spacer()
                
                TextField("", text: $guess)
                    .disabled(disableTextField)
                    .foregroundColor(.black)
                    .background(.white)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(guessColor, lineWidth: 3)
                    )
                    .background(RoundedRectangle(cornerRadius: 14).fill(Color.white))
                    .padding()
                
                ZStack{
                    Button {
                        if guess.caseInsensitiveCompare(icon.answer) == .orderedSame {
                            disableTextField.toggle()
                            toggleGuessed()
                            guessColor = Color(.green)


                        } else {
                            guessColor = Color(.red)
                            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { (timer) in
                                
                                guessColor = Color(.black)
                            }
                        }
                    } label: {
                        Text("Guess")
                            .foregroundColor(.white)
                            .padding()
                            .padding(.horizontal)
                            .background(.black)
                            .cornerRadius(30)
                            .shadow(radius: 10)
                    }
                    .padding()
                    
                    if disableTextField {
                        GuessedInfo()
                    }
                }
                Spacer()
                
            }
            
            Spacer()
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

struct GuessView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            GuessView(icon:appleLogo, level: level_1)
        }
        .environment(
            \.managedObjectContext,
             PersistenceController.preview.container.viewContext
        )
    }
}
