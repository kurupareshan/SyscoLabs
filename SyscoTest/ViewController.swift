//
//  ViewController.swift
//  SyscoTest
//
//  Created by kurupareshan pathmanathan on 5/25/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var planetDetails: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        planetDetails.clipsToBounds = true
        planetDetails.layer.borderWidth = 2
        planetDetails.layer.borderColor = UIColor.lightGray.cgColor
        planetDetails.layer.cornerRadius = 10
        planetDetails.textColor = UIColor.black
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let vc = PlanetViewController.create(viewModel: PlanetViewModel())
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: true, completion: nil)
        }
    }
}

