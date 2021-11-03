//
//  ArtistServiceImplementation.swift
//  Lesson6
//
//  Created by Alexandr Evtodiy on 02.11.2021.
//  Copyright © 2021 Alex Apriamashvili. All rights reserved.
//

import Foundation

final class ArtistServiceImplementation: ArtistService {

    func fetchArtistList(_ completion: @escaping ArtistListResult) {
        completion(.success(ModelStubFactory.list()))
    }

    func fetchArtist(at index: Int , _ completion: @escaping ArtistDetailResult) {
        completion(.success(ModelStubFactory.detail()))
    }
}
