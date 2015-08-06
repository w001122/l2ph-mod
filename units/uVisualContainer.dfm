object fVisual: TfVisual
  Left = 0
  Top = 0
  Width = 451
  Height = 304
  Align = alClient
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  TabStop = True
  OnResize = FrameResize
  object Splitter3: TSplitter
    Left = 98
    Top = 5
    Height = 299
    Align = alRight
    Visible = False
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 5
    Width = 98
    Height = 299
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #207#240#238#241#236#238#242#240
      OnShow = TabSheet1Show
      object GroupBox12: TGroupBox
        Left = 0
        Top = 51
        Width = 90
        Height = 220
        Align = alClient
        Caption = #203#238#227' '#239#224#234#229#242#238#226':'
        TabOrder = 0
        object ListView5: TListView
          Left = 2
          Top = 15
          Width = 86
          Height = 203
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          Columns = <
            item
              Caption = 'No'
            end
            item
              Alignment = taRightJustify
              Caption = 'size'
              Width = 40
            end
            item
              Caption = 'Id'
              Width = 65
            end
            item
              AutoSize = True
              Caption = 'Name'
              WidthType = (
                -73)
            end>
          ColumnClick = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FullDrag = True
          GridLines = True
          HideSelection = False
          MultiSelect = True
          ReadOnly = True
          RowSelect = True
          ParentFont = False
          ParentShowHint = False
          PopupMenu = PopupMenu1
          ShowHint = True
          SmallImages = ImageList2
          TabOrder = 0
          ViewStyle = vsReport
          OnClick = ListView5Click
          OnCustomDrawItem = ListView5CustomDrawItem
          OnKeyUp = ListView5KeyUp
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 90
        Height = 29
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 268
          Height = 29
          Align = alClient
          AutoSize = True
          BevelOuter = bvNone
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 0
          object ToolBar1: TToolBar
            Left = 0
            Top = 0
            Width = 268
            Height = 29
            Align = alClient
            Images = imgBT
            TabOrder = 0
            object ReloadThis: TToolButton
              Left = 0
              Top = 0
              Hint = #206#225#237#238#226#232#242#252
              ImageIndex = 22
              ParentShowHint = False
              ShowHint = True
              OnClick = ReloadThisClick
            end
            object tbtnSave: TToolButton
              Tag = 1
              Left = 23
              Top = 0
              Hint = #209#238#245#240#224#237#232#242#252' '#235#238#227' '#234#224#234'...'
              ImageIndex = 0
              ParentShowHint = False
              ShowHint = True
              OnClick = tbtnSaveClick
            end
            object btnSaveRaw: TToolButton
              Tag = 1
              Left = 46
              Top = 0
              ImageIndex = 21
              ParentShowHint = False
              ShowHint = True
              Visible = False
              OnClick = btnSaveRawClick
            end
            object tbtnClear: TToolButton
              Tag = 1
              Left = 69
              Top = 0
              Hint = #206#247#232#241#242#232#242#252' '#235#238#227
              ImageIndex = 1
              ParentShowHint = False
              ShowHint = True
              OnClick = tbtnClearClick
            end
            object ToolButton1: TToolButton
              Left = 92
              Top = 0
              Width = 14
              ImageIndex = 5
              Style = tbsSeparator
            end
            object tbtnFilterDel: TToolButton
              Left = 106
              Top = 0
              Hint = #211#225#240#224#242#252' '#226#241#229' '#239#224#234#229#242#251' '#242#229#234#243#249#229#227#238' '#242#232#239#224' '#232#231' '#244#232#235#252#242#240#224
              Enabled = False
              ImageIndex = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = tbtnFilterDelClick
            end
            object tbtnDelete: TToolButton
              Left = 129
              Top = 0
              Hint = #211#228#224#235#232#242#252' '#232#231' '#235#238#227#224
              Enabled = False
              ImageIndex = 3
              ParentShowHint = False
              ShowHint = True
              OnClick = tbtnDeleteClick
            end
            object ToolButton15: TToolButton
              Left = 0
              Top = 0
              Width = 11
              ImageIndex = 16
              Wrap = True
              Style = tbsSeparator
            end
            object tbtnToSend: TToolButton
              Left = 0
              Top = 33
              Hint = #196#238#225#224#226#232#242#252' '#239#224#234#229#242' '#226' '#207#238#241#251#235#234#243
              Enabled = False
              ImageIndex = 4
              ParentShowHint = False
              ShowHint = True
              OnClick = tbtnToSendClick
            end
            object ToolButton2: TToolButton
              Left = 23
              Top = 33
              Width = 10
              Caption = 'ToolButton2'
              ImageIndex = 11
              Style = tbsSeparator
            end
            object ToolButton4: TToolButton
              Left = 33
              Top = 33
              Hint = #207#224#234#229#242#251' '#238#242' '#241#229#240#226#229#240#224
              Down = True
              ImageIndex = 5
              ParentShowHint = False
              ShowHint = True
              Style = tbsCheck
              OnClick = ToolButton4Click
            end
            object ToolButton3: TToolButton
              Left = 56
              Top = 33
              Hint = #207#224#234#229#242#251' '#238#242' '#234#235#232#229#237#242#224
              Down = True
              ImageIndex = 6
              ParentShowHint = False
              ShowHint = True
              Style = tbsCheck
              OnClick = ToolButton4Click
            end
            object ToolButton5: TToolButton
              Left = 79
              Top = 33
              Hint = #209#235#229#228#232#242#252' '#231#224' '#239#238#241#235#229#228#237#232#236' '#239#240#232#248#229#228#248#232#236' '#239#224#234#229#242#238#236
              Down = True
              ImageIndex = 7
              ParentShowHint = False
              ShowHint = True
              Style = tbsCheck
            end
            object BtnAutoSavePckts: TToolButton
              Left = 102
              Top = 33
              Hint = #209#238#245#240#224#237#255#242#252' '#235#238#227' '#239#229#240#229#228' '#224#226#242#238' '#238#247#232#241#242#234#238#233
              AllowAllUp = True
              ImageIndex = 8
              ParentShowHint = False
              ShowHint = True
              Style = tbsCheck
            end
            object ToolButton9: TToolButton
              Left = 125
              Top = 33
              Width = 14
              ImageIndex = 12
              Style = tbsSeparator
            end
            object ToolButton6: TToolButton
              Left = 139
              Top = 33
              Hint = #207#238#234#224#231#224#242#252'/'#241#239#240#255#242#224#242#252' '#244#232#235#252#242#240#251
              ImageIndex = 9
              ParentShowHint = False
              ShowHint = True
              Style = tbsCheck
              OnClick = ToolButton6Click
            end
            object ToolButton17: TToolButton
              Left = 162
              Top = 33
              Hint = #207#238#234#224#231#251#226#224#242#252' '#241#236#229#249#229#237#232#229' '#226' Hex/Dec'
              ImageIndex = 10
              ParentShowHint = False
              ShowHint = True
              Style = tbsCheck
              OnClick = ToolButton17Click
            end
          end
        end
        object Panel7: TPanel
          Left = -5
          Top = 0
          Width = 95
          Height = 29
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object ToolBar3: TToolBar
            Left = 0
            Top = 0
            Width = 95
            Height = 29
            Align = alClient
            ButtonHeight = 23
            Images = imgBT
            TabOrder = 0
            object btnProcessPackets: TToolButton
              Left = 0
              Top = 0
              Hint = #206#225#240#224#225#224#242#251#226#224#242#252' '#239#224#234#229#242#251
              Down = True
              ImageIndex = 23
              ParentShowHint = False
              ShowHint = True
              Style = tbsCheck
            end
            object ToolButton37: TToolButton
              Left = 23
              Top = 0
              Hint = 
                #205#229' '#231#224#234#240#251#226#224#242#252' '#253#242#238#242' '#244#240#229#233#236' '#239#238#241#235#229' '#228#232#241#234#238#237#237#229#234#242#224' '#241#226#255#231#224#237#238#227#238' '#241' '#237#232#236' '#241#238#229#228#232#237 +
                #229#237#232#255
              ImageIndex = 12
              ParentShowHint = False
              ShowHint = True
              Style = tbsCheck
              OnClick = ToolButton30Click
            end
            object ToolButton38: TToolButton
              Left = 46
              Top = 0
              Hint = #211#225#232#242#252' '#241#238#229#228#232#237#229#237#232#229' '#232' ('#232#235#232') '#199#224#234#240#251#242#252' '#228#224#237#237#251#233' '#244#240#229#233#236
              ImageIndex = 11
              ParentShowHint = False
              ShowHint = True
              OnClick = CloseConnectionClick
            end
            object ToolButton8: TToolButton
              Left = 69
              Top = 0
              Hint = #199#224#234#240#251#242#252' '#228#224#237#237#251#233' '#235#238#227
              ImageIndex = 20
              ParentShowHint = False
              ShowHint = True
              Visible = False
              OnClick = ToolButton8Click
            end
          end
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 29
        Width = 90
        Height = 22
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object btnRegRuleUpdate: TSpeedButton
          Left = 399
          Top = 0
          Width = 72
          Height = 21
          Caption = #207#240#232#236#229#237#232#242#252
          Enabled = False
          Flat = True
          OnClick = btnRegRuleUpdateClick
        end
        object edtRegRule: TEdit
          Left = 152
          Top = 0
          Width = 247
          Height = 21
          TabOrder = 0
        end
        object chkRegRule: TCheckBox
          Left = 0
          Top = 0
          Width = 152
          Height = 21
          Caption = #212#232#235#252#242#240#238#226#224#242#252' '#239#238' '#239#240#224#226#232#235#243
          TabOrder = 1
          OnClick = chkRegRuleClick
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #207#238#241#251#235#234#224
      ImageIndex = 1
      OnShow = TabSheet1Show
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 90
        Height = 28
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 363
        object Panel9: TPanel
          Left = 0
          Top = 0
          Width = 44
          Height = 28
          Align = alClient
          AutoSize = True
          BevelOuter = bvNone
          TabOrder = 0
          ExplicitWidth = 317
          object ToolBar2: TToolBar
            Left = 0
            Top = 0
            Width = 44
            Height = 28
            Align = alClient
            Images = imgBT
            TabOrder = 0
            ExplicitWidth = 317
            object SaveBnt: TToolButton
              Left = 0
              Top = 0
              Hint = #209#238#245#240#224#237#232#242#252' '#239#224#234#229#242#251
              ImageIndex = 0
              ParentShowHint = False
              ShowHint = True
              OnClick = SaveBntClick
            end
            object OpenBtn: TToolButton
              Left = 23
              Top = 0
              Hint = #199#224#227#240#243#231#232#242#252' '#239#224#234#229#242#251
              ImageIndex = 13
              ParentShowHint = False
              ShowHint = True
              OnClick = OpenBtnClick
            end
            object ToolButton14: TToolButton
              Left = 46
              Top = 0
              Width = 14
              ImageIndex = 5
              Style = tbsSeparator
            end
            object ToServer: TToolButton
              Left = 60
              Top = 0
              Hint = #206#242#239#240#224#226#235#255#242#252' '#237#224' '#241#229#240#226#229#240
              Down = True
              ImageIndex = 16
              ParentShowHint = False
              ShowHint = True
              Style = tbsCheck
              OnClick = ToServerClick
            end
            object ToClient: TToolButton
              Left = 83
              Top = 0
              Hint = #206#242#239#240#224#226#235#255#242#252' '#237#224' '#234#235#232#229#237#242
              ImageIndex = 17
              ParentShowHint = False
              ShowHint = True
              Style = tbsCheck
              OnClick = ToClientClick
            end
            object ToolButton19: TToolButton
              Left = 106
              Top = 0
              Width = 7
              ImageIndex = 16
              Style = tbsSeparator
            end
            object EachLinePacket: TToolButton
              Left = 113
              Top = 0
              Hint = #202#224#230#228#224#255' '#241#242#240#238#234#224' '#253#242#238' '#238#242#228#229#235#252#237#251#233' '#239#224#234#229#242
              ImageIndex = 15
              ParentShowHint = False
              ShowHint = True
              Style = tbsCheck
            end
            object ToolButton13: TToolButton
              Left = 136
              Top = 0
              Width = 8
              ImageIndex = 15
              Style = tbsSeparator
            end
            object SendBtn: TToolButton
              Left = 144
              Top = 0
              Hint = #206#242#239#240#224#226#232#242#252
              ImageIndex = 4
              ParentShowHint = False
              ShowHint = True
              OnClick = SendBtnClick
            end
            object ToolButton26: TToolButton
              Left = 0
              Top = 0
              Width = 66
              ImageIndex = 12
              Wrap = True
              Style = tbsSeparator
            end
            object JvSpinEdit1: TJvSpinEdit
              Left = 0
              Top = 88
              Width = 52
              Height = 22
              Hint = '"'#207#238#227#240#229#248#237#238#241#242#252' '#241#240#224#225#224#242#251#226#224#237#232#255'" '#177' '#209#229#234
              Increment = 0.100000000000000000
              MaxValue = 6000.000000000000000000
              MinValue = 0.100000000000000000
              ValueType = vtFloat
              Value = 5.000000000000000000
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnChange = JvSpinEdit1Change
              BevelInner = bvNone
              BevelOuter = bvNone
            end
            object Label1: TLabel
              Left = 52
              Top = 88
              Width = 85
              Height = 22
              Alignment = taRightJustify
              AutoSize = False
              BiDiMode = bdLeftToRight
              Caption = ' '#177#200#237#242#229#240#226#224#235' '
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial Narrow'
              Font.Style = []
              ParentBiDiMode = False
              ParentFont = False
            end
            object JvSpinEdit2: TJvSpinEdit
              Left = 137
              Top = 88
              Width = 52
              Height = 22
              Hint = #207#238#227#240#229#248#237#238#241#242#252' '#242#224#233#236#229#240#224
              Increment = 0.100000000000000000
              MaxValue = 6000.000000000000000000
              MinValue = 0.010000000000000000
              ValueType = vtFloat
              Value = 0.010000000000000000
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              BevelInner = bvNone
              BevelOuter = bvNone
            end
            object SendByTimer: TToolButton
              Left = 189
              Top = 88
              Hint = #206#242#239#240#224#226#235#255#242#252' '#239#238' '#242#224#233#236#229#240#243' '#234#224#230#228#251#229' '#245#245#245' '#241#229#234#243#237#228
              ImageIndex = 14
              ParentShowHint = False
              ShowHint = True
              Style = tbsCheck
              OnClick = SendByTimerClick
            end
          end
        end
        object Panel11: TPanel
          Left = 44
          Top = 0
          Width = 46
          Height = 28
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitLeft = 317
          object ToolBar5: TToolBar
            Left = 0
            Top = 0
            Width = 46
            Height = 28
            Align = alClient
            ButtonHeight = 23
            Images = imgBT
            TabOrder = 0
            object ToolButton30: TToolButton
              Left = 0
              Top = 0
              Hint = 
                #205#229' '#231#224#234#240#251#226#224#242#252' '#253#242#238#242' '#244#240#229#233#236' '#239#238#241#235#229' '#228#232#241#234#238#237#237#229#234#242#224' '#241#226#255#231#224#237#238#227#238' '#241' '#237#232#236' '#241#238#229#228#232#237 +
                #229#237#232#255
              ImageIndex = 12
              ParentShowHint = False
              ShowHint = True
              Style = tbsCheck
              OnClick = ToolButton30Click
            end
            object ToolButton31: TToolButton
              Left = 23
              Top = 0
              Hint = #211#225#232#242#252' '#241#238#229#228#232#237#229#237#232#229' '#232' ('#232#235#232') '#199#224#234#240#251#242#252' '#228#224#237#237#251#233' '#244#240#229#233#236
              ImageIndex = 11
              ParentShowHint = False
              ShowHint = True
              OnClick = CloseConnectionClick
            end
          end
        end
      end
      object GroupBox7: TGroupBox
        Left = 0
        Top = 28
        Width = 90
        Height = 243
        Align = alClient
        Caption = #207#224#234#229#242#251' '#237#224' '#238#242#239#240#224#226#234#243':'
        TabOrder = 1
        ExplicitWidth = 363
        ExplicitHeight = 452
        object Memo4: TJvRichEdit
          Left = 2
          Top = 15
          Width = 359
          Height = 435
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFlat = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          UndoLimit = 0
          WordWrap = False
          OnChange = Memo4Change
          OnKeyUp = Memo4KeyUp
          OnMouseUp = Memo4MouseUp
          OnMouseEnter = Memo4MouseEnter
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #196#238#239#238#235#237#232#242#229#235#252#237#238
      ImageIndex = 2
      OnShow = TabSheet3Show
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GroupBox8: TGroupBox
        Left = 0
        Top = 29
        Width = 363
        Height = 451
        Align = alClient
        Caption = #209#234#240#232#239#242' '#226#251#239#238#235#237#255#229#236#251#233' '#239#238' '#237#224#230#224#242#232#254' '#234#237#238#239#234#232' '#194#251#239#238#235#237#232#242#252':'
        TabOrder = 0
      end
      object Panel12: TPanel
        Left = 0
        Top = 0
        Width = 363
        Height = 29
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object Panel13: TPanel
          Left = 2
          Top = 2
          Width = 359
          Height = 25
          Align = alClient
          AutoSize = True
          BevelOuter = bvNone
          TabOrder = 0
          object ToolBar6: TToolBar
            Left = 0
            Top = 0
            Width = 359
            Height = 25
            Align = alClient
            ButtonHeight = 23
            Images = imgBT
            TabOrder = 0
            object ToolButton25: TToolButton
              Left = 0
              Top = 0
              Hint = #209#238#245#240#224#237#232#242#252' '#241#234#240#232#239#242
              ImageIndex = 0
              ParentShowHint = False
              ShowHint = True
              OnClick = ToolButton25Click
            end
            object ToolButton27: TToolButton
              Left = 23
              Top = 0
              Hint = #199#224#227#240#243#231#232#242#252' '#241#234#240#232#239#242' '#232#231' '#244#224#233#235#224
              ImageIndex = 13
              ParentShowHint = False
              ShowHint = True
              OnClick = ToolButton27Click
            end
            object ToolButton28: TToolButton
              Left = 46
              Top = 0
              Width = 14
              ImageIndex = 5
              Style = tbsSeparator
            end
            object btnExecute: TToolButton
              Left = 60
              Top = 0
              Hint = #194#251#239#238#235#237#232#242#252' '#241#234#240#232#239#242
              ImageIndex = 18
              ParentShowHint = False
              ShowHint = True
              OnClick = btnExecuteClick
            end
            object btnTerminate: TToolButton
              Left = 83
              Top = 0
              Hint = #207#240#229#240#226#224#242#252' '#226#251#239#238#235#237#229#237#232#229' '#241#234#240#232#239#242#224
              Enabled = False
              ImageIndex = 19
              ParentShowHint = False
              ShowHint = True
              OnClick = btnTerminateClick
            end
          end
        end
      end
    end
  end
  object Panel14: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 5
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
  end
  object packetVievPanel: TPanel
    Left = 101
    Top = 5
    Width = 350
    Height = 299
    Align = alRight
    TabOrder = 3
  end
  object waitbar: TPanel
    Left = 160
    Top = 224
    Width = 456
    Height = 46
    TabOrder = 2
    Visible = False
    object Label3: TLabel
      Left = 1
      Top = 1
      Width = 454
      Height = 13
      Align = alTop
      Caption = #207#229#240#229#241#242#240#224#232#226#224#229#242#241#255' '#241#239#232#241#238#234' '#239#224#234#229#242#238#226'...'
      ExplicitWidth = 171
    end
    object ProgressBar1: TProgressBar
      Left = 1
      Top = 14
      Width = 454
      Height = 31
      Align = alClient
      TabOrder = 0
    end
  end
  object splashpnl: TPanel
    Left = 112
    Top = 280
    Width = 521
    Height = 58
    TabOrder = 4
    Visible = False
    object Splash: TJvLabel
      Left = 1
      Top = 1
      Width = 519
      Height = 56
      Align = alClient
      Alignment = taCenter
      AutoSize = False
      Caption = 
        #196#224#237#237#238#229' '#241#238#229#228#232#237#229#237#232#229' '#239#240#238#239#243#249#229#237#238' '#247#229#240#229#231' SocketEngine '#226' '#240#229#230#232#236#229' "'#237#229' '#228#229#248#232 +
        #244#240#238#226#224#242#252' '#242#240#224#244#232#234'"'#13#10#200#237#244#238#240#236#224#246#232#255' '#238' '#241#238#229#228#232#237#229#237#232#232' '#237#229' '#225#243#228#229#242' '#228#238#241#242#243#239#237#224
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Layout = tlCenter
      ParentFont = False
      Transparent = True
      AutoOpenURL = False
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -19
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
  end
  object imgBT: TImageList
    Left = 48
    Top = 80
    Bitmap = {
      494C010118001A002C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000007000000001002000000000000070
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5636B00A563
      6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B00A5636B00A5636B00000000000000000000000000000000000000
      000000000000000000000000000000000000006CC400006CC400006CC4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000424242004242420042424200424242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5636B00FFEF
      C600C6CE9400D6CE9400EFCE9C00E7CE9400EFC68400EFBD8400EFBD7B00EFBD
      8400EFBD8400EFC68400A5636B00000000000000000000000000000000000000
      0000000000008BBCE400006CC40000000000006CC4007CFCFF00006CC4000000
      0000006CC4008BBCE4000000000000000000000000008C636300424242004242
      42008C4A390094521800B55A0000424242008C6363008C6363008C6363008C63
      63008C6363008C6363000000000000000000000000002C20E8002A1EE7002C20
      E800AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAEAE002C20
      E8002A1EE7002C20E80000000000000000000000000000000000A5636B00FFEF
      CE009CBD7300299C21006BAD4A0021941000219410005AA53900CEB57300EFBD
      7B00EFBD7B00EFC68400A5636B0000000000000000000000000000000000E7E5
      E30075828900006CC4007CFCFF00006CC400A4FFFF007CFCFF007CFCFF00006C
      C4007CFCFF00006CC4000000000000000000000000008C636300B55A0000B55A
      0000AD5A1000B55A0000C65A00004242420008A5180000840000008400000084
      000008A518008C6363000000000000000000000000002A1EE700BAAFFF002C20
      E800F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F3002C20
      E800BAAFFF002A1EE70000000000000000000000000000000000A5635A00FFEF
      DE00BDCE9C00108C08000084000000840000008400000084000029941800DEBD
      7B00EFBD7B00EFC68400A5636B00000000000000000000000000CFB7A200E7A1
      5E00006CC4007CFCFF007EEEFF007EEEFF008FF3FE007CFCFF007CFCFF007CFC
      FF007CFCFF007CFCFF00006CC40000000000000000008C636300C65A0000C65A
      0000C65A0000C65A0000CE6300004242420031C64A0010AD180010AD180010AD
      1800009C00008C6363000000000000000000000000002A1EE7009081FF002C20
      E800F5F5F500C2C2C200C2C2C200C2C2C200C2C2C200C2C2C200F5F5F5002C20
      E8009081FF002A1EE70000000000000000000000000000000000A5635A00FFF7
      E700BDCE9C00189410000084000018941000ADBD730073AD4A000084000073AD
      4A00EFBD8400EFC68400A5636B000000000000000000CFB7A200F1A36200FFC3
      8900FCC88C00006CC4007CFCFF007EEEFF009EFCFF00006CC4007CFCFF007CFC
      FF007CFCFF00006CC4000000000000000000000000008C636300C65A0000CE63
      0000CE630000CE630000CE6300004242420031C64A0021BD310021BD310029C6
      4A0042D66B008C6363000000000000000000000000002A1EE7009284FF002C20
      E800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F8002C20
      E8009284FF002A1EE70000000000000000000000000000000000A5736B00FFF7
      EF00BDD6A500088C0800008400000084000084B55A00EFCEA500A5B56B006BAD
      4A00EFC68C00EFC68400A5636B0000000000E7E5E300E78B4900FFAB6D00006C
      C400006CC4007CFCFF007EEEFF00A5F9FF00006CC400FFBC7200006CC4007CFC
      FF007CFCFF009EFFFF00006CC400006CC400000000008C636300CE630000CE6B
      0000CE6B0000CE6B0000D6730000424242000084000021AD310029BD390031C6
      4A0042D66B008C6363000000000000000000000000002A1EE7009587FF002C20
      E800FBFBFB00C2C2C200C2C2C200C2C2C200C2C2C200C2C2C200FBFBFB002C20
      E8009587FF002A1EE70000000000000000000000000000000000A5736B00FFFF
      FF00E7E7D600A5CE94009CC6840094BD73009CBD7300EFD6AD00EFCEA5009CC6
      7B00EFC69400EFC68C00A5636B0000000000C99D7C00FF996100FFA26400006C
      C4007CFCFF007EEEFF00B4F4FF00006CC4006B9DA900FFB36900FFAF6700006C
      C4007CFCFF007CFCFF007CFCFF00006CC400000000008C636300CE6B0000CE6B
      0000DE841800FFF7DE00D673000042424200008400000084000000840000009C
      0000009C00008C6363000000000000000000000000002A1EE7009B8EFF002C20
      E800FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD002C20
      E8009B8EFF002A1EE70000000000000000000000000000000000BD846B00FFFF
      FF00A5DEA500FFEFE700F7EFD6009CC6840094BD730094BD73009CBD7300EFCE
      A500EFCE9C00F7CE9400A5636B0000000000E1874E00FF935F00FF9D6400006C
      C400006CC4007CFCFF007EEEFF007EEEFF00006CC400F4B07500006CC40043BA
      E4007CFCFF0076E4FE00006CC400006CC400000000008C636300D6730000D673
      0000DE7B0800D6730000D673000042424200FFE7C600FFE7C600FFE7C600FFE7
      C600FFE7C6008C6363000000000000000000000000002A1EE7009F91FF002C20
      E8002C20E8002C20E8002C20E8002C20E8002C20E8002C20E8002C20E8002C20
      E8009F91FF002A1EE70000000000000000000000000000000000BD846B00FFFF
      FF0073C67300ADD6A500FFEFE70084C673000084000000840000088C0800EFD6
      AD00EFCEA500F7D6A500A5636B0000000000E6773E00FF8D5F00FFA77D00FFAF
      8100EEB38C00006CC4007CFCFF007EEEFF007CFCFF00006CC40043BAE4007CFC
      FF007CFCFF00006CC4000000000000000000000000008C636300D6730000D673
      0000DE7B0000DE7B0000DE7B000042424200FFEFD600FFEFD600FFEFD600FFEF
      D600FFEFD6008C6363000000000000000000000000002A1EE700A295FF008C7E
      FF008C7EFF008C7EFF008C7EFF008C7EFF008C7EFF008C7EFF008C7EFF008C7E
      FF00A295FF002A1EE70000000000000000000000000000000000D6946B00FFFF
      FF0084CE8400008400007BC67300ADD6A5001894180000840000108C0800F7D6
      B500F7D6AD00EFCEA500A5636B0000000000E6723C00FF967400FDB29500D3BF
      B500006CC4007CFCFF007EEEFF007EEEFF007CFCFF007CFCFF007CFCFF007CFC
      FF007CFCFF007EF9FF00006CC40000000000000000008C636300DE7B0000E77B
      0000E77B0000E77B0000EF7B000042424200FFF7D600FFF7DE00FFF7DE00FFF7
      DE00FFF7DE008C6363000000000000000000000000002A1EE700A699FF002C20
      E8002C20E8002C20E8002C20E8002C20E8002C20E8002C20E8002C20E8002C20
      E800A699FF002A1EE70000000000000000000000000000000000D6946B00FFFF
      FF00F7F7EF0029A5290000840000008400000084000000840000108C0800FFEF
      CE00DECEB500B5AD9400A5636B0000000000E1804C00F8A69200B1D9E900A4DA
      F00076A0C500006CC4007CFCFF00006CC4007CFCFF007CFCFF007CFCFF00006C
      C4007CFCFF00006CC4008BBCE40000000000000000008C636300FF840000F784
      0000EF7B0000EF7B0000EF7B000042424200FFF7D600FFF7D600FFF7D600FFF7
      D600FFF7D6008C6363000000000000000000000000002A1EE700ACA0FF002C20
      E800F4F4F400F4F4F400F4F4F400F4F4F4009287800092878000F4F4F4002C20
      E800ACA0FF002A1EE70000000000000000000000000000000000DE9C7300FFFF
      FF00FFFFFF00DEF7DE0063BD6300219C2100219C210073BD6B00299C2100946B
      5200A56B5A00A56B5A00A5636B0000000000C99B7B00D3C5C400C1EAF700BFE8
      F700BCE6F60075A9D200006CC400FFCEBD00006CC4007CFCFF00006CC400E2D6
      D400006CC400728690000000000000000000000000008C636300FF840000FF84
      0000F7840800F7840000FF84000042424200FFF7D600FFF7D600FFF7D600FFF7
      D600FFF7D6008C6363000000000000000000000000002A1EE700ADA1FF002C20
      E800F8F8F800F8F8F800F8F8F800F8F8F8009287800092878000F8F8F8002C20
      E800ADA1FF002A1EE70000000000000000000000000000000000DE9C7300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DEF7DE00DEF7DE00FFFFF700ADB594008C6B
      5200E79C5200E78C3100B56B4A0000000000E7E5E300B6B7A300D9F3FB00D8F2
      FB00D6F1FA00D4F0FA00D6EDF600F3E0DB00006CC400006CC400006CC400D6F1
      FA00A2ADA000E7E5E300000000000000000000000000000000008C6363008C63
      6300DE732900E77B1800FF840000424242008484840084848400848484008484
      840084848400848484000000000000000000000000002A1EE700D4CDFF007768
      FF00FDFDFD00FDFDFD00FDFDFD00FDFDFD00C1BAB500C1BAB500FDFDFD007768
      FF002A1EE7000000000000000000000000000000000000000000E7AD7B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEC6C600A56B
      5A00FFB55A00BD7B5A00000000000000000000000000CDB8A500DBD8CB00ECF9
      FD00EBF9FD00EAF8FD00E9F7FC00ECF5F800FFEAE500FFEAE500F6F2F100D2D5
      CA00CCB8A5000000000000000000000000000000000000000000000000000000
      00008C6363008C6363008C636300424242000000000000000000000000000000
      000000000000000000000000000000000000000000002C20E8002A1EE7002C20
      E800AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAEAE002C20
      E800000000000000000000000000000000000000000000000000E7AD7B00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00DEC6C600A56B
      5A00BD846B000000000000000000000000000000000000000000CEB9A500E3C4
      A700FAFDFE00FAFEFE00FAFDFE00FAFDFE00FFFAF900FFF8F700E7B99700CEB9
      A500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7AD7B00D694
      6B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00A56B
      5A0000000000000000000000000000000000000000000000000000000000E7E5
      E300C9A78900DEB59000E0C2A500E0C2A500E1B08800C9A58700E7E5E3000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D659
      6200D6596200D6596200D6596200D6596200D6596200D6596200D6596200D659
      6200D659620000000000000000000000000000000000000000000000000048B5
      620048B5620048B5620048B5620048B5620048B5620048B5620048B5620048B5
      620048B56200000000000000000000000000000000000000000000000000527B
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063BBE900209EE000209E
      E000209EE000209EE000209EE000209EE000209EE000209EE000209EE000209E
      E000209EE000209EE00063BBE900000000000000000000000000D6596200E161
      6A00E1616A00E1616A00E1616A00E1616A00E1616A00E1616A00E1616A00E161
      6A00E1616A00D65962000000000000000000000000000000000048B5620030DB
      950030DB950030DB950030DB950030DB950030DB950030DB950030DB950030DB
      950030DB950048B562000000000000000000000000000000000000000000317B
      EF00527BC600296BC60000000000000000000000000000000000000000000000
      00000000000000000000000000000000000063BBE90048C0EF006AE4FF0062E3
      FF005AE1FF0053E0FF004DDFFF0048DFFF0044DEFF0044DEFF0044DEFF0044DE
      FF0044DEFF0044DEFF0032BDEF0063BBE90000000000D6596200C1475200C147
      5200FFD6D800FFD6D800FFD6D800FFD6D800FFD6D800FFD6D800FFD6D800FFD6
      D800C1475200C1475200D6596200000000000000000048B5620011CE810011CE
      8100C3FFE400C3FFE400C3FFE400C3FFE400C3FFE400C3FFE400C3FFE400C3FF
      E40011CE810011CE810048B5620000000000000000000000000000000000397B
      E700007BFF000073F700527BC600000000000000000000000000000000000000
      000000000000000000000000000000000000209EE0007BE6FF0073E5FF006AE4
      FF0062E3FF005AE1FF0053E0FF004DDFFF0048DFFF0044DEFF0044DEFF0044DE
      FF0044DEFF0044DEFF0044DEFF00209EE00000000000D6596200B13B4600B13B
      4600FFDBDD00FFDBDD00FFDBDD00FFDBDD00FFDBDD00FFDBDD00FFDBDD00FFDB
      DD00B13B4600B13B4600D6596200000000000000000048B5620000C8760000C8
      7600C9FFE600C9FFE600C9FFE600C9FFE600C9FFE600C9FFE600C9FFE600C9FF
      E60000C8760000C8760048B56200000000000000000000000000000000000000
      0000009CFF00008CFF00008CFF00527BC6000000000000000000000000000000
      000000000000000000000000000000000000209EE0008CEFFF0087F2FF0073E5
      FF006AE4FF0062E3FF005AE1FF001C75D2001C75D20048DFFF0044DEFF0044DE
      FF0044DEFF0050EAFF004CE6FF00209EE00000000000D6596200B13B4600B13B
      4600B13B4600B13B4600B13B4600B13B4600B13B4600B13B4600B13B4600B13B
      4600B13B4600B13B4600D6596200000000000000000048B5620001C8760001C8
      760001C8760001C8760001C8760001C8760001C8760001C8760001C8760001C8
      760001C8760001C8760048B56200000000000000000000000000000000000000
      00000000000000B5FF00008CFF000094FF00527BC600527BC600000000000000
      00000000000000000000000000000000000000000000209EE0008EF1FF007BE6
      FF0073E5FF006AE4FF0062E3FF001C75D2001C75D2004DDFFF0048DFFF0044DE
      FF0044DEFF004EE8FF00209EE0000000000000000000D6596200B43D4800B43D
      4800B43D4800B43D4800B43D4800FFFFFF00FFFFFF00B43D4800B43D4800B43D
      4800B43D4800B43D4800D6596200000000000000000048B5620003C9770003C9
      770003C9770003C9770003C97700D7FFED00D7FFED0003C9770003C9770003C9
      770003C9770003C9770048B56200000000000000000000000000000000000000
      0000000000000000000000B5FF0008C6FF00009CFF00009CFF00527BC6000000
      00000000000000000000000000000000000000000000209EE00095F1FF0090F3
      FF007BE6FF0073E5FF006AE4FF0062E3FF005AE1FF0053E0FF004DDFFF0048DF
      FF0050EAFF004CE6FF00209EE0000000000000000000D6596200B73F4A00B73F
      4A00B73F4A00B73F4A00B73F4A00FFFDFD00FFFDFD00B73F4A00B73F4A00B73F
      4A00B73F4A00B73F4A00D6596200000000000000000048B5620007CA780007CA
      780007CA780007CA7800DFFFF000DFFFF000DFFFF000DFFFF00007CA780007CA
      780007CA780007CA780048B56200000000000000000000000000000000000000
      000000000000000000000000000000B5FF0008BDFF0000ADFF00009CFF00527B
      C600000000000000000000000000000000000000000000000000209EE00097F3
      FF0084E7FF007BE6FF0073E5FF001C75D200207BD5005AE1FF0053E0FF004DDF
      FF0052E9FF00209EE000000000000000000000000000D6596200BB434E00BB43
      4E00BB434E00BB434E00BB434E00FFF8F900FFF8F900BB434E00BB434E00BB43
      4E00BB434E00BB434E00D6596200000000000000000048B562000BCC7A000BCC
      7A000BCC7A00E7FFF400E7FFF400E7FFF400E7FFF400E7FFF400E7FFF4000BCC
      7A000BCC7A000BCC7A0048B56200000000000000000000000000000000000000
      0000527BC600527BC600527BC60000C6FF0008FFFF0031F7FF0010BDFF0000AD
      FF00527BC600527BC60000000000000000000000000000000000209EE0009DF2
      FF0099F5FF0084E7FF007BE6FF001C75D2001C75D20062E3FF005AE1FF005FEC
      FF0055E7FF00209EE000000000000000000000000000D6596200C1475200C147
      5200FFF3F300FFF3F300C1475200FFF3F300FFF3F300C1475200FFF3F300FFF3
      F300C1475200C1475200D6596200000000000000000048B5620010CE7D0010CE
      7D00EEFFF700EEFFF70010CE7D00EEFFF700EEFFF70010CE7D00EEFFF700EEFF
      F70010CE7D0010CE7D0048B56200000000000000000000000000000000000000
      000029ADFF0000C6FF0000EFFF0000F7FF0000F7FF0000FFFF004AEFFF0018CE
      FF0000A5FF00527BC6000000000000000000000000000000000000000000209E
      E0009FF4FF008DE9FF0084E7FF001C75D2001C75D2006AE4FF0062E3FF0064EB
      FF00209EE00000000000000000000000000000000000D6596200C74C5600C74C
      5600C74C5600FFEEF000FFEEF000FFEEF000FFEEF000FFEEF000FFEEF000C74C
      5600C74C5600C74C5600D6596200000000000000000048B5620016D1800016D1
      800016D1800016D1800016D18000F5FFFB00F5FFFB0016D1800016D1800016D1
      800016D1800016D1800048B56200000000000000000000000000000000000000
      000039A5FF0000C6FF0000EFFF0000F7FF0000EFFF0000DEFF0000FFFF0000FF
      FF0039EFFF0008C6FF00527BC60000000000000000000000000000000000209E
      E000A4F3FF00A1F6FF008DE9FF001C75D2001C75D20073E5FF0076F0FF006AEB
      FF00209EE00000000000000000000000000000000000D6596200CE525C00CE52
      5C00CE525C00CE525C00FFE9EB00FFE9EB00FFE9EB00FFE9EB00CE525C00CE52
      5C00CE525C00CE525C00D6596200000000000000000048B562001DD383001DD3
      83001DD383001DD383001DD38300FBFFFD00FBFFFD001DD383001DD383001DD3
      83001DD383001DD3830048B56200000000000000000000000000000000000000
      00000000000008C6FF0039E7FF004AEFFF0042F7FF0018FFFF0000FFFF0000FF
      FF0008FFFF0021FFFF00527BC600000000000000000000000000000000000000
      0000209EE000A6F5FF0095EAFF001C75D2001C75D2007BE6FF007DEFFF00209E
      E0000000000000000000000000000000000000000000D6596200F06E7700FC79
      8100D5586100D5586100D5586100FFE4E500FFE4E500D5586100D5586100D558
      6100FC798100F06E7700D6596200000000000000000048B5620045DC980054DF
      A10024D6860024D6860024D68600FFFFFF00FFFFFF0024D6860024D6860024D6
      860054DFA10045DC980048B56200000000000000000000000000000000000000
      000000000000000000000000000031D6FF0008F7FF0000FFFF0000F7FF0000D6
      FF0000B5FF00527BC60000000000000000000000000000000000000000000000
      0000209EE000ABF4FF00A8F7FF0095EAFF008DE9FF0090F3FF0083EEFF00209E
      E000000000000000000000000000000000000000000000000000D6596200FFB7
      BC00FFB8BD00FFB8BD00FFB8BD00FFB8BD00FFB8BD00FFB8BD00FFB8BD00FFB8
      BD00FFB7BC00D65962000000000000000000000000000000000048B56200A6EF
      CE00A8EFCF00A8EFCF00A8EFCF00A8EFCF00A8EFCF00A8EFCF00A8EFCF00A8EF
      CF00A6EFCE0048B5620000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031D6FF0000F7FF0000EF
      FF0000ADFF0000A5FF00527BC600000000000000000000000000000000000000
      000000000000209EE000B3FCFF00A3F2FF009CF1FF009DF9FF00209EE0000000
      000000000000000000000000000000000000000000000000000000000000D659
      6200D6596200D6596200D6596200D6596200D6596200D6596200D6596200D659
      6200D659620000000000000000000000000000000000000000000000000048B5
      620048B5620048B5620048B5620048B5620048B5620048B5620048B5620048B5
      620048B562000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000031D6
      FF0042DEFF0010D6FF005AA5FF00527BC6000000000000000000000000000000
      00000000000063BBE9006DCEEF00C3FFFF00BCFFFF0063CEEF0063BBE9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000031D6FF0052A5FF00527BC6000000000000000000000000000000
      0000000000000000000063BBE900209EE000209EE00063BBE900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000037A3
      CA0037A3CA0037A3CA0037A3CA0037A3CA0037A3CA0037A3CA0037A3CA0037A3
      CA0037A3CA000000000000000000000000000000000029ADD60031B5DE0021AD
      D600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009B9591009B9591009B9591009B9591009B959100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003131C6003131C6003131A5003131A5000000
      000000000000000000000000000000000000000000000000000037A3CA00C1FF
      FF00C1FFFF00C1FFFF00C1FFFF00C1FFFF00C1FFFF00C1FFFF00C1FFFF00C1FF
      FF00C1FFFF0037A3CA0000000000000000000000000029ADD6009CDEEF0084EF
      FF004AC6E70021ADD60018A5C60018A5C60018A5C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009B95
      91009B959100BEB5B300F0E3E300F0E3E300F0E3E300BEB5B3009B9591009B95
      9100000000000000000000000000000000000000000000000000000000000000
      000000000000000000003139FF003139FF003139FF003131E7003131E7003131
      A50000000000000000000000000000000000000000000000000037A3CA00BAFC
      FE0074F8FD0074F8FD0074F8FD0074F8FD0074F8FD0074F8FD0074F8FD0074F8
      FD00BAFCFE0037A3CA0000000000000000000000000029ADD60052BDE7009CFF
      FF0094FFFF0073DEF70073DEF70073DEF70073DEF7004AC6E70021ADD60018A5
      C6000000000000000000000000000000000000000000000000009B959100BEB5
      B300F0E3E300F0E3E300BAA89A00BAA89A00BAA89A00F0E3E300F0E3E300BEB5
      B3009B9591000000000000000000000000000000000000000000000000000000
      0000000000003139FF003139FF003139FF003139FF003139FF003131E7003131
      E7003131A500000000000000000000000000000000000000000037A3CA00AEF6
      FC005CECF9005CECF9005CECF9005CECF9005CECF9005CECF9005CECF9005CEC
      F900AEF6FC0037A3CA0000000000000000000000000029ADD60052BDE700ADFF
      FF008CF7FF008CEFFF008CEFFF008CEFFF0073DEF70073DEF70073DEF7004AC6
      EF0021ADD600000000000000000000000000000000009B959100BEB5B300F0E3
      E300BAA89A00BAA89A00E8E9E800E8E9E800E8E9E800BAA89A00BAA89A00F0E3
      E300BEB5B3009B95910000000000000000000000000000000000000000000000
      0000000000003139FF006363FF003139FF003139FF003139FF003139FF003131
      E7003131A500000000000000000000000000000000000000000037A3CA00A2F0
      FB0044E0F60044E0F60044E0F60044E0F60044E0F60044E0F60044E0F60044E0
      F600A2F0FB0037A3CA0000000000000000000000000029ADD60029ADD600ADDE
      EF0094F7FF0094F7FF008CEFFF008CEFFF008CEFFF008CEFFF0073DEF70073DE
      F7004AC6EF00000000000000000000000000000000009B959100F0E3E300BAA8
      9A00E8E9E800E8E9E800E8E9E800E8E9E800E8E9E800E8E9E800E8E9E800BAA8
      9A00F0E3E3009B9591000000000000000000CE6B00007B3908007B3908007B39
      08007B3908006363FF006363FF003139FF003139FF003139FF003139FF003139
      FF003131A500000000000000000000000000000000000000000037A3CA009BEC
      F90036D9F30036D9F30036D9F30036D9F30036D9F30036D9F30036D9F30036D9
      F3009BECF90037A3CA0000000000000000000000000029ADD60073DEF70029AD
      D6009CFFFF008CF7FF008CF7FF008CF7FF008CEFFF008CEFFF008CEFFF0073DE
      F70073DEF70018A5C60000000000000000009B959100BEB5B300F0E3E300BAA8
      9A00E8E9E800E8E9E800E8E9E800E8E9E800E8E9E800E8E9E800E8E9E800BAA8
      9A00F0E3E300BEB5B3009B95910000000000CE6B0000F7941000CE630000CE63
      0000CE6300006363FF009C9CFF006363FF003139FF003139FF003139FF003139
      FF003131A500004A0000004A0000004A0000000000000000000037A3CA00A2F0
      FB0044E0F60044E0F60044E0F60044E0F60044E0F60044E0F60044E0F60044E0
      F600A2F0FB0037A3CA0000000000000000000000000029ADD60094F7FF0029AD
      D600ADDEEF00A5EFF700A5EFF700A5F7FF008CEFFF008CEFFF008CEFFF0073DE
      F7000073080018A5C60000000000000000009B959100F0E3E300BAA89A00F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200BAA89A00F0E3E3009B9591000000000000000000CE6B0000F7941000E76B
      0000E76B0000E76B00006363FF009C9CFF006363FF003139FF003139FF003131
      C600007B0800007B0800007B0800004A0000000000000000000037A3CA00C1FF
      FF00C1FFFF00C1FFFF00C1FFFF00C1FFFF00C1FFFF00C1FFFF00C1FFFF00C1FF
      FF00C1FFFF0037A3CA0000000000000000000000000029ADD6009CFFFF0073DE
      F70029ADD60018A5C60018A5C60018A5C600ADDEEF008CF7FF0084EFFF000073
      08005AE78C000073080018A5C600000000009B959100F0E3E300BAA89A00F2F2
      F200F2F2F200F2F2F200F2F2F200928780009287800092878000F2F2F200F2F2
      F200BAA89A00F0E3E3009B959100000000000000000000000000CE6B0000F794
      1000E76B0000CE6300007B3908006363FF003139FF003139FF003139FF00009C
      0800009C0800009C0800007B0800004A000000000000000000000000000037A3
      CA0037A3CA0037A3CA0037A3CA0037A3CA0037A3CA0037A3CA0037A3CA0037A3
      CA0037A3CA000000000000000000000000000000000029ADD6009CFFFF0094F7
      FF0073DEF70073DEF70073DEF7006BDEF70029ADD600ADDEEF000073080052D6
      7B0042D66B0031C64A0000730800000000009B959100F0E3E300BAA89A00FAFA
      FA00FAFAFA00FAFAFA00FAFAFA0092878000FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00BAA89A00F0E3E3009B95910000000000000000000000000000000000CE6B
      0000F79410007B390800000000000873100042C67300009C0800009C0800009C
      0800009C0800009C0800007B0800004A0000000000000000000000000000B1AA
      A4009D756500B1AAA40000000000000000000000000000000000B1AAA4009D75
      6500B1AAA4000000000000000000000000000000000029ADD6009CFFFF0094F7
      FF0094F7FF0094F7FF0094F7FF0073DEF70073DEF70029ADD60018A5C600108C
      210031C64A00109C210018A5C600000000009B959100BEB5B300F0E3E300BAA8
      9A00FAFAFA00FAFAFA00FAFAFA0092878000FAFAFA00FAFAFA00FAFAFA00BAA8
      9A00F0E3E300BEB5B3009B959100000000000000000000000000000000000000
      0000CE6B000000000000000000000873100042C67300009C0800009C0800009C
      0800009C0800009C0800007B0800004A0000000000000000000000000000B1AA
      A400B99A8D00B1AAA40000000000000000000000000000000000B1AAA400B99A
      8D00B1AAA4000000000000000000000000000000000029ADD600C6FFFF0094FF
      FF009CFFFF00D6FFFF00D6FFFF008CEFFF0094EFFF0073DEF70073DEF7000884
      100018AD2900088410000000000000000000000000009B959100F0E3E300BAA8
      9A00FAFAFA00FAFAFA00FAFAFA0092878000FAFAFA00FAFAFA00FAFAFA00BAA8
      9A00F0E3E3009B95910000000000000000000000000000000000000000000000
      00000000000000000000000000000873100042C67300009C0800009C0800009C
      0800009C0800009C0800007B0800004A0000000000000000000000000000B1AA
      A400E0CEC400B1AAA40000000000000000000000000000000000B1AAA400E0CE
      C400B1AAA4000000000000000000000000000000000021ADD6009CDEEF00C6FF
      FF00C6FFFF009CDEEF0018ADD60018A5C60018A5C60018A5C60018A5C600088C
      100008A51800000000000000000000000000000000009B959100BEB5B300F0E3
      E300BAA89A00BAA89A00FAFAFA00FAFAFA00FAFAFA00BAA89A00BAA89A00F0E3
      E300BEB5B3009B95910000000000000000000000000000000000000000000000
      00000000000000000000000000000873100042C67300009C0800009C0800009C
      0800009C0800009C0800007B0800004A0000000000000000000000000000B1AA
      A400FDF5EE00FDF5EE00B1AAA400B1AAA400B1AAA400B1AAA400FDF5EE00FDF5
      EE00B1AAA400000000000000000000000000000000000000000031B5DE0029AD
      D60018A5C60018A5C60000000000000000000000000000000000088C100008A5
      18000884100000000000000000000000000000000000000000009B959100BEB5
      B300F0E3E300F0E3E300BAA89A00BAA89A00BAA89A00F0E3E300F0E3E300BEB5
      B3009B9591000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000873100042C6730042C6730042C6730042C6
      730042C6730042C6730042C67300004A00000000000000000000000000000000
      0000B1AAA400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B1AA
      A400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000730800087B0800088C1000088C1000087B
      0800000000000000000000000000000000000000000000000000000000009B95
      91009B959100BEB5B300F0E3E300F0E3E300F0E3E300BEB5B3009B9591009B95
      9100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000087310000873100008731000087310000873
      1000087310000873100008731000087310000000000000000000000000000000
      000000000000B1AAA400B1AAA400B1AAA400B1AAA400B1AAA400B1AAA4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009B9591009B9591009B9591009B9591009B959100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A9CC6008484840084A5AD000000
      00000000000000000000000000000000000000000000AD5A5A00AD5A5A00E7C6
      C600E7C6C600C6CEC600C6CEC600C6CEC600C6CEC600AD5A5A00943131000000
      000000000000000000000000000000000000000000005A5242005A5242000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B8C940073CEE7005A737B000000
      000000000000000000000000000000000000BD7B7300C65A5A00C65A5A00E7C6
      C6009C393900B5737300C6CEC600F7F7F700F7F7F700C65A5A00943131000000
      0000000000000000000000000000000000005A52420073524A0073524A005A52
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000007308000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000000000000000008484840000000000000000004A9CC6008484840084A5
      AD0000000000000000000000000000000000738C94005AB5E700427B9C000000
      000000000000000000000000000000000000BD7B7300C65A5A00C65A5A00C694
      8C009C3939009C4A4A00E7C6C600C6CEC600F7F7F700C65A5A00943131000000
      000094313100000000000000000000000000B5848400C6ADAD0073524A005A52
      4200000000005A5242005A5242005A52420073524A0073524A0073524A007352
      4A0073524A0073524A00B5848400000000000000000000000000007308000073
      0800000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006BADBD0073C6D6004A63
      6B0000000000000000000000000000000000636B6B00297B9C0029739C007B63
      63009C6B6B00000000000000000000000000BD7B7300C65A5A00C65A5A00C694
      8C00C6948C00BDA5A500BDA5A500E7C6C600C6CEC600C65A5A0094313100C65A
      5A009431310000000000000000000000000000000000B5848400B58484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007308000073080000730800008C
      0800008C08000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000528494005ABDF7000031
      DE0073636300000000009C737300AD737300AD6B6B0052848C0073CEE7008C73
      7B00D68484000031DE000000000000000000BD7B7300AD524A00B55A5A00C65A
      5A00C65A5A00C65A5A00C65A5A00C65A5A00C65A5A00C65A5A0094313100C65A
      5A00943131000000000094313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008C0800008C
      0800000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002184B5000031
      DE000031DE009C6B6B00D6848400DE8C8C00C67B7B006B737B0084DEEF009484
      8C000031DE00AD7373008C8C8C0000000000BD7B7300AD524A00FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700C65A5A0094313100C65A
      5A0094313100C65A5A009431310000000000000000005A5242005A5242000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008C08000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD737300528CA50073D6
      FF000031DE000031DE00D6848400D6848400D68484007B6363000031DE000031
      DE00D6848400BD7B7B00947B7B0000000000BD7B7300AD524A00FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700C65A5A0094313100C65A
      5A0094313100C65A5A0094313100000000005A52420073524A0073524A005A52
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84000000000000000000848484000000000000000000BD7B7B008C84840084DE
      EF0073949C000031DE000031DE00C67B7B009C6B6B000031DE000031DE00CE94
      9400CE949400C68C8C009484840000000000BD7B7300AD524A00FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700C65A5A0094313100C65A
      5A0094313100C65A5A009431310000000000B5848400C6ADAD0073524A005A52
      4200000000005A5242005A5242005A52420073524A0073524A0073524A007352
      4A0073524A0073524A00B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD7373009C6B6B00949C
      9C00A5A5A5009C6B6B000031DE000031E7000031DE000031E700DEA5A500DEA5
      A500DEA5A500C68C8C009C84840000000000BD7B7300AD524A00FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700C65A5A0094313100C65A
      5A0094313100C65A5A00943131000000000000000000B5848400B58484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000084848400000000008484
      84000000000000000000848484000000000000000000A56B6B00A56B6B00AD73
      7300CE9C9C00DEB5B500EFBDBD000031E7000031E7000031DE000031DE00EFAD
      AD00DEADAD00B58484008C8C8C0000000000BD7B7300AD524A00FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700C65A5A0094313100C65A
      5A0094313100C65A5A0094313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD7B7B00EFD6D600FFEF
      EF00FFE7E700EFCECE000031DE000031EF00F7C6C600F7C6C6000031F7000031
      DE00CE9C9C009C8484000000000000000000BD7B7300AD524A00D6D6D600CEB5
      B500CEB5B500CEB5B500CEB5B500CEB5B500D6D6D600AD524A0094313100C65A
      5A0094313100C65A5A009431310000000000000000005A5242005A5242000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5848400DECECE00FFF7
      F700FFF7F7000031F7000031EF00EFD6D600F7CECE00F7C6C600F7C6C6000031
      F7009C8484000000000000000000000000000000000000000000BD7B7300AD52
      4A00FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700C65A
      5A0094313100C65A5A0094313100000000005A52420073524A0073524A005A52
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B58C8C00CEAD
      AD000031FF000031EF00FFEFEF00FFE7E700EFC6C600EFB5B5009C8484009C84
      84000031F7000000000000000000000000000000000000000000BD7B7300AD52
      4A00D6D6D600CEB5B500CEB5B500CEB5B500CEB5B500CEB5B500D6D6D600AD52
      4A0094313100C65A5A009431310000000000B5848400C6ADAD0073524A005A52
      4200000000005A5242005A5242005A52420073524A0073524A0073524A007352
      4A0073524A0073524A00B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000031
      F7000031F700CEB5B500C6ADAD00BDA5A500BDA5A5009C8484008C8484007373
      7300000000000031F70000000000000000000000000000000000000000000000
      0000BD7B7300AD524A00FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700C65A5A00943131000000000000000000B5848400B58484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000084848400000000008484
      8400000000000000000084848400000000000000000000000000000000000031
      F70000000000000000000000000000000000A5A5A500FFFFFF008C8C8C007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000BD7B7300AD524A00D6D6D600CEB5B500CEB5B500CEB5B500CEB5B500CEB5
      B500D6D6D600AD524A0094313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500FFFFFF008C8C8C007373
      7300000000000000000000000000000000000000000000000000F8F8F800EEEE
      EE00E9E9E900E8E8E800DEDEDE00D8D8D800D8D8D800E0E0E000E8E8E800ECEC
      EC00F1F1F100FAFAFA0000000000000000000000000000000000000000000000
      0000000000000000000000000000F7EFDE00EFDEC60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5CEFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D9D9D900CECECE00C4C4C400C6C6
      C600C1C1C100B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B8B8B800C4C4
      C400CACACA00CCCCCC00D5D5D500DCDCDC000000000000000000000000000000
      00000000000000000000FFF7F700D69C5A00EFD6BD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000739CF70084ADFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000109CCE0042BDDE0039BDDE0021ADD600109CCE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00DEAD7300CE8C4200D69C5A00D6A56B00D6A56B00D6A5
      6B00D6A56B00D6A56B00EFD6BD00000000000000000000000000C6D6FF00A5C6
      FF00A5C6FF00A5C6FF00A5C6FF008CADFF00427BF7002163F700A5C6FF000000
      00000000000000000000000000000000000000000000000000000000000010A5
      CE0018ADD60094DEFF0094DEFF0094DEF70084DEF70039BDDE00109CCE000000
      0000000000000000000000000000000000006D6D6D0030303000323232003232
      3200323232003232320032323200323232003232320032323200323232003232
      32003232320032323200303030006D6D6D000000000000000000000000000000
      000000000000E7C69C00CE8C4200845A29006B4A21006B4A2100B57B3900CE8C
      4200CE8C4200CE8C4200E7CEA5000000000000000000000000006394F7002163
      F7002163F7002163F7002163F7002163F7002163F7002163F7002163F700BDD6
      FF000000000000000000000000000000000000000000000000000000000029AD
      D60029ADD6009CE7F70094DEF70094DEF70052C6E70094DEFF0094DEFF005AC6
      DE00000000000000000000000000000000003838380044444400C5C5C500C5C5
      C500C5C5C500C5C5C500C5C5C500C5C5C500C5C5C500C5C5C500C5C5C500C5C5
      C500C5C5C500C5C5C50044444400383838000000000000000000000000000000
      0000EFDEC600CE8C42005A422100000000005A4221002918080008080000B57B
      3900CE8C4200CE8C4200E7CEA5000000000000000000000000006394F7002163
      F7002163F700185AD600103184001031840010318400185AD6002163F700296B
      F700DEE7FF0000000000000000000000000000000000000000000000000031BD
      DE0029B5DE00ADEFFF009CE7F7006BC6E700109CC60084DEF70094DEFF0094DE
      FF0010A5D6000000000000000000000000004949490073737300585858009F9F
      9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F
      9F009F9F9F00585858007373730049494900000000000000000000000000F7EF
      DE00CE944A00CE8C42000808000052391800CE8C4200BD843900000000006B4A
      2100CE8C4200CE8C4200E7CEA5000000000000000000000000006394F7002163
      F700184AB50000001000082963001042A50008184200000000001042A5002163
      F7003973F700EFEFFF0000000000000000000000000000000000000000004AC6
      E70039BDDE00CEF7FF00BDEFFF00A5E7FF00188CB50094DEF70094DEF70094DE
      F70010A5D600000000000000000000000000585858009F9F9F00838383006C6C
      6C00B4B4B400B4B4B40073737300323232003232320073737300B4B4B400B4B4
      B4006C6C6C00838383009F9F9F00585858000000000000000000FFFFF700D69C
      5A00CE8C4200CE8C4200B57B3900B57B3900CE8C4200A5733100000000006B4A
      2100CE8C4200CE8C4200E7CEA5000000000000000000000000006394F7002163
      F70008215200001031002163F7002163F7002163F7001852C6002163F7002163
      F7002163F7004A84F700F7F7FF000000000000000000000000000000000073D6
      EF004AC6E700CEF7FF00CEF7FF00BDEFFF005AC6DE009CE7F70094DEFF0094DE
      F70010A5D60000000000000000000000000066666600AEAEAE00AEAEAE009494
      94007D7D7D008686860044444400C5C5C500C5C5C50044444400868686007D7D
      7D0094949400AEAEAE00AEAEAE00666666000000000000000000DEAD7B00CE8C
      4200CE8C4200CE8C4200CE8C4200CE8C42007B5229000808000008080000BD84
      3900CE8C4200CE8C4200E7CEA5000000000000000000000000006394F7002163
      F70000000000103184002163F7002163F7002163F7002163F7002163F7002163
      F7002163F7002163F7006B9CF700000000000000000000000000000000004AC6
      E7004AC6E70042BDDE0042BDDE0021ADD60031B5DE0073D6EF009CE7F7004AC6
      E70010A5D60000000000000000000000000073737300BBBBBB00BBBBBB00BBBB
      BB007979790058585800CECECE009F9F9F009F9F9F00CECECE00585858007979
      7900BBBBBB00BBBBBB00BBBBBB00737373000000000000000000DEAD7300CE8C
      4200CE8C4200CE8C4200BD843900291808000000000052391800BD843900CE8C
      4200CE8C4200CE8C4200E7CEA5000000000000000000000000006394F7002163
      F70000000000103184002163F7002163F7002163F7002163F7002163F7002163
      F7002163F7002163F700B5CEFF00000000000000000000000000000000008CDE
      F70063C6E700109CC6007BDEF7004AC6E70031BDDE0010A5CE0029ADD60052C6
      E70010A5D60000000000000000000000000080808000C5C5C500C5C5C5009898
      98006C6C6C00D6D6D600B4B4B400B4B4B400B4B4B400B4B4B400D6D6D6006C6C
      6C0098989800C5C5C500C5C5C500808080000000000000000000FFF7F700D69C
      5A00CE8C4200CE8C42005239180008080000A5733100CE8C4200CE8C4200CE8C
      4200CE8C4200CE8C4200E7CEA5000000000000000000000000006394F7002163
      F70000001000102973002163F7002163F7002163F7002163F7002163F7002163
      F7002163F70084ADFF0000000000000000000000000000000000000000000000
      0000188CB5001894BD005AC6DE007BDEF70073D6EF00109CC6001894BD00109C
      CE00000000000000000000000000000000008B8B8B00D0D0D000A6A6A6007D7D
      7D00DDDDDD00C5C5C500C5C5C500C5C5C500C5C5C500C5C5C500C5C5C500DDDD
      DD007D7D7D00A6A6A600D0D0D0008B8B8B00000000000000000000000000FFEF
      E700CE945200CE8C42003121100029180800CE8C4200A573310031211000A573
      3100CE8C4200CE8C4200E7CEA5000000000000000000000000006394F7002163
      F7000829630000082100215AE7002163F7001852C600103994002163F7002163
      F7005A8CF700FFFFFF0000000000000000000000000000000000000000000000
      0000000000001894BD000000000018A5D60021ADD600109CCE001894BD000000
      00000000000000000000000000000000000094949400B0B0B0008D8D8D00E2E2
      E200D3D3D300D3D3D300D3D3D300D3D3D300D3D3D300D3D3D300D3D3D300D3D3
      D300E2E2E2008D8D8D00B0B0B000949494000000000000000000000000000000
      0000F7E7CE00CE8C4A00845A290000000000523918002918080008080000BD84
      3900CE8C4200CE8C4200E7CEA5000000000000000000000000006394F7002163
      F700185AD6000010310000103100102973000000100000103100185AD6003973
      F700EFF7FF000000000000000000000000000000000000000000000000000000
      00000000000073D6EF00188CB500000000000000000010A5CE00188CB5000000
      0000000000000000000000000000000000009D9D9D009A9A9A00E7E7E700DDDD
      DD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDD
      DD00DDDDDD00E7E7E7009A9A9A009D9D9D000000000000000000000000000000
      000000000000EFD6BD00CE8C4200946331006B4A21006B4A2100BD843900CE8C
      4200CE8C4200CE8C4200E7CEA5000000000000000000000000006394F7002163
      F700296BF7002163F7001852C600184AB5001852C6002163F7002163F700D6E7
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000008CDEF70073D6EF0000000000188CB500109CCE00000000000000
      000000000000000000000000000000000000B1B1B100A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100A1A1A100B1B1B1000000000000000000000000000000
      00000000000000000000E7C69C00CE8C4200DEBD8C00EFD6B500EFD6B500EFD6
      B500EFD6B500EFD6B500F7EFDE00000000000000000000000000A5BDFF007BA5
      F7007BA5F7007BA5F7007BA5F7007BA5F700427BF7002163F700ADC6FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000042BDDE0039BDDE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DEB58400EFD6BD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007BA5F70084ADFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00F7EFDE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5CEFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001073100010731000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008C8C8C00949494007373730073737300636363005A5A5A00525252005252
      52005A5A5A000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001084100039BD630010731000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A98D6300AF8D5B00A98D
      6300AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00A98D
      6300AF8D5B00A98D630000000000000000000000000000000000000000009494
      9400848484009C9C9C0052525200525252006B6B6B0039393900525252004242
      4200313131003939390000000000000000000000000000000000000000000000
      000000000000000000001084100052E77B0039BD630010731000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      E6003232D6003232D600000000000000000000000000000000003232D6003232
      D6008484E60000000000000000000000000000000000AF8D5B00F6DFC200A98D
      6300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300A98D
      6300F6DFC200AF8D5B0000000000000000000000000000000000000000009C9C
      9C00848484009C9C9C004A4A4A004A4A4A006B6B6B0029292900525252004242
      4200212121002929290000000000000000000000000000000000000000000000
      000000000000000000001084100084F7A50039BD630010731000000000000000
      00000000000000000000000000000000000000000000000000008484E6004A4A
      FF004A4AFF004A4AFF003232D60000000000000000003232D6004A4AFF004A4A
      FF004A4AFF008484E600000000000000000000000000AF8D5B00F0C79A00A98D
      6300F5F5F500C2C2C200C2C2C200C2C2C200C2C2C200C2C2C200F5F5F500A98D
      6300F0C79A00AF8D5B0000000000000000000000000000000000000000009C9C
      9C0084848400A5A5A50042424200424242006B6B6B0018181800525252004242
      4200101010002929290000000000000000000000000000000000000000000000
      000000000000000000001084100084F7A50039BD630010731000000000000000
      00000000000000000000000000000000000000000000000000003232D6004A4A
      FF004A4AFF004A4AFF004A4AFF003232D6003232D6004A4AFF004A4AFF004A4A
      FF004A4AFF003232D600000000000000000000000000AF8D5B00F1C99C00A98D
      6300F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800A98D
      6300F1C99C00AF8D5B000000000000000000000000000000000000000000A5A5
      A50084848400A5A5A5004A4A4A004A4A4A006B6B6B0018181800525252004242
      4200101010002929290000000000000000000000000000000000000000000000
      000000000000000000001084100084F7A50039BD630010731000000000000000
      00000000000000000000000000000000000000000000000000003232D6006565
      FF007272FF004A4AFF004A4AFF004A4AFF004A4AFF004A4AFF004A4AFF007272
      FF006565FF003232D600000000000000000000000000AF8D5B00F3CB9D00A98D
      6300FBFBFB00C2C2C200C2C2C200C2C2C200C2C2C200C2C2C200FBFBFB00A98D
      6300F3CB9D00AF8D5B000000000000000000000000000000000000000000A5A5
      A50084848400ADADAD004A4A4A004A4A4A006B6B6B0018181800525252004242
      4200101010002929290000000000000000000000000000000000000000000000
      000000000000000000001084100084F7A50039BD630010731000000000000000
      0000000000000000000000000000000000000000000000000000000000003232
      D6008F8FFF007272FF004A4AFF004A4AFF004A4AFF004A4AFF007272FF008F8F
      FF003232D60000000000000000000000000000000000AF8D5B00F5CEA100A98D
      6300FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00A98D
      6300F5CEA100AF8D5B000000000000000000000000000000000000000000A5A5
      A50084848400ADADAD004A4A4A004A4A4A006B6B6B0018181800525252004242
      4200101010002929290000000000000000000000000000000000000000000000
      000000000000000000001084100084F7A50039BD630010731000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003232D6007272FF005151FF005151FF005151FF005151FF007272FF003232
      D6000000000000000000000000000000000000000000AF8D5B00F7D1A400A98D
      6300A98D6300A98D6300A98D6300A98D6300A98D6300A98D6300A98D6300A98D
      6300F7D1A400AF8D5B0000000000000000000000000000000000000000009C9C
      9C0084848400A5A5A50042424200424242006B6B6B0018181800525252004242
      4200101010002929290000000000000000000000000000000000000000000000
      0000000000001084100084F7A50052E77B0039BD6300104A1000107310000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003232D6005A5AFF005A5AFF005A5AFF005A5AFF005A5AFF005A5AFF003232
      D6000000000000000000000000000000000000000000AF8D5B00F9D4A600F7C9
      9000F7C99000F7C99000F7C99000F7C99000F7C99000F7C99000F7C99000F7C9
      9000F9D4A600AF8D5B0000000000000000000000000000000000000000009C9C
      9C0084848400A5A5A50042424200424242006B6B6B0018181800525252004242
      4200101010002929290000000000000000000000000000000000000000000000
      00001084100084F7A50052E77B0052E77B0039AD520010631000104A10001073
      1000000000000000000000000000000000000000000000000000000000003232
      D6006565FF006565FF006565FF006565FF006565FF006565FF006565FF006565
      FF003232D60000000000000000000000000000000000AF8D5B00FAD7A900A98D
      6300A98D6300A98D6300A98D6300A98D6300A98D6300A98D6300A98D6300A98D
      6300FAD7A900AF8D5B000000000000000000000000000000000094949400A5A5
      A500737373009C9C9C0039393900393939006B6B6B0018181800525252004A4A
      4A0010101000313131007B7B7B00000000000000000000000000000000001084
      100084F7A5006BEF8C0063EF840052E77B0039BD5A001094100010631000104A
      10001073100000000000000000000000000000000000000000003232D6007272
      FF007272FF007272FF009292FF00ADADFF00ADADFF009292FF007272FF007272
      FF007272FF003232D600000000000000000000000000AF8D5B00FDDAAB00A98D
      6300F4F4F400F4F4F400F4F4F400F4F4F4009287800092878000F4F4F400A98D
      6300FDDAAB00AF8D5B00000000000000000000000000000000008C8C8C009C9C
      9C009C9C9C00949494007B7B7B007B7B7B00636363005A5A5A00525252004A4A
      4A004242420031313100212121000000000000000000000000001084100084F7
      A5006BEF940063EF8C0052E77B004AD6730039BD630039BD6300109410001063
      1000104A100010731000000000000000000000000000000000003232D6007F7F
      FF007F7FFF009B9BFF00B0B0FF003232D6003232D600B0B0FF009B9BFF007F7F
      FF007F7FFF003232D600000000000000000000000000AF8D5B00FDDDAD00A98D
      6300F8F8F800F8F8F800F8F8F800F8F8F8009287800092878000F8F8F800A98D
      6300FDDDAD00AF8D5B0000000000000000000000000000000000737373006363
      6300636363006B6B6B00636363006363630052525200525252004A4A4A004A4A
      4A0031313100313131007373730000000000000000001084100084F7A5006BEF
      940052DE73004AD6630042CE5A0031BD520039BD630039BD630039BD63001094
      100010631000104A1000107310000000000000000000000000008484E600B0B0
      FF00D0D0FF00D0D0FF003232D60000000000000000003232D600CFCFFF00D0D0
      FF00B0B0FF008484E600000000000000000000000000AF8D5B00FFEDD300D0BE
      9F00FDFDFD00FDFDFD00FDFDFD00FDFDFD00C1BAB500C1BAB500FDFDFD00D0BE
      9F00AF8D5B000000000000000000000000000000000000000000000000009C9C
      9C00949494009494940084848400848484007B7B7B00737373006B6B6B006B6B
      6B00636363005A5A5A0000000000000000001084100010841000108410001084
      1000108410001084100010841000108410001084100010841000108410001084
      1000108410001084100010841000108410000000000000000000000000008484
      E6003232D6003232D600000000000000000000000000000000003232D6003232
      D6008484E60000000000000000000000000000000000A98D6300AF8D5B00A98D
      6300AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00A98D
      6300000000000000000000000000000000000000000000000000000000000000
      000000000000A5A5A5007B7B7B000000000000000000737373007B7B7B004242
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A5A5A5007B7B7B007B7B7B007B7B7B00424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000700000000100010000000000800300000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFC001FF1FF0FFFFFFC001F913
      80038003C001E00380038003C001C00180038003C001800380038003C0010000
      80038003C001000080038003C001000080038003C001000380038003C0010001
      80038003C001000180038003C001000380038003C0010003C0038007C0038007
      F0FF800FC007C00FFFFFFFFFC00FE01FFFFFFFFFFFFFFFFFE007E007EFFF8001
      C003C003E3FF000080018001E1FF000080018001F0FF000080018001F83F8001
      80018001FC1F800180018001FE0FC00380018001F003C00380018001F003E007
      80018001F001E00780018001F801F00F80018001FE03F00FC003C003FF81F81F
      E007E007FFE0F81FFFFFFFFFFFF8FC3FFFFFFFFFFFFFFFFFE0078FFFF83FFE1F
      C003807FE00FFC0FC003800FC007F807C00380078003F807C003800780030007
      C003800300010000C003800300018000C00380010001C000E00780010001E200
      E3C780010001F600E3C780038003FE00E3C780078003FE00E007C3C7C007FE00
      F00FFE0FE00FFE00F81FFFFFF83FFFFFFFFFFFFFFFFFFF1F801F9FFFFFFFFF1F
      001F0FFFDF218F1F00070801CF2D8F0700079FFF07ED84030001FFFFCFEDC001
      00019FFFDFED800100010FFFFFE1800100010801FFFF800100019FFFE4218001
      0001FFFFE5AD800300019FFFFDAD8007C0010FFFFDADC007C0010801FDADE00B
      F0019FFFFC21EF0FF001FFFFFFFFFF0FC003FE7FFF3FFFFF0000FC7FFF3FF07F
      FFFFF801C01FE01F0000F801C00FE00F0000F001C007E0070000E001C003E007
      0000C001C001E0070000C001C001E0070000C001C001E0070000C001C003F00F
      0000E001C003FA1F0000F001C007F99F0000F801C00FF93F0000FC01C01FFE7F
      FFFFFE7FFF3FFFFFFFFFFE7FFF3FFFFFFFFFFFFFFF3FFFFFFFFFF007FE3FFFFF
      8003E003FC3FE3C78003E003FC3FC1838003E003FC3FC0038003E003FC3FC003
      8003E003FC3FE0078003E003FC3FF00F8003E003F81FF00F8003E003F00FE007
      8003C001E007C0038003C001C003C0038003C0018001C1838007E0030000E3C7
      800FF98FFFFFFFFFFFFFFC1FFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object ImageList2: TImageList
    Height = 12
    Width = 12
    Left = 16
    Top = 80
    Bitmap = {
      494C0101040006002C000C000C00FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000300000001800000001002000000000000012
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00DEAD
      7300CE8C4200D69C5A00D6A56B00D6A56B00D6A56B00D6A56B00D6A56B00EFD6
      BD00A5C6FF00A5C6FF00A5C6FF00A5C6FF008CADFF00427BF7002163F700A5C6
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00F7F7F700F7F7F700FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00F7F7F700F7F7F700FFFF
      FF00000000000000000000000000000000000000000000000000E7C69C00CE8C
      4200845A29006B4A21006B4A2100B57B3900CE8C4200CE8C4200CE8C4200E7CE
      A5002163F7002163F7002163F7002163F7002163F7002163F7002163F7002163
      F700BDD6FF000000000000000000000000000000000000000000FFFFFF00C6DE
      C60073B57B004AA55200529C5A007BAD8400CED6CE00FFFFFF00000000000000
      00000000000000000000FFFFFF00DECEC600BD946B00AD734200AD734A00AD8C
      7B00D6D6CE00FFFFFF00000000000000000000000000EFDEC600CE8C42005A42
      2100000000005A4221002918080008080000B57B3900CE8C4200CE8C4200E7CE
      A5002163F7002163F700185AD600103184001031840010318400185AD6002163
      F700296BF700DEE7FF00000000000000000000000000F7FFFF009CD6A50031B5
      4A0021B5420029BD4A0021AD3900109C290031943900ADBDAD00FFFFFF000000
      000000000000FFFFF700D6B58C00BD6B1800BD5A0000C6732100BD631000AD4A
      00009C5A2900C6B5AD00FFFFFF0000000000F7EFDE00CE944A00CE8C42000808
      000052391800CE8C4200BD843900000000006B4A2100CE8C4200CE8C4200E7CE
      A5002163F700184AB50000001000082963001042A50008184200000000001042
      A5002163F7003973F700EFEFFF0000000000FFFFFF00B5E7BD0039C65A0029C6
      5A004ACE6B00C6EFCE008CE7A50029BD420010A5290031943900CED6CE000000
      0000FFFFFF00E7CEAD00C6731000C66B0000CE7B1800F7E7CE00E7B58400BD5A
      0000AD4A00009C5A2900DED6CE0000000000D69C5A00CE8C4200CE8C4200B57B
      3900B57B3900CE8C4200A5733100000000006B4A2100CE8C4200CE8C4200E7CE
      A5002163F70008215200001031002163F7002163F7002163F7001852C6002163
      F7002163F7002163F7004A84F700F7F7FF00F7FFF7006BD6840039CE6B0052D6
      7300CEF7D600FFFFFF00F7FFFF0094E7A50029BD4200109C290084AD8400FFFF
      FF00FFF7F700D69C5200CE730000CE730000D6841800FFEFDE00EFC69400C663
      0000BD5A0000AD4A0000B5948400FFFFFF00CE8C4200CE8C4200CE8C4200CE8C
      4200CE8C42007B5229000808000008080000BD843900CE8C4200CE8C4200E7CE
      A5002163F70000000000103184002163F7002163F7002163F7002163F7002163
      F7002163F7002163F7002163F7006B9CF700E7F7E70063DE84005AD67B00CEF7
      D600E7FFEF00F7FFF700EFFFEF00F7FFF70094E7A50021B539005AA56300F7F7
      F700F7EFDE00DE943900DE9C3900E7A55A00DE943100FFEFDE00EFC69C00D68C
      3100DE9C5A00BD6B1800AD735200F7F7F700CE8C4200CE8C4200CE8C4200BD84
      3900291808000000000052391800BD843900CE8C4200CE8C4200CE8C4200E7CE
      A5002163F70000000000103184002163F7002163F7002163F7002163F7002163
      F7002163F7002163F7002163F700B5CEFF00DEF7E7006BE78C0084DE9400B5EF
      C60073DE8C00E7F7E700A5EFB50094E7AD00C6F7CE0042C65A0052A55A00F7F7
      F700FFEFD600E79C3900EFAD6300FFF7EF00F7DEBD00FFF7EF00F7DEC600FFEF
      DE00F7E7D600CE7B3100B57B4A00F7F7F700D69C5A00CE8C4200CE8C42005239
      180008080000A5733100CE8C4200CE8C4200CE8C4200CE8C4200CE8C4200E7CE
      A5002163F70000001000102973002163F7002163F7002163F7002163F7002163
      F7002163F7002163F70084ADFF0000000000EFFFF70084EFA50063EF8C0052EF
      840052E78400DEF7E7009CE7AD0039D66B0031CE630021BD4A007BBD8400FFFF
      FF00FFF7EF00EFAD5200EF9C2100EFB56300FFF7EF00FFFFFF00FFFFFF00F7E7
      D600D68C3900BD630000C6947300FFFFFF00FFEFE700CE945200CE8C42003121
      100029180800CE8C4200A573310031211000A5733100CE8C4200CE8C4200E7CE
      A5002163F7000829630000082100215AE7002163F7001852C600103994002163
      F7002163F7005A8CF700FFFFFF0000000000FFFFFF00ADEFBD0084F7A50063F7
      94005AEF8400DEF7E70094E7A50039D66B0031CE630039BD5200CEDECE000000
      0000FFFFFF00F7C68C00F7AD3900F79C1000EFB56300FFF7EF00F7E7CE00DE94
      3100CE730000BD6B1800E7D6C6000000000000000000F7E7CE00CE8C4A00845A
      290000000000523918002918080008080000BD843900CE8C4200CE8C4200E7CE
      A5002163F700185AD6000010310000103100102973000000100000103100185A
      D6003973F700EFF7FF00000000000000000000000000EFFFF7009CF7B50084FF
      AD0063EF940084E79C0063DE7B0039D66B0039CE63009CD6A500FFFFFF000000
      000000000000FFF7E700F7BD6B00FFAD3900F79C1800EFA55200DE942900D67B
      0000CE7B1000DEB59400FFFFFF00000000000000000000000000EFD6BD00CE8C
      4200946331006B4A21006B4A2100BD843900CE8C4200CE8C4200CE8C4200E7CE
      A5002163F700296BF7002163F7001852C600184AB5001852C6002163F7002163
      F700D6E7FF000000000000000000000000000000000000000000EFFFF700ADF7
      C60084EFA50073E7940063DE8C0073DE8C00BDE7C600FFFFFF00000000000000
      00000000000000000000FFF7E700F7CE8C00EFAD5200E7A53900DE9C3100DE9C
      4A00EFCEB500FFFFFF000000000000000000000000000000000000000000E7C6
      9C00CE8C4200DEBD8C00EFD6B500EFD6B500EFD6B500EFD6B500EFD6B500F7EF
      DE007BA5F7007BA5F7007BA5F7007BA5F7007BA5F700427BF7002163F700ADC6
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00EFFFF700E7FFE700E7F7E700F7FFF7000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFF7EF00FFEFDE00FFEFDE00FFFF
      F70000000000000000000000000000000000424D3E000000000000003E000000
      2800000030000000180000000100010000000000C00000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000C0000FF0FF0F0000C00007C03C030000
      8000038018010000000001001001000000000000000000000000000000000000
      0000000000000000000001000000000000000100100100008000038018010000
      C00007C03C030000E0000FE0FE0F000000000000000000000000000000000000
      000000000000}
  end
  object PopupMenu1: TPopupMenu
    OnPopup = ListView5Click
    Left = 112
    Top = 112
    object N1: TMenuItem
      Caption = #205#229' '#239#238#234#224#231#251#226#224#242#252' '#253#242#238#242' '#239#224#234#229#242
      OnClick = tbtnFilterDelClick
    end
    object N2: TMenuItem
      Caption = #196#238#225#224#226#232#242#252' '#253#242#238#242' '#239#224#234#229#242' '#226' '#239#238#241#251#235#234#243
      OnClick = tbtnToSendClick
    end
  end
  object dlgSaveLog: TSaveDialog
    DefaultExt = '*.pLog'
    Filter = #203#238#227' '#239#224#234#229#242#238#226' (*.pLog)|*.pLog|'#194#241#229' '#244#224#233#235#251' (*.*)|*.*'
    FilterIndex = 0
    Options = [ofOverwritePrompt, ofHideReadOnly, ofExtensionDifferent, ofEnableSizing]
    Left = 16
    Top = 144
  end
  object timerSend: TTimer
    Enabled = False
    Interval = 250
    OnTimer = timerSendTimer
    Left = 79
    Top = 112
  end
  object dlgSaveLogRaw: TSaveDialog
    DefaultExt = '*.rawLog'
    Filter = #203#238#227' '#239#224#234#229#242#238#226' (*.rawLog)|*.rawLog|'#194#241#229' '#244#224#233#235#251' (*.*)|*.*'
    FilterIndex = 0
    Options = [ofOverwritePrompt, ofHideReadOnly, ofExtensionDifferent, ofEnableSizing]
    Left = 16
    Top = 112
  end
  object DlgSavePacket: TSaveDialog
    DefaultExt = '*.pckt'
    Filter = #196#229#234#240#232#239#242#238#226#224#237#251#229' '#239#224#234#229#242#251' (*.pckt)|*.pckt|'#194#241#229' '#244#224#233#235#251' (*.*)|*.*'
    FilterIndex = 0
    Options = [ofOverwritePrompt, ofHideReadOnly, ofExtensionDifferent, ofEnableSizing]
    Left = 16
    Top = 208
  end
  object DlgOpenPacket: TOpenDialog
    DefaultExt = '*.pckt'
    Filter = #196#229#234#240#232#239#242#238#226#224#237#251#229' '#239#224#234#229#242#251' (*.pckt)|*.pckt|'#194#241#229' '#244#224#233#235#251' (*.*)|*.*'
    FilterIndex = 0
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 48
    Top = 208
  end
  object DlgOpenScript: TOpenDialog
    DefaultExt = '*.script'
    Filter = #212#224#233#235' '#241#234#240#232#239#242#224' (*.script)|*.script|'#194#241#229' '#244#224#233#235#251' (*.*)|*.*'
    FilterIndex = 0
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 48
    Top = 240
  end
  object dlgSaveScript: TSaveDialog
    DefaultExt = '*.script'
    Filter = #212#224#233#235' '#241#234#240#232#239#242#224' (*.script)|*.script|'#194#241#229' '#244#224#233#235#251' (*.*)|*.*'
    FilterIndex = 0
    Options = [ofOverwritePrompt, ofHideReadOnly, ofExtensionDifferent, ofEnableSizing]
    Left = 16
    Top = 240
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
      'TL2PacketHackMain.Caption'
      'ListView5.Hint')
    UseInheritedData = True
    AutoSkipEmpties = True
    NumOfLanguages = 2
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
      'MasterFields'
      'TabStops'
      'SyntaxType')
    Left = 392
    Top = 8
    TranslationData = {
      737443617074696F6E730D0A54616253686565743101CFF0EEF1ECEEF2F00156
      696577010D0A47726F7570426F78313201CBEEE320EFE0EAE5F2EEE23A015061
      636B6574206C6F673A010D0A54616253686565743201CFEEF1FBEBEAE0015061
      636B65742073656E64010D0A54616253686565743301C4EEEFEEEBEDE8F2E5EB
      FCEDEE014164646974696F6E616C010D0A47726F7570426F783801D1EAF0E8EF
      F220E2FBEFEEEBEDFFE5ECFBE920EFEE20EDE0E6E0F2E8FE20EAEDEEEFEAE820
      C2FBEFEEEBEDE8F2FC3A0153696D706C65207363727970742077686174207769
      6C6C206265206578656375746564207768656E2052756E20627574746F6E2070
      7573686564010D0A4C6162656C3301CFE5F0E5F1F2F0E0E8E2E0E5F2F1FF20F1
      EFE8F1EEEA20EFE0EAE5F2EEE22E2E2E01576F726B696E672E2E2E010D0A4E31
      01CDE520EFEEEAE0E7FBE2E0F2FC20FDF2EEF220EFE0EAE5F201446F206E6F74
      2073686F772074686973207061636B6574010D0A4E3201C4EEE1E0E2E8F2FC20
      FDF2EEF220EFE0EAE5F220E220EFEEF1FBEBEAF3014164642074686973207061
      636B657420746F207061636B65742073656E646572010D0A47726F7570426F78
      3701CFE0EAE5F2FB20EDE020EEF2EFF0E0E2EAF33A015061636B65747320666F
      722073656E643A010D0A53706C61736801C4E0EDEDEEE520F1EEE5E4E8EDE5ED
      E8E520EFF0EEEFF3F9E5EDEE20F7E5F0E5E720536F636B6574456E67696E6520
      E220F0E5E6E8ECE52022EDE520E4E5F8E8F4F0EEE2E0F2FC20F2F0E0F4E8EA22
      191AC8EDF4EEF0ECE0F6E8FF20EE20F1EEE5E4E8EDE5EDE8E820EDE520E1F3E4
      E5F220E4EEF1F2F3EFEDE00122446F206E6F7420646563727970742074726166
      6669636B22206D6F6465207761732061637469766174656420666F7220746869
      7320636F6E6E656374696F6E2E191A4E6F20696E666F726D6174696F6E206162
      6F757420636F6E6E656374696F6E20617661696C61626C652E010D0A4C616265
      6C310120B1C8EDF2E5F0E2E0EB20012020B120496E74657276616C010D0A6274
      6E52656752756C6555706461746501CFF0E8ECE5EDE8F2FC014170706C79010D
      0A63686B52656752756C6501D4E8EBFCF2F0EEE2E0F2FC20EFEE20EFF0E0E2E8
      EBF301546F2066696C74657220627920612072756C65010D0A546F6F6C427574
      746F6E3201546F6F6C427574746F6E3201010D0A737448696E74730D0A746274
      6E5361766501D1EEF5F0E0EDE8F2FC20EBEEE320EAE0EA2E2E2E015361766520
      7061636B6574206C6F672061732E2E2E010D0A7462746E436C65617201CEF7E8
      F1F2E8F2FC20EBEEE301436C656172206C6F67010D0A7462746E46696C746572
      44656C01D3E1F0E0F2FC20E2F1E520EFE0EAE5F2FB20F2E5EAF3F9E5E3EE20F2
      E8EFE020E8E720F4E8EBFCF2F0E00144656C65746520616C6C207061636B6574
      73206F662073616D6520747970652066726F6D2066696C746572010D0A746274
      6E44656C65746501D3E4E0EBE8F2FC20E8E720EBEEE3E00144656C6574652066
      726F6D207061636B6574206C69737420287065726D616E656E7429010D0A7462
      746E546F53656E6401C4EEE1E0E2E8F2FC20EFE0EAE5F220E220CFEEF1FBEBEA
      F3014164642074686973207061636B657420746F207061636B65742073656E64
      6572010D0A546F6F6C427574746F6E3401CFE0EAE5F2FB20EEF220F1E5F0E2E5
      F0E00146726F6D20736572766572010D0A546F6F6C427574746F6E3301CFE0EA
      E5F2FB20EEF220EAEBE8E5EDF2E00146726F6D20636C69656E74010D0A546F6F
      6C427574746F6E3501D1EBE5E4E8F2FC20E7E020EFEEF1EBE5E4EDE8EC20EFF0
      E8F8E5E4F8E8EC20EFE0EAE5F2EEEC014175746F207363726F6F6C646F776E01
      0D0A42746E4175746F5361766550636B747301D1EEF5F0E0EDFFF2FC20EBEEE3
      20EFE5F0E5E420E0E2F2EE20EEF7E8F1F2EAEEE90153617665206C6F67206265
      666F7265206175746F636C656172010D0A546F6F6C427574746F6E3601CFEEEA
      E0E7E0F2FC2FF1EFF0FFF2E0F2FC20F4E8EBFCF2F0FB0153686F772F48696465
      2066696C74657273010D0A546F6F6C427574746F6E313701CFEEEAE0E7FBE2E0
      F2FC20F1ECE5F9E5EDE8E520E2204865782F4465630153686F77206F66667365
      7420696E206865782F646563010D0A546F6F6C427574746F6E333701CDE520E7
      E0EAF0FBE2E0F2FC20FDF2EEF220F4F0E5E9EC20EFEEF1EBE520E4E8F1EAEEED
      EDE5EAF2E020F1E2FFE7E0EDEEE3EE20F120EDE8EC20F1EEE5E4E8EDE5EDE8FF
      01446F206E6F7420636C6F73652074686973206672616D652061667465722064
      6973636F6E6E656374010D0A546F6F6C427574746F6E333801D3E1E8F2FC20F1
      EEE5E4E8EDE5EDE8E520E82028E8EBE82920C7E0EAF0FBF2FC20E4E0EDEDFBE9
      20F4F0E5E9EC01436C6F73652077696E646F772028616E6420636F6E6E656374
      696F6E29010D0A546F6F6C427574746F6E3801C7E0EAF0FBF2FC20E4E0EDEDFB
      E920EBEEE301436C6F7365206C6F67010D0A53617665426E7401D1EEF5F0E0ED
      E8F2FC20EFE0EAE5F2FB0153617665207061636B6574287329010D0A4F70656E
      42746E01C7E0E3F0F3E7E8F2FC20EFE0EAE5F2FB014C6F6164207061636B6574
      287329010D0A546F53657276657201CEF2EFF0E0E2EBFFF2FC20EDE020F1E5F0
      E2E5F00177696C6C2073656E642073656E6420746F20736572766572010D0A54
      6F436C69656E7401CEF2EFF0E0E2EBFFF2FC20EDE020EAEBE8E5EDF20177696C
      6C2073656E6420746F20636C69656E74010D0A456163684C696E655061636B65
      7401CAE0E6E4E0FF20F1F2F0EEEAE020FDF2EE20EEF2E4E5EBFCEDFBE920EFE0
      EAE5F20145616368206C696E65203D206E6577207061636B6574010D0A53656E
      6442746E01CEF2EFF0E0E2E8F2FC0153454E44010D0A53656E64427954696D65
      7201CEF2EFF0E0E2EBFFF2FC20EFEE20F2E0E9ECE5F0F320EAE0E6E4FBE520F5
      F5F520F1E5EAF3EDE40153656E642062792074696D6572206561636820787878
      20736563010D0A4A765370696E456469743201CFEEE3F0E5F8EDEEF1F2FC20F2
      E0E9ECE5F0E00154696D657220696E74657276616C010D0A546F6F6C42757474
      6F6E333001CDE520E7E0EAF0FBE2E0F2FC20FDF2EEF220F4F0E5E9EC20EFEEF1
      EBE520E4E8F1EAEEEDEDE5EAF2E020F1E2FFE7E0EDEEE3EE20F120EDE8EC20F1
      EEE5E4E8EDE5EDE8FF01446F206E6F7420636C6F73652074686973206672616D
      6520616674657220646973636F6E6E656374010D0A546F6F6C427574746F6E33
      3101D3E1E8F2FC20F1EEE5E4E8EDE5EDE8E520E82028E8EBE82920C7E0EAF0FB
      F2FC20E4E0EDEDFBE920F4F0E5E9EC01436C6F73652077696E646F772028616E
      6420636F6E6E656374696F6E29010D0A546F6F6C427574746F6E323501D1EEF5
      F0E0EDE8F2FC20F1EAF0E8EFF2015361766520736372697074010D0A546F6F6C
      427574746F6E323701C7E0E3F0F3E7E8F2FC20F1EAF0E8EFF220E8E720F4E0E9
      EBE0014C6F616420736372697074010D0A62746E4578656375746501C2FBEFEE
      EBEDE8F2FC20F1EAF0E8EFF2014578656375746520736372697074010D0A6274
      6E5465726D696E61746501CFF0E5F0E2E0F2FC20E2FBEFEEEBEDE5EDE8E520F1
      EAF0E8EFF2E0015465726D696E61746520736372697074010D0A52656C6F6164
      5468697301CEE1EDEEE2E8F2FC0152656672657368010D0A62746E50726F6365
      73735061636B65747301CEE1F0E0E1E0F2FBE2E0F2FC20EFE0EAE5F2FB015061
      727365207061636B657473010D0A4A765370696E45646974310122CFEEE3F0E5
      F8EDEEF1F2FC20F1F0E0E1E0F2FBE2E0EDE8FF2220B120D1E5EA01696E746572
      76616C20B120536563010D0A7374446973706C61794C6162656C730D0A737446
      6F6E74730D0A546656697375616C014D532053616E7320536572696601010D0A
      4C6973745669657735014D532053616E7320536572696601010D0A4D656D6F34
      01436F7572696572204E657701010D0A53706C617368014D532053616E732053
      6572696601010D0A4C6162656C3101417269616C204E6172726F7701010D0A73
      744D756C74694C696E65730D0A7374446C677343617074696F6E730D0A576172
      6E696E67015761726E696E67015761726E696E67010D0A4572726F7201457272
      6F72014572726F72010D0A496E666F726D6174696F6E01496E666F726D617469
      6F6E01496E666F726D6174696F6E010D0A436F6E6669726D01436F6E6669726D
      01436F6E6669726D010D0A59657301265965730126596573010D0A4E6F01264E
      6F01264E6F010D0A4F4B014F4B014F4B010D0A43616E63656C0143616E63656C
      0143616E63656C010D0A41626F7274012641626F7274012641626F7274010D0A
      52657472790126526574727901265265747279010D0A49676E6F726501264967
      6E6F7265012649676E6F7265010D0A416C6C0126416C6C0126416C6C010D0A4E
      6F20546F20416C6C014E266F20746F20416C6C014E266F20746F20416C6C010D
      0A59657320546F20416C6C0159657320746F2026416C6C0159657320746F2026
      416C6C010D0A48656C70012648656C70012648656C70010D0A7374537472696E
      67730D0A4944535F313801C2FB20F3E2E5F0E5EDFB20F7F2EE20F5EEF2E8F2E5
      20E2FBE9F2E820E8E720EFF0EEE3F0E0ECECFB3F0141726520796F7520737572
      65203F010D0A4944535F313901C2F1E520F1EEE5E4E8EDE5EDE8FF20EFF0E5F0
      E2F3F2F1FF2101416C6C20636F6E6E656374696F6E732077696C6C2062652063
      6C6F73656421010D0A4944535F3601CFEEE4E4E5F0E6E0F2FC20EFF0EEE5EAF2
      3A01537570706F727420746869732070726F6A6563743A010D0A4944535F3901
      D1F2E0F0F2F3E5F2204C32706820760153746172747570206F66204C32706820
      76010D0A627974650120E1E0E9F228E029012062797465287329010D0A656E64
      62015BCAEEEDE5F620EFEEE2F2EEF0FFFEF9E5E3EEF1FF20E1EBEEEAE0202001
      5B456E64206F662072657065617420626C6F636B2020010D0A4944535F313039
      01C2FBE4E5EBE5EDEDFBE920EFE0EAE5F23A20F2E8EF202D2030780153656C65
      63746564207061636B6574203A2074797065202D3078010D0A4944535F313236
      01C2F0E5ECFF20EFF0E8F5EEE4E03A20015265636976652074696D653A20010D
      0A4944535F32333201C2FBE4E5EBE5EDEDFBE920EFE0EAE5F23A0153656C6563
      746564207061636B65743A010D0A7265616C6C7977616E743201E5F1EBE820EE
      EDEE20F1F3F9E5F1F2E2F3E5F22E20C2FB20F3E2E5F0E5EDFB203F0141726520
      796F752073757265203F010D0A7265616C6C7977616E7401DDF2EE20E4E5E9F1
      F2E2E8E520E7E0EAF0EEE5F220E4E0EDEDFBE920E4E8E0EBEEE320E820EFF0E5
      F0E2E5F220F2E5EAF3F9E5E520F1EEE5E4E8EDE5EDE8E501546869732077696C
      6C20636C6F73652074686973206469616C6F6720616E6420636F6E6E65637469
      6F6E2E010D0A73697A65012C20F0E0E7ECE5F0202D20012C2073697A65202D20
      010D0A73697A65320150E0E7ECE5F03A200153697A653A20010D0A736B697020
      73637279707401CFF0EEEFF3F1EAE0E5EC20F1EAF0E8EFF201536B6970207363
      72697074010D0A736B697001CFF0EEEFF3F1EAE0E5EC2001536B697020010D0A
      737461727462015BCDE0F7E0EBEE20EFEEE2F2EEF0FFFEF9E5E3EEF1FF20E1EB
      EEEAE020015B626567696E206F662072657065617420626C6F636B2020010D0A
      7479706530780154E8EF3A20307801547970654C203078010D0A756E6B6E6F77
      696E6401CDE5E8E7E2E5F1F2EDFBE920E8E4E5EDF2E8F4E8EAE0F2EEF0202D3E
      203F286E616D65292101556E6B6E6F776E20696E646566696361746F72202D3E
      203F286E616D652921010D0A73744F74686572537472696E67730D0A646C6753
      6176654C6F672E46696C74657201CBEEE320EFE0EAE5F2EEE220282A2E704C6F
      67297C2A2E704C6F677CC2F1E520F4E0E9EBFB20282A2E2A297C2A2E2A015061
      636B6574206C6F6720282A2E704C6F67297C2A2E704C6F677C416C6C2066696C
      657320282A2E2A297C2A2E2A010D0A646C67536176654C6F675261772E46696C
      74657201CBEEE320EFE0EAE5F2EEE220282A2E7261774C6F67297C2A2E726177
      4C6F677CC2F1E520F4E0E9EBFB20282A2E2A297C2A2E2A015061636B65742052
      4157206C6F6720282A2E7261774C6F67297C2A2E7261774C6F677C416C6C2066
      696C657320282A2E2A297C2A2E2A010D0A446C67536176655061636B65742E46
      696C74657201C4E5EAF0E8EFF2EEE2E0EDFBE520EFE0EAE5F2FB20282A2E7063
      6B74297C2A2E70636B747CC2F1E520F4E0E9EBFB20282A2E2A297C2A2E2A0150
      61636B657428732920282A2E70636B74297C2A2E70636B747C416C6C2066696C
      657320282A2E2A297C2A2E2A010D0A446C674F70656E5061636B65742E46696C
      74657201C4E5EAF0E8EFF2EEE2E0EDFBE520EFE0EAE5F2FB20282A2E70636B74
      297C2A2E70636B747CC2F1E520F4E0E9EBFB20282A2E2A297C2A2E2A01706163
      6B657428732920282A2E70636B74297C2A2E70636B747C416C6C2066696C6573
      20282A2E2A297C2A2E2A010D0A446C674F70656E5363726970742E46696C7465
      7201D4E0E9EB20F1EAF0E8EFF2E020282A2E736372697074297C2A2E73637269
      70747CC2F1E520F4E0E9EBFB20282A2E2A297C2A2E2A01536372697074206669
      6C6520282A2E736372697074297C2A2E7363726970747C416C6C2066696C6573
      20282A2E2A297C2A2E2A010D0A646C67536176655363726970742E46696C7465
      7201D4E0E9EB20F1EAF0E8EFF2E020282A2E736372697074297C2A2E73637269
      70747CC2F1E520F4E0E9EBFB20282A2E2A297C2A2E2A01536372697074206669
      6C6520282A2E736372697074297C2A2E7363726970747C416C6C2066696C6573
      20282A2E2A297C2A2E2A010D0A73744C6F63616C65730D0A7374436F6C6C6563
      74696F6E730D0A4C69737456696577352E436F6C756D6E735B305D2E43617074
      696F6E014E6F01010D0A4C69737456696577352E436F6C756D6E735B315D2E43
      617074696F6E0173697A6501010D0A4C69737456696577352E436F6C756D6E73
      5B325D2E43617074696F6E01496401010D0A4C69737456696577352E436F6C75
      6D6E735B335D2E43617074696F6E014E616D6501010D0A737443686172536574
      730D0A546656697375616C0144454641554C545F434841525345540144454641
      554C545F43484152534554010D0A4C69737456696577350144454641554C545F
      434841525345540144454641554C545F43484152534554010D0A4D656D6F3401
      44454641554C545F434841525345540144454641554C545F4348415253455401
      0D0A53706C6173680144454641554C545F434841525345540144454641554C54
      5F43484152534554010D0A4C6162656C31015255535349414E5F434841525345
      540144454641554C545F43484152534554010D0A}
  end
  object PerlRegEx: TPerlRegEx
    Options = [preCaseLess]
    Left = 360
    Top = 8
  end
end
