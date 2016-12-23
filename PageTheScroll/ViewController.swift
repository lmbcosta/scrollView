//
//  ViewController.swift
//  PageTheScroll
//
//  Created by Luis  Costa on 22/12/16.
//  Copyright © 2016 Luis  Costa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    var images = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    override func viewDidAppear(_ animated: Bool) {
        // Do any additional setup after loading the view, typically from a nib.
        var contentWidth: CGFloat = 0
        let scrollWidth = scrollView.frame.size.width
        let scroolHeight = scrollView.frame.size.height
        
        print("Scroll view width: \(scrollView.frame.size.width)")
            
            
        for i in 0...2 {
            // Criar uma UIImage atraves de um ficheiro
            let image = UIImage(named: "icon\(i).png")
            // Criar uma UIImageView atraves de uma UIView existente
            let imageView = UIImageView(image: image)
            // Adicionar ao array para manipular mais tarde
            images.append(imageView)
                
            //A ideia será a cada imagem coloca-la um ecran à direita
            // Como se houvessem 3 ecrans
                
            // definir a corrodenada X das imagens
            var newX: CGFloat = 0.0
            // Por cada imagem ela será colocada no centro do ecran
            // Sendo colocado cada foto num novo ecran da scroll view
            // o frame vai ser o da scroll view
            newX = scrollWidth / 2 + scrollWidth * CGFloat(i)
            
            // Atualiza o contentSize da scrollView
            contentWidth += newX
                
            // Adicionar a scrollview UIImageView como nova subView
            // UIImageView extend UIImage
            scrollView.addSubview(imageView)
                
            // Agora que foi adicionada, definir uma frame para a imageView
            // X: Calculado anteriormente pelo newX
            // Y: altura será metade da width da frame da scrollview
            // X e Y permite ter a imagem centrada
            // Importante: Adicionar primeiro à scrollView para saber o sistema de coordenadas
            // width e height predefinidas para os icones
            let widthIcon: CGFloat = 150.0
            let heightIcon: CGFloat = 150.0
            imageView.frame = CGRect(x: newX - widthIcon / 2, y: scroolHeight / 2 - heightIcon / 2, width: widthIcon, height: heightIcon)
                
            // Definir o contentSize da scrollview
            // existe content para lá da frame definida
            // Para tal definimos apenas a width
            // Por cada imagem vamos incrementando a content width
            scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
        
            // http://stackoverflow.com/questions/20449256/how-does-clipstobounds-work
            // This is a simple explanation for the function clipToBounds
            // Basicamente as subviews da scroll view tem content maior e por definicao,
            // a srcoll view nao a smostra limitando o que mostra aos seus limites
            // Nao queremos que isso aconteca de modo a ver-se um pouco dos icones anteriores e posteriores
            scrollView.clipsToBounds = false
            // Check the result using cliptoBounds
            //scrollView.clipsToBounds = true
        }
    }
}
