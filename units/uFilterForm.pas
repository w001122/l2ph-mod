unit uFilterForm;

interface

uses
  PerlRegEx,
  inifiles,
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ExtCtrls,
  ComCtrls,
  siComp,
  JvExComCtrls,
  JvListView;

type
  TfPacketFilter = class (TForm)
    PageControl2 : TPageControl;
    TabSheet1 : TTabSheet;
    TabSheet7 : TTabSheet;
    Panel17 : TPanel;
    Button1 : TButton;
    Button13 : TButton;
    UpdateBtn : TButton;
    lang : TsiLang;
    ListView1 : TJvListView;
    ListView2 : TJvListView;
    ButtonCleanAll : TButton;
    EditSearchById : TEdit;
    Label1 : TLabel;
    Label2 : TLabel;
    EditSearchByName : TEdit;
    procedure Button1Click(Sender : TObject);
    procedure Button13Click(Sender : TObject);
    procedure FormCreate(Sender : TObject);
    procedure FormDestroy(Sender : TObject);
    procedure UpdateBtnClick(Sender : TObject);
    procedure ButtonCleanAllClick(Sender : TObject);
    procedure EditSearchByIdChange(Sender : TObject);
    procedure EditSearchByNameChange(Sender : TObject);
  protected
    procedure CreateParams(var Params : TCreateParams); override;
  public
    procedure refreshexisting;
    procedure LoadPktIni(s : string);
    procedure LoadPacketsIni;
    { Public declarations }
  end;

var
  fPacketFilter : TfPacketFilter;

implementation

uses
  uMain,
  uGlobalFuncs,
  uData,
  uSocketEngine;

{$R *.dfm}

procedure TfPacketFilter.Button1Click(Sender : TObject);
var
  i : integer;
begin
  if PageControl2.ActivePageIndex = 0 then
  begin
    for i := 0 to ListView1.Items.Count - 1 do
    begin
      ListView1.Items.Item[i].Checked := true;
    end;
  end
  else
  begin
    for i := 0 to ListView2.Items.Count - 1 do
    begin
      ListView2.Items.Item[i].Checked := true;
    end;
  end;
end;

procedure TfPacketFilter.ButtonCleanAllClick(Sender : TObject);
var
  i : integer;
  li : TListItems;
begin
  if PageControl2.ActivePageIndex = 0 then
  begin
    li := ListView1.Items;
  end
  else
  begin
    li := ListView2.Items;
  end;
  with li do
  begin
    for I := 0 to Count - 1 do
    begin
      item[i].Checked := false;
    end;
  end;
end;

procedure TfPacketFilter.Button13Click(Sender : TObject);
var
  i : integer;
begin
  if PageControl2.ActivePageIndex = 0 then
  begin
    with ListView1.Items do
    begin
      for i := 0 to ListView1.Items.Count - 1 do
      begin
        Item[i].Checked := not Item[i].Checked;
      end;
    end;
  end
  else
  begin
    with ListView2.Items do
    begin
      for i := 0 to ListView2.Items.Count - 1 do
      begin
        Item[i].Checked := not Item[i].Checked;
      end;
    end;
  end;
end;

procedure TfPacketFilter.FormCreate(Sender : TObject);
begin
  loadpos(self);

  PacketsFromS := TStringList.Create;
  PacketsFromC := TStringList.Create;
  PacketsNames := TStringList.Create;
end;

procedure TfPacketFilter.FormDestroy(Sender : TObject);
begin
  savepos(self);

  PacketsFromC.Destroy;
  PacketsFromS.Destroy;
  PacketsNames.Destroy;
  if assigned(PacketsINI) then
  begin
    PacketsINI.Destroy;
  end;
end;

procedure TfPacketFilter.LoadPktIni(s : string);
var
  FromS : boolean;
  i : integer;
  temp : string;
