//
//  SettingScene.swift
//  spritekit-demos
//
import SpriteKit

class SettingScene: BaseScene {
    
    required override init(size: CGSize) {
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func render() {
        super.render()
        self.backgroundColor = .blue
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.scene_machine?.transition(to: .HomeScene )
    }
    
}
