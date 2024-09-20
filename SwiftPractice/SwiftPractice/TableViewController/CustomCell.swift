import UIKit

protocol CustomCellProtocol {
  func configure(with text: String)
}

final class CustomCell: UITableViewCell {
  
  // MARK: - UIElements
  private let titleLabel = UILabel()
  
  // MARK: - Properties
  static let reuseIdentifier = String(describing: CustomCell.self)
  static let rowHeigh: CGFloat = 100
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.backgroundColor = .red
    setupUI()
    configureSubviews()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Actions
extension CustomCell: CustomCellProtocol {
  func configure(with text: String) {
    titleLabel.text = text
  }
}

//  MARK: - Set Views and Constraints
private extension CustomCell {
  func setupUI() {
    // Title Label
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.numberOfLines = 1
    titleLabel.font = .preferredFont(forTextStyle: .title2)
  }
  
  func configureSubviews() {
    contentView.addSubview(titleLabel)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
    ])
  }
}
