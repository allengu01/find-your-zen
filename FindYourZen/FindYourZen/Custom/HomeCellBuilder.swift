//
//  HomeCellBuilder.swift
//  FindYourZen
//
//  Created by Allen Gu on 3/21/21.
//

import Foundation
import UIKit

public class CellBuilder {
    public static func getTipCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tip", for: indexPath) as? HomeTipCell {
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    public static func getTodoCell(collectionView: UICollectionView, indexPath: IndexPath, title: String) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "todo", for: indexPath) as? HomeTodoCell {
            cell.configure(title: title, imageName: "home-\(title)")
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    public static func getCheckinCell(collectionView: UICollectionView, indexPath: IndexPath, viewController: HomeViewController) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "checkin", for: indexPath) as? HomeCheckinCell {
            cell.configureSliders(viewController: viewController)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
}
