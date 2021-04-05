//
//  HomeViewController.swift
//  FindYourZen
//
//  Created by Allen Gu on 3/21/21.
//

import UIKit

public class HomeViewController: CustomViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    let todos: [String] = ["exercise", "meditate", "hydrate"]
    
    lazy var collectionView: UICollectionView = {
        let collectionView: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: self.makeLayout())
        collectionView.backgroundColor = UIColor.clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(HomeTipCell.self, forCellWithReuseIdentifier: "tip")
        collectionView.register(HomeTodoCell.self, forCellWithReuseIdentifier: "todo")
        collectionView.register(HomeCheckinCell.self, forCellWithReuseIdentifier: "checkin")
        collectionView.register(HomeSectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        return collectionView
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationItem.title = "find your zen"
        self.view.addSubview(self.collectionView)
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        self.setGradientBackground()
        super.viewWillAppear(animated)
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider!) {
        let roundedStressValue = round(sender.value)
        sender.value = roundedStressValue
        (sender as! CustomSlider).valueLabel!.text = "\(Int(roundedStressValue))"
    }
    
    func makeLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (section: Int, environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            if section == 0 {
                return HomeLayoutBuilder.buildTipSectionLayout(size: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(170)))
            }
            else if section == 1 {
                return HomeLayoutBuilder.buildTodoSectionLayout(size: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(170)))
            }
            else if section == 2 {
                return HomeLayoutBuilder.buildCheckinSectionLayout(size: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(280)))
            }
            else {
                return HomeLayoutBuilder.buildTipSectionLayout(size: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(170)))
            }
        }
        return layout
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 {
            return todos.count
        }
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            return CellBuilder.getTipCell(collectionView: collectionView, indexPath: indexPath)
        }
        else if indexPath.section == 1 {
            return CellBuilder.getTodoCell(collectionView: collectionView, indexPath: indexPath, title: todos[indexPath.item])
        }
        else if indexPath.section == 2 {
            return CellBuilder.getCheckinCell(collectionView: collectionView, indexPath: indexPath, viewController: self)
        }
        return UICollectionViewCell()
    }
    
    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as? HomeSectionHeader else {
            fatalError("Could not dequeue HomeSectionHeader")
        }
        if indexPath.section == 1 {
            headerView.configure(text: "to-do")
        }
        else if indexPath.section == 2 {
            headerView.configure(text: "checkin")
        }
        return headerView
    }
//
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        return UICollectionReusableView()
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
