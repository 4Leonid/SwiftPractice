import UIKit

class CustomView: UIView {
  
  private let tableView = UITableView()
  
  private weak var delegate: TableViewController?
  
  init(delegate: TableViewController? = nil) {
    self.delegate = delegate
    super.init(frame: .zero)
    setupUI()
    configureSubviews()
    setupConstraints()
    setDelegates()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

//  MARK: - Set Views and Constraints
extension CustomView {
  func setupUI() {
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.reuseIdentifier)
    tableView.backgroundColor = .yellow
    tableView.rowHeight = CustomCell.rowHeigh
  }
  
  func configureSubviews() {
    addSubview(tableView)
  }
  
  func setupConstraints() {
    tableView.edgesToSuperview()
    NSLayoutConstraint.activate([
      
    ])
  }
  
  func setDelegates() {
    tableView.dataSource = delegate
    tableView.delegate = delegate
  }
}


