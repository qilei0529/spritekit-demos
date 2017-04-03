//
//  HScene.swift
//  spritekit-demos
//

import SpriteKit

// 场景调度器基础类
protocol HSceneMachine {
    var scenes: [ SceneName: HScene ] { get }
    func transition( to: SceneName )
}
// 场景基础类
protocol HScene {
    func render()
}
// 场景名字
enum SceneName {
    case HomeScene
    case SettingScene
    
    func toString()-> String {
        switch self {
        case .HomeScene:
            return "Home"
        case .SettingScene:
            return "Setting"
        }
    }
}
// 调度器
class GameSceneMachine: HSceneMachine {

    var scenes: [SceneName:HScene] = [SceneName:HScene]()
    var view: SKView!
    var size: CGSize!
    
    init( view: SKView) {
        self.view = view
        self.size = self.view.frame.size
        
        view.ignoresSiblingOrder = true
        view.showsFPS = true
        view.showsNodeCount = true
    }
    
    /// 切换到指定场景
    func transition(to name: SceneName ) {
        
        var scene: BaseScene
        
        switch name {
        case .HomeScene:
            scene = HomeScene(size: self.size)
            break;
        case .SettingScene:
            scene = SettingScene(size: self.size)
            break;
        }
        scene.scene_machine = self
        scene.name = name.toString()
        scene.scaleMode = .aspectFill
        scene.render()
        self.view.presentScene(scene)
        
    }
    
}


class BaseScene: SKScene , HScene {
    var scene_machine: GameSceneMachine?
    func render() {
        print("\(name) render")
    }
}


