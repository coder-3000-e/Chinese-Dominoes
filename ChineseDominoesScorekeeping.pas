unit ChineseDominoesScorekeeping;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Math, jpeg, ComCtrls;

type
  Tfrm_Dominoes = class(TForm)
    tab_dom: TPageControl;
    tab_Dominoes: TTabSheet;
    Background: TImage;
    lbl_dom: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    edt_Player1: TEdit;
    edt_Player4: TEdit;
    edt_Player3: TEdit;
    edt_Player2: TEdit;
    btn_AddPlayers: TButton;
    pnl_1: TPanel;
    Player11: TLabel;
    Player33: TLabel;
    Player22: TLabel;
    Player44: TLabel;
    pnl_Special: TPanel;
    cmb_Special: TComboBox;
    btn_plus10: TButton;
    btn_minus10: TButton;
    btn_plus30: TButton;
    pnl_Double: TPanel;
    lbl_Double20: TLabel;
    lbl_Double: TLabel;
    btn_double: TButton;
    btn_double20: TButton;
    pnl_scores: TPanel;
    lbl_player11: TLabel;
    lbl_player22: TLabel;
    lbl_player33: TLabel;
    lbl_player44: TLabel;
    Label5: TLabel;
    mmo_PlayerScore2: TMemo;
    mmo_PlayerScore3: TMemo;
    mmo_PlayerScore4: TMemo;
    mmo_PlayerScore1: TMemo;
    cmb_Winner: TComboBox;
    btn_Winner: TButton;
    edt_Score1: TEdit;
    edt_Score2: TEdit;
    edt_Score3: TEdit;
    btn_AddScores: TButton;
    btn_NoWinnner: TButton;
    edt_Score4: TEdit;
    btn_addscores2: TButton;
    btn_NewGame: TButton;
    procedure FormActivate(Sender: TObject);
    procedure btn_WinnerClick(Sender: TObject);
    procedure btn_AddScoresClick(Sender: TObject);
    procedure btn_AddPlayersClick(Sender: TObject);
    procedure btn_plus10Click(Sender: TObject);
    procedure btn_plus30Click(Sender: TObject);
    procedure btn_minus10Click(Sender: TObject);
    procedure cmb_SpecialChange(Sender: TObject);
    procedure cmb_WinnerChange(Sender: TObject);
    procedure btn_NewGameClick(Sender: TObject);
    procedure edt_Player4Change(Sender: TObject);
    procedure btn_doubleClick(Sender: TObject);
    procedure btn_double20Click(Sender: TObject);
    procedure btn_NoWinnnerClick(Sender: TObject);
    procedure btn_addscores2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Dominoes: Tfrm_Dominoes;
  Today: TDateTime;
  Total1, PlayerScore1, Counter1, Fault1: Integer;
  Total2, PlayerScore2, Counter2, Fault2: Integer;
  Total3, PlayerScore3, Counter3, Fault3: Integer;
  Total4, PlayerScore4, Counter4, Fault4: Integer;
  myFile: TextFile;
  texts: string;
  Numberss: TStringList;

implementation

{$R *.dfm}

procedure Tfrm_Dominoes.btn_AddPlayersClick(Sender: TObject);
Var
  Player1: string;
  Player2: string;
  Player3: string;
  Player4: string;

begin

  Player1 := edt_Player1.text;
  Player2 := edt_Player2.text;
  Player3 := edt_Player3.text;
  Player4 := edt_Player4.text;
  btn_AddPlayers.Enabled := False;

  lbl_player11.Caption := Player1;
  lbl_player22.Caption := Player2;
  lbl_player33.Caption := Player3;
  lbl_player44.Caption := Player4;

  edt_Player1.ReadOnly := True;
  edt_Player2.ReadOnly := True;
  edt_Player3.ReadOnly := True;
  edt_Player4.ReadOnly := True;

  cmb_Winner.Items.Add(Player1);
  cmb_Winner.Items.Add(Player2);
  cmb_Winner.Items.Add(Player3);
  cmb_Winner.Items.Add(Player4);

  cmb_Special.Items.Add(Player1);
  cmb_Special.Items.Add(Player2);
  cmb_Special.Items.Add(Player3);
  cmb_Special.Items.Add(Player4);

  cmb_Special.Enabled := True;
  btn_double.Enabled := True;
  btn_double20.Enabled := True;
  cmb_Winner.Enabled := True;

  btn_Winner.Enabled := True;
  btn_NoWinnner.Enabled := True;
end;

procedure Tfrm_Dominoes.btn_addscores2Click(Sender: TObject);
Var
  Player1: string;
  Player2: string;
  Player3: string;
  Player4: string;
  I: Integer;