//  BColor: TColor;
begin
  fromS := false;
  ListView1.Items.BeginUpdate;
  ListView2.Items.BeginUpdate;
  try
    // ������� ������
    ListView1.Clear;
    ListView2.Clear;
    PacketsFromS.Clear;
    PacketsFromC.Clear;
    PacketsNames.Clear;
    //��������� packets.ini
    PacketsNames.LoadFromFile(AppPath + 'settings\' + s);
    for i := 0 to PacketsNames.Count - 1 do
    begin
      temp := copy(PacketsNames[i], 1, 2); //����� � ������ ������� ��� ������� 
      if temp = '//' then
      begin
        continue;
      end; //�����������, ���������� ��
      if PacketsNames[i] = '' then
      begin
        continue;
      end;     //������ ������, ���������� ��
      if uppercase(PacketsNames[i]) = '[CLIENT]' then
      begin
        fromS := false;
        continue;
      end;   //��������� � ��������� �������� �����
      if uppercase(PacketsNames[i]) = '[SERVER]' then
      begin
        fromS := true;
        continue;
      end;    //��������� � ��������� �������� �����
      if not fromS then
      begin // ���������� ������
        with ListView2.Items.Add do
        begin
          Caption := PacketsNames.Names[i];
          Checked := true;
          SubItems.Add(GetNamePacket(PacketsNames.ValueFromIndex[i]));
          PacketsFromC.Append(PacketsNames.Names[i] + '=' + (GetNamePacket(PacketsNames.ValueFromIndex[i])));
        end;
      end
      else   //��������� ������
      begin
        with ListView1.Items.Add do
        begin
          Caption := PacketsNames.Names[i];
          Checked := true;
          SubItems.Add(GetNamePacket(PacketsNames.ValueFromIndex[i]));
          PacketsFromS.Append(PacketsNames.Names[i] + '=' + (GetNamePacket(PacketsNames.ValueFromIndex[i])));
        end;
      end;
    end;
    //��������� packets.ini
    //������ ������� ��� ������� �������
    if PacketsINI <> nil then
    begin
      PacketsINI.Free;
    end;
    PacketsINI := TMemIniFile.Create(AppPath + 'settings\' + s);
  finally
    ListView1.Items.EndUpdate;
    ListView2.Items.EndUpdate;
  end;
end;

procedure TfPacketFilter.LoadPacketsIni;
var
  i : integer;
begin
  //��� ������ ���������������� packets???.ini
  case GlobalProtocolVersion of
    AION :
    begin
      LoadPktIni('packetsAion21.ini');
    end;       //������ ��� AION v 2.1 - 2.6
    AION27 :
    begin
      LoadPktIni('packetsAion27.ini');
    end;   //������ ��� AION v 2.7 - ���� ������� ID
    CHRONICLE4 :
    begin
      LoadPktIni('packetsC4.ini');
    end;   //������ ��� �4
    CHRONICLE5 :
    begin
      LoadPktIni('packetsC5.ini');
    end;   //������ ��� C5
    INTERLUDE :
    begin
      LoadPktIni('packetsInterlude.ini');
    end;        //������ ��� ����������
    GRACIA :
    begin
      LoadPktIni('packetsGracia.ini');
    end;              //������ ��� ������
    GRACIAFINAL :
    begin
      LoadPktIni('packetsGraciaFinal.ini');
    end;    //������ ��� ������ �����
    GRACIAEPILOGUE :
    begin
      LoadPktIni('packetsGraciaEpilogue.ini');
    end;  //������ ��� ������ ������
    FREYA :
    begin
      LoadPktIni('packetsFreya.ini');
    end;                    //������ ��� Freya
    HIGHFIVE :
    begin
      LoadPktIni('packetsHighFive.ini');
    end;              //������ ��� High Five
    GOD :
    begin
      LoadPktIni('packetsGOD.ini');
    end;                        //������ ��� Goddess of Destruction
    ERTHEIA :
    begin
      LoadPktIni('packetsErtheia.ini');
    end;
    INFINITEODYSSEY :
    begin
      LoadPktIni('packetsOdyssey.ini');
    end;
    CLASSIC :
    begin
      LoadPktIni('packetsClassic.ini');
    end;
  end;

  filterS := Options.ReadString('Snifer', 'notFS', '');
  filterC := Options.ReadString('Snifer', 'notFC', '');

  for i := 0 to (ListView1.Items.Count) - 1 do
  begin
    ListView1.Items.Item[i].Checked := pos('/' + ListView1.Items.Item[i].Caption + '/', filterS) = 0;
  end;

  for i := 0 to (ListView2.Items.Count) - 1 do
  begin
    ListView2.Items.Item[i].Checked := pos('/' + ListView2.Items.Item[i].Caption + '/', filterC) = 0;
  end;
end;

procedure TfPacketFilter.UpdateBtnClick(Sender : TObject);
var
  i : integer;
begin
  filterS := '/';
  i := 0;
  while i < ListView1.Items.Count do
  begin
    if not ListView1.Items.Item[i].Checked then
    begin
      filterS := filterS + ListView1.Items.Item[i].Caption + '/';
    end;
    inc(i);
  end;
  Options.WriteString('Snifer', 'notFS', filterS);
  filterC := '/';
  i := 0;
  while i < ListView2.Items.Count do
  begin
    if not ListView2.Items.Item[i].Checked then
    begin
      filterC := filterC + ListView2.Items.Item[i].Caption + '/';
    end;
    inc(i);
  end;
  Options.WriteString('Snifer', 'notFC', filterC);

  Options.UpdateFile;
  refreshexisting;
end;

procedure TfPacketFilter.refreshexisting;
//��������� ������������ ��������.
var
  i : integer;
begin
  try
    i := 0;
    while i < LSPConnections.Count do
    begin
      if assigned(TlspConnection(LSPConnections.Items[i]).Visual) then
      begin
        TlspConnection(LSPConnections.Items[i]).Visual.PacketListRefresh(false);
      end;
      inc(i);
    end;

    i := 0;
    if assigned(sockEngine) then
    begin
      while i < sockEngine.tunels.Count do
      begin
        if assigned(Ttunel(sockEngine.tunels.Items[i]).Visual) then
        begin
          Ttunel(sockEngine.tunels.Items[i]).Visual.PacketListRefresh(false);
        end;
        inc(i);
      end;
    end;

    i := 0;
    while i < PacketLogWievs.Count do
    begin
      if assigned(TpacketLogWiev(PacketLogWievs.Items[i]).Visual) then
      begin
        TpacketLogWiev(PacketLogWievs.Items[i]).Visual.PacketListRefresh(false);
      end;
      inc(i);
    end;
  except
  end;
end;

procedure TfPacketFilter.CreateParams(var Params : TCreateParams);
begin
  inherited;
  with Params do
  begin
    ExStyle := ExStyle or WS_EX_APPWINDOW or WS_EX_CONTROLPARENT;
  end;
end;

procedure TfPacketFilter.EditSearchByIdChange(Sender : TObject);
var
  item : TListItem;
  lv : TJvListView;
begin
  if PageControl2.ActivePageIndex = 0 then
  begin
    lv := ListView1;
  end
  else
  begin
    lv := ListView2;
  end;
  item := lv.FindCaption(0, editsearchbyid.Text, true, true, true);
  if item <> nil then
  begin
    item.MakeVisible(false);
  end;
end;

procedure TfPacketFilter.EditSearchByNameChange(Sender : TObject);
var
  i : integer;
  lv : TJvListView;
  PerlRegEx : TPerlRegEx;
begin
  if PageControl2.ActivePageIndex = 0 then
  begin
    lv := ListView1;
  end
  else
  begin
    lv := ListView2;
  end;

  if length(editsearchbyname.Text) > 0 then
  begin
    PerlRegEx := TPerlRegEx.Create(nil);
    PerlRegEx.Options := [preCaseLess];
    try
      with PerlRegEx do
      begin
        RegEx := editsearchbyname.Text;
        for I := 0 to lv.Items.Count - 1 do
        begin
          Subject := lv.items[i].SubItems[0];
          if match then
          begin
            lv.items[i].MakeVisible(false);
            exit;
          end;
        end;
      end;
    except
    end;
    PerlRegEx.Free;
  end;
end;

end.
