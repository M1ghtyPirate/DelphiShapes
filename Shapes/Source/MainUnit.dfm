object Form1: TForm1
  Left = 192
  Top = 324
  Width = 775
  Height = 657
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 8
    Top = 8
    Width = 601
    Height = 601
  end
  object Label1: TLabel
    Left = 624
    Top = 72
    Width = 121
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #1062#1074#1077#1090' '#1092#1086#1085#1072
  end
  object lbBColor: TLabel
    Left = 624
    Top = 88
    Width = 121
    Height = 25
    Alignment = taCenter
    AutoSize = False
  end
  object Button1: TButton
    Left = 624
    Top = 8
    Width = 121
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 624
    Top = 40
    Width = 121
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 1
    OnClick = Button2Click
  end
  object GroupBox1: TGroupBox
    Left = 616
    Top = 144
    Width = 137
    Height = 465
    Caption = #1060#1080#1075#1091#1088#1072':'
    TabOrder = 2
    object lbColorFig: TLabel
      Left = 8
      Top = 72
      Width = 121
      Height = 17
      Alignment = taCenter
      AutoSize = False
      Caption = #1062#1074#1077#1090
    end
    object Label3: TLabel
      Left = 8
      Top = 288
      Width = 41
      Height = 21
      Alignment = taCenter
      AutoSize = False
      Caption = 'X'
      Layout = tlCenter
    end
    object Label4: TLabel
      Left = 8
      Top = 320
      Width = 41
      Height = 21
      Alignment = taCenter
      AutoSize = False
      Caption = 'Y'
      Layout = tlCenter
    end
    object Label5: TLabel
      Left = 8
      Top = 352
      Width = 41
      Height = 21
      Alignment = taCenter
      AutoSize = False
      Caption = #1056#1072#1079#1084#1077#1088
      Layout = tlCenter
    end
    object lbAColor: TLabel
      Left = 8
      Top = 88
      Width = 121
      Height = 25
      Alignment = taCenter
      AutoSize = False
    end
    object ComboBox1: TComboBox
      Left = 8
      Top = 48
      Width = 121
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'ComboBox1'
      OnChange = ComboBox1Change
    end
    object edXFig: TEdit
      Left = 56
      Top = 288
      Width = 73
      Height = 21
      TabOrder = 1
      Text = 'edXFig'
      OnExit = edXFigExit
    end
    object edYFig: TEdit
      Left = 56
      Top = 320
      Width = 73
      Height = 21
      TabOrder = 2
      Text = 'edYFig'
      OnExit = edXFigExit
    end
    object edSize: TEdit
      Left = 56
      Top = 352
      Width = 73
      Height = 21
      TabOrder = 3
      Text = 'edSize'
      OnExit = edXFigExit
    end
    object RadioGroup1: TRadioGroup
      Left = 0
      Top = 152
      Width = 137
      Height = 129
      Caption = #1058#1080#1087' '#1092#1080#1075#1091#1088#1099
      ItemIndex = 0
      Items.Strings = (
        #1050#1074#1072#1076#1088#1072#1090
        #1050#1088#1091#1075
        #1058#1088#1077#1091#1075#1086#1083#1100#1085#1080#1082
        #1050#1074#1072#1076#1088#1072#1090' '#1074' '#1082#1074#1072#1076#1088#1072#1090#1077
        #1050#1088#1091#1075' '#1074' '#1082#1074#1072#1076#1088#1072#1090#1077
        #1050#1074#1072#1076#1088#1072#1090' '#1074' '#1082#1088#1091#1075#1077
        #1050#1088#1091#1075' '#1074' '#1082#1088#1091#1075#1077
        #1058#1088#1077#1091#1075#1086#1083#1100#1085#1080#1082' '#1074' '#1082#1088#1091#1075#1077
        #1058#1088'. '#1074' '#1090#1088#1077#1091#1075#1086#1083#1100#1085#1080#1082#1077)
      TabOrder = 4
      OnClick = RadioGroup1Click
    end
    object cmbColor: TComboBox
      Left = 8
      Top = 120
      Width = 121
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 5
      Text = #1063#1077#1088#1085#1099#1081
      OnSelect = cmbColorSelect
      Items.Strings = (
        #1063#1077#1088#1085#1099#1081
        #1057#1077#1088#1099#1081
        #1050#1088#1072#1089#1085#1099#1081
        #1046#1077#1083#1090#1099#1081
        #1047#1077#1083#1077#1085#1099#1081
        #1043#1086#1083#1091#1073#1086#1081
        #1057#1080#1085#1080#1081)
    end
    object Button3: TButton
      Left = 8
      Top = 16
      Width = 121
      Height = 25
      Caption = #1053#1086#1074#1072#1103' '#1092#1080#1075#1091#1088#1072
      TabOrder = 6
      OnClick = Button3Click
    end
  end
  object cmbBackColor: TComboBox
    Left = 624
    Top = 120
    Width = 121
    Height = 21
    ItemHeight = 13
    ItemIndex = 7
    TabOrder = 3
    Text = #1041#1077#1083#1099#1081
    OnSelect = cmbBackColorSelect
    Items.Strings = (
      #1063#1077#1088#1085#1099#1081
      #1057#1077#1088#1099#1081
      #1050#1088#1072#1089#1085#1099#1081
      #1046#1077#1083#1090#1099#1081
      #1047#1077#1083#1077#1085#1099#1081
      #1043#1086#1083#1091#1073#1086#1081
      #1057#1080#1085#1080#1081
      #1041#1077#1083#1099#1081)
  end
end
