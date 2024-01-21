//
//  HeroTransformationTableViewController.swift
//  practicaDragonBall
//
//  Created by Pablo Jesús Peragón Garrido on 19/1/24.
//

import UIKit

final class HeroTransformationTableViewController: UITableViewController {
    typealias DataSource = UITableViewDiffableDataSource<Int, HeroTransformation>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, HeroTransformation>
    // MARK: - Model
    private var listaTransformations: [HeroTransformation] = []
    private let networkModel = NetworkModel.shared
    private var dataSource: DataSource?
    
    init(tranformation: [HeroTransformation]) {
        
        self.listaTransformations = tranformation
        super.init(nibName: nil, bundle: nil)
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        tableView.register(
            UINib(nibName: TransformationTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: TransformationTableViewCell.identifier
        )
        
        tableView.estimatedRowHeight = 150
        
        dataSource = DataSource(tableView: tableView) { tableView, indexPath, transformation in
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: TransformationTableViewCell.identifier,
                for: indexPath
            ) as? TransformationTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: transformation)
            return cell
            
        }
        
        tableView.dataSource = dataSource
        
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(listaTransformations)
        dataSource?.apply(snapshot)
    
    }
    
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let transformation = listaTransformations[indexPath.row]
        print("seleccionaste la transformacion del heroe: \(transformation)")
        
    }
    
    override func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        150
    }
}


// MARK: - Configuration
private extension HeroTransformationTableViewController {
    func setUpView() {
        title = "Transformations"
    }
}