begin
  Player1 := edt_Player1.text;
  Player2 := edt_Player2.text;
  Player3 := edt_Player3.text;
  Player4 := edt_Player4.text;

  Player11.Hide;
  Player22.Hide;
  Player33.Hide;
  Player44.Hide;
  edt_Score1.Hide;
  edt_Score2.Hide;
  edt_Score3.Hide;
  edt_Score4.Hide;
  btn_AddScores.Hide;

  PlayerScore1 := 0;
  PlayerScore2 := 0;
  PlayerScore3 := 0;
  PlayerScore4 := 0;

  if btn_double.Enabled = False then
  begin
    Counter1 := Counter1 - 1;
    Fault1 := Fault1;
    PlayerScore1 := (StrToInt(edt_Score1.text)) * 2;
    Total1 := Total1 + PlayerScore1 + Fault1;
    mmo_PlayerScore1.Lines.Add(Format('%d: %d  (%d)', [Counter1, PlayerScore1,
        Fault1]));

    Counter2 := Counter2 - 1;
    Fault2 := Fault2;
    PlayerScore2 := (StrToInt(edt_Score2.text)) * 2;
    Total2 := Total2 + PlayerScore2 + Fault2;
    mmo_PlayerScore2.Lines.Add(Format('%d: %d  (%d)', [Counter2, PlayerScore2,
        Fault2]));

    Counter3 := Counter3 - 1;
    Fault3 := Fault3;
    PlayerScore3 := (StrToInt(edt_Score3.text)) * 2;
    Total3 := Total3 + PlayerScore3 + Fault3;
    mmo_PlayerScore3.Lines.Add(Format('%d: %d  (%d)', [Counter3, PlayerScore3,
        Fault3]));

    Counter4 := Counter4 - 1;
    Fault4 := Fault4;
    PlayerScore4 := (StrToInt(edt_Score4.text)) * 2;
    Total4 := Total4 + PlayerScore4 + Fault4;
    mmo_PlayerScore4.Lines.Add(Format('%d: %d  (%d)', [Counter4, PlayerScore4,
        Fault4]));

  end

  else if btn_double20.Enabled = False then
  begin
    Counter1 := Counter1 - 1;
    Fault1 := Fault1;
    PlayerScore1 := ((StrToInt(edt_Score1.text)) * 2) + 20;
    Total1 := Total1 + PlayerScore1 + Fault1;
    mmo_PlayerScore1.Lines.Add(Format('%d: %d  (%d)', [Counter1, PlayerScore1,
        Fault1]));

    Counter2 := Counter2 - 1;
    Fault2 := Fault2;
    PlayerScore2 := ((StrToInt(edt_Score2.text)) * 2) + 20;
    Total2 := Total2 + PlayerScore2 + Fault2;
    mmo_PlayerScore2.Lines.Add(Format('%d: %d  (%d)', [Counter2, PlayerScore2,
        Fault2]));

    Counter3 := Counter3 - 1;
    Fault3 := Fault3;
    PlayerScore3 := ((StrToInt(edt_Score3.text)) * 2) + 20;
    Total3 := Total3 + PlayerScore3 + Fault3;
    mmo_PlayerScore3.Lines.Add(Format('%d: %d  (%d)', [Counter3, PlayerScore3,
        Fault3]));

    Counter4 := Counter4 - 1;
    Fault4 := Fault4;
    PlayerScore4 := ((StrToInt(edt_Score4.text)) * 2) + 20;
    Total4 := Total4 + PlayerScore4 + Fault4;
    mmo_PlayerScore4.Lines.Add(Format('%d: %d  (%d)', [Counter4, PlayerScore4,
        Fault4]));

  end
  else
  begin
    Counter1 := Counter1 - 1;
    Fault1 := Fault1;
    PlayerScore1 := StrToInt(edt_Score1.text);
    Total1 := Total1 + PlayerScore1 + Fault1;
    mmo_PlayerScore1.Lines.Add(Format('%d: %d  (%d)', [Counter1, PlayerScore1,
        Fault1]));

    Counter2 := Counter2 - 1;
    Fault2 := Fault2;
    PlayerScore2 := StrToInt(edt_Score2.text);
    Total2 := Total2 + PlayerScore2 + Fault2;
    mmo_PlayerScore2.Lines.Add(Format('%d: %d  (%d)', [Counter2, PlayerScore2,
        Fault2]));

    Counter3 := Counter3 - 1;
    Fault3 := Fault3;
    PlayerScore3 := StrToInt(edt_Score3.text);
    Total3 := Total3 + PlayerScore3 + Fault3;
    mmo_PlayerScore3.Lines.Add(Format('%d: %d  (%d)', [Counter3, PlayerScore3,
        Fault3]));

    Counter4 := Counter4 - 1;
    Fault4 := Fault4;
    PlayerScore4 := StrToInt(edt_Score4.text);
    Total4 := Total4 + PlayerScore4 + Fault4;
    mmo_PlayerScore4.Lines.Add(Format('%d: %d  (%d)', [Counter4, PlayerScore4,
        Fault4]));

  end;

  Fault1 := 0;
  Fault3 := 0;
  Fault4 := 0;
  Fault2 := 0;
  btn_Winner.Enabled := True;
  btn_NoWinnner.Enabled := True;
  btn_addscores2.Hide;

  if Counter1 = 0 then
  begin
    if Counter2 = 0 then
    begin
      btn_Winner.Enabled := False;
      cmb_Winner.Enabled := False;
      cmb_Special.Enabled := False;
      btn_double.Enabled := False;
      btn_double20.Enabled := False;
      mmo_PlayerScore1.Lines.Add('');
      mmo_PlayerScore1.Lines.Add(Format('Total: %d', [Total1]));
      mmo_PlayerScore2.Lines.Add('');
      mmo_PlayerScore2.Lines.Add(Format('Total: %d', [Total2]));
      mmo_PlayerScore3.Lines.Add('');
      mmo_PlayerScore3.Lines.Add(Format('Total: %d', [Total3]));
      mmo_PlayerScore4.Lines.Add('');
      mmo_PlayerScore4.Lines.Add(Format('Total: %d', [Total4]));
    end;

  end;
  btn_double.Enabled := True;
  btn_double20.Enabled := True;
