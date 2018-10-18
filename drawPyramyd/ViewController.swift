//
//  ViewController.swift
//  drawPyramyd
//
//  Created by MacBook on 18.10.2018.
//  Copyright © 2018 Bizz. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //   drawStringCubeX(6)  //  строка
        //   drawStairsCube(5)   // лесенка
             drawPyramydUI(8)    // пирамидка
    }
/*   Я решил, что "оцентрируюсь" на расстоянии по х=80 с обеих сторон, и на высоте у=500.
     Расстояние между кубиками фиксированное и равно 5.
     Размер кубика я буду вычислять динамически, исходя из количества их, count. То есть
     size = (414 - 2x80 - 5(count -1))/count, то есть size = 259 / count - 5
     Делал все постепенно: сначала функция drawBox рисует квадрат с аргументами - размер и координаты
     Далее функция drawStringCube (использует drawBox) принимает в аргументах
     количество count кубиков, координаты и размер кубика.
     Далее drawStairsCube - лесенка, уже берет только count
     Ну и финальная drawPyramydUI(count) которая отличается от лесенки лишь сдвигом по х на (size+5)/2

     Сделал отдельные методы drawStringCubeX drawStairsCube которые принимают лишь count
     и самостоятельно  делают строку и лесенку. Потому что для финальной пирамиды мне пришлось передавать из функции в функцию аргументы
     
 */
    func drawBox(_ size:Int, _ x:Int, _ y:Int) {
        //var x = 80
        //let y = 500
        let cube = CGRect.init(x: x, y: y, width: size, height: size)
        let box = UIView(frame: cube)
        box.backgroundColor = UIColor(red: CGFloat(arc4random_uniform(256))/255,
                                      green: CGFloat(arc4random_uniform(256))/255,
                                      blue: CGFloat(arc4random_uniform(256))/255,
                                      alpha: 1)
        view.backgroundColor = UIColor(red: CGFloat(arc4random_uniform(256))/255,
                                       green: CGFloat(arc4random_uniform(256))/255,
                                       blue: CGFloat(arc4random_uniform(256))/255,
                                       alpha: 1)
        view.addSubview(box)
    }
    
    func drawStringCubeX(_ count:Int) {
        let size = 259 / count - 5
        var x = 80
        let y = 500
        for _ in 0..<count {
            drawBox(size, x, y)
            x+=size + 5
        }
    }
    
    func drawStringCube(_ count: Int,xpos:Int,ypos:Int, size:Int) {
        var x = xpos
        let y = ypos
        for _ in 0..<count {
            drawBox(size, x, y)
            x+=size + 5
        }
    }
    
    func drawStairsCube(_ count:Int) {
        let size = 259 / count - 5
        var xpos = 80
        var ypos = 500
        var n = count
        for i in 0..<count {
            for _ in 0..<count {
                drawStringCube(n, xpos:xpos, ypos: ypos, size:size)
            }
            xpos = 80      //возвращаем х в исходное положение
            ypos = 500 - (size + 5)*(i+1)  //сдвигаемся по у вверх
            n-=1
        }
    }
    
    func drawPyramydUI(_ count:Int) {
        let size = 259 / count - 5  // размер кубика динамический
        var xpos = 80               //первоначальные значения позиции
        var ypos = 500
        var n = count               // копируем в n чтобы уменьшать количество в каждой строке
        for i in 0..<count {
            for _ in 0..<count {
                drawStringCube(n, xpos:xpos, ypos:ypos, size:size)
            }
            xpos+=(size+5)/2                   // сдвиг по Х вправо
            ypos = 500 - (size + 5)*(i+1)      // сдвиг по У вверх
            n-=1
        }
    }
    
    
    
}

