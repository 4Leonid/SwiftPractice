import UIKit

final class TableViewController: UIViewController {
  
  private lazy var tableView = CustomView(delegate: self)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupUI()
    configureSubviews()
    setupConstraints()
  }
}

// MARK: - UITableViewDataSource
extension TableViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.reuseIdentifier, for: indexPath) as? CustomCell else { return UITableViewCell() }
    let text = String(indexPath.row)
    cell.configure(with: text)
    return cell
  }
}

// MARK: - UITableViewDelegate
extension TableViewController: UITableViewDelegate {
  
}
//  MARK: - Set Views and Constraints
extension TableViewController {
  func setupUI() {
    tableView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func configureSubviews() {
    view.addSubview(tableView)
  }
  
  func setupConstraints() {
    tableView.edgesToSuperview()
    NSLayoutConstraint.activate([
      
    ])
  }
}
