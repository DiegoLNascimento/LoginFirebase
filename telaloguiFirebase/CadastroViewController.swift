//
//  CadastroViewController.swift
//  telaloguiFirebase
//
//  Created by Diego on 03/09/22.
//

import UIKit
import SnapKit
import FirebaseAuth

class CadastroViewController: UIViewController {
    
    var auth:Auth?
    
    var fundo: UIImageView = {
        let fundo = UIImageView(frame: .zero)
        fundo.image = UIImage(named: "fundo")
        return fundo
    }()
    
    var email: UITextField = {
        let email = UITextField(frame: .zero)
        email.layer.borderWidth = 2
        email.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.2)
        email.textAlignment = .left
        email.placeholder = "    Email"
        email.layer.cornerRadius = 10
        email.autocapitalizationType = .none
        return email
    }()
    
    var senha: UITextField = {
        let senha = UITextField(frame: .zero)
        senha.layer.borderWidth = 2
        senha.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.2)
        senha.textAlignment = .justified
        senha.placeholder = "    Senha"
        senha.layer.cornerRadius = 10
        senha.autocapitalizationType = .none
        return senha
    }()
    
    var cadstrar: UIButton = {
        let btnLoguin = UIButton(frame: .zero)
        btnLoguin.layer.cornerRadius = 10
        btnLoguin.setTitle("CADASTRAR", for: .normal)
        btnLoguin.setTitle("CADASTRAR", for: .selected)
        btnLoguin.backgroundColor = .init(red: 33/255, green: 121/255, blue: 141/255, alpha: 1)
        btnLoguin.setTitleColor(UIColor.white, for: .normal)
        btnLoguin.addTarget(self, action: #selector(btnCadastroVoltatr), for: .touchUpInside)
        return btnLoguin
    }()
    
    var voltar: UIButton = {
        let voltar = UIButton(frame: .zero)
        voltar.titleLabel?.font = .systemFont(ofSize: 13)
        voltar.setTitle("Voltar", for: .normal)
//        voltar.titleLabel?.attributedText = NSAttributedString(string: "Voltar", attributes:
//                                                                [.underlineStyle: NSUnderlineStyle.single.rawValue])
        voltar.titleLabel?.font = .systemFont(ofSize: 13)
        voltar.setTitleColor(UIColor.black, for: .normal)
        voltar.addTarget(self, action: #selector(voltarLoguin), for: .touchUpInside)
        return voltar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.auth = Auth.auth()
        addView()
        constraints()
    }
    
    @objc private func voltarLoguin() {
        self.dismiss(animated: true)
    }
    
    @objc private func btnCadastroVoltatr(){
        let email = email.text ?? ""
        let senha = senha.text ?? ""
        self.auth?.createUser(withEmail: email, password: senha, completion: { [weak self](result, erro) in
            if erro != nil {
                self?.error()
            }else {
                self?.ok()
            }
        })
    }
    
    func error() {
        let alert1 = UIAlertController(title: "Erro", message: "usuario não cadastrado", preferredStyle: .alert)
        
        let btnAlert1 = UIAlertAction(title: "Ok", style: .default)
        
        alert1.addAction(btnAlert1)
        self.present(alert1, animated: true, completion: nil)
    }
    
    func ok () {
        let alert = UIAlertController(title: "Sucesso", message: "usuario cadastrado", preferredStyle: .alert)
        
        let btnAlert = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(btnAlert)
        self.present(alert, animated: true, completion: nil)
    }
    
    func addView() {
        self.view.addSubview(fundo)
        self.view.addSubview(email)
        self.view.addSubview(senha)
        self.view.addSubview(cadstrar)
        self.view.addSubview(voltar)
        
    }
    
    func constraints() {
        
        fundo.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        email.snp.makeConstraints { make in
            make.top.equalTo(450)
            make.centerX.equalToSuperview()
            make.width.equalTo(280)
            make.height.equalTo(45)
        }
        
        senha.snp.makeConstraints { make in
            make.top.equalTo(email.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(280)
            make.height.equalTo(45)
        }
        
        cadstrar.snp.makeConstraints { make in
            make.top.equalTo(senha.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(280)
            make.height.equalTo(45)
        }
        voltar.snp.makeConstraints { make in
            make.top.equalTo(cadstrar.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(280)
            make.height.equalTo(45)
        }
    }
}
