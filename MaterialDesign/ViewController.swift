//
//  ViewController.swift
//  MaterialDesign
//
//  Created by Maulik Bhuptani on 31/07/17.
//  Copyright © 2017 Maulik Bhuptani. All rights reserved.
//

import UIKit
import Material

class ViewController: UIViewController {

    @IBOutlet weak var card: Card!
    @IBOutlet weak var cardContent: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var shareButton: IconButton!
    @IBOutlet weak var favoriteButton: IconButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Color.grey.lighten5

        card.contentView = cardContent

        titleLabel.font = RobotoFont.medium(with: 17)
        titleLabel.textColor = Color.darkText.primary
        titleLabel.text = "Hire  iPhone App Developer"
        
        descriptionLabel.font = RobotoFont.regular(with: 14)
        descriptionLabel.textColor = Color.darkText.secondary
        descriptionLabel.text = "We are reliable & reputed mobile App company"
        
        favoriteButton.image = Icon.favorite
        favoriteButton.tintColor = Color.red.base
        
        shareButton.image = Icon.cm.share
        shareButton.tintColor = Color.blue.base
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

