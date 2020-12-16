

import Foundation

class PostViewModel: ObservableObject {
    @Published var posts = [Post]()
    @Published var post = Post()
    @Published var isCreated = false
    @Published var isUpdated = false
    @Published var isDeleted = false
    @Published var isLoading = false
    
    func apiPostList(){
        isLoading = true
        AFHttp.get(url: AFHttp.API_POST_LIST, params: AFHttp.paramsEmpty(), handler: { response in
            self.isLoading = false
            
            switch response.result {
            case .success:
                let posts = try! JSONDecoder().decode([Post].self, from: response.data!)
                self.posts =  posts
            case let .failure(error):
                print(error)
            }
        })
    }
    
    func apiPostSingle(id: Int){
        isLoading = true
        AFHttp.get(url: AFHttp.API_POST_SINGLE + String(id), params: AFHttp.paramsEmpty(), handler: {response in
            self.isLoading = false
            
            switch response.result {
            case .success:
                let post = try! JSONDecoder().decode(Post.self, from: response.data!)
                self.post = post
            case let .failure(error):
                print(error)
            }
        })
    }
    
    func apiPostCreate(post:Post){
        isLoading = true
        AFHttp.post(url: AFHttp.API_POST_CREATE, params: AFHttp.paramsPostCreate(post: post), handler: {response in
            self.isLoading = false
            
            switch response.result {
            case .success:
                print(response.result)
                self.isCreated = true
            case let .failure(error):
                print(error)
            }
        })
    }
    
    func apiPostUpdate(post:Post){
        isLoading = true
        AFHttp.put(url: AFHttp.API_POST_UPDATE + String(post.id!), params: AFHttp.paramsPostUpdate(post: post), handler: {response in
            self.isLoading = false
            
            switch response.result {
            case .success:
                print(response.result)
                self.isUpdated = true
            case let .failure(error):
                print(error)
            }
        })
    }
    
    func apiPostDelete(post:Post){
        isLoading = true
        AFHttp.del(url: AFHttp.API_POST_DELETE + String(post.id!), params: AFHttp.paramsEmpty(), handler: {response in
            self.isLoading = false
            
            switch response.result {
            case .success:
                print(response.result)
                self.isDeleted = true
            case let .failure(error):
                print(error)
            }
        })
    }
    
}