end;

procedure Tfrm_Dominoes.btn_AddScoresClick(Sender: TObject);
Var
  Player1: string;
  Player2: string;
  Player3: string;
  Player4: string;
begin
  btn_NoWinnner.Enabled := True;
  Player1 := edt_Player1.text;
  Player2 := edt_Player2.text;
  Player3 := edt_Player3.text;
  Player4 := edt_Player4.text;

  Player11.Hide;
  Player22.Hide;
  Player33.Hide;
  edt_Score1.Hide;
  edt_Score2.Hide;
  edt_Score3.Hide;
  btn_AddScores.Hide;

  PlayerScore1 := 0;
  PlayerScore2 := 0;
  PlayerScore3 := 0;
  PlayerScore4 := 0;

  if btn_double.Enabled = False then
  begin
    if Player1 = cmb_Winner.Items[cmb_Winner.ItemIndex] then
    begin
      Counter2 := Counter2 - 1;
      Fault2 := Fault2;
      PlayerScore2 := (StrToInt(edt_Score1.text)) * 2;
      Total2 := Total2 + PlayerScore2 + Fault2;
      mmo_PlayerScore2.Lines.Add(Format('%d: %d  (%d)', [Counter2,
          PlayerScore2, Fault2]));

      Counter3 := Counter3 - 1;
      Fault3 := Fault3;
      PlayerScore3 := (StrToInt(edt_Score2.text)) * 2;
      Total3 := Total3 + PlayerScore3 + Fault3;
      mmo_PlayerScore3.Lines.Add(Format('%d: %d  (%d)', [Counter3,
          PlayerScore3, Fault3]));

      Counter4 := Counter4 - 1;
      Fault4 := Fault4;
      PlayerScore4 := (StrToInt(edt_Score3.text)) * 2;
      Total4 := Total4 + PlayerScore4 + Fault4;
      mmo_PlayerScore4.Lines.Add(Format('%d: %d  (%d)', [Counter4,
          PlayerScore4, Fault4]));

    end
    else if Player2 = cmb_Winner.Items[cmb_Winner.ItemIndex] then
    begin
      Counter1 := Counter1 - 1;
      Fault1 := Fault1;
      PlayerScore1 := (StrToInt(edt_Score1.text)) * 2;
      Total1 := Total1 + PlayerScore1 + Fault1;
      mmo_PlayerScore1.Lines.Add(Format('%d: %d  (%d)', [Counter1,
          PlayerScore1, Fault1]));

      Counter3 := Counter3 - 1;
      Fault3 := Fault3;
      PlayerScore3 := (StrToInt(edt_Score2.text)) * 2;
      Total3 := Total3 + PlayerScore3 + Fault3;
      mmo_PlayerScore3.Lines.Add(Format('%d: %d  (%d)', [Counter3,
          PlayerScore3, Fault3]));

      Counter4 := Counter4 - 1;
      Fault4 := Fault4;
      PlayerScore4 := (StrToInt(edt_Score3.text)) * 2;
      Total4 := Total4 + PlayerScore4 + Fault4;
      mmo_PlayerScore4.Lines.Add(Format('%d: %d  (%d)', [Counter4,
          PlayerScore4, Fault4]));

    end
    else if Player3 = cmb_Winner.Items[cmb_Winner.ItemIndex] then
    begin
      Counter1 := Counter1 - 1;
      Fault1 := Fault1;
      PlayerScore1 := (StrToInt(edt_Score1.text)) * 2;
      Total1 := Total1 + PlayerScore1 + Fault1;
      mmo_PlayerScore1.Lines.Add(Format('%d: %d  (%d)', [Counter1,
          PlayerScore1, Fault1]));

      Counter2 := Counter2 - 1;
      Fault2 := Fault2;
      PlayerScore2 := (StrToInt(edt_Score2.text)) * 2;
      Total2 := Total2 + PlayerScore2 + Fault2;
      mmo_PlayerScore2.Lines.Add(Format('%d: %d  (%d)', [Counter2,
          PlayerScore2, Fault2]));

      Counter4 := Counter4 - 1;
      Fault4 := Fault4;
      PlayerScore4 := (StrToInt(edt_Score3.text)) * 2;
      Total4 := Total4 + PlayerScore4 + Fault4;
      mmo_PlayerScore4.Lines.Add(Format('%d: %d  (%d)', [Counter4,
          PlayerScore4, Fault4]));

    end
    else if Player4 = cmb_Winner.Items[cmb_Winner.ItemIndex] then
    begin
      Counter1 := Counter1 - 1;
      Fault1 := Fault1;
      PlayerScore1 := (StrToInt(edt_Score1.text)) * 2;
      Total1 := Total1 + PlayerScore1 + Fault1;
      mmo_PlayerScore1.Lines.Add(Format('%d: %d  (%d)', [Counter1,
          PlayerScore1, Fault1]));

      Counter2 := Counter2 - 1;
      Fault2 := Fault2;
      PlayerScore2 := (StrToInt(edt_Score2.text)) * 2;
      Total2 := Total2 + PlayerScore2 + Fault2;
      mmo_PlayerScore2.Lines.Add(Format('%d: %d  (%d)', [Counter2,
          PlayerScore2, Fault2]));

      Counter3 := Counter3 - 1;
      Fault3 := Fault3;
      PlayerScore3 := (StrToInt(edt_Score3.text)) * 2;
      Total3 := Total3 + PlayerScore3 + Fault3;
      mmo_PlayerScore3.Lines.Add(Format('%d: %d  (%d)', [Counter3,
          PlayerScore3, Fault3]));

    end
  end
  else if btn_double20.Enabled = False then
  begin
    if Player1 = cmb_Winner.Items[cmb_Winner.ItemIndex] then
    begin
      Counter2 := Counter2 - 1;
      Fault2 := Fault2;
      PlayerScore2 := ((StrToInt(edt_Score1.text)) * 2) + 20;
      Total2 := Total2 + PlayerScore2 + Fault2;
      mmo_PlayerScore2.Lines.Add(Format('%d: %d  (%d)', [Counter2,
          PlayerScore2, Fault2]));

      Counter3 := Counter3 - 1;
      Fault3 := Fault3;
      PlayerScore3 := ((StrToInt(edt_Score2.text)) * 2) + 20;
      Total3 := Total3 + PlayerScore3 + Fault3;
      mmo_PlayerScore3.Lines.Add(Format('%d: %d  (%d)', [Counter3,
          PlayerScore3, Fault3]));

      Counter4 := Counter4 - 1;
      Fault4 := Fault4;
      PlayerScore4 := ((StrToInt(edt_Score3.text)) * 2) + 20;
      Total4 := Total4 + PlayerScore4 + Fault4;
      mmo_PlayerScore4.Lines.Add(Format('%d: %d  (%d)', [Counter4,
          PlayerScore4, Fault4]));

    end
    else if Player2 = cmb_Winner.Items[cmb_Winner.ItemIndex] then
    begin
      Counter1 := Counter1 - 1;
      Fault1 := Fault1;
      PlayerScore1 := ((StrToInt(edt_Score1.text)) * 2) + 20;
      Total1 := Total1 + PlayerScore1 + Fault1;
      mmo_PlayerScore1.Lines.Add(Format('%d: %d  (%d)', [Counter1,
          PlayerScore1, Fault1]));

      Counter3 := Counter3 - 1;
      Fault3 := Fault3;
      PlayerScore3 := ((StrToInt(edt_Score2.text)) * 2) + 20;
      Total3 := Total3 + PlayerScore3 + Fault3;
      mmo_PlayerScore3.Lines.Add(Format('%d: %d  (%d)', [Counter3,
          PlayerScore3, Fault3]));

      Counter4 := Counter4 - 1;
      Fault4 := Fault4;
      PlayerScore4 := ((StrToInt(edt_Score3.text)) * 2) + 20;
      Total4 := Total4 + PlayerScore4 + Fault4;
      mmo_PlayerScore4.Lines.Add(Format('%d: %d  (%d)', [Counter4,
          PlayerScore4, Fault4]));

    end
    else if Player3 = cmb_Winner.Items[cmb_Winner.ItemIndex] then
    begin
      Counter1 := Counter1 - 1;
      Fault1 := Fault1;
      PlayerScore1 := ((StrToInt(edt_Score1.text)) * 2) + 20;
      Total1 := Total1 + PlayerScore1 + Fault1;
      mmo_PlayerScore1.Lines.Add(Format('%d: %d  (%d)', [Counter1,
          PlayerScore1, Fault1]));

      Counter2 := Counter2 - 1;
      Fault2 := Fault2;
      PlayerScore2 := ((StrToInt(edt_Score2.text)) * 2) + 20;
      Total2 := Total2 + PlayerScore2 + Fault2;
      mmo_PlayerScore2.Lines.Add(Format('%d: %d  (%d)', [Counter2,
          PlayerScore2, Fault2]));

      Counter4 := Counter4 - 1;
      Fault4 := Fault4;
      PlayerScore4 := ((StrToInt(edt_Score3.text)) * 2) + 20;
      Total4 := Total4 + PlayerScore4 + Fault4;
      mmo_PlayerScore4.Lines.Add(Format('%d: %d  (%d)', [Counter4,
          PlayerScore4, Fault4]));

    end
    else if Player4 = cmb_Winner.Items[cmb_Winner.ItemIndex] then
    begin
      Counter1 := Counter1 - 1;
      Fault1 := Fault1;
      PlayerScore1 := ((StrToInt(edt_Score1.text)) * 2) + 20;
      Total1 := Total1 + PlayerScore1 + Fault1;
      mmo_PlayerScore1.Lines.Add(Format('%d: %d  (%d)', [Counter1,
          PlayerScore1, Fault1]));

      Counter2 := Counter2 - 1;
      Fault2 := Fault2;
      PlayerScore2 := ((StrToInt(edt_Score2.text)) * 2) + 20;
      Total2 := Total2 + PlayerScore2 + Fault2;
      mmo_PlayerScore2.Lines.Add(Format('%d: %d  (%d)', [Counter2,
          PlayerScore2, Fault2]));

      Counter3 := Counter3 - 1;
      Fault3 := Fault3;
      PlayerScore3 := ((StrToInt(edt_Score3.text)) * 2) + 20;
      Total3 := Total3 + PlayerScore3 + Fault3;
      mmo_PlayerScore3.Lines.Add(Format('%d: %d  (%d)', [Counter3,
          PlayerScore3, Fault3]));
    end

  end
  else
  begin
    if Player1 = cmb_Winner.Items[cmb_Winner.ItemIndex] then
    begin
      Counter2 := Counter2 - 1;
      Fault2 := Fault2;
      PlayerScore2 := StrToInt(edt_Score1.text);
      Total2 := Total2 + PlayerScore2 + Fault2;
      mmo_PlayerScore2.Lines.Add(Format('%d: %d  (%d)', [Counter2,
          PlayerScore2, Fault2]));

      Counter3 := Counter3 - 1;
      Fault3 := Fault3;
      PlayerScore3 := StrToInt(edt_Score2.text);
      Total3 := Total3 + PlayerScore3 + Fault3;
      mmo_PlayerScore3.Lines.Add(Format('%d: %d  (%d)', [Counter3,
          PlayerScore3, Fault3]));

      Counter4 := Counter4 - 1;
      Fault4 := Fault4;
      PlayerScore4 := StrToInt(edt_Score3.text);
      Total4 := Total4 + PlayerScore4 + Fault4;
      mmo_PlayerScore4.Lines.Add(Format('%d: %d  (%d)', [Counter4,
          PlayerScore4, Fault4]));

    end
    else if Player2 = cmb_Winner.Items[cmb_Winner.ItemIndex] then
    begin
      Counter1 := Counter1 - 1;
      Fault1 := Fault1;
      PlayerScore1 := StrToInt(edt_Score1.text);
      Total1 := Total1 + PlayerScore1 + Fault1;
      mmo_PlayerScore1.Lines.Add(Format('%d: %d  (%d)', [Counter1,
          PlayerScore1, Fault1]));

      Counter3 := Counter3 - 1;
      Fault3 := Fault3;
      PlayerScore3 := StrToInt(edt_Score2.text);
      Total3 := Total3 + PlayerScore3 + Fault3;
      mmo_PlayerScore3.Lines.Add(Format('%d: %d  (%d)', [Counter3,
          PlayerScore3, Fault3]));

      Counter4 := Counter4 - 1;
      Fault4 := Fault4;
      PlayerScore4 := StrToInt(edt_Score3.text);
      Total4 := Total4 + PlayerScore4 + Fault4;
      mmo_PlayerScore4.Lines.Add(Format('%d: %d  (%d)', [Counter4,
          PlayerScore4, Fault4]));

    end
    else if Player3 = cmb_Winner.Items[cmb_Winner.ItemIndex] then
    begin
      Counter1 := Counter1 - 1;
      Fault1 := Fault1;
      PlayerScore1 := StrToInt(edt_Score1.text);
      Total1 := Total1 + PlayerScore1 + Fault1;
      mmo_PlayerScore1.Lines.Add(Format('%d: %d  (%d)', [Counter1,
          PlayerScore1, Fault1]));

      Counter2 := Counter2 - 1;
      Fault2 := Fault2;
      PlayerScore2 := StrToInt(edt_Score2.text);
      Total2 := Total2 + PlayerScore2 + Fault2;
      mmo_PlayerScore2.Lines.Add(Format('%d: %d  (%d)', [Counter2,
          PlayerScore2, Fault2]));

      Counter4 := Counter4 - 1;
      Fault4 := Fault4;
      PlayerScore4 := StrToInt(edt_Score3.text);
      Total4 := Total4 + PlayerScore4 + Fault4;
      mmo_PlayerScore4.Lines.Add(Format('%d: %d  (%d)', [Counter4,
          PlayerScore4, Fault4]));

    end
    else if Player4 = cmb_Winner.Items[cmb_Winner.ItemIndex] then
    begin
      Counter1 := Counter1 - 1;
      Fault1 := Fault1;
      PlayerScore1 := StrToInt(edt_Score1.text);
      Total1 := Total1 + PlayerScore1 + Fault1;
      mmo_PlayerScore1.Lines.Add(Format('%d: %d  (%d)', [Counter1,
          PlayerScore1, Fault1]));

      Counter2 := Counter2 - 1;
      Fault2 := Fault2;
      PlayerScore2 := StrToInt(edt_Score2.text);
      Total2 := Total2 + PlayerScore2 + Fault2;
      mmo_PlayerScore2.Lines.Add(Format('%d: %d  (%d)', [Counter2,
          PlayerScore2, Fault2]));

      Counter3 := Counter3 - 1;
      Fault3 := Fault3;
      PlayerScore3 := StrToInt(edt_Score3.text);
      Total3 := Total3 + PlayerScore3 + Fault3;
      mmo_PlayerScore3.Lines.Add(Format('%d: %d  (%d)', [Counter3,
          PlayerScore3, Fault3]));

    end;
  end;
  Fault1 := 0;
  Fault3 := 0;
  Fault4 := 0;
  Fault2 := 0;
  btn_Winner.Enabled := True;

  if Counter1 = 0 then
  begin
    if Counter2 = 0 then
    begin
      btn_NoWinnner.Enabled := False;
      btn_Winner.Enabled := False;
      cmb_Winner.Enabled := False;
      cmb_Special.Enabled := False;
      btn_double.Enabled := False;
      btn_double20.Enabled := False;
      mmo_PlayerScore1.Lines.Add('');
      mmo_PlayerScore1.Lines.Add(Format('Total: %d', [Total1]));
      mmo_PlayerScore2.Lines.Add('');
      mmo_PlayerScore2.Lines.Add(Format('Total: %d', [Total2]));
      mmo_PlayerScore3.Lines.Add('');
      mmo_PlayerScore3.Lines.Add(Format('Total: %d', [Total3]));
      mmo_PlayerScore4.Lines.Add('');
      mmo_PlayerScore4.Lines.Add(Format('Total: %d', [Total4]));
    end;

  end;

  btn_double.Enabled := True;
  btn_double20.Enabled := True;
