//
//  Result.swift
//  Lesson6
//
//  Created by Alexandr Evtodiy on 02.11.2021.
//  Copyright © 2021 Alex Apriamashvili. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}
