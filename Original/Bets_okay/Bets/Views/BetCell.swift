//
//  BetCell.swift
//  Bets
//
//  Created by Milton Leslie Sobrinho de Souza Sanches on 03/05/24.
//

import UIKit
import BetsCore

class BetCell: UICollectionViewCell {
    static let identifier = "BetCell"
    
    private let nameLabel = UILabel()
    private let sellInLabel = UILabel()
    private let qualityLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, sellInLabel, qualityLabel])
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }

    func configure(with viewModel: BetViewModel) {
        nameLabel.text = "Name: \(viewModel.name)"
        sellInLabel.text = "Sell In: \(viewModel.sellIn)"
        qualityLabel.text = "Quality: \(viewModel.quality)"
    }
}
