//
//  TableViewController.swift
//  JSonTesteSwift
//
//  Created by LeandroLee on 2/10/16.
//  Copyright © 2016 goldhandsapp4u. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
  
    // MARK: - let / var -
    private var tempJson: [(String, String, String, String, String, String, String, String, String, String, String, String, String, String, UIImage)] = []
    
    // MARK: - override -
    override func viewDidLoad() {
        super.viewDidLoad()
        queryJson()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source -
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tempJson.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
        cell.crmLbl.text = tempJson[indexPath.row].0
        cell.crmUfLbl.text = tempJson[indexPath.row].1
        cell.dateUpdateLbl.text = tempJson[indexPath.row].2
        cell.dateStartLbl.text = tempJson[indexPath.row].3
        cell.birthLbl.text = tempJson[indexPath.row].4
        cell.emailLbl.text = tempJson[indexPath.row].5
        if Int(tempJson[indexPath.row].6) == 1 {
            cell.activeLbl.text = "Sim"
        } else {
            cell.activeLbl.text = "Não"
        }
        if Int(tempJson[indexPath.row].7) == 1 {
            cell.confirmLbl.text = "Sim"
        } else {
            cell.confirmLbl.text = "Não"
        }
        cell.optionLbl.text = tempJson[indexPath.row].8
        if Int(tempJson[indexPath.row].9) == 1 {
            cell.sexLbl.text = "M"
        } else {
            cell.sexLbl.text = "F"
        }
        cell.titleLbl.text = tempJson[indexPath.row].10
        cell.userIdLbl.text = tempJson[indexPath.row].11
        cell.nameLbl.text = tempJson[indexPath.row].12
        cell.obsLbl.text = tempJson[indexPath.row].13
        cell.ImgIv.image = tempJson[indexPath.row].14
        return cell
    }
    
    // MARK: - func -
    private func queryJson() {
        JSONLoader.load("http://delivery.parapps.com.br/ws/user", onCompleteFunction: { (data) -> Void in
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
                let dadosJson = (json["response"]!)! as! NSArray
                for dados in dadosJson {
                    let crm = dados["crm"] as! String
                    let crm_UF = dados["crm_UF"] as! String
                    let dataAlteracao = dados["dataAlteracao"] as! String
                    let dataCadastro = dados["dataCadastro"] as! String
                    let dataNascimento = dados["dataNascimento"] as! String
                    let email = dados["email"] as! String
                    let flagAtivo = dados["flagAtivo"] as! String
                    let flagCadastroConfirmado = dados["flagCadastroConfirmado"] as! String
                    let idOpcaoSexual = dados["idOpcaoSexual"] as! String
                    let idSexo = dados["idSexo"] as! String
                    let idTituloPessoal = dados["idTituloPessoal"] as! String
                    let idUser = dados["idUser"] as! String
                    let nome = dados["nome"] as! String
                    let observacao = dados["observacao"] as! String
                    var foto: UIImage = UIImage()
                    if dados["foto"] as! String != "" {
                        let imageData = NSData(base64EncodedString: dados["foto"] as! String, options: NSDataBase64DecodingOptions.IgnoreUnknownCharacters)
                        let image = UIImage(data: imageData!)
                        foto = image!
                    }
                    
                    self.tempJson.append((crm, crm_UF, dataAlteracao, dataCadastro, dataNascimento, email, flagAtivo, flagCadastroConfirmado, idOpcaoSexual, idSexo, idTituloPessoal, idUser, nome, observacao, foto))
                }
                dispatch_async((dispatch_get_main_queue()), { () -> Void in
                    self.tableView.reloadData()
                })
            } catch {
                print("Error Json Load !")
            }
            
            }) { (error) -> Void in
                print("Erro ao efetuar requisição: \(error?.localizedDescription)")
        }
    }
}
