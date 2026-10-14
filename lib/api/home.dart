import 'package:hm_shop/utils/DioRequest.dart';
import 'package:hm_shop/viewmodels/Home.dart';

Future<List<BannerItem>> getBanners() async {
  return (await dioRequest.get("/banners") as List).map((item) {
    return BannerItem.formJSON(item as Map<String, dynamic>);
  }).toList();
}

Future<List<BannerItem>> queryBanners() async {
  return await dioRequest.getFormJson<List<BannerItem>>(
    "/banners",
    fromJson: (json) => (json as List)
        .map((e) => BannerItem.formJSON(e as Map<String, dynamic>))
        .toList(),
  );
}
