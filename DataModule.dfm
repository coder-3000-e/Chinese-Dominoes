object Players_module: TPlayers_module
  OldCreateOrder = False
  Height = 150
  Width = 215
  object Players_Database: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\loure\Desk' +
      'top\Chinese Dominoes\DataBase\Dominoes.MDB;Persist Security Info' +
      '=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 56
    Top = 16
  end
  object tbl_Players: TADOTable
    Active = True
    Connection = Players_Database
    CursorType = ctStatic
    TableName = 'players'
    Left = 40
    Top = 72
    object tbl_Playersid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object tbl_Playersplayer_name: TWideStringField
      FieldName = 'player_name'
    end
    object tbl_Playersscore: TIntegerField
      FieldName = 'score'
    end
  end
  object tbl_Scores: TADOTable
    Active = True
    Connection = Players_Database
    CursorType = ctStatic
    TableName = 'Winners'
    Left = 104
    Top = 72
    object tbl_ScoresDate_Of_Winner: TDateTimeField
      FieldName = 'Date_Of_Winner'
    end
    object tbl_ScoresWinner: TWideStringField
      FieldName = 'Winner'
    end
    object tbl_ScoresScores: TIntegerField
      FieldName = 'Scores'
    end
  end
end
