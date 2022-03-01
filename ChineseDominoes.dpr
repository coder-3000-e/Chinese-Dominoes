program ChineseDominoes;

uses
  Forms,
  ChineseDominoesScorekeeping in 'ChineseDominoesScorekeeping.pas' {frm_Dominoes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_Dominoes, frm_Dominoes);
  Application.Run;
end.
