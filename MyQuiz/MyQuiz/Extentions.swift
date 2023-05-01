//
//  Extentions.swift
//  MyQuiz
//
//  Created by Pawel Swiderski on 04/08/2022.
//

import Foundation
import SwiftUI

extension Text {
    func categoryTitle() -> some View {
        self.fontWeight(.heavy)
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .background(.red)
            .cornerRadius(25)
            .padding()
            .padding(.horizontal)
    }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
