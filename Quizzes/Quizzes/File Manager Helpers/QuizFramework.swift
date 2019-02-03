//
//  QuizFramework.swift
//  Quizzes
//
//  Created by Ibraheem rawlinson on 2/2/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

class QuizFramework: Codable {
    let collection: [QuizCollection]
}

class QuizCollection: Codable {
    let facts: [String]
    let id: String
    let quizTitle: String
}
