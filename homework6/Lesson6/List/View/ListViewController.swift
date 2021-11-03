import UIKit

class ListViewController: UIViewController {
    
    // MARK: Properties
    var output: ListViewOutput?
    let dataHandler: ListViewDataHandlerProtocol
    let tableView: UITableView = UITableView()
    var elements: [ListViewModel]  {
        set {
            dataHandler.elements = newValue
        }
        get {
            dataHandler.elements
        }
    }
    
    // MARK: Init
    internal init(dataHandler: ListViewDataHandlerProtocol) {
        self.dataHandler = dataHandler
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: Life cycles
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        view.backgroundColor = .white
        title = "Artists"
        output?.viewIsReady()
    }
}

private extension ListViewController {
    
    func configureUI() {
        view.addSubview(tableView)
        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: ListViewDataHandler.artistCellIdentifier
        )
        tableView.dataSource = dataHandler
        tableView.delegate = output
        constrainTableView()
    }
    
    func constrainTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension ListViewController: ListViewInput {
    func reload(_ viewModels: [ListViewModel]) {
        elements = viewModels
        tableView.reloadData()
    }
}










