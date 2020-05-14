class Accept < ActiveHash::Base
  self.data = [
  {id: 1, name: '1人'}, {id: 2, name: '2~4人'},
  {id: 3, name: '5~10人'}, {id: 4, name: '10人以上'}
  ]
end