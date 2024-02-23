//
//  PostViewController.swift
//  Hobby app
//
//  Created by 鈴木絢心 on 2024/01/12.
//

import UIKit
import FirebaseStorage
import FirebaseFirestore

class PostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var postImageView: UIImageView!
    
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        label.font = UIFont(name: "Shirayukimini", size: 15)
    }
    
    

    @IBAction func takephoto() {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            
            //カメラを起動
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.delegate = self
            
            picker.allowsEditing = true
            
            present(picker, animated: true, completion: nil)
        }else{
            //カメラを使えない時にコンソールに出るエラー
            print("error")
        }
        
        
       
    }
    
    @IBAction func openAlbum() {
        //カメラロールを使えるかの確認
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            
            //カメラロールの画像を選択して画像を表示するまでの一連の流れ
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.delegate = self
            
            picker.allowsEditing = true
            
            present(picker, animated: true, completion: nil)
            
        }
        
    }
    
    
    //カメラ、カメラロールを使った時に選択した画像をアプリ内に表示するためのメソッド
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        postImageView.image = info[.editedImage] as? UIImage
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func saveToFirestore() {
            // nilチェック
            if let selectImage = postImageView.image {
                // 今日日付をintに変換して被らない名前にする
                let imageName = "\(Date().timeIntervalSince1970).jpg"
                // 今回はpostsというフォルダーの中に画像を保存する
                let reference = Storage.storage().reference().child("posts/\(imageName)")
                // 画像データがそのままだとサイズが大きかったりするので、サイズを調整
                if let imageData = selectImage.jpegData(compressionQuality: 0.8) {
                    // メタデータを設定
                    let metadata = StorageMetadata()
                    metadata.contentType = "image/jpeg"
                    // ①ここでstorageへの保存を行う
                    reference.putData(imageData, metadata: metadata, completion:{(metadata, error) in
//                        if let _ = metadata {
                        // ②storageへの保存が成功した場合はdownloadURLの取得を行う
                        reference.downloadURL{(url,error) in
                                if let downloadUrl = url {
                                    // downloadURLの取得が成功した場合
                                    // String型へ変換を行う
                                    let downloadUrlStr = downloadUrl.absoluteString
                                    // ③firestoreへ保存を行う
                                    Firestore.firestore().collection("posts").document().setData([
                                        "imageURL": downloadUrlStr,
                                        "createdAt": FieldValue.serverTimestamp()
                                    ]){ error in
                                        if let error = error {
                                            // firestoreへ保存が失敗した場合

                                        } else {
                                            print("aaa")
                                            // firestoreへ保存が成功した場合
                                        }
                                    }
                                } else {
                                    // downloadURLの取得が失敗した場合の処理
                                }
                            }
//                        } else {
                            // storageの保存が失敗した場合の処理
                        }
//                                      }
                    )
                }
            }
        }

    
    
    
    
    //投稿
    @IBAction func sharephoto(){
        
//        let shareText = ""
        
        let shareImage = postImageView.image!
        
//        let activityItems:[Any] = [shareText, shareImage]
        
        saveToFirestore()
        
        
        let alert: UIAlertController = UIAlertController(title:"投稿完了！", message: "投稿が完了しました！", preferredStyle: .alert)
        
        alert .addAction(
            UIAlertAction (title: "OK",
                           style: .default,
                           handler: { action in
                               self.navigationController?.popViewController(animated: true)
                           })
            )
        present(alert, animated: true, completion: nil)
    
    }
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
