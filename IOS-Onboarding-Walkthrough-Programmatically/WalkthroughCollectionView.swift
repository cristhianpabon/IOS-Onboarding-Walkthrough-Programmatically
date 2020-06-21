//
//  WalkthroughCollectionView.swift
//  IOS-Onboarding-Walkthrough-Programmatically
//
//  Created by c.pabon.cuellar on 28/04/2020.
//  Copyright © 2020 cristhia.pabon. All rights reserved.
//

import UIKit

class WalkthroughCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    var pages = [walkthroughPage]()
    var nextView: UIViewController?
    var currentPath = 0
    
    //MARK: UI components
    private lazy var pageControl: UIPageControl = {
       let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .systemPink
        pc.pageIndicatorTintColor = .gray
        pc.translatesAutoresizingMaskIntoConstraints = false
        return pc
    }()
    
    private lazy var nextButton: UIButton = {
        let image = UIImage(named: String.nextButtonString) as UIImage?
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(String.nextButtonString, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action:  #selector(nextCell), for: .touchUpInside)
        return button
    }()
    
    //MARK: Properties
    init(pages: Array<walkthroughPage>, nextView: UIViewController){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        
        self.pages = pages
        self.nextView = nextView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! WalkthroughCell
        cell.setImage(imageName: pages[indexPath.row].image!)
        cell.setTitle(titleString: pages[indexPath.row].title!)
        cell.setContent(contentString: pages[indexPath.row].content!)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionDirectionFlowLayout(){
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                  flowLayout.scrollDirection = .horizontal
        }
    }

    @objc func nextCell(){
        if pageControl.currentPage+1 < pages.count{
            let nextPath = min(pageControl.currentPage + 1, pages.count - 1)
            let indexPath = IndexPath(item: nextPath, section: 0)
            pageControl.currentPage = nextPath
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        } else {
            self.presentNextView(viewController: nextView!)
        }
    }
    
    func setCurrentDot(index: Int){
        pageControl.currentPage = index
    }
    
    func presentNextView(viewController: UIViewController){
        let nextViewController = viewController
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.size.width
        print(page)
        setCurrentDot(index: Int(page))
    }

    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
}

//MARK:- Programmatically implementation
extension WalkthroughCollectionViewController: ProgramaticallyLayoutable {
    
    //MARK: Constraints
    func setUpPageControl(){
        let leftConstant = view.frame.size.height * 0.064
        pageControl.topAnchor.constraint(equalTo: nextButton.topAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: nextButton.bottomAnchor).isActive = true
        pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leftConstant).isActive = true
        
    }
    
    func setUpNextButton(){
        let bottomConstant = view.frame.size.height * 0.064
        let rightConstant = view.frame.size.height * 0.036
        nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bottomConstant).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -rightConstant).isActive = true
    }
    

    func buildViewHierarchy() {
        view.addSubview(pageControl)
        view.addSubview(nextButton)
    }
    
    func setUpConstraints() {
        setUpPageControl()
        setUpNextButton()
    }
    
    public func setUpAdditionalConfigs(){
        self.navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        //MARK: Colecction View
        collectionView.backgroundColor = .white
        collectionView.register(WalkthroughCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionDirectionFlowLayout()
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
    }
}

//MARK:- View string resources
fileprivate extension String {
    static let nextButtonString = "NEXT"
}
