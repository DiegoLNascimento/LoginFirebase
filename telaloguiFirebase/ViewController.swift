////
//  ViewController.swift
//  telaloguinViewcode
//
//  Created by Diego on 01/09/22.
//

import UIKit
import SnapKit
import FirebaseAuth
import Firebase

class ViewController: UIViewController {
    
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
        senha.isSecureTextEntry = true
        return senha
    }()
    
    var btnCadastro: UIButton = {
        let text = UIButton(frame: .zero)
        text.setTitle("Cadastrar email", for: .normal)
        text.setTitleColor(UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.6), for: .normal)
        text.titleLabel?.font = .systemFont(ofSize: 16)
        text.addTarget( self,action: #selector(btnCadastros), for: .touchUpInside)
        return text
    }()
    
    var g : UIImageView = {
        let fundo = UIImageView(frame: .zero)
        fundo.image = UIImage(named: "g")
        return fundo
    }()
    
    var face: UIImageView = {
        let fundo = UIImageView(frame: .zero)
        fundo.image = UIImage(named: "face")
        return fundo
    }()
    
    var entrar: UIButton = {
        let btnLoguin = UIButton(frame: .zero)
        btnLoguin.layer.cornerRadius = 10
        btnLoguin.setTitle("ENTRAR", for: .normal)
        btnLoguin.setTitle("ENTRAR", for: .selected)
        btnLoguin.backgroundColor = .init(red: 33/255, green: 121/255, blue: 141/255, alpha: 1)
        btnLoguin.setTitleColor(UIColor.white, for: .normal)
        btnLoguin.addTarget(self, action: #selector(btnEntrar), for: .touchUpInside)
        return btnLoguin
    }()
    
    var text2: UILabel = {
        let text = UILabel(frame: .zero)
        text.text = "Esqueceu a senha?"
        text.textAlignment = .left
        text.textColor = .init(red: 0, green: 0, blue: 0, alpha: 0.8)
        text.font = .systemFont(ofSize: 11)
        return text
    }()
    
    var text3: UILabel = {
        let text = UILabel(frame: .zero)
        text.textAlignment = .right
        text.textColor = .systemBlue
        text.attributedText =  NSAttributedString(string: "Recuperar senha?", attributes:
                                                    [.underlineStyle: NSUnderlineStyle.single.rawValue])
        text.font = .systemFont(ofSize: 11)
        return text
    }()
    
    var text4: UILabel = {
        let text = UILabel(frame: .zero)
        text.textAlignment = .center
        text.textColor = .init(red: 0, green: 0, blue: 0, alpha: 0.5)
        text.attributedText =  NSAttributedString(string: "Criar uma nova senha", attributes:
                                                    [.underlineStyle: NSUnderlineStyle.single.rawValue])
        text.font = .systemFont(ofSize: 13)
        return text
    }()
    
    var auth: Auth?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.auth = Auth.auth()
        addView()
        constraints()
    }
    
    @objc private func btnCadastros() {
        let tela2 = CadastroViewController()
        tela2.modalTransitionStyle = .flipHorizontal
        tela2.modalPresentationStyle = .fullScreen
        self.present(tela2, animated: true, completion: nil)
    }
    
    @objc private func btnEntrar() {
        let email = email.text ?? ""
        let senha = senha.text ?? ""
        
        self.auth?.signIn(withEmail: email, password: senha, completion: { usuario, erro in
            if erro != nil {
                self.errou()
            }else {
                self.proxinaTela()
            }
        })
    }
    
    func errou() {
        let alert = UIAlertController(title: "ERRO", message: "Usuario ou senha incorretos", preferredStyle: .actionSheet)
        
        let btnAlert = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(btnAlert)
        self.present(alert, animated: true, completion: nil)
        self.email.text = ""
        self.senha.text = ""
    }
    
    func proxinaTela() {
        let tela2 = tela2ViewController()
        
        let nav = UINavigationController(rootViewController: tela2)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true)
    }
    
    func addView() {
        self.view.addSubview(fundo)
        self.view.addSubview(email)
        self.view.addSubview(senha)
        self.view.addSubview(btnCadastro)
        self.view.addSubview(g)
        self.view.addSubview(face)
        self.view.addSubview(entrar)
        self.view.addSubview(text2)
        self.view.addSubview(text3)
        self.view.addSubview(text4)
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
        
        btnCadastro.snp.makeConstraints { make in
            make.top.equalTo(senha.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(30)
        }
        
        g.snp.makeConstraints { make in
            make.top.equalTo(btnCadastro.snp.bottom).offset(5)
            make.leading.equalTo(155)
            make.width.equalTo(40)
            make.height.equalTo(30)
        }
        
        face.snp.makeConstraints { make in
            make.top.equalTo(btnCadastro.snp.bottom).offset(5)
            make.trailing.equalTo(-155)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        entrar.snp.makeConstraints { make in
            make.top.equalTo(g.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(280)
            make.height.equalTo(45)
        }
        
        text2.snp.makeConstraints { make in
            make.top.equalTo(entrar.snp.bottom).offset(10)
            make.leading.equalTo(90)
            make.width.equalTo(200)
            make.height.equalTo(30)
        }
        
        text3.snp.makeConstraints { make in
            make.top.equalTo(entrar.snp.bottom).offset(10)
            make.trailing.equalTo(-100)
            make.width.equalTo(200)
            make.height.equalTo(30)
        }
        
        text4.snp.makeConstraints { make in
            make.top.equalTo(text3.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(30)
        }
    }
}




