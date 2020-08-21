import UIKit
import Firebase
import FirebaseAuth
class PostData: NSObject {
    var id: String
    var name: String?
    var caption: String?
    var date: Date?

    init(document: QueryDocumentSnapshot) {
        self.id = document.documentID

        let postDic = document.data()

        self.name = postDic["name"] as? String

        self.caption = postDic["caption"] as? String

        let timestamp = postDic["date"] as? Timestamp
        self.date = timestamp?.dateValue()

        
        
    }
}
