class Comment < ActiveHash::Base
  self.data = [
      {id: 1, name: 'アウトプットできました！'},
      {id: 2, name: 'さすがです！！'},
      {id: 3, name: '新しいことを学んで素晴らしい！！'},
      {id: 4, name: '継続は力なり！'},
      {id: 5, name: 'あなたの勝利です...！！！'},
      {id: 6, name: 'よく頑張りました！'},
      {id: 7, name: '眠いのにえらいです！'},
      {id: 8, name: '100点です！！！'}
  ]
end