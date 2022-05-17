class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: 'メンズ' },
    { id: 2, name: 'レディース' },
    { id: 3, name: 'ベビー・キッズ' },
    { id: 4, name: 'インテリア' },
    { id: 5, name: '住まい' },
    { id: 6, name: '小物' },
    { id: 7, name: '本・音楽・ゲーム' },
    { id: 8, name: 'おもちゃ・ホビー・グッズ' },
    { id: 9, name: '家電・スマホ・カメラ' },
    { id: 10, name: 'スポーツ・レジャー' },
    { id: 11, name: 'ハンドメイド' },
    { id: 12, name: 'その他' }
  ]


  include ActiveHash::Associations
  has_many :items
  end

