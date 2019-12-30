object Form1: TForm1
  Left = 298
  Top = 127
  Width = 640
  Height = 480
  Caption = 'pbox'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -9
  Font.Name = 'Arial'
  Font.Style = [fsBold]
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 11
  object pb: TImage
    Left = 120
    Top = 112
    Width = 512
    Height = 341
    OnMouseDown = pbMouseDown
  end
  object m1: TImage
    Left = 120
    Top = 0
    Width = 329
    Height = 109
  end
  object m2: TImage
    Left = 0
    Top = 112
    Width = 117
    Height = 225
  end
end
