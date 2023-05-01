//
//  PreviewProvider.swift
//  MyQuiz
//
//  Created by Pawel Swiderski on 07/08/2022.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var appleLogo: Icon {
        let icon = Icon(context: PersistenceController.preview.container.viewContext)
        icon.imageName = "AppleLogo"
        icon.answer = "Apple"
        icon.guessed = false
        icon.id = UUID()
        icon.imageScale = 1
        //icon.level = level_1
        icon.timestamp = Date()
        return icon
    }
    
    static var amazonLogo: Icon {
        let icon = Icon(context: PersistenceController.preview.container.viewContext)
        icon.imageName = "AmazonLogo"
        icon.answer = "Amazon"
        icon.guessed = false
        icon.id = UUID()
        icon.imageScale = 2
        //icon.level = level_1
        icon.timestamp = Date()
        return icon
    }
    
    static var level_1: Level {
        let level = Level(context: PersistenceController.preview.container.viewContext)
        level.levelNumber = 1
        level.icons = [appleLogo, amazonLogo, appleLogo, amazonLogo, appleLogo, amazonLogo, appleLogo, amazonLogo, appleLogo, amazonLogo, appleLogo, amazonLogo]
       
        return level
    }
}
