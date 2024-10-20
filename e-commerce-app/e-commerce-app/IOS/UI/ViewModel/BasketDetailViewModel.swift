import Foundation

class BasketDetailViewModel: ObservableObject {
    
    var basketService = BasketService()

    @Published public var basketDetail: BasketListModel?
    @Published public var totalPrice: Double?

    func getBasketDetail() async {
        let getBasketListRequestModel = GetBasketListRequestModel()
        getBasketListRequestModel.kullaniciAdi = ServicePaths.Constans.userName
        basketDetail = await basketService.getBasketList(getBasketListRequestModel: getBasketListRequestModel)
        getTotalPrice()
        refatorBasket()
    }
    
    func refatorBasket() {
        // Sepet detayı yoksa fonksiyondan çık.
        guard let urunlerSepeti = basketDetail?.urunlerSepeti else {
            return
        }
        
        var newBasketDetail = BasketListModel()
      
        // Ürünleri isimlerine göre gruplandırıyoruz.
        let groupedProducts = Dictionary(grouping: urunlerSepeti, by: { $0.ad })
        
        for (ad, urunler) in groupedProducts {
            let toplamFiyat = urunler.reduce(0.0) { $0 + ($1.fiyat * Double($1.siparisAdeti)) }
            let toplamAdet = urunler.reduce(0) { $0 + $1.siparisAdeti }
            
            if let ilkUrun = urunler.first {
                let yeniUrun = UrunModel()
                yeniUrun.ad = ad
                yeniUrun.fiyat = toplamFiyat
                yeniUrun.sepetId = ilkUrun.sepetId
                yeniUrun.kullaniciAdi = ilkUrun.kullaniciAdi
                yeniUrun.siparisAdeti = toplamAdet
                yeniUrun.marka = ilkUrun.marka
                yeniUrun.kategori = ilkUrun.kategori
                yeniUrun.resim = ilkUrun.resim
                
                // Sepete yeni ürünü ekle
                newBasketDetail.urunlerSepeti.append(yeniUrun)
            }
        }
        
        // Güncellenmiş sepet detayını ata
        basketDetail = newBasketDetail
    }

    func getTotalPrice()  {
        totalPrice = basketDetail?.urunlerSepeti.reduce(0.0) { $0 + ($1.fiyat * Double($1.siparisAdeti)) } ?? 0.0
    }
}
