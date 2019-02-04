//
//  ProfileHelper.swift
//  Quizzes
//
//  Created by Ibraheem rawlinson on 2/4/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

final class ProfileHelper{
    static let fileName = "Profile.plist"
    private static var profiles = [ProfileFramework]()
    private init(){}
    static func fetchProfilesFromDocumentsDirectory() -> [ProfileFramework]{
        let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: fileName).path
        if FileManager.default.fileExists(atPath: path){
            if let data = FileManager.default.contents(atPath: path){
                do {
                    profiles = try PropertyListDecoder().decode([ProfileFramework].self, from: data)
                } catch {
                    print("property list decoding error: \(error)")
                }
            } else {
                print("data is nil")
            }
        } else {
            print("\(fileName) does not exist")
        }
        return profiles
    }
    static func saveProfiles(){
        // step 1  create the path
        let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: fileName)
        //step 2 create a do catch and encode the data
        do {
            let data = try PropertyListEncoder().encode(profiles)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoding \(error)")
        }
    }
}
