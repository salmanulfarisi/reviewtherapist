const List titlePostCard = [
  "Worzone Mobile Android Optimization is Worse Now?!",
  "Fortnite 23.30 Patch Adds Son Gohan And Piccolo Skins In New Dragon Ball Super Crossover",
  "Who Is The Kid Laroi? Everything You Need To Know About Fortnite's Newest Icon."
];
const List gameNamePostCard = [
  "Call of Duty Mobile",
  "Fortnite",
  "Fortnite",
];
const List gameImagePostCard = [
  "https://prod.assets.earlygamecdn.com/images/warzone-2-release-date.jpg?mtime=1643176468",
  "https://www.gamespot.com/a/uploads/scale_super/3/37852/4093143-dragonball-keyart.jpg",
  "https://cdn2.unrealengine.com/fortnite-the-kid-larois-wild-dreams-1920x1080-d5f96d1d2dda.jpg",
];
const List postLike = [999, 1499, 999949];
const List postSave = [99, 149, 52];
const List postComment = [1959, 1999, 3949];
List chipText = [
  'All Posts',
  'Daillies',
  'Arcade',
  'Action',
  "Adventure",
  "Casual",
];
final List<String> selectedList = [];

const List monthDaillies = [
  'JAN',
  'FEB',
  'MAR',
  'APR',
  'MAY',
  'JUN',
  'JUL',
  'AUG',
  'SEP',
  'OCT',
  'NOV',
  'DEC'
];
const List dayDaillies = [
  '01',
  '02',
  '03',
  '04',
  '05',
  '06',
  '07',
  '08',
  '09',
  '10',
  '11',
  '12'
];
const List discription = [
  'Call of Duty Mobile',
  'Fortnite',
  'Fortnite',
];
const List userCount = [
  '250 million Users',
  '83.3 million Users',
  '83.3 million Users',
];
const List postDate = [
  '1 day ago',
  '2 day ago',
  '3 day ago',
];

const List postBlog = [
  "While we don’t have concrete data for all entries in the Call of Duty franchise, we have data on the three wildly popular online entries Call of Duty: Modern Warfare, Call of Duty: Mobile, and Call of Duty: Warzone.\n The data indicates that in the last 30 days a total of 118.234.190 players have been recorded between the three Call of Duty games.\n  Call of Duty: Mobile is the most popular and Call of Duty: Modern Warfare is the least.\n  At least 400 million people have at least played a Call of Duty game at least once.\n  Unfortunately, this number was recorded in 2021, and since then, Activision has not revealed any numbers regarding the popular franchise in terms of a collective player base.",
  "Fortnite is an online video game developed by Epic Games and released in 2017.\n It is available in three distinct game mode versions that otherwise share the same general gameplay and game engine: Fortnite Battle Royale, a free-to-play battle royale game in which up to 100 players fight to be the last person standing; Fortnite: Save the World, a cooperative hybrid tower defense-shooter and survival game in which up to four players fight off zombie-like creatures and defend objects with traps and fortifications they can build; and Fortnite Creative, in which players are given complete freedom to create worlds and battle arenas.\nSave the World and Battle Royale were released in 2017 as early access titles, while Creative was released on December 6, 2018. While the Save the World and Creative versions have been successful for Epic Games, Fortnite Battle Royale in particular became an overwhelming success and a cultural phenomenon, drawing more than 125 million players in less than a year, earning hundreds of millions of dollars per month.\n Fortnite as a whole generated \$9 billion in gross revenue up until December 2019.\nSave the World is available only for Windows, macOS,[b] PlayStation 4, and Xbox One, while Battle Royale and Creative were released for all those platforms, and also for Nintendo Switch, iOS,[b] and Android devices.\n[b] The game also launched with the release of the ninth-generation PlayStation 5 and Xbox Series X/S consoles.",
  " Fortnite is an online video game developed by Epic Games and released in 2017.\n It is available in three distinct game mode versions that otherwise share the same general gameplay and game engine: Fortnite Battle Royale, a free-to-play battle royale game in which up to 100 players fight to be the last person standing; Fortnite: Save the World, a cooperative hybrid tower defense-shooter and survival game in which up to four players fight off zombie-like creatures and defend objects with traps and fortifications they can build; and Fortnite Creative, in which players are given complete freedom to create worlds and battle arenas.\nSave the World and Battle Royale were released in 2017 as early access titles, while Creative was released on December 6, 2018. While the Save the World and Creative versions have been successful for Epic Games, Fortnite Battle Royale in particular became an overwhelming success and a cultural phenomenon, drawing more than 125 million players in less than a year, earning hundreds of millions of dollars per month.\n Fortnite as a whole generated \$9 billion in gross revenue up until December 2019.\nSave the World is available only for Windows, macOS,[b] PlayStation 4, and Xbox One, while Battle Royale and Creative were released for all those platforms, and also for Nintendo Switch, iOS,[b] and Android devices.\n[b] The game also launched with the release of the ninth-generation PlayStation 5 and Xbox Series X/S consoles."
];

