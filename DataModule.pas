unit DataModule;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TPlayers_module = class(TDataModule)
    Players_Database: TADOConnection;
    tbl_Players: TADOTable;
    tbl_Playersid: TAutoIncField;
    tbl_Playersplayer_name: TWideStringField;
    tbl_Playersscore: TIntegerField;
    tbl_Scores: TADOTable;
    tbl_ScoresDate_Of_Winner: TDateTimeField;
    tbl_ScoresWinner: TWideStringField;
    tbl_ScoresScores: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Players_module: TPlayers_module;

implementation

{$R *.dfm}

end.
