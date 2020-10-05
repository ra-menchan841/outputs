class Comment < ActiveHash::Base
  self.data = [
      {id: 1, name: 'アウトプットしたの？えらい！'},
      {id: 2, name: '学習してえらい！'},
      {id: 3, name: '新しいこと学んだの？すごい！'},
      {id: 4, name: 'パソコン開いてえらい！'},
      {id: 5, name: '今日はパソコン開いただけで満点！'},
      {id: 6, name: '頑張ってえらい！'},
      {id: 7, name: '起きててえらい！'},
      {id: 8, name: '今日はアウトプットしただけで満点！'}
  ]
end