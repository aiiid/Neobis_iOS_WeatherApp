//
//  AppLayouts.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Ai Hawok on 17/06/2024.
//

import UIKit

class AppLayouts {
    static let shared = AppLayouts()
    
    func dayForecastSection() -> NSCollectionLayoutSection {
        // Item settings
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
         let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group settings
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(75),
            heightDimension: .absolute(90)
        )
         let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15)
        
        // Section settings
         let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 60, trailing: 10)
        section.orthogonalScrollingBehavior = .continuous
        
        // Adjust interGroupSpacing
        section.interGroupSpacing = 7
           
        // Add header
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(40)
        )
            let header = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
            
        section.boundarySupplementaryItems = [header]
         return section
    }
    
    func weekForecastSection() -> NSCollectionLayoutSection {
        // Item settings
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
         let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group settings
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60))
        
         let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        // Section settings
         let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 10)
//         section.orthogonalScrollingBehavior = .continuous
        
        // Adjust interGroupSpacing
        section.interGroupSpacing = 15 // Set the desired spacing between groups
           
        // Add header
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(40)
        )
            let header = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
            
            section.boundarySupplementaryItems = [header]
        
         return section
    }
}
