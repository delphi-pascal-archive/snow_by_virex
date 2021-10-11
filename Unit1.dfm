object Form1: TForm1
  Left = 222
  Top = 138
  BorderIcons = [biMinimize]
  BorderStyle = bsNone
  Caption = 'The "Snow" by VirEx (c)'
  ClientHeight = 411
  ClientWidth = 491
  Color = clScrollBar
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnPaint = FormPaint
  OnResize = FormResize
  DesignSize = (
    491
    411)
  PixelsPerInch = 120
  TextHeight = 16
  object Button1: TButton
    Left = 168
    Top = 136
    Width = 145
    Height = 25
    Hint = #1042#1099#1081#1090#1080' '#1080#1079' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
    Anchors = []
    Caption = #1042#1099#1093#1086#1076
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 184
    Width = 491
    Height = 227
    Align = alBottom
    Color = 13158655
    DockSite = True
    TabOrder = 1
    DesignSize = (
      491
      227)
    object Label1: TLabel
      Left = 10
      Top = 15
      Width = 177
      Height = 21
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1085#1077#1078#1080#1085#1086#1082':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 10
      Top = 44
      Width = 186
      Height = 21
      Caption = #1057#1082#1086#1088#1086#1089#1090#1100' "'#1087#1086#1083#1077#1090#1072'" '#1084#1082#1089'.:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 10
      Top = 74
      Width = 93
      Height = 21
      Caption = #1057#1080#1083#1072' '#1074#1077#1090#1088#1072':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Bevel1: TBevel
      Tag = 1
      Left = 10
      Top = 112
      Width = 474
      Height = 106
    end
    object Label4: TLabel
      Left = 192
      Top = 134
      Width = 171
      Height = 18
      Cursor = crHandPoint
      Hint = #1050#1083#1072#1076#1086#1074#1082#1072' - '#1089#1073#1086#1088#1085#1080#1082' '#1080#1089#1093#1086#1076#1085#1080#1082#1086#1074' '#1085#1072' Delphi, C '#1080' '#1076#1088'.'
      Caption = 'http://kladovka.net.ru'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Label4Click
    end
    object Label5: TLabel
      Left = 192
      Top = 154
      Width = 251
      Height = 18
      Cursor = crHandPoint
      Hint = #1050#1086#1085#1089#1086#1083#1100' '#1076#1083#1103' Windows, '#1091#1087#1088#1086#1097#1072#1077#1090' '#1088#1072#1073#1086#1090#1091' '#1079#1072' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1086#1084
      Caption = 'http://winconsul.kladovka.net.ru'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Label5Click
    end
    object Label7: TLabel
      Left = 192
      Top = 174
      Width = 211
      Height = 18
      Cursor = crHandPoint
      Hint = #1052#1086#1073#1080#1083#1100#1085#1099#1081' offline '#1082#1083#1080#1077#1085#1090' '#1076#1083#1103' '#1092#1086#1088#1091#1084#1072' "'#1052#1072#1089#1090#1077#1088#1072' Delphi"'
      Caption = 'http://jdmc.kladovka.net.ru'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Label7Click
    end
    object Label6: TLabel
      Left = 192
      Top = 193
      Width = 172
      Height = 18
      Cursor = crHandPoint
      Hint = #1060#1086#1088#1091#1084' "'#1052#1072#1089#1090#1077#1088#1072' Delphi"'
      Caption = 'http://delphimaster.ru'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Label6Click
    end
    object Label8: TLabel
      Left = 18
      Top = 134
      Width = 69
      Height = 18
      Caption = #1050#1083#1072#1076#1086#1074#1082#1072' '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 18
      Top = 154
      Width = 116
      Height = 18
      Caption = 'Windows '#1082#1086#1085#1089#1086#1083#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 18
      Top = 174
      Width = 130
      Height = 18
      Caption = #1052#1086#1073#1080#1083#1100#1085#1099#1081' '#1082#1083#1080#1077#1085#1090
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 18
      Top = 193
      Width = 163
      Height = 18
      Caption = #1060#1086#1088#1091#1084' "'#1052#1072#1089#1090#1077#1088#1072' Delphi"'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 161
      Top = 106
      Width = 120
      Height = 12
      Caption = 'The "Snow" by VirEx (c)'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object UpDown1: TUpDown
      Left = 244
      Top = 14
      Width = 19
      Height = 26
      Associate = Edit1
      Max = 10000
      Increment = 10
      TabOrder = 0
      Thousands = False
      OnClick = UpDown1Click
    end
    object Edit1: TEdit
      Left = 203
      Top = 15
      Width = 41
      Height = 24
      Color = 13158655
      TabOrder = 1
      Text = '0'
      OnChange = Edit1Change
      OnKeyPress = Edit1KeyPress
    end
    object Edit2: TEdit
      Left = 203
      Top = 44
      Width = 41
      Height = 24
      Color = 13158655
      TabOrder = 2
      Text = '0'
      OnChange = Edit2Chane
      OnKeyPress = Edit1KeyPress
    end
    object UpDown2: TUpDown
      Left = 244
      Top = 43
      Width = 19
      Height = 26
      Associate = Edit2
      Max = 1000
      Increment = 5
      TabOrder = 3
      Thousands = False
      OnClick = UpDown2Click
    end
    object Edit3: TEdit
      Left = 203
      Top = 74
      Width = 41
      Height = 24
      Color = 13158655
      TabOrder = 4
      Text = '0'
      OnChange = Edit3Change
      OnKeyPress = Edit1KeyPress
    end
    object UpDown3: TUpDown
      Left = 244
      Top = 73
      Width = 18
      Height = 26
      Associate = Edit3
      Max = 5
      TabOrder = 5
      Thousands = False
      OnClick = UpDown3Click
    end
    object Button2: TButton
      Left = 441
      Top = 181
      Width = 35
      Height = 31
      Hint = #1057#1074#1077#1088#1085#1091#1090#1100' '#1086#1082#1085#1086
      Anchors = []
      Caption = '_'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = Button2Click
    end
    object Memo1: TMemo
      Left = 272
      Top = 10
      Width = 209
      Height = 80
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = 13158655
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        #1055#1086#1079#1076#1088#1072#1074#1083#1103#1102' '#1042#1072#1089' '#1089' '#1085#1086#1074#1099#1084' '
        '2007 '#1075#1086#1076#1086#1084' '#1080' '#1078#1077#1083#1072#1102' '#1074#1089#1077#1084' '
        #1080#1079#1084#1077#1085#1080#1090#1100' '#1089#1074#1086#1102' '#1078#1080#1079#1085#1100' '#1074' '
        #1083#1091#1095#1096#1091#1102' '#1089#1090#1086#1088#1086#1085#1091' '#1074' '#1085#1086#1074#1086#1084' '
        #1075#1086#1076#1091)
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
  end
  object Timer1: TTimer
    Interval = 50
    OnTimer = Timer1Timer
    Left = 8
    Top = 8
  end
end
