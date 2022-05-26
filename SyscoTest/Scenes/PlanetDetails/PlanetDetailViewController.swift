//
//  PlanetDetailViewController.swift
//  SyscoTest
//
//  Created by kurupareshan pathmanathan on 5/25/22.
//

import UIKit

class PlanetDetailViewController: UIViewController {
    
    var viewModel: PlanetDetailViewModel? = nil
    
    @IBOutlet weak var gravityLabel: UILabel!
    @IBOutlet weak var orbitoryLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    public class var storyboardName: String {
        return "PlanetDetail"
    }
    
    static func create(viewModel: PlanetDetailViewModel) -> PlanetDetailViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle(for: self))
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: PlanetDetailViewController.self)) as? PlanetDetailViewController
        viewController!.viewModel = viewModel
        return viewController!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = viewModel?.result?.name
        orbitoryLabel.text = viewModel?.result?.orbitalPeriod
        gravityLabel.text = viewModel?.result?.gravity
        nameLabel.clipsToBounds = true
        nameLabel.layer.cornerRadius = 5
        orbitoryLabel.clipsToBounds = true
        orbitoryLabel.layer.cornerRadius = 5
        gravityLabel.clipsToBounds = true
        gravityLabel.layer.cornerRadius = 5
        nameLabel.layer.borderColor = UIColor.lightGray.cgColor
        nameLabel.layer.borderWidth = 1
        orbitoryLabel.layer.borderColor = UIColor.lightGray.cgColor
        orbitoryLabel.layer.borderWidth = 1
        gravityLabel.layer.borderColor = UIColor.lightGray.cgColor
        gravityLabel.layer.borderWidth = 1
    }

    @IBAction func BackbuttonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
