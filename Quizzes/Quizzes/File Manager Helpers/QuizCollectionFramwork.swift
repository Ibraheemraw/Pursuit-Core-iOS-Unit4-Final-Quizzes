//
//  QuizCollectionFramwork.swift
//  Quizzes
//
//  Created by Ibraheem rawlinson on 2/2/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation


final class QuizCollectionFramwork {
    static let fileName = "QuizCollection.plist"
    private static var collection = [QuizCollection]()
    private init(){}
    static func fetchQuizCollectionFromDocumentsDirectory() -> [QuizCollection]{
        let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: fileName).path
        if FileManager.default.fileExists(atPath: path){
            if let data = FileManager.default.contents(atPath: path){
                do {
                    collection = try PropertyListDecoder().decode([QuizCollection].self, from: data)
                } catch {
                    print("property list decoding error: \(error)")
                }
            } else {
               print("data is nil")
            }
        } else {
           print("\(fileName) does not exist")
        }
        return collection
    }
    static func saveQuizCollection(){
        // step 1  create the path
        let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: fileName)
        //step 2 create a do catch and encode the data
        do {
            let data = try PropertyListEncoder().encode(collection)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoding \(error)")
        }
    }
    static func addQuiz(quiz: QuizCollection){
        collection.append(quiz)
        saveQuizCollection()
    }
    static func deleteQuizFromQuizCollection(favoriteQuiz: QuizCollection, atIndex: Int){
         // get current favorite evnets and remove favorite from index
        var favoriteQuizzes = fetchQuizCollectionFromDocumentsDirectory()
        favoriteQuizzes.remove(at: atIndex)
        // save changes to documents directory
        let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: fileName)
        do {
            let data = try PropertyListEncoder().encode(favoriteQuizzes)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch{
            print("property list encoding error: \(error)")
        }
    }
//    static func updateQuizCollection(item: Item, atIndex index: Int){
//        
//    }
    
    static public func isFavorite(id: String) -> Bool {
        let index = fetchQuizCollectionFromDocumentsDirectory().index { $0.id == id }
        var found = false
        if let _ = index {
            found = true
        }
        return found
    }
}
