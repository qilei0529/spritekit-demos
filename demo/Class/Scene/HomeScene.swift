//
//  HomeScene.swift
//  spritekit-demos
//

import SpriteKit

class HomeScene: BaseScene {
    
    // button
    lazy var backButton: LabelButton = {
        let size = SIZE( 120, 40)
        let b = LabelButton(color: RGBA(20, 200, 0, 1), size: size)
        b.setTitle(title: "+")
        b.onPress(closure: {
            self.scene_machine?.transition(to: SettingScene.self )
        })
        b.zPosition = 5;
        b.position = MID(self.size);
        return b
    }()
    
    override func render() {
        self.backgroundColor = .red
        self.addChild(backButton)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
}