end;

procedure Tfrm_Dominoes.btn_double20Click(Sender: TObject);
begin
  btn_double20.Enabled := False;
end;

procedure Tfrm_Dominoes.btn_doubleClick(Sender: TObject);
begin
  btn_double.Enabled := False;
end;

procedure Tfrm_Dominoes.btn_minus10Click(Sender: TObject);
Var
  Player1: string;
  Player2: string;
  Player3: string;
  Player4: string;
begin
  Player1 := edt_Player1.text;
  Player2 := edt_Player2.text;
  Player3 := edt_Player3.text;
  Player4 := edt_Player4.text;
  if Player1 = cmb_Special.Items[cmb_Special.ItemIndex] then
  begin
    Total1 := Total1 - 10;
  end
  else if Player2 = cmb_Special.Items[cmb_Special.ItemIndex] then
  begin
    Total2 := Total2 - 10;
  end
  else if Player3 = cmb_Special.Items[cmb_Special.ItemIndex] then
  begin
    Total3 := Total3 - 10;
  end
  else if Player4 = cmb_Special.Items[cmb_Special.ItemIndex] then
  begin
    Total4 := Total4 - 10;
  end;
  btn_plus10.Enabled := False;
  btn_minus10.Enabled := False;
  btn_plus30.Enabled := False;
