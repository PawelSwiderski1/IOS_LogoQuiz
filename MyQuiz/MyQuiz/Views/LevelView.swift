//
//  LevelView.swift
//  MyQuiz
//
//  Created by Pawel Swiderski on 05/08/2022.
//
import SwiftUI

struct LevelView: View {
    @ObservedObject var level: Level

    var body: some View {
        VStack {
            Spacer()
            
            CustomNavBar(left: {
                NavigationLink {
                    ChooseLevelView()
                } label: {
                    Image(systemName: "arrowshape.turn.up.backward.fill")
                        .foregroundColor(.black)
                        .scaleEffect(1.3)
                        .padding()
                }
            }, center: {
                Text("Level 1 ")
                    .font(.title)
                    .fontWeight(.heavy)
            }, right: {
            })
             
            Spacer()
            
            VStack (spacing: 10){
                //Spacer()
                
                ForEach(level.iconsArray.chunked(into: 3), id: \.self) { chunk in
                    
                    HStack (spacing: 10){
                        //Spacer()
                        
                        ForEach(chunk, id: \.self) { icon in
                            NavigationLink {
                                if !icon.guessed {
                                    GuessView(icon: icon, level: level)
                                } else {
                                    GuessedIconView(icon: icon, level: level)
                                }
                            } label: {
                                ZStack{
                                    Image(icon.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .scaleEffect(icon.imageScale)
                                        //.padding()
                                        .opacity(icon.guessed ? 0.5 : 1)
                                    
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(Color(.green))
                                        .opacity(icon.guessed ? 1 : 0)
                                }
                                //Spacer()
                            }
                            
                        }
                        //Spacer()
                    }
                    //Spacer()
                }
            }
            
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            //Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("AccentColor"))
        
        
        .navigationBarHidden(true)
        
    }
    
}

struct LevelView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView{
            LevelView(level: level_1)
        }
        .buttonStyle(PlainButtonStyle())
        .environment(
            \.managedObjectContext,
             PersistenceController.preview.container.viewContext
        )
    }
}
