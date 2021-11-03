//
//  DetailViewDataHandler.swift
//  Lesson6
//
//  Created by Alexandr Evtodiy on 02.11.2021.
//  Copyright © 2021 Alex Apriamashvili. All rights reserved.
//

import Foundation
import UIKit

protocol DetailViewDataHandlerProtocol: UITableViewDataSource  {
    static var artistCellIdentifier: String {get}
    var tableContents: DetailViewModel? {get set}
}

final class DetailViewDataHandler: NSObject, DetailViewDataHandlerProtocol {
    
    // MARK: - Properties
    static var artistCellIdentifier = "com.song.cell"
    var tableContents: DetailViewModel?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let count = tableContents?.artistAlbums.count else {
            return 0
        }
        return count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      guard let contents = tableContents,
        contents.artistAlbums.count > section else { return 0 }
      return contents.artistAlbums[section].songList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailViewDataHandler.artistCellIdentifier, for: indexPath)
      guard let songCell = cell as? SongCell,
        let contents = tableContents,
        contents.artistAlbums[indexPath.section].songList.count > indexPath.row else { return cell }
      let viewModel = contents.artistAlbums[indexPath.section].songList[indexPath.row]
      songCell.applyViewModel(viewModel)

      return songCell
    }
}


