//
//  HW1_CollectionViewController.swift
//  HW_10
//
//  Created by Olga Novikova on 02.12.2020.
//

import UIKit

class HW1_CollectionViewController: UIViewController {
    
    let images = ["art1", "art2", "art3", "art4", "art5", "art6", "art7"]
    let olds = "2 400,00"
    let news = "1 200,00"
    let sales = "50 %"
    let names = ["Кугурими Пони 1", "Кугурими Вазовски", "Кугурими Стич", "Кугурими Банни", "Кугурими Пигги", "Кугурими Пикачу", "Кугурими Пони 2"]
    
    let itemsHorizontal: CGFloat = 2// количество столбцов
    let itemsVertical: CGFloat = 3 // количество строк
    
    let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)  // отступы
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HW1_CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "articleCell", for: indexPath) as! HW1_CollectionViewCell // ячейка товара
        
        let imageBox = images[indexPath.row] //приведение типа (тк, названия фото - строка)
        let image = UIImage(named: imageBox)
        
        cell.imageArticle.image = image
        cell.oldPrice.text = olds
        cell.newPrice.text = news
        cell.sale.text = sales
        cell.nameArticle.text = names[indexPath.row]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {  // расчет для вывода по два товара в ряд с ровненькими отступами, независимо от размера экрана
        
        // две ячейки в ширину
        let paddingWidth = sectionInserts.left * (itemsHorizontal + 1) // сколько отступов в ряду (2 товара = 3 отступа)
        let availableWidth = collectionView.frame.width - paddingWidth // доступная ширина (ширина  минус отступы)
        let widthItem = availableWidth / itemsHorizontal // ширина картинки (доступная ширина делим на количество в ряду
        
        // три ячейки в высоту
        let paddingHeight = sectionInserts.top * (itemsVertical + 1) // сколько отступов в столбце (3 товара = 4 отступа)
        let availableHeight = collectionView.frame.height - paddingHeight  // доступная высота (минус отступы и хидер)
        let heightItem = availableHeight / itemsVertical // ширина картинки (доступная высота делим на количество в столбце
        return CGSize(width: widthItem, height: heightItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat { // расстояние между объектами секций
        return sectionInserts.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat { // расстояние между объектами секций
        return sectionInserts.top
    }
}
