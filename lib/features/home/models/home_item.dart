class HomeItem {
final String title;
final String image;
final int type;
final bool showAd;

const HomeItem({
required this.title,
required this.image,
required this.type,
this.showAd = false,
});
}
