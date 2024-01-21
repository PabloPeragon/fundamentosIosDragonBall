//
//  HeroListTableViewController.swift
//  practicaDragonBall
//
//  Created by Pablo Jesús Peragón Garrido on 16/1/24.
//

import UIKit

final class HeroesListTableViewController: UITableViewController {
    typealias DataSource = UITableViewDiffableDataSource<Int, DragonBallHero>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, DragonBallHero>
    // MARK: - Model
    private var heroes: [DragonBallHero] = []
    private let networkModel = NetworkModel.shared
    private var datasource: DataSource?
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        tableView.register(
            UINib(nibName: "HeroeTableViewCell", bundle: nil),
            forCellReuseIdentifier: "HeroeTableViewCell"
        )
        
        tableView.estimatedRowHeight = 100
        
        datasource = DataSource(tableView: tableView) { tableView, indexPath, hero in
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "HeroeTableViewCell",
                for: indexPath
            ) as? HeroeTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: hero)
            return cell
        }
        
        tableView.dataSource = datasource
        
        networkModel.getHeroes { [weak self] result in
            switch result {
            case .success(let heroes):
                self?.heroes = heroes
                var snapshot = Snapshot()
                snapshot.appendSections([0])
                snapshot.appendItems(heroes)
                self?.datasource?.apply(snapshot)
            case .failure(let error):
                print("Error loading heroes: \(error)")
            }
        }
    }
    
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let hero = heroes[indexPath.row]
        let detailViewController = heroDetailViewController(hero: hero)
        navigationController?.show(detailViewController, sender: nil)
    }
    override func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        100
    }
    
}

// MARK: - Configuration
private extension HeroesListTableViewController {
    func setUpView() {
        title = "Heroes"
    }
}


    

        
