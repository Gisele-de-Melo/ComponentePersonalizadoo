object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Componente Personalizado'
  ClientHeight = 134
  ClientWidth = 250
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  StyleElements = []
  TextHeight = 15
  object MyCustomButton1: TMyCustomButton
    Left = 48
    Top = 32
    Width = 145
    Height = 73
    Caption = 'Custom Button'
    BackgroundColor = clRed
    TextColor = clWhite
    OnClick = MyCustomButton1Click
  end
end
