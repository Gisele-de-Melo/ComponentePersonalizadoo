//------------------------------------------------------------------------------------------------------------
//********* Sobre ************
//Autor: Gisele de Melo
//Esse código foi desenvolvido com o intuito de aprendizado para o blog codedelphi.com, portanto não me
//responsabilizo pelo uso do mesmo.
//
//********* About ************
//Author: Gisele de Melo
//This code was developed for learning purposes for the codedelphi.com blog, therefore I am not responsible for
//its use.
//------------------------------------------------------------------------------------------------------------

unit MyButtonUnit;

interface

uses
  System.Classes, Vcl.Controls, Vcl.Graphics, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TMyCustomButton = class(TCustomControl)
  private
    FOnClick: TNotifyEvent;
    FCaption: string;
    FBackgroundColor: TColor;
    FTextColor: TColor;
    procedure SetCaption(const Value: string);
    procedure SetBackgroundColor(const Value: TColor);
    procedure SetTextColor(const Value: TColor);
  protected
    procedure Paint; override;
    procedure Click; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Caption: string read FCaption write SetCaption;
    property BackgroundColor: TColor read FBackgroundColor write SetBackgroundColor default clBtnFace;
    property TextColor: TColor read FTextColor write SetTextColor default clBtnText;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TMyCustomButton]);
end;

{ TMyCustomButton }

constructor TMyCustomButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Width := 100;
  Height := 50;
  FCaption := 'Custom Button';
  FBackgroundColor := clBtnFace;
  FTextColor := clBtnText;
  ControlStyle := ControlStyle + [csCaptureMouse, csClickEvents, csSetCaption];
end;

procedure TMyCustomButton.Click;
begin
  inherited;
  if Assigned(FOnClick) then
    FOnClick(Self);
end;

procedure TMyCustomButton.Paint;
begin
  inherited;
  Canvas.Brush.Color := FBackgroundColor;
  Canvas.FillRect(ClientRect);
  Canvas.Font.Color := FTextColor;
  Canvas.TextOut((Width - Canvas.TextWidth(FCaption)) div 2, (Height - Canvas.TextHeight(FCaption)) div 2, FCaption);
end;

procedure TMyCustomButton.SetBackgroundColor(const Value: TColor);
begin
  if FBackgroundColor <> Value then
  begin
    FBackgroundColor := Value;
    Invalidate;
  end;
end;

procedure TMyCustomButton.SetCaption(const Value: string);
begin
  if FCaption <> Value then
  begin
    FCaption := Value;
    Invalidate;
  end;
end;

procedure TMyCustomButton.SetTextColor(const Value: TColor);
begin
  if FTextColor <> Value then
  begin
    FTextColor := Value;
    Invalidate;
  end;
end;

end.

