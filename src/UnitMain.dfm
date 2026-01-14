object FormMain: TFormMain
  Left = 192
  Top = 124
  Width = 800
  Height = 600
  Caption = 'Sistema de Gesti'#243'n de Parking - Universidad de Zaragoza'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object LabelTitulo: TLabel
    Left = 16
    Top = 16
    Width = 441
    Height = 24
    Caption = 'Sistema de Gesti'#243'n de Parking - UNIZAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object PageControl1: TPageControl
    Left = 16
    Top = 56
    Width = 753
    Height = 497
    ActivePage = TabSheetEntrada
    TabOrder = 0
    object TabSheetEntrada: TTabSheet
      Caption = 'Registrar Entrada'
      object PanelEntrada: TPanel
        Left = 0
        Top = 0
        Width = 745
        Height = 469
        Align = alClient
        TabOrder = 0
        object LabelMatriculaEntrada: TLabel
          Left = 24
          Top = 24
          Width = 100
          Height = 13
          Caption = 'Matr'#237'cula del Veh'#237'culo:'
        end
        object LabelCampus: TLabel
          Left = 24
          Top = 72
          Width = 97
          Height = 13
          Caption = 'Seleccione Campus:'
        end
        object LabelLocalidadEntrada: TLabel
          Left = 24
          Top = 120
          Width = 50
          Height = 13
          Caption = 'Localidad:'
        end
        object EditMatriculaEntrada: TEdit
          Left = 144
          Top = 20
          Width = 200
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
        end
        object ComboBoxCampus: TComboBox
          Left = 144
          Top = 68
          Width = 400
          Height = 21
          Style = csDropDownList
          TabOrder = 1
          OnChange = ComboBoxCampusChange
        end
        object ButtonRegistrarEntrada: TButton
          Left = 24
          Top = 160
          Width = 200
          Height = 35
          Caption = 'Registrar Entrada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = ButtonRegistrarEntradaClick
        end
        object EditLocalidadEntrada: TEdit
          Left = 144
          Top = 116
          Width = 200
          Height = 21
          Color = clBtnFace
          Enabled = False
          ReadOnly = True
          TabOrder = 3
        end
        object MemoInfoEntrada: TMemo
          Left = 24
          Top = 208
          Width = 697
          Height = 241
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 4
        end
      end
    end
    object TabSheetSalida: TTabSheet
      Caption = 'Registrar Salida'
      ImageIndex = 1
      object PanelSalida: TPanel
        Left = 0
        Top = 0
        Width = 745
        Height = 469
        Align = alClient
        TabOrder = 0
        object LabelMatriculaSalida: TLabel
          Left = 24
          Top = 24
          Width = 100
          Height = 13
          Caption = 'Matr'#237'cula del Veh'#237'culo:'
        end
        object EditMatriculaSalida: TEdit
          Left = 144
          Top = 20
          Width = 200
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
        end
        object ButtonRegistrarSalida: TButton
          Left = 24
          Top = 64
          Width = 200
          Height = 35
          Caption = 'Registrar Salida'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = ButtonRegistrarSalidaClick
        end
        object MemoInfoSalida: TMemo
          Left = 24
          Top = 112
          Width = 697
          Height = 337
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 2
        end
      end
    end
    object TabSheetConsulta: TTabSheet
      Caption = 'Consultar Registros'
      ImageIndex = 2
      object PanelConsulta: TPanel
        Left = 0
        Top = 0
        Width = 745
        Height = 469
        Align = alClient
        TabOrder = 0
        object LabelRegistrosActivos: TLabel
          Left = 24
          Top = 16
          Width = 200
          Height = 13
          Caption = 'Veh'#237'culos actualmente en parking: 0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ListBoxRegistros: TListBox
          Left = 24
          Top = 72
          Width = 697
          Height = 169
          ItemHeight = 13
          TabOrder = 0
          OnClick = ListBoxRegistrosClick
        end
        object ButtonActualizarLista: TButton
          Left = 24
          Top = 40
          Width = 200
          Height = 25
          Caption = 'Actualizar Lista'
          TabOrder = 1
          OnClick = ButtonActualizarListaClick
        end
        object MemoDetalleRegistro: TMemo
          Left = 24
          Top = 256
          Width = 697
          Height = 193
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 2
        end
      end
    end
  end
end
