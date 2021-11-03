//
//  ListViewDataHandler.swift
//  Lesson6
//
//  Created by Alexandr Evtodiy on 01.11.2021.
//  Copyright © 2021 Alex Apriamashvili. All rights reserved.
//

import Foundation
import UIKit

protocol ListViewDataHandlerProtocol: UITableViewDataSource  {
    static var artistCellIdentifier: String {get}
    var elements: [ListViewModel] {get set}
}

final class ListViewDataHandler: NSObject, ListViewDataHandlerProtocol {
    
    // MARK: - Properties
    static var artistCellIdentifier = "cell"
    var elements: [ListViewModel] = []
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return elements.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListViewDataHandler.artistCellIdentifier, for: indexPath)
      cell.accessoryType = .disclosureIndicator
      cell.textLabel?.text = elements[indexPath.row].title
      return cell
    }
}
