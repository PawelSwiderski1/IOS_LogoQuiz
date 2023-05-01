//
//  ContentView.swift
//  MyQuiz
//
//  Created by Pawel Swiderski on 03/08/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack (spacing: 140){
                Spacer()
                
                Text("Choose the category")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color(hue: 0.5, saturation: 0.85, brightness: 0.15, opacity: 0.9))
                VStack (spacing: 60) {
                    NavigationLink {
                        ChooseLevelView()
                    } label: {
                        Text("Brands")
                            .categoryTitle()
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Text("Celebrities")
                        .categoryTitle()
                        
                    Text("Movies & TV Shows")
                        .categoryTitle()
                    
                    Spacer()
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(Color("AccentColor"))
        }
        .navigationBarHidden(true)
        .buttonStyle(PlainButtonStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
