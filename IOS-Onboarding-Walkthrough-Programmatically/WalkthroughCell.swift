//
//  WalkthroughCell.swift
//  IOS-Onboarding-Walkthrough-Programmatically
//
//  Created by c.pabon.cuellar on 28/04/2020.
//  Copyright © 2020 cristhia.pabon. All rights reserved.
//

import UIKit

class WalkthroughCell: UICollectionViewCell {
    
    //MARK: UI components
    private lazy var imageWalkthrough : UIImageView = {
        let imageView = UIImageView(image: nil)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24.0, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var contentLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    //MARK: Properties
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setImage(imageName: String){
        self.imageWalkthrough.image = UIImage(named: imageName)
    }
    
    public func setTitle(titleString: String){
        self.titleLabel.text = titleString
    }
    
    public func setContent(contentString: String){
        self.contentLabel.text = contentString
    }
}

//MARK:- Programmatically implementation
extension WalkthroughCell: ProgramaticallyLayoutable {
    
    //MARK: Constraints
    func setUpImageWalkthrough() {
        let topConstant = self.frame.size.height * 0.038
        let marginConstant = self.frame.size.width * 0.084
//        let bottomConstant = self.frame.size.height * 0.056
        imageWalkthrough.topAnchor.constraint(equalTo: self.topAnchor, constant: topConstant).isActive = true
        imageWalkthrough.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: marginConstant).isActive = true
        imageWalkthrough.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -marginConstant).isActive = true
        imageWalkthrough.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.50).isActive = true
    }

    func setUpTitleLabel() {
        let topConstant = self.frame.size.height * 0.043
        let margin = self.frame.size.width * 0.04
        titleLabel.topAnchor.constraint(equalTo: imageWalkthrough.bottomAnchor, constant: topConstant).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin).isActive = true
    }

    func setUpContentLabel() {
        let topConstant = self.frame.size.height * 0.012
        let margin = self.frame.size.width * 0.04
        contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: topConstant).isActive = true
        contentLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin).isActive = true
        contentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin).isActive = true
    }
    
    func buildViewHierarchy() {
        self.addSubview(imageWalkthrough)
        self.addSubview(titleLabel)
        self.addSubview(contentLabel)
    }
    
    func setUpConstraints() {
        setUpImageWalkthrough()
        setUpTitleLabel()
        setUpContentLabel()
    }
    
    public func setUpAdditionalConfigs(){
        self.backgroundColor = .white
    }
}


//MARK:- View string resources
fileprivate extension String {
}
