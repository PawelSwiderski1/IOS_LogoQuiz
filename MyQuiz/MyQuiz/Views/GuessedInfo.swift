//
//  GuessedInfo.swift
//  MyQuiz
//
//  Created by Pawel Swiderski on 08/08/2022.
//

import SwiftUI

struct GuessedInfo: View {
    var body: some View {
        HStack {
            Spacer()
            
            VStack {
                Text("Correct!")
                    .fontWeight(.heavy)
                    .font(.title)
                    .foregroundColor(.white)
            }
            
            .frame(maxWidth: .infinity)
            .frame(height: 170)
            .padding()
            .padding(.horizontal)
            .background(.green)
            .cornerRadius(40)
            
            Spacer()
        }
        
    }
}

struct GuessedInfo_Previews: PreviewProvider {
    static var previews: some View {
        GuessedInfo()
    }
}
