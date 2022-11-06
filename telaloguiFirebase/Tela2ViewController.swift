//laloguinViewcode
//
//  Created by Diego on 01/09/22.
//

import UIKit
import SnapKit

class tela2ViewController: UIViewController {
    
    var dog:UIImageView = {
        let dog = UIImageView(frame: .zero)
        dog.image = UIImage(named: "dog")
        return dog
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        dogView()
        layout()
        // Do any additional setup after loading the view.
    }
    func dogView() {
        self.view.addSubview(dog)
    }
    
    func layout() {
        dog.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(400)
        }
    }
    
}

