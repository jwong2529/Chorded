import SwiftUI

struct ViewHomePage: View {
    
    @State private var searchText = ""
    @StateObject private var trendingAlbumsVM = TrendingAlbumsViewModel()
    
    init() {
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont(name: "Georgia-Bold", size: 26)!]
        
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .systemGray4
//        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = .black
        UISearchBar.appearance().barTintColor = UIColor.white
    }

    var body: some View {
        NavigationStack {
            ZStack {
                AppBackground()
                VStack {
                    NavigationLink(destination: ViewTrendingAlbumsPage()) {
                        HStack {
                            Text("Trending")
                                .font(.system(size: 20, weight: .medium, design: .default))
                                .foregroundColor(.white)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.blue)
                        }
                        .contentShape(Rectangle())
                        .padding()
                    }
                    .buttonStyle(HighlightButtonStyle())
                    
                    //just sample cover for now, will rewrite logic for this when i set up database
                    //need to pass in array of albums now instead of strings
//                    AlbumCarousel(albumImages: Array(repeating: "sampleAlbumCover", count: 10), count: 10)
//                        .padding(.bottom)
//                    if !trendingAlbumsVM.albums.isEmpty {
//                        AlbumCarousel(albums: trendingAlbumsVM.albums)
//                            .padding(.bottom)
//                    } else {
//                        ProgressView()
//                            .padding(.bottom)
//                    }
                    
                    NavigationLink(destination: ViewRecentFriendsActivityPage()) {
                        HStack {
                            Text("Recent from friends")
                                .font(.system(size: 20, weight: .medium, design: .default))
                                .foregroundColor(.white)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.blue)
                        }
                        .contentShape(Rectangle())
                        .padding()
                    }
                    .buttonStyle(HighlightButtonStyle())
                    
//                    AlbumCarousel(albumImages: Array(repeating: "sampleAlbumCover", count: 10), count: 10)
//                    
                    Spacer()
                }
            }
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Chorded").font(.system(size: 26, weight: .bold, design: .default))
                            .foregroundColor(.white)
                            
                    }
                }
            }
            .searchable(text: $searchText)
        }
    }
    
}

#Preview {
    ViewHomePage()
}