end;

procedure Tfrm_Dominoes.btn_NewGameClick(Sender: TObject);
begin
  frm_Dominoes.Free;
  Application.CreateForm(Tfrm_Dominoes, frm_Dominoes);
  Application.Run;
end;

procedure Tfrm_Dominoes.btn_NoWinnnerClick(Sender: TObject);
Var
  Player1: string;
  Player2: string;
  Player3: string;
  Player4: string;
begin
  edt_Score1.Clear;
  edt_Score2.Clear;
  edt_Score3.Clear;
  edt_Score4.Clear;

  Player1 := edt_Player1.text;
  Player2 := edt_Player2.text;
  Player3 := edt_Player3.text;
  Player4 := edt_Player4.text;

  PlayerScore1 := 0;
  PlayerScore2 := 0;
  PlayerScore3 := 0;
  PlayerScore4 := 0;

  btn_addscores2.Show;
  Player11.Show;
  Player22.Show;
  Player33.Show;
  Player44.Show;
  edt_Score1.Show;
  edt_Score2.Show;
  edt_Score3.Show;
  edt_Score4.Show;

  Player11.Caption := edt_Player1.text;
  Player22.Caption := edt_Player2.text;
  Player33.Caption := edt_Player3.text;
  Player44.Caption := edt_Player4.text;

  btn_NoWinnner.Enabled := False;
  btn_Winner.Enabled := False;
