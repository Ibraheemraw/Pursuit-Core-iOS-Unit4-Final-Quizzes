//
//  QuizApiClient.swift
//  Quizzes
//
//  Created by Ibraheem rawlinson on 2/2/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation


final class QuizApiClient {
    static func searchForQuizCollection(callBack: @escaping(AppError?, [QuizCollection]?)->Void){
        let endPointUrl = "https://quizzes-9ff59.firebaseio.com/.json"
        NetworkHelper.shared.performDataTask(endpointURLString: endPointUrl, httpMethod: "GET", httpBody: nil) { (appError, data) in
            if let appError = appError {
                print(appError.errorMessage())
            }
            if let data = data {
                do {
                    let quizCollection = try JSONDecoder().decode([QuizCollection].self, from: data)
                    callBack(nil, quizCollection)
                } catch {
                    callBack(AppError.jsonDecodingError(error), nil)
                }
            }
        }
        
    }
}