class BlogPostImage {
  String title;
  String content;
  List<String>? imageUnderTitle;
  List<String> image;
  BlogPostImage(
      {required this.title,
      required this.content,
      required this.image,
      this.imageUnderTitle});
}

List<bool> numberofImage = [
  true,
  false,
  true,
];

List<BlogPostImage> blogpostList = [
  BlogPostImage(
    title: "$titlePostCard",
    content: postBlog.toString(),
    image: [
      "https://prod.assets.earlygamecdn.com/images/warzone-2-release-date.jpg?mtime=1643176468",
      "https://www.gamespot.com/a/uploads/scale_super/3/37852/4093143-dragonball-keyart.jpg",
      "https://cdn2.unrealengine.com/fortnite-the-kid-larois-wild-dreams-1920x1080-d5f96d1d2dda.jpg",
    ],
  ),
];
List commentUser = [
  "https://cdn2.unrealengine.com/fortnite-the-kid-larois-wild-dreams-1920x1080-d5f96d1d2dda.jpg",
  "https://prod.assets.earlygamecdn.com/images/warzone-2-release-date.jpg?mtime=1643176468",
  "https://www.gamespot.com/a/uploads/scale_super/3/37852/4093143-dragonball-keyart.jpg",
];
List comment = [
  "Nice",
  "Good",
  "Nice",
];
List commentDate = [
  "1 day ago",
  "2 day ago",
  "3 day ago",
];

List newRelease = [
  "https://wallpaperaccess.com/full/2086922.jpg",
  "https://4kwallpapers.com/images/walls/thumbs_2t/9809.jpg",
  "https://wallpaperaccess.com/full/228227.jpg",
  "https://images.wallpapersden.com/image/wxl-ghostrunner-4k-gaming_82129.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1a6J0-FoKm5evdVgqHb0hXHmMjADwa6WiTXWSqJ_cWyUaz0SEqcVQDbFsFgimr8RiHr4&usqp=CAU",
  "https://wallpapers.com/images/featured/33vov45f7zqi6t75.jpg",
  "https://i.pinimg.com/originals/66/3f/f0/663ff0b0fa8219aab260ba50b2eb3d5a.jpg",
  "https://w0.peakpx.com/wallpaper/223/747/HD-wallpaper-spider-man-2021-game-screenshot-poster.jpg",
  "https://free4kwallpapers.com/uploads/originals/2021/03/10/battlefield-game-wallpaper.jpg",
  "https://www.pixelstalk.net/wp-content/uploads/images6/Gaming-Wallpaper-4k-Wallpaper-HD.jpg"
];
List newReleaseName = [
  "Hogwarts Legacy",
  "Horizon Call of the Mountain",
  "Sons of the Forest",
  "Wild Hearts",
  "Blood Bowl 3",
  "OCTOPATH TRAVELER II",
  "Atomic Heart",
  "Company of Heroes 3",
  "Kerbal Space Program 2",
  "Ghostrunner",
];