end;

procedure Tfrm_Dominoes.btn_plus10Click(Sender: TObject);
Var
  Player1: string;
  Player2: string;
  Player3: string;
  Player4: string;
begin
  Player1 := edt_Player1.text;
  Player2 := edt_Player2.text;
  Player3 := edt_Player3.text;
  Player4 := edt_Player4.text;
  if Player1 = cmb_Special.Items[cmb_Special.ItemIndex] then
  begin
    Fault1 := Fault1 + 10;
  end
  else if Player2 = cmb_Special.Items[cmb_Special.ItemIndex] then
  begin
    Fault2 := Fault2 + 10;
  end
  else if Player3 = cmb_Special.Items[cmb_Special.ItemIndex] then
  begin
    Fault3 := Fault3 + 10;
  end
  else if Player4 = cmb_Special.Items[cmb_Special.ItemIndex] then
  begin
    Fault4 := Fault4 + 10;
  end;

  btn_plus10.Enabled := False;
  btn_minus10.Enabled := False;
  btn_plus30.Enabled := False;

end;

procedure Tfrm_Dominoes.btn_plus30Click(Sender: TObject);
Var
  Player1: string;
  Player2: string;
  Player3: string;
  Player4: string;
begin
  Player1 := edt_Player1.text;
  Player2 := edt_Player2.text;
  Player3 := edt_Player3.text;
  Player4 := edt_Player4.text;
  if Player1 = cmb_Special.Items[cmb_Special.ItemIndex] then
  begin
    Fault1 := Fault1 + 30;
  end
  else if Player2 = cmb_Special.Items[cmb_Special.ItemIndex] then
  begin
    Fault2 := Fault2 + 30;
  end
  else if Player3 = cmb_Special.Items[cmb_Special.ItemIndex] then
  begin
    Fault3 := Fault3 + 30;
  end
  else if Player4 = cmb_Special.Items[cmb_Special.ItemIndex] then
  begin
    Fault4 := Fault4 + 30;
  end;
  btn_plus10.Enabled := False;
  btn_minus10.Enabled := False;
  btn_plus30.Enabled := False;

