//
//  HostingVC.swift
//  swiftUIandStoryboard
//
//  Created by Burak Ayvaz on 9.11.2020.
//

import UIKit
import SwiftUI
import SpriteKit

struct SecondView : View {
    
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: 400, height: 800)
        scene.scaleMode = .fill
        return scene
    }
    
    
    var body: some View {
        
        ZStack {
            Color.black.opacity(0.9).edgesIgnoringSafeArea(.all)
            VStack{
                Text("Drop Objects")
                    .font(.largeTitle)
                    .fontWeight(.thin)
                    .foregroundColor(Color.white)
                    .padding(.all)
                Button(action: {
                    print("Button Clicked")
                }, label: {
                    Text("Click Here")
                })
                
                SpriteView(scene: scene).frame(width: 400, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
                    .overlay(RoundedRectangle(cornerRadius: 25.0).stroke(Color.white))
                    .foregroundColor(.blue)
            }
        }
      }
}

class HostingVC: UIHostingController<SecondView> {
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder, rootView: SecondView())
        }

}

class GameScene : SKScene{
    
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else{return}
        let location = touch.location(in: self)
        
        
        //Add Color Here
        let colors = [SKColor.green,SKColor.blue,SKColor.red]
        
        //For Random Color Selection
        let randomCol = colors.randomElement() ?? SKColor.yellow
        
    
//        Circle Code
//        let circle = SKShapeNode( circleOfRadius: 25)
//        circle.fillColor = randomCol
//        circle.position = location
//        circle.physicsBody = SKPhysicsBody(circleOfRadius: 25)
//        addChild(circle)
        
        
//        Box Code
          let size = CGSize(width: 40, height: 40)
          let box = SKShapeNode(rectOf: size)
          box.fillColor = randomCol
          box.position = location
          box.physicsBody = SKPhysicsBody(rectangleOf: size)
          addChild(box)
    
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
