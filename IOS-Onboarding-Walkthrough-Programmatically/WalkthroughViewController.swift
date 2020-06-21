//
//  ViewController.swift
//  IOS-Onboarding-Walkthrough-Programmatically
//
//  Created by c.pabon.cuellar on 28/04/2020.
//  Copyright © 2020 cristhia.pabon. All rights reserved.
//

import UIKit

class WalkthroughViewController: UIViewController {
    
    var walkthroughPages = [walkthroughPage]()
    
    let page1: walkthroughPage = walkthroughPage(image: "walkthrough1",
                           title: "Fresh Food",
                           content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")

    let page2: walkthroughPage = walkthroughPage(image: "walkthrough2",
                           title: "Fast Delivery",
                           content: "Quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")

    let page3: walkthroughPage = walkthroughPage(image: "walkthrough3",
                           title: "Easy Payment",
                           content: "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPages()
        presentWalkthrough()
        self.view.backgroundColor = .blue
    }
    
    
    func loadPages(){
        walkthroughPages.append(page1)
        walkthroughPages.append(page2)
        walkthroughPages.append(page3)
    }
    
    func presentWalkthrough(){
        let walkthroughView = WalkthroughCollectionViewController(pages: walkthroughPages, nextView: ViewController())
               navigationController?.pushViewController(walkthroughView, animated: false)
    }

}
