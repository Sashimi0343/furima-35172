class Days_to_ship < ActiveHash::Base

  self.data = [
    { id: 1, name: '--'},
    { id: 2, name: '経済'},
    { id: 3, name: '政治'},
    { id: 4, name: '地域'},
  ]

  include ActiveHash::Associations
  has_many :items

end