end;

procedure Tfrm_Dominoes.btn_WinnerClick(Sender: TObject);
Var
  Player1: string;
  Player2: string;
  Player3: string;
  Player4: string;
begin
  btn_NoWinnner.Enabled := False;
  Player1 := edt_Player1.text;
  Player2 := edt_Player2.text;
  Player3 := edt_Player3.text;
  Player4 := edt_Player4.text;

  lbl_player11.Caption := Player1;
  lbl_player22.Caption := Player2;
  lbl_player33.Caption := Player3;
  lbl_player44.Caption := Player4;

  Player11.Show;
  Player22.Show;
  Player33.Show;
  edt_Score1.Show;
  edt_Score2.Show;
  edt_Score3.Show;
  btn_AddScores.Show;

  PlayerScore1 := 0;
  PlayerScore2 := 0;
  PlayerScore3 := 0;
  PlayerScore4 := 0;

  if Player1 = cmb_Winner.Items[cmb_Winner.ItemIndex] then
  begin
    Fault1 := Fault1;
    Counter1 := Counter1 - 1;
    Total1 := Total1 + Fault1;
    mmo_PlayerScore1.Lines.Add(Format('%d: --   (%d)', [Counter1, Fault1]));
    Player11.Caption := Player2;
    Player22.Caption := Player3;
    Player33.Caption := Player4;

  end
  else if Player2 = cmb_Winner.Items[cmb_Winner.ItemIndex] then
  begin
    Fault2 := Fault2;
    Counter2 := Counter2 - 1;
    Total2 := Total2 + Fault2;
    mmo_PlayerScore2.Lines.Add(Format('%d: --   (%d)', [Counter2, Fault2]));

    Player11.Caption := Player1;
    Player22.Caption := Player3;
    Player33.Caption := Player4;
  end
  else if Player3 = cmb_Winner.Items[cmb_Winner.ItemIndex] then
  begin
    Fault3 := Fault3;
    Counter3 := Counter3 - 1;
    Total3 := Total3 + Fault3;
    mmo_PlayerScore3.Lines.Add(Format('%d: --   (%d)', [Counter3, Fault3]));

    Player11.Caption := Player1;
    Player22.Caption := Player2;
    Player33.Caption := Player4;
  end
  else if Player4 = cmb_Winner.Items[cmb_Winner.ItemIndex] then
  begin

    Fault4 := Fault4;
    Counter4 := Counter4 - 1;
    Total4 := Total4 + Fault4;
    mmo_PlayerScore4.Lines.Add(Format('%d: --   (%d)', [Counter4, Fault4]));

    Player11.Caption := Player1;
    Player22.Caption := Player2;
    Player33.Caption := Player3;

  end;
  edt_Score1.Clear;
  edt_Score2.Clear;
  edt_Score3.Clear;
  btn_Winner.Enabled := False;
