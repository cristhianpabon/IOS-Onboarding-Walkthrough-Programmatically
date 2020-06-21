//
//  ProgramaticallyLayoutable.swift
//  IOS-Onboarding-Walkthrough-Programmatically
//
//  Created by c.pabon.cuellar on 28/04/2020.
//  Copyright © 2020 cristhia.pabon. All rights reserved.
//

import Foundation

public protocol ProgramaticallyLayoutable {
    func setUpView()
    func buildViewHierarchy()
    func setUpConstraints()
    func setUpAdditionalConfigs()
}

public extension ProgramaticallyLayoutable {
    
    func setUpView() {
        buildViewHierarchy()
        setUpConstraints()
        setUpAdditionalConfigs()
    }
    
    func setUpAdditionalConfigs() {}
}
