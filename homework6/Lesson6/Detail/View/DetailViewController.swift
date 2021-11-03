import UIKit

final class DetailViewController: UIViewController {
    
    
    // MARK: - Properties
    
    var output: DetailViewOutput?
    private let tableView: UITableView = UITableView()
    let dataHandler: DetailViewDataHandlerProtocol
    private var tableContents: DetailViewModel? {
        set {
            dataHandler.tableContents = newValue
        }
        get {
            dataHandler.tableContents
        }
    }
    
    // MARK: - Init
    
    internal init(dataHandler: DetailViewDataHandlerProtocol) {
        self.dataHandler = dataHandler
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        output?.viewIsReady()
    }
}

extension DetailViewController: DetailViewInput {
    
    func updateDetails(_ details: DetailViewModel) {
        title = details.artistName
        tableContents = details
        tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate

extension DetailViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderView()
        guard let contents = tableContents,
              contents.artistAlbums.count > section else { return headerView }
        let viewModel = contents.artistAlbums[section]
        headerView.apply(title: viewModel.title, date: viewModel.date)
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
}

// MARK: - Configuration

private extension DetailViewController {
    
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        configureTableView()
        constrainContents()
    }
    
    func configureTableView() {
        tableView.dataSource = dataHandler
        //tableView.delegate = output
        tableView.delegate = self
        tableView.register(SongCell.self, forCellReuseIdentifier: DetailViewDataHandler.artistCellIdentifier)
    }
}

// MARK: - Layout

private extension DetailViewController {
    
    func constrainContents() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
}
