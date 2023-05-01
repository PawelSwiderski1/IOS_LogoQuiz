//
//  TestView.swift
//  MyQuiz
//
//  Created by Pawel Swiderski on 10/08/2022.
//

import SwiftUI

struct TestView: View {
    //@Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var levels: FetchedResults<Level>
    //@ObservedObject var level: Level

    var body: some View {
        VStack{
//            List {
//                ForEach(levels, id: \.self) { level in
//                    Section("\(level.levelNumber)"){
//                        ForEach(level.iconsArray, id: \.self){ icon in
//                            Text(icon.imageName)
//                        }
//                    }
//                }
//
//            }
            
            Text(levels[0].iconsArray[0].imageName)
//
//            Button("Add icons") {
//                let icon1 = Icon(context: moc)
//                icon1.imageName = "AppleLogo"
//                icon1.timestamp = Date()
//                icon1.level = Level(context: moc)
//                icon1.level?.levelNumber = 1
//
//                let icon2 = Icon(context: moc)
//                icon2.imageName = "AmazonLogo"
//                icon2.timestamp  = Date()
//                icon2.level = Level(context: moc)
//                icon2.level?.levelNumber = 1
//
//                try? moc.save()
//            }
            
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
        .environment(
            \.managedObjectContext,
             PersistenceController.preview.container.viewContext
        )
    }
}
