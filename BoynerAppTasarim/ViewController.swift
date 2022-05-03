//
//  ViewController.swift
//  BoynerAppTasarim
//
//  Created by Buse Şentürk on 29.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var productGender: UIButton!
    @IBOutlet weak var productGender2: UIButton!
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    var productListesi = [ProductModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        setUI()
        setProductData()
        setUITabBar()
        productCollectionView.collectionViewLayout = ColumnFlowLayout(numberOfColumns: 2, minColumnSpacing: 0, minLineSpacing: 10)
    }
    
    private func setUI() {
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.yellow
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0,width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "boyner_icon")
        imageView.image = image
        navigationItem.titleView = imageView
        productGender.layer.borderColor = UIColor.lightGray.cgColor
        productGender.layer.borderWidth = 0.5
        productGender2.layer.borderColor = UIColor.lightGray.cgColor
        productGender2.layer.borderWidth = 0.5
    }
    
    private func changeTabBarItemColor(itemAppearance: UITabBarItemAppearance) {
        itemAppearance.normal.iconColor = UIColor.black
        itemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        itemAppearance.normal.badgeBackgroundColor = UIColor(red: 7.0/255.0, green: 166.0/255.0, blue: 123.0/255.0, alpha: 1.0)
        itemAppearance.selected.iconColor = UIColor(red: 7.0/255.0, green: 166.0/255.0, blue: 123.0/255.0, alpha: 1.0)
        itemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor:  UIColor(red: 7.0/255.0, green: 166.0/255.0, blue: 123.0/255.0, alpha: 1.0)]
        itemAppearance.selected.badgeBackgroundColor = UIColor(red: 7.0/255.0, green: 166.0/255.0, blue: 123.0/255.0, alpha: 1.0)
    }
    
    private func setUITabBar() {
        if let tabItems = tabBarController?.tabBar.items {
            let item = tabItems[2]
            item.badgeValue = "2"
        }
        let tabAppearance = UITabBarAppearance()
        changeTabBarItemColor(itemAppearance: tabAppearance.stackedLayoutAppearance)
        changeTabBarItemColor(itemAppearance: tabAppearance.inlineLayoutAppearance)
        changeTabBarItemColor(itemAppearance: tabAppearance.compactInlineLayoutAppearance)
        tabBarController?.tabBar.standardAppearance = tabAppearance
        tabBarController?.tabBar.scrollEdgeAppearance = tabAppearance
    }
    
    private func setProductData() {
        let product1 = ProductModel(productViewName: "product1", productBrandName: "People By Fabrika", productKind: "Bej Kadın Elbise", firstPrice: "479.99 TL", secondPrice: "279.99 TL", basketPrice: "   223.99 TL   ")
        let product2 = ProductModel(productViewName: "product2", productBrandName: "Mavi", productKind: "Bisiklet Yaka Kadın Sweatshirt", firstPrice: "284.95 TL", secondPrice: "259.99 TL", basketPrice: "   224.99 TL   ")
        let product3 = ProductModel(productViewName: "product3", productBrandName: "Mavi", productKind: "Siyah Kadın Sweatshirt", firstPrice: "339.95 TL", secondPrice: "329.99 TL", basketPrice: "   299.99 TL   ")
        let product4 = ProductModel(productViewName: "product4", productBrandName: "People By Fabrika", productKind: "T-Shirt", firstPrice: "119.99 TL", secondPrice: "79.99 TL", basketPrice: "   47.99 TL   ")
        productListesi.append(product1)
        productListesi.append(product2)
        productListesi.append(product3)
        productListesi.append(product4)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productListesi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let product = productListesi[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! ProductCollectionViewCell
        cell.basketText.text = "   Sepette"
        cell.productNameLabel.text = product.productBrandName
        cell.productKind.text = product.productKind
        cell.firstPriceLabel.text = product.firstPrice
        let attributedString = NSMutableAttributedString(string:"\(product.firstPrice!)")
        attributedString.addAttribute(NSAttributedString.Key.baselineOffset, value: 0, range: NSMakeRange(0, attributedString.length))
        attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSNumber(value: NSUnderlineStyle.thick.rawValue), range: NSMakeRange(0, attributedString.length))
        attributedString.addAttribute(NSAttributedString.Key.strikethroughColor, value: UIColor.gray, range: NSMakeRange(0, attributedString.length))
        cell.firstPriceLabel.attributedText = attributedString
        cell.secondPriceLabel.text = product.secondPrice
        cell.basketPriceLabel.text = product.basketPrice
        let basketGreen = UIColor(red: 144.0/255.0, green: 188.0/255.0, blue: 178.0/255.0, alpha: 1.0)
        cell.basketTable.layer.borderColor = basketGreen.cgColor
        cell.basketTable.layer.borderWidth = 1.0
        cell.productImageView.image = UIImage(named: product.productViewName!)
        return cell
    }
}

