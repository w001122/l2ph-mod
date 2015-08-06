object fPacketFilter: TfPacketFilter
  Left = 364
  Top = 258
  BorderStyle = bsSizeToolWin
  Caption = #212#232#235#252#242#240' '#239#224#234#229#242#238#226
  ClientHeight = 458
  ClientWidth = 326
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl2: TPageControl
    Left = 0
    Top = 0
    Width = 326
    Height = 376
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #206#242' '#241#229#240#226#229#240#224
      object ListView1: TJvListView
        Left = 0
        Top = 0
        Width = 318
        Height = 348
        Align = alClient
        Checkboxes = True
        Columns = <
          item
            Caption = 'Id'
            Width = 80
          end
          item
            AutoSize = True
            Caption = 'Name'
          end>
        GridLines = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
        ColumnsOrder = '0=80,1=234'
        Groups = <>
        ExtendedColumns = <
          item
          end
          item
          end>
      end
    end
    object TabSheet7: TTabSheet
      Caption = #206#242' '#234#235#232#229#237#242#224
      ImageIndex = 1
      object ListView2: TJvListView
        Left = 0
        Top = 0
        Width = 318
        Height = 348
        Align = alClient
        Checkboxes = True
        Columns = <
          item
            Caption = 'Id'
            Width = 80
          end
          item
            Caption = 'Name'
            Width = 260
          end>
        GridLines = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
        ColumnsOrder = '0=80,1=260'
        Groups = <>
        ExtendedColumns = <
          item
          end
          item
          end>
      end
    end
  end
  object Panel17: TPanel
    Left = 0
    Top = 376
    Width = 326
    Height = 82
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 11
      Width = 60
      Height = 13
      Caption = 'Search by Id'
    end
    object Label2: TLabel
      Left = 168
      Top = 11
      Width = 28
      Height = 13
      Caption = 'Name'
    end
    object Button1: TButton
      Left = 8
      Top = 30
      Width = 150
      Height = 19
      Caption = #194#251#228#229#235#232#242#252' '#226#241#184
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button13: TButton
      Left = 164
      Top = 30
      Width = 150
      Height = 19
      Caption = #200#237#226#229#240#242#232#240#238#226#224#242#252
      TabOrder = 1
      OnClick = Button13Click
    end
    object UpdateBtn: TButton
      Left = 164
      Top = 55
      Width = 150
      Height = 19
      Caption = #207#240#232#236#229#237#232#242#252
      TabOrder = 2
      OnClick = UpdateBtnClick
    end
    object ButtonCleanAll: TButton
      Left = 8
      Top = 55
      Width = 150
      Height = 18
      Caption = 'Clean All'
      TabOrder = 3
      OnClick = ButtonCleanAllClick
    end
    object EditSearchById: TEdit
      Left = 74
      Top = 6
      Width = 84
      Height = 21
      TabOrder = 4
      OnChange = EditSearchByIdChange
    end
    object EditSearchByName: TEdit
      Left = 202
      Top = 6
      Width = 112
      Height = 21
      TabOrder = 5
      OnChange = EditSearchByNameChange
    end
  end
  object lang: TsiLang
    Version = '6.1.0.1'
    IsInheritedOwner = True
    StringsTypes.Strings = (
      'TIB_STRINGLIST'
      'TSTRINGLIST')
    SmartExcludeProps.Strings = (
      'Action4.Caption'
      'Action5.Caption'
      'Action6.Caption'
      'Action7.Caption'
      'Action8.Caption'
      'Action9.Caption'
      'Action10.Caption'
      'TL2PacketHackMain.Caption')
    UseInheritedData = True
    AutoSkipEmpties = True
    NumOfLanguages = 2
    LangDispatcher = fMain.lang
    LangDelim = 1
    DoNotTranslate.Strings = (
      'Action2'
      'Action3')
    LangNames.Strings = (
      'Rus'
      'Eng')
    Language = 'Rus'
    ExcludedProperties.Strings = (
      'Category'
      'SecondaryShortCuts'
      'HelpKeyword'
      'InitialDir'
      'HelpKeyword'
      'ActivePage'
      'ImeName'
      'DefaultExt'
      'FileName'
      'FieldName'
      'PickList'
      'DisplayFormat'
      'EditMask'
      'KeyList'
      'LookupDisplayFields'
      'DropDownSpecRow'
      'TableName'
      'DatabaseName'
      'IndexName'
      'MasterFields')
    Left = 149
    Top = 220
    TranslationData = {
      737443617074696F6E730D0A54665061636B657446696C74657201D4E8EBFCF2
      F020EFE0EAE5F2EEE2015061636B65742066696C746572010D0A546162536865
      65743101CEF220F1E5F0E2E5F0E00146726F6D20736572766572010D0A546162
      53686565743701CEF220EAEBE8E5EDF2E00146726F6D20636C69656E74010D0A
      427574746F6E3101C2FBE4E5EBE8F2FC20E2F1B80153656C65637420616C6C01
      0D0A427574746F6E313301C8EDE2E5F0F2E8F0EEE2E0F2FC01496E7665727401
      0D0A55706461746542746E01CFF0E8ECE5EDE8F2FC014150504C59010D0A7374
      48696E74730D0A7374446973706C61794C6162656C730D0A7374466F6E74730D
      0A54665061636B657446696C746572014D532053616E7320536572696601010D
      0A73744D756C74694C696E65730D0A7374446C677343617074696F6E730D0A57
      61726E696E67015761726E696E67015761726E696E67010D0A4572726F720145
      72726F72014572726F72010D0A496E666F726D6174696F6E01496E666F726D61
      74696F6E01496E666F726D6174696F6E010D0A436F6E6669726D01436F6E6669
      726D01436F6E6669726D010D0A59657301265965730126596573010D0A4E6F01
      264E6F01264E6F010D0A4F4B014F4B014F4B010D0A43616E63656C0143616E63
      656C0143616E63656C010D0A41626F7274012641626F7274012641626F727401
      0D0A52657472790126526574727901265265747279010D0A49676E6F72650126
      49676E6F7265012649676E6F7265010D0A416C6C0126416C6C0126416C6C010D
      0A4E6F20546F20416C6C014E266F20746F20416C6C014E266F20746F20416C6C
      010D0A59657320546F20416C6C0159657320746F2026416C6C0159657320746F
      2026416C6C010D0A48656C70012648656C70012648656C70010D0A7374537472
      696E67730D0A4944535F313801C2FB20F3E2E5F0E5EDFB20F7F2EE20F5EEF2E8
      F2E520E2FBE9F2E820E8E720EFF0EEE3F0E0ECECFB3F0141726520796F752073
      757265203F010D0A4944535F313901C2F1E520F1EEE5E4E8EDE5EDE8FF20EFF0
      E5F0E2F3F2F1FF2101416C6C20636F6E6E656374696F6E732077696C6C206265
      20636C6F73656421010D0A4944535F3601CFEEE4E4E5F0E6E0F2FC20EFF0EEE5
      EAF23A01537570706F727420746869732070726F6A6563743A010D0A4944535F
      3901D1F2E0F0F2F3E5F2204C32706820760153746172747570206F66204C3270
      682076010D0A73744F74686572537472696E67730D0A73744C6F63616C65730D
      0A7374436F6C6C656374696F6E730D0A737443686172536574730D0A54665061
      636B657446696C7465720144454641554C545F43484152534554014445464155
      4C545F43484152534554010D0A}
  end
end
