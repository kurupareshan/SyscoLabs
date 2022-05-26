//
//  PlanetViewController.swift
//  SyscoTest
//
//  Created by kurupareshan pathmanathan on 5/25/22.
//

import UIKit

class PlanetViewController: UIViewController {

    var viewModel: PlanetViewModel? = nil
    
    @IBOutlet weak var tableView: UITableView!
    public class var storyboardName: String {
        return "Planet"
    }
    
    static func create(viewModel: PlanetViewModel) -> PlanetViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle(for: self))
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: PlanetViewController.self)) as? PlanetViewController
        viewController!.viewModel = viewModel
        return viewController!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "PlanetTableViewCell", bundle: nil), forCellReuseIdentifier: "PlanetTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        getPlanetData()
    }
    
    func getPlanetData() {
        viewModel?.getData{ (status, message) in
            if (status) {
                self.tableView.layoutIfNeeded()
                self.tableView.reloadData()
            }
        }
    }
}

extension PlanetViewController: UITableViewDelegate, UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel!.resultArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "PlanetTableViewCell", for: indexPath) as! PlanetTableViewCell
        cell.setupView(result: (viewModel?.resultArray[indexPath.row])!, index: indexPath.row)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PlanetDetailViewController.create(viewModel: PlanetDetailViewModel(result: (viewModel?.resultArray[indexPath.row])!))
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
