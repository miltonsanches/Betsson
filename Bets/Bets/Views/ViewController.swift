import UIKit
import BetsCore

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    private var list: UICollectionView!
    private var activity: UIActivityIndicatorView!
    private var betListViewModel: BetListViewModel!
    let updateButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Odds"
        
        setupUI()
        
        betListViewModel = BetListViewModel(repository: BetRepository(service: RemoteBetService.instance))
        Task {
            await loadBets()
        }
    }
    
    private func setupUI() {
        updateButton.setTitle("Update", for: .normal)
        updateButton.setTitleColor(.white, for: .normal)
        updateButton.backgroundColor = .black
        updateButton.layer.cornerRadius = 5
        updateButton.frame = CGRect(x: 0, y: 0, width: 80, height: 30)
        updateButton.addTarget(self, action: #selector(updateOddsButtonTapped), for: .touchUpInside)
        let updateBarButton = UIBarButtonItem(customView: updateButton)
        navigationItem.rightBarButtonItem = updateBarButton
        
        let configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        list = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        list.register(BetCell.self, forCellWithReuseIdentifier: BetCell.identifier)
        list.dataSource = self
        list.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(list)
        list.delegate = self
        NSLayoutConstraint.activate([
            list.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            list.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            list.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            list.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        activity = UIActivityIndicatorView(style: .medium)
        activity.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activity)
        NSLayoutConstraint.activate([
            activity.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activity.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    private func loadBets() async {
        UIView.animate(withDuration: 1, animations: {
            self.list.isHidden = true
            self.activity.startAnimating()
        }) { _ in
            Task {
                do {
                    try await self.betListViewModel.fetchBets()
                    await MainActor.run {
                        self.list.reloadData()
                        UIView.animate(withDuration: 1, animations: {
                            self.list.isHidden = false
                            self.activity.stopAnimating()
                        })
                    }
                } catch {
                    print("Error fetching items.")
                }
            }
        }
    }
    
    @objc private func updateOddsButtonTapped() {
        Task {
            await loadBets()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return betListViewModel.betViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let betViewModel = betListViewModel.betViewModels[indexPath.item]
        guard let cell = list.dequeueReusableCell(withReuseIdentifier: BetCell.identifier, for: indexPath) as? BetCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: betViewModel)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let betViewModel = betListViewModel.betViewModels[indexPath.item]
        let betDetailVC = BetDetailViewController()
        betDetailVC.bet = Bet(name: betViewModel.name, sellIn: betViewModel.sellIn, quality: betViewModel.quality)
        navigationController?.pushViewController(betDetailVC, animated: true)
    }
}
