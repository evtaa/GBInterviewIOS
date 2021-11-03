//
//  ArtistService.swift
//  Lesson6
//
//  Created by Alexandr Evtodiy on 02.11.2021.
//  Copyright © 2021 Alex Apriamashvili. All rights reserved.
//

import Foundation

protocol ArtistService {

    typealias ArtistListResult = (Result<[Model.Artist]>) -> ()
    typealias ArtistDetailResult = (Result<Model.Artist>) -> ()

    func fetchArtistList(_ completion: @escaping ArtistListResult)
    func fetchArtist(at index: Int , _ completion: @escaping ArtistDetailResult)
}