end;

procedure Tfrm_Dominoes.cmb_SpecialChange(Sender: TObject);
begin
  btn_plus10.Enabled := True;
  btn_minus10.Enabled := True;
  btn_plus30.Enabled := True;
end;

procedure Tfrm_Dominoes.cmb_WinnerChange(Sender: TObject);
begin
  btn_Winner.Enabled := True;

end;

procedure Tfrm_Dominoes.edt_Player4Change(Sender: TObject);
begin
  btn_AddPlayers.Enabled := True;
end;

procedure Tfrm_Dominoes.FormActivate(Sender: TObject);
begin
  Player11.Hide;
  Player22.Hide;
  Player33.Hide;
  edt_Score1.Hide;
  edt_Score2.Hide;
  edt_Score3.Hide;
  btn_AddScores.Hide;
  Player44.Hide;
  edt_Player4.Hide;
  btn_addscores2.Hide;
  edt_Score4.Hide;

  edt_Player1.ReadOnly := False;
  edt_Player2.ReadOnly := False;
  edt_Player3.ReadOnly := False;
  edt_Player4.ReadOnly := False;

  btn_plus10.Enabled := False;
  btn_minus10.Enabled := False;
  btn_plus30.Enabled := False;

  btn_AddPlayers.Enabled := False;
  btn_Winner.Enabled := False;

  cmb_Winner.Enabled := False;
  cmb_Special.Enabled := False;
  btn_double.Enabled := False;
  btn_double20.Enabled := False;
  btn_NoWinnner.Enabled := False;
  mmo_PlayerScore1.Clear;
  mmo_PlayerScore2.Clear;
  mmo_PlayerScore3.Clear;
  mmo_PlayerScore4.Clear;

  Total1 := 0;
  PlayerScore1 := 0;
  Counter1 := 7;
  Fault1 := 0;
  Total2 := 0;
  PlayerScore2 := 0;
  Counter2 := 7;
  Fault2 := 0;
  Total3 := 0;
  PlayerScore3 := 0;
  Counter3 := 7;
  Fault3 := 0;
  Total4 := 0;
  PlayerScore4 := 0;
  Counter4 := 7;
  Fault4 := 0;
  Today := Now;
  cmb_Winner.Items.Clear;

  edt_Player4.Show;
end;

end.
