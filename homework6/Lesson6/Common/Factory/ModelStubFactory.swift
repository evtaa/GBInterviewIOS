//
//  ModelStubFactory.swift
//  Lesson6
//
//  Created by Alexandr Evtodiy on 02.11.2021.
//  Copyright © 2021 Alex Apriamashvili. All rights reserved.
//

import Foundation

final class ModelStubFactory {
    static func detail() -> Model.Artist {
        let detail = Model.Artist(
            identifier: 1,
            name: "John Lennonn",
            albums: [
                Model.Artist.Album(
                    name: "Imagine",
                    songs: [
                        Model.Artist.Song(name: "Imagine", duration: 180),
                        Model.Artist.Song(name: "Crippled Inside", duration: 227),
                        Model.Artist.Song(name: "Jealous Guy", duration: 254),
                        Model.Artist.Song(name: "It's So Hard", duration: 205),
                        Model.Artist.Song(name: "I Don't Want to Be a Soldier", duration: 365),
                        Model.Artist.Song(name: "Gimme Some Truth", duration: 196),
                        Model.Artist.Song(name: "Oh My Love", duration: 170),
                        Model.Artist.Song(name: "How Do You Sleep?", duration: 336),
                        Model.Artist.Song(name: "How?", duration: 223),
                        Model.Artist.Song(name: "Oh Yoko!", duration: 260)
                    ],
                    date: Date(timeIntervalSince1970: 53222400)
                )
            ]
        )
        return detail
    }
    
    static func list() -> [Model.Artist] {
        let list = [
            Model.Artist(
                identifier: 1,
                name: "John Lennon1",
                albums: [
                    Model.Artist.Album(
                        name: "Imagine",
                        songs: [
                            Model.Artist.Song(name: "Imagine1", duration: 180),
                            Model.Artist.Song(name: "Crippled Inside", duration: 227),
                            Model.Artist.Song(name: "Jealous Guy", duration: 254),
                            Model.Artist.Song(name: "It's So Hard", duration: 205),
                            Model.Artist.Song(name: "I Don't Want to Be a Soldier", duration: 365),
                            Model.Artist.Song(name: "Gimme Some Truth", duration: 196),
                            Model.Artist.Song(name: "Oh My Love", duration: 170),
                            Model.Artist.Song(name: "How Do You Sleep?", duration: 336),
                            Model.Artist.Song(name: "How?", duration: 223),
                            Model.Artist.Song(name: "Oh Yoko!", duration: 260)
                        ],
                        date: Date(timeIntervalSince1970: 53222400)
                    )
                ]
            ),
            Model.Artist(
                identifier: 2,
                name: "John Lennon2",
                albums: [
                    Model.Artist.Album(
                        name: "Imagine",
                        songs: [
                            Model.Artist.Song(name: "Imagine2", duration: 180),
                            Model.Artist.Song(name: "Crippled Inside", duration: 227),
                            Model.Artist.Song(name: "Jealous Guy", duration: 254),
                            Model.Artist.Song(name: "It's So Hard", duration: 205),
                            Model.Artist.Song(name: "I Don't Want to Be a Soldier", duration: 365),
                            Model.Artist.Song(name: "Gimme Some Truth", duration: 196),
                            Model.Artist.Song(name: "Oh My Love", duration: 170),
                            Model.Artist.Song(name: "How Do You Sleep?", duration: 336),
                            Model.Artist.Song(name: "How?", duration: 223),
                            Model.Artist.Song(name: "Oh Yoko!", duration: 260)
                        ],
                        date: Date(timeIntervalSince1970: 53222400)
                    )
                ]
            )]
        return list
    }
}
