//
//  BetDetailViewController.swift
//  Bets
//
//  Created by Milton Leslie Sobrinho de Souza Sanches on 03/05/24.
//

import UIKit
import BetsCore

class BetDetailViewController: UIViewController {
    var bet: Bet?

    private var nameLabel: UILabel!
    private var sellInLabel: UILabel!
    private var qualityLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        displayBetDetails()
    }

    private func setupUI() {
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)

        sellInLabel = UILabel()
        sellInLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sellInLabel)

        qualityLabel = UILabel()
        qualityLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(qualityLabel)

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sellInLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            sellInLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            qualityLabel.topAnchor.constraint(equalTo: sellInLabel.bottomAnchor, constant: 20),
            qualityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
    }

    private func displayBetDetails() {
        guard let bet = bet else { return }
        navigationItem.title = bet.name
        nameLabel.text = "Name: \(bet.name)"
        sellInLabel.text = "Sell In: \(bet.sellIn) days"
        qualityLabel.text = "Quality: \(bet.quality)"
    }
}
