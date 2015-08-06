unit uPacketView;

interface

uses
  ComCtrls,
  SysUtils,
  StrUtils,
  uGlobalFuncs,
  uJavaParser,
  Windows,
  Messages,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  RVScroll,
  RichView,
  RVStyle,
  ExtCtrls,
  siComp,
  StdCtrls,
  Menus;

type
  TfPacketView = class (TFrame)
    Splitter1 : TSplitter;
    rvHEX : TRichView;
    lang : TsiLang;
    Label1 : TLabel;
    PopupMenu1 : TPopupMenu;
    N1 : TMenuItem;
    RVStyle1 : TRVStyle;
    N2 : TMenuItem;
    Panel1 : TPanel;
    rvFuncs : TRichView;
    Label2 : TLabel;
    rvDescryption : TRichView;
    Splitter2 : TSplitter;
    procedure rvHEXMouseMove(Sender : TObject; Shift : TShiftState; X, Y : integer);
    procedure rvDescryptionMouseMove(Sender : TObject; Shift : TShiftState; X, Y : integer);
    procedure rvDescryptionRVMouseUp(Sender : TCustomRichView; Button : TMouseButton; Shift : TShiftState; ItemNo, X, Y : integer);
    procedure rvHEXRVMouseUp(Sender : TCustomRichView; Button : TMouseButton; Shift : TShiftState; ItemNo, X, Y : integer);
    procedure rvHEXSelect(Sender : TObject);
    procedure rvDescryptionSelect(Sender : TObject);
    procedure N1Click(Sender : TObject);
    procedure N2Click(Sender : TObject);
    procedure rvFuncsSelect(Sender : TObject);

  private
    { Private declarations }
    procedure fParseAndProcess();
    procedure fParse;
    procedure fGet;
    procedure fSwitch;
    procedure fLoop;
    procedure fFor;
    procedure fLoopM;
    function GetName(s : string) : string;
    function GetTyp(s : string) : string;
    function GetType(const s : string; var i : integer) : string;
    function GetFunc(s : string) : string;
    function GetParam(s : string) : string;
    function GetParam2(s : string) : string;
    function GetFunc01(const ar1 : integer) : string;
    function GetFunc01Aion(const ar1 : integer) : string;
    function GetFuncStrAion(const ar1 : integer) : string;
    function GetFunc02(const ar1 : integer) : string;
    function GetFunc09(id : byte; ar1 : integer) : string;
    function GetSkill(const ar1 : integer) : string;
    function GetSkillAion(const ar1 : integer) : string;
    function GetAugment(const ar1 : integer) : string;
    function GetMsgID(const ar1 : integer) : string;
    function GetMsgIDA(const ar1 : integer) : string;
    function GetClassID(const ar1 : integer) : string;
    function GetClassIDAion(const ar1 : integer) : string;
    function GetFSup(const ar1 : integer) : string;
    function prnoffset(offset : integer) : string;
    function AllowedName(Name : string) : boolean;
    function GetValue(var typ : string; name_, PktStr : string; var PosInPkt : integer) : string;
    function GetNpcID(const ar1 : cardinal) : string;
    procedure addtoHex(Str : string);
    procedure selectitemwithtag(Itemtag : integer);
    function get(param1 : string; id : byte; var value : string) : boolean;
    procedure addToDescr(offset : integer; typ, name_, value : string);
    function GetFuncParams(FuncParamNames, FuncParamTypes : TStringList) : string;
    procedure PrintFuncsParams(sFuncName : string);
    //��� ������������� � WPF 669f
    function GetFSay2(const ar1 : integer) : string;
    function GetF0(const ar1 : integer) : string;
    function GetF1(const ar1 : integer) : string;
    function GetF9(ar1 : integer) : string;
    function GetF3(const ar1 : integer) : string;
    //yet another parser
    procedure fParseJ;
    function GetFromIni(const ar1 : integer) : string;
  public
    { Public declarations }
    currentpacket : string;
    hexvalue : string; //��� ������ HEX � ����������� �������
    HexViewOffset : boolean;
    itemTag, templateindex : integer;
    //yet another parser
    procedure ParsePacket(PacketName, Packet : string; size : word = 0);
    procedure InterpretatorJava(PacketName, Packet : string; size : word = 0);
    procedure InterpretJava(PacketJava : TJavaParser; SkipID : boolean; PktStr : string; var PosInPkt : integer; var typ, name_, value, hexvalue : string; size : word);
  end;

implementation

uses
  umain;

{$R *.dfm}

var
  cID : byte;
  wSubID, wSize, wSub2ID : word;
  blockmask, PktStr, StrIni, Param0 : string;
  oldpos, ii, PosInIni, PosInPkt, offset : integer;
  ptime : TDateTime;
  isshow : boolean;
  FuncNames, FuncParamNames, FuncParamTypes, FuncParamNumbers : TStringList;
  value, tmp_value, typ, name_, func, tmp_param, param1, param2, tmp_param1, tmp_param2, tmp_param12 : string;
  valuepool : array[1..9] of integer;

procedure TfPacketView.addtoHex(Str : string);
begin
  inc(itemTag);
  rvHEX.AddNLTag(copy(str, 1, length(str) - 1), templateindex, -1, itemTag);
  rvHEX.AddNL(' ', 0, -1);
end;

function TfPacketView.GetNpcID(const ar1 : cardinal) : string;
// ������� �-���, ���������� �� �� �������, � �� ���������
// :Get.NpcID - ���������� ����� �� ��� ID �� �������� ���������
var
  _ar1 : cardinal;
begin
  _ar1 := ar1 - kNpcID;
  result := '0';
  if ar1 = 0 then
  begin
    exit;
  end;
  result := NpcIdList.Values[inttostr(_ar1)];
  if length(result) > -1 then
  begin
    result := result + ' ID:' + inttostr(ar1) + ' (0x' + inttohex(ar1, 4) + ')';
  end
  else
  begin
    result := 'Unknown Npc ID:' + inttostr(ar1) + '(' + inttohex(ar1, 4) + ')';
  end;
end;

function TfPacketView.GetValue(var typ : string; name_, PktStr : string; var PosInPkt : integer) : string;
var
  value : string;
  d : integer;
  pch : widestring;
begin
  templateindex := 0;
  hexvalue := '';
  case typ[1] of
    'v' :
    begin
      value := IntToStr(valuepool[Strtoint(typ[2])]);
      hexvalue := ' (0x' + inttohex(Strtoint(value), 8) + ')';
    end;
    'd' :
    begin
      value := IntToStr(PInteger(@PktStr[PosInPkt])^);
      hexvalue := ' (0x' + inttohex(Strtoint(value), 8) + ')';
      templateindex := 10;
      Inc(PosInPkt, 4);
    end;  //integer (������ 4 �����)           d, h-hex
    'c' :
    begin
      value := IntToStr(PByte(@PktStr[PosInPkt])^);
      hexvalue := ' (0x' + inttohex(Strtoint(value), 2) + ')';
      templateindex := 11;
      Inc(PosInPkt);
    end;  //byte / char (������ 1 ����)        b
    'f' :
    begin
      value := FloatToStr(PDouble(@PktStr[PosInPkt])^);
      templateindex := 12;
      Inc(PosInPkt, 8);
    end;  //double (������ 8 ����, float)      f
    'n' :
    begin
      value := FloatToStr(PSingle(@PktStr[PosInPkt])^);
      templateindex := 12;
      Inc(PosInPkt, 4);
    end;  //Single (������ 4 ����, float)      n
    'h' :
    begin
      value := IntToStr(PWord(@PktStr[PosInPkt])^);
      hexvalue := ' (0x' + inttohex(Strtoint(value), 4) + ')';
      templateindex := 13;
      Inc(PosInPkt, 2);
    end;  //word (������ 2 �����)              w
    'q' :
    begin
      value := IntToStr(PInt64(@PktStr[PosInPkt])^);
      templateindex := 14;
      Inc(PosInPkt, 8);
    end;  //int64 (������ 8 �����)
    '-', 'z' :
    begin
      templateindex := 15;
      if Length(name_) > 4 then
      begin
        if name_[1] <> 'S' then
        begin
          d := strtoint(copy(name_, 1, 5));
          Inc(PosInPkt, d);
          value := lang.GetTextOrDefault('skip' (* '���������� ' *)) + inttostr(d) + lang.GetTextOrDefault('byte' (* ' ����(�)' *));
        end
        else
        begin
          value := lang.GetTextOrDefault('skip script' (* '���������� ������' *));
        end;
      end
      else
      begin
        d := strtoint(name_);
        Inc(PosInPkt, d);
        value := lang.GetTextOrDefault('skip' (* '���������� ' *)) + inttostr(d) + lang.GetTextOrDefault('byte' (* ' ����(�)' *));
      end;
    end;
    's' :
    begin
      templateindex := 16;
//            d := PosEx(#0#0, PktStr, PosInPkt) - PosInPkt;
      d := get_ws_length(PktStr, PosInPkt);
      if (d mod 2) = 1 then
      begin
        Inc(d);
      end;
      SetLength(pch, d div 2);
      if d >= 2 then
      begin
        Move(PktStr[PosInPkt], pch[1], d);
      end
      else
      begin
        d := 0;
      end;
      value := pch; //����������� ���������

      Inc(PosInPkt, d + 2);
    end;
    '_' :
    begin //(�������) ������ �� ������, ����� ��� switch
      templateindex := 17;
      value := '0';
    end;
    'w' :
    begin
      templateindex := 16;
      d := PWord(@PktStr[PosInPkt])^;
      Inc(PosInPkt, 2);
      if (d > wlimit) or (d < 0) then
      begin
        value := 'range error';
        result := value;
        exit;
      end;
      SetLength(pch, d);
      d := d * 2;
      if d > 0 then
      begin
        Move(PktStr[PosInPkt], pch[1], d * 2);
      end
      else
      begin
        d := 0;
      end;
      value := pch;
      Inc(PosInPkt, d);
    end;
  else
  begin
    value := lang.GetTextOrDefault('unknownid' (* '����������� ������������� -> ?(name_)!' *));
  end;
  end;
  Result := value;
  if PosInPkt > wSize + 10 then
  begin
    result := 'range error';
  end;
end;

{ TfPacketView }
//-------------
function TfPacketView.GetType(const s : string; var i : integer) : string;
begin
  Result := '';
  while (s[i] <> ')') and (i < Length(s)) do
  begin
    Result := Result + s[i];
    Inc(i);
  end;
  Result := Result + s[i];
end;
//-------------
function TfPacketView.GetTyp(s : string) : string;
var
  k,kk : integer;
begin
  //d(Count:For.0001)
  //d(Count:Get.Func01)
  //-(40)
  Result := '';
  k := Pos('(', s);
  for kk := 1 to k-1 do
  begin
    Result := Result + s[kk];
  end;
end;

function TfPacketView.GetName(s : string) : string;
var
  k : integer;
begin
  Result := '';
  k := Pos('(', s);
  if k = 0 then
  begin
    exit;
  end;
  inc(k);
  while (s[k] <> ':') and (k < Length(s)) do
  begin
    Result := Result + s[k];
    Inc(k);
  end;
end;

function TfPacketView.GetFunc(s : string) : string;
var
  k : integer;
begin
  Result := '';
  k := Pos(':', s);
  if k = 0 then
  begin
    exit;
  end;
  inc(k);
  while (s[k] <> '.') and (k < Length(s)) do
  begin
    Result := Result + s[k];
    Inc(k);
  end;
end;
//-------------
function TfPacketView.GetParam(s : string) : string;
var
  k : integer;
begin
  Result := '';
  k := Pos('.', s);
  //�� ����� �����
  if k = 0 then
  begin
    exit;
  end;
  inc(k);
  while (s[k] <> '.') and (k < Length(s)) do
  begin //or(s[k]<>')')
    Result := Result + s[k];
    Inc(k);
  end;
end;
//-------------
function TfPacketView.GetParam2(s : string) : string;
var
  k, l : integer;
  s2 : string;
begin
  Result := '';
  k := Pos('.', s);
  //�� ����� �����
  if k = 0 then
  begin
    exit;
  end;
  //�� ��������� �� ������ ������
  inc(k);
  l := length(s);
  s2 := copy(s, k, l - k + 1);
  //���� ������ �����
  k := Pos('.', s2);
  //�� ����� �����
  if k = 0 then
  begin
    exit;
  end;
  inc(k);
  while (s2[k] <> ')') and (k < Length(s2)) do
  begin
    Result := Result + s2[k];
    Inc(k);
  end;
end;
//��� ������������� � WPF 669f
function TfPacketView.GetF0(const ar1 : integer) : string;
// ������� �-���, ���������� �� �� �������, � �� ���������
// :Get.F0 - ���������� �������� Item'� �� ��� ID �� �������� ���������
begin
  result := GetFunc01(ar1);
end;

function TfPacketView.GetF3(const ar1 : integer) : string;
// ������� �-���, ���������� �� �� �������, � �� ���������
// :Get.F3 - ���������� �������� ������� �� ��� ID �� �������� ���������
begin
  result := GetFunc01(ar1);
end;
//-------------
function TfPacketView.GetFunc01(const ar1 : integer) : string;
// ������� �-���, ���������� �� �� �������, � �� ���������
// :Get.Func01 - ���������� �������� Item'� �� ��� ID �� �������� ���������
begin
  result := '0';
  if ar1 = 0 then
  begin
    exit;
  end;
  result := ItemsList.Values[IntTostr(ar1)];
  if length(result) > -1 then
  begin
    result := result + ' ID:' + inttostr(ar1) + ' (0x' + inttohex(ar1, 4) + ')';
  end
  else
  begin
    result := 'Unknown Items ID:' + inttostr(ar1) + '(' + inttohex(ar1, 4) + ')';
  end;
end;
//AION -------------
function TfPacketView.GetFunc01Aion(const ar1 : integer) : string;
// ������� �-���, ���������� �� �� �������, � �� ���������
// :Get.Func01A - ���������� �������� Item'� �� ��� ID �� �������� ���������
begin
  result := '0';
  if ar1 = 0 then
  begin
    exit;
  end;
  result := ItemsListAion.Values[IntTostr(ar1)];
  if length(result) > 0 then
  begin
    result := result + ' ID:' + inttostr(ar1) + ' (0x' + inttohex(ar1, 4) + ')';
  end
  else
  begin
    result := 'Unknown Items ID:' + inttostr(ar1) + '(' + inttohex(ar1, 4) + ')';
  end;
end;
//-------------
function TfPacketView.GetFuncStrAion(const ar1 : integer) : string;
// ������� �-���, ���������� �� �� �������, � �� ���������
// :Get.StringA - ���������� ������ �� ��� ID �� �������� ���������
begin
  result := '0';
  if ar1 = 0 then
  begin
    exit;
  end;
  result := ClientStringsAion.Values[IntTostr(ar1)];
  if length(result) > 0 then
  begin
    result := result + ' ID:' + inttostr(ar1) + ' (0x' + inttohex(ar1, 4) + ')';
  end
  else
  begin
    result := 'Unknown msgID:' + inttostr(ar1) + '(' + inttohex(ar1, 4) + ')';
  end;
end;
//��� ������������� � WPF 669f
function TfPacketView.GetFSay2(const ar1 : integer) : string;
// ������� �-���, ���������� �� �� �������, � �� ���������
// :Get.FSay2 - ���������� ��� Say2
begin
  result := GetFunc02(ar1);
end;

function TfPacketView.GetFunc02(const ar1 : integer) : string;
// ������� �-���, ���������� �� �� �������, � �� ���������
// :Get.Func02 - ���������� ��� Say2
begin
  case ar1 of
    0 :
    begin
      result := 'ALL';
    end;
    1 :
    begin
      result := '! SHOUT';
    end;
    2 :
    begin
      result := '" TELL';
    end;
    3 :
    begin
      result := '# PARTY';
    end;
    4 :
    begin
      result := '@ CLAN';
    end;
    5 :
    begin
      result := 'GM';
    end;
    6 :
    begin
      result := 'PETITION_PLAYER';
    end;
    7 :
    begin
      result := 'PETITION_GM';
    end;
    8 :
    begin
      result := '+ TRADE';
    end;
    9 :
    begin
      result := '$ ALLIANCE';
    end;
    10 :
    begin
      result := 'ANNOUNCEMENT';
    end;
    11 :
    begin
      result := 'BOAT (WILLCRASHCLIENT?)';
    end;
    12 :
    begin
      result := 'L2FRIEND';
    end;
    13 :
    begin
      result := 'MSNCHAT';
    end;
    14 :
    begin
      result := 'PARTYMATCH_ROOM';
    end;
    15 :
    begin
      result := 'PARTYROOM_COMMANDER (yellow)';
    end;
    16 :
    begin
      result := 'PARTYROOM_ALL (red)';
    end;
    17 :
    begin
      result := 'HERO_VOICE';
    end;
    18 :
    begin
      result := 'CRITICAL_ANNOUNCE';
    end;
    19 :
    begin
      result := 'SCREEN_ANNOUNCE';
    end;
    20 :
    begin
      result := 'BATTLEFIELD';
    end;
    21 :
    begin
      result := 'MPCC_ROOM';
    end;
  else
  begin
    result := '?';
  end;
  end;
  result := result + ' ID:' + inttostr(ar1) + ' (0x' + inttohex(ar1, 4) + ')';
end;
//-------------
function TfPacketView.GetF9(ar1 : integer) : string;
// ������� �-���, ���������� �� �� �������, � �� ���������
// :Get.F9 - SocialAction
begin
  result := '';
  case ar1 of // [C] 1B - RequestSocialAction,  [S] 2D - SocialAction
              // CT1: [S] 27 - SocialAction
    02 :
    begin
      result := 'Greeting';
    end;
    03 :
    begin
      result := 'Victory';
    end;
    04 :
    begin
      result := 'Advance';
    end;
    05 :
    begin
      result := 'No';
    end;
    06 :
    begin
      result := 'Yes';
    end;
    07 :
    begin
      result := 'Bow';
    end;
    08 :
    begin
      result := 'Unaware';
    end;
    09 :
    begin
      result := 'Social Waiting';
    end;
    $0A :
    begin
      result := 'Laugh';
    end;
    $0B :
    begin
      result := 'Applaud';
    end;
    $0C :
    begin
      result := 'Dance';
    end;
    $0D :
    begin
      result := 'Sorrow';
    end;
    $0E :
    begin
      result := 'Charm';
    end;
    $0F :
    begin
      result := 'Shyness';
    end;
    $10 :
    begin
      result := 'Hero light';
    end;
    $084A :
    begin
      result := 'LVL-UP';
    end;
  else
  begin
    result := '?';
  end;
  end;
  result := result + ' ID:' + inttostr(ar1) + ' (0x' + inttohex(ar1, 4) + ')';
end;
//-------------
function TfPacketView.GetFunc09(id : byte; ar1 : integer) : string;
// ������� �-���, ���������� �� �� �������, � �� ���������
// :Get.Func09 - ������.
begin
  result := '';
  if (id in [$1B, $2D, $27]) then
  begin
    case ar1 of // [C] 1B - RequestSocialAction,  [S] 2D - SocialAction
                // CT1: [S] 27 - SocialAction
      02 :
      begin
        result := 'Greeting';
      end;
      03 :
      begin
        result := 'Victory';
      end;
      04 :
      begin
        result := 'Advance';
      end;
      05 :
      begin
        result := 'No';
      end;
      06 :
      begin
        result := 'Yes';
      end;
      07 :
      begin
        result := 'Bow';
      end;
      08 :
      begin
        result := 'Unaware';
      end;
      09 :
      begin
        result := 'Social Waiting';
      end;
      $0A :
      begin
        result := 'Laugh';
      end;
      $0B :
      begin
        result := 'Applaud';
      end;
      $0C :
      begin
        result := 'Dance';
      end;
      $0D :
      begin
        result := 'Sorrow';
      end;
      $0E :
      begin
        result := 'Charm';
      end;
      $0F :
      begin
        result := 'Shyness';
      end;
      $10 :
      begin
        result := 'Hero light';
      end;
      $084A :
      begin
        result := 'LVL-UP';
      end;
    else
    begin
      result := '?';
    end;
    end;
  end
  else
  if (id = $6D) then
  begin
    case ar1 of //  [C] 6D - RequestRestartPoint.
      0 :
      begin
        result := 'res to town';
      end;
      1 :
      begin
        result := 'res to clanhall';
      end;
      2 :
      begin
        result := 'res to castle';
      end;
      3 :
      begin
        result := 'res to siege HQ';
      end;
      4 :
      begin
        result := 'res here and now :)';
      end;
    else
    begin
      result := '?';
    end;
    end;
  end;
  if (id = $6E) then
  begin
    case ar1 of // [C] 6E - RequestGMCommand.
      1 :
      begin
        result := 'player status';
      end;
      2 :
      begin
        result := 'player clan';
      end;
      3 :
      begin
        result := 'player skills';
      end;
      4 :
      begin
        result := 'player quests';
      end;
      5 :
      begin
        result := 'player inventory';
      end;
      6 :
      begin
        result := 'player warehouse';
      end;
    else
    begin
      result := '?';
    end;
    end;
  end;
  if (id = $A0) then
  begin
    case ar1 of // [C] A0 -RequestBlock
      0 :
      begin
        result := 'block name';
      end;
      1 :
      begin
        result := 'unblock name';
      end;
      2 :
      begin
        result := 'list blocked names';
      end;
      3 :
      begin
        result := 'block all';
      end;
      4 :
      begin
        result := 'unblock all';
      end;
    else
    begin
      result := '?';
    end;
    end;
  end;
  result := result + ' ID:' + inttostr(ar1) + ' (0x' + inttohex(ar1, 4) + ')';
end;
//-------------
function TfPacketView.GetSkill(const ar1 : integer) : string;
// ������� �-���, ���������� �� �� �������, � �� ���������
// :Get.Skill - ���������� �������� ����� �� ��� ID �� �������� ���������
begin
  result := '0';
  if ar1 = 0 then
  begin
    exit;
  end;
  result := SkillList.Values[inttostr(ar1)];
  if length(result) > -1 then
  begin
    result := result + ' ID:' + inttostr(ar1) + ' (0x' + inttohex(ar1, 4) + ')';
  end
  else
  begin
    result := 'Unknown Skill ID:' + inttostr(ar1) + '(' + inttohex(ar1, 4) + ')';
  end;
end;
//AION -------------
function TfPacketView.GetSkillAion(const ar1 : integer) : string;
// ������� �-���, ���������� �� �� �������, � �� ���������
// :Get.SkillA - ���������� �������� ����� �� ��� ID �� �������� ���������
begin
  result := '0';
  if ar1 = 0 then
  begin
    exit;
  end;
  result := SkillListAion.Values[inttostr(ar1)];
  if length(result) > 0 then
  begin
    result := result + ' ID:' + inttostr(ar1) + ' (0x' + inttohex(ar1, 4) + ')';
  end
  else
  begin
    result := 'Unknown Skill ID:' + inttostr(ar1) + '(' + inttohex(ar1, 4) + ')';
  end;
end;
//��� ������������� � WPF 669f
function TfPacketView.GetF1(const ar1 : integer) : string;
// ������� �-���, ���������� �� �� �������, � �� ���������
// :Get.F1 - ���������� �������� ����� �� ��� ID �� �������� ���������
begin
  result := GetAugment(ar1);
end;
//-------------
function TfPacketView.GetAugment(const ar1 : integer) : string;
// ������� �-���, ���������� �� �� �������, � �� ���������
// :Get.AugmentID - ���������� �������� ����� �� ��� ID �� �������� ���������
begin
  result := '0';
  if ar1 = 0 then
  begin
    exit;
  end;
  result := AugmentList.Values[inttostr(ar1)];
  if length(result) > -1 then
  begin
    result := result + ' ID:' + inttostr(ar1) + ' (0x' + inttohex(ar1, 4) + ')';
  end
  else
  begin
    result := 'Unknown Augment ID:' + inttostr(ar1) + '(' + inttohex(ar1, 4) + ')';
  end;
end;
//-------------
function TfPacketView.GetMsgID(const ar1 : integer) : string;
// ������� �-���, ���������� �� �� �������, � �� ���������
// :Get.MsgID - ���������� ����� �� ��� ID �� �������� ���������
begin
  {result := '0';
  if ar1 = 0 then
  begin
    exit;
  end;}
  result := SysMsgidList.Values[inttostr(ar1)];
  if length(result) > -1 then
  begin
    result := result + ' ID:' + inttostr(ar1) + ' (0x' + inttohex(ar1, 4) + ')';
  end
  else
  begin
    result := 'Unknown SysMsg ID:' + inttostr(ar1) + '(' + inttohex(ar1, 4) + ')';
  end;
end;
//AION -------------
function TfPacketView.GetMsgIDA(const ar1 : integer) : string;
// ������� �-���, ���������� �� �� �������, � �� ���������
// :Get.MsgIDA - ���������� ����� �� ��� ID �� �������� ���������
begin
  result := '0';
  if ar1 = 0 then
  begin
    exit;
  end;
  result := SysMsgidListAion.Values[inttostr(ar1)];
  if length(result) > 0 then
  begin
    result := result + ' ID:' + inttostr(ar1) + ' (0x' + inttohex(ar1, 4) + ')';
  end
  else
  begin
    result := 'Unknown SysMsg ID:' + inttostr(ar1) + '(' + inttohex(ar1, 4) + ')';
  end;
end;
//-------------
function TfPacketView.GetClassID(const ar1 : integer) : string;
// ������� �-���, ���������� �� �� �������, � �� ���������
// :Get.ClassID - �����
begin
  result := ClassIdList.Values[inttostr(ar1)];
  if length(result) > 0 then
  begin
    result := result + ' ID:' + inttostr(ar1) + ' (0x' + inttohex(ar1, 4) + ')';
  end
  else
  begin
    result := 'Unknown Class ID:' + inttostr(ar1) + '(' + inttohex(ar1, 4) + ')';
  end;
end;
//AION -------------
function TfPacketView.GetClassIDAion(const ar1 : integer) : string;
// ������� �-���, ���������� �� �� �������, � �� ���������
// :Get.ClassIDA - �����
begin
  result := ClassIdListAion.Values[inttostr(ar1)];
  if length(result) > 0 then
  begin
    result := result + ' ID:' + inttostr(ar1) + ' (0x' + inttohex(ar1, 4) + ')';
  end
  else
  begin
    result := 'Unknown Class ID:' + inttostr(ar1) + '(' + inttohex(ar1, 4) + ')';
  end;
end;
//-------------
function TfPacketView.GetFSup(const ar1 : integer) : string;
// ������� �-���, ���������� �� �� �������, � �� ���������
// :Get.FSup - Status Update ID
begin
  case ar1 of
    01 :
    begin
      result := 'Level';
    end;
    02 :
    begin
      result := 'EXP';
    end;
    03 :
    begin
      result := 'STR';
    end;
    04 :
    begin
      result := 'DEX';
    end;
    05 :
    begin
      result := 'CON';
    end;
    06 :
    begin
      result := 'INT';
    end;
    07 :
    begin
      result := 'WIT';
    end;
    08 :
    begin
      result := 'MEN';
    end;
    09 :
    begin
      result := 'cur_HP';
    end;
    $0A :
    begin
      result := 'max_HP';
    end;
    $0B :
    begin
      result := 'cur_MP';
    end;
    $0C :
    begin
      result := 'max_MP';
    end;
    $0D :
    begin
      result := 'SP';
    end;
    $0E :
    begin
      result := 'cur_Load';
    end;
    $0F :
    begin
      result := 'max_Load';
    end;
    $11 :
    begin
      result := 'P_ATK';
    end;
    $12 :
    begin
      result := 'ATK_SPD';
    end;
    $13 :
    begin
      result := 'P_DEF';
    end;
    $14 :
    begin
      result := 'Evasion';
    end;
    $15 :
    begin
      result := 'Accuracy';
    end;
    $16 :
    begin
      result := 'Critical';
    end;
    $17 :
    begin
      result := 'M_ATK';
    end;
    $18 :
    begin
      result := 'CAST_SPD';
    end;
    $19 :
    begin
      result := 'M_DEF';
    end;
    $1A :
    begin
      result := 'PVP_FLAG';
    end;
    $1B :
    begin
      result := 'KARMA';
    end;
    $21 :
    begin
      result := 'cur_CP';
    end;
    $22 :
    begin
      result := 'max_CP';
    end;
  else
  begin
    result := '?';
  end
  end;
  result := result + ' ID:' + inttostr(ar1) + ' (0x' + inttohex(ar1, 4) + ')';
end;

function TfPacketView.prnoffset(offset : integer) : string;
begin
  result := inttostr(offset);
  case Length(result) of
    1 :
    begin
      result := '000' + result;
    end;
    2 :
    begin
      result := '00' + result;
    end;
    3 :
    begin
      result := '0' + result;
    end;
  end;
end;
//�������� �� ��, ��� ������ ������ �� ��������
function TfPacketView.AllowedName(Name : string) : boolean;
var
  i : integer;
begin
  result := true;
  i := 1;
  while i <= length(Name) do
  begin
    if not (lowercase(Name[i])[1] in ['a'..'z']) then
    begin
      result := false;
      exit;
    end;
    inc(i);
  end;
end;
//=======================================================================
// �������� ��������� �������
//=======================================================================
//  procedure addToDescr(offset:integer; typ, name_, value:string);
//  procedure PrintFuncsParams(sFuncName:string);
//  procedure fGet();
//  procedure fFor();
//  procedure fLoop();
//  procedure fParse();
//  procedure fSwitch();
//=======================================================================
procedure TfPacketView.addToDescr(offset : integer; typ, name_, value : string);
var
  another : string;
begin
  another := ' ' + typ + ' ';
  if HexViewOffset then
  begin
    rvDescryption.AddNLTag(inttohex(offset, 4) + another, templateindex, 0, itemTag);
  end
  else
  begin
    rvDescryption.AddNLTag(prnoffset(offset) + another, templateindex, 0, itemTag);
  end;

  rvDescryption.GetItem(rvDescryption.ItemCount - 1).Tag := itemTag;
  rvDescryption.AddNL(' ', 0, -1);
  rvDescryption.AddNL(name_, 1, -1);
  rvDescryption.AddNL(': ', 0, -1);
  rvDescryption.AddNL(value, 0, -1);
end;
//=======================================================================
function TfPacketView.GetFuncParams(FuncParamNames, FuncParamTypes : TStringList) : string;
var
  i : integer;
begin
  result := '';
  i := 0;
  while i < funcparamnames.Count do
  begin
    if (i < funcparamnames.Count - 1) and (FuncParamTypes.Strings[i] = FuncParamTypes.Strings[i + 1]) then
    begin
      result := format('%s%s, ', [result, FuncParamNames.Strings[i]]);
    end
    else
    begin
      case FuncParamTypes.Strings[i][1] of
        'd' :
        begin
          result := format('%s%s:%s', [result, FuncParamNames.Strings[i], 'Integer']);
        end;  //dword (������ 4 �����)           d, h-hex
        'c' :
        begin
          result := format('%s%s:%s', [result, FuncParamNames.Strings[i], 'Byte']);
        end;  //byte / char (������ 1 ����)        b
        'f' :
        begin
          result := format('%s%s:%s', [result, FuncParamNames.Strings[i], 'Real']);
        end;  //double (������ 8 ����, float)      f
        'h' :
        begin
          result := format('%s%s:%s', [result, FuncParamNames.Strings[i], 'Word']);
        end;  //word (������ 2 �����)              w
        'q' :
        begin
          result := format('%s%s:%s', [result, FuncParamNames.Strings[i], 'Int64']);
        end;  //int64 (������ 8 �����)
        's' :
        begin
          result := format('%s%s:%s', [result, FuncParamNames.Strings[i], 'String']);
        end;
      end;
      if i < funcparamnames.Count - 1 then
      begin
        result := result + '; ';
      end;
    end;
    inc(i);
  end;
end;
//=======================================================================
procedure TfPacketView.PrintFuncsParams(sFuncName : string);
var
  i : integer;
  values : string;
begin
  if FuncNames.IndexOf(sFuncName) < 0 then
  begin
    i := 0;
    values := '';
    while i < FuncParamNumbers.count do
    begin
      if (i < FuncParamNumbers.Count - 1) then
      begin
        values := format('%sValues[%s], ', [values, FuncParamNumbers.Strings[i]]);
      end
      else
      begin
        values := format('%sValues[%s]', [values, FuncParamNumbers.Strings[i]]);
      end;

      inc(i);
    end;
    rvFuncs.AddNL(format('Declaration : %s(%s);', [sFuncName, GetFuncParams(FuncParamNames, FuncParamTypes)]), 0, 0);
    rvFuncs.AddNL(format('Calling : %s(%s);', [sFuncName, values]), 0, 0);

    FuncNames.Add(sFuncName);
    rvFuncs.AddNL('Mask : ', 0, 0);
    rvFuncs.AddNL(blockmask, 0, -1);
    rvFuncs.AddNL('', 0, 0);
    blockmask := '';
  end;
  FuncParamNumbers.clear;
  FuncParamNames.Clear;
  FuncParamTypes.Clear;
end;
//=======================================================================
procedure TfPacketView.fParse();
begin
      //������� ������ ���� typ(name_:func.param1.param2)
  Param0 := GetType(StrIni, PosInIni);
  inc(PosInIni); //���������� �� ��������� ��������
  typ := GetTyp(Param0); //��������� ��� ��������
  name_ := GetName(Param0); //��������� ��� �������� � ������� typ(name_:func.param1.param2)
  func := uppercase(GetFunc(Param0)); //��������� ��� ������� � ������� typ(name_:func.param1.param2)
  param1 := uppercase(GetParam(Param0)); //��������� ��� �������� � ������� typ(name_:func.param1.param2)
  param2 := GetParam2(Param0); //��������� ��� �������� � ������� typ(name_:func.param1.param2)
  offset := PosinPkt - 11;
  oldpos := PosInPkt;
      //��� �� ��� ���������
      // if (PosInIni<Length(StrIni))and(PosInPkt<sizze+10)

      //��������� �������� �� ������, �������� ��������� � ������������ � ����� ��������
  value := GetValue(typ, name_, PktStr, PosInPkt);
      //���������� �������
  if typ <> '_' then
  begin
    if AllowedName(name_) then
    begin
      FuncParamNames.Add(name_);
      FuncParamTypes.Add(typ);
      FuncParamNumbers.Add(inttostr(length(blockmask)));
    end;
    blockmask := blockmask + typ;
  end;
  if PosInPkt - oldpos > 0 then
  begin
    addtoHex(StringToHex(copy(pktstr, oldpos, PosInPkt - oldpos), ' '));
  end;
end;
//=======================================================================
procedure TfPacketView.fGet();
begin
  if not get(param1, cID, value) then
  begin
    exit;
  end
  else
  begin
    addToDescr(offset, typ, name_, value);
  end;        //�������������
end;
//=======================================================================
//�������� ������ switch � java ����� ��������� ���:
//���:
//switch (���������) { case
//��������1:
//// ������������������ ����������
//break;
//case ��������2:
//// ������������������ ����������
//break;
//...
//case ��������N:
//// ������������������ ����������
//break;
//default:
//// ������������������ ����������, ����������� �� ���������
//� ��� �������� ������ �������� ���, ������:
//���:
//17=SM_MESSAGE:h(id2)c(chatType:switch.0002.0003)c(RaceId)d(ObjectId)_(id:case.0.2)h(unk)s(message)_(id:case.1.3)h(unk)d(unk)s(message)_(id:case.2.4)h(unk)d(unk)d(unk)s(message)s(Name)s(message)
//���:
//����� � ����� c(chatType:switch.0002.0003)
//chatType  - ���������, ��� ���� (1 ����)
// switch  - �������� ����� ��������� ������
//0002 - ������� ��������� ����� switch ����������, �.�. �������� c(RaceId)d(ObjectId) ������ ��������� � ����������� �� �����
//0003 - ������� ��������� _(id:case ������������ � switch

//� ����� _(id:case.0000.0002)h(unk)s(message)
//_ - ������������
//id - ������������, ���� ����� ������� ��� ��������������
//case - �������� ����� ��� �������� ������ �� ��������� 0000
//0002 � ���������� ��������� � ����� case, �.�. �������� h(unk)s(message)
//��������� �������� s(Name)s(message) �������� ��� ����� default, �.�. ���� chatType �� ������������� �� ������ case, �� � ����������� �������� �������� s(Name)s(message).
//�� �������� ���� ����� ����� ��������, �.�. ������ 0001 ����� 1.
//=======================================================================

procedure TfPacketView.fParseAndProcess();
begin
  fParse();
  if Func = 'LOOPM' then
  begin
    fLoopM();
  end
  else
  if Func = 'LOOP' then
  begin
    fLoop();
  end
  else
  if Func = 'FOR' then
  begin
    fFor();
  end
  else
  if Func = 'SWITCH' then
  begin
    fSwitch();
  end
  else
  if Func = 'GET' then
  begin
    fGet();
  end
  else
  if Func = 'SAVE' then
  begin
    valuepool[Strtoint(param1)] := Strtoint(value);
	addToDescr(offset, typ, name_, value + hexvalue);
  end
  else
  begin
    addToDescr(offset, typ, name_, value + hexvalue);
  end;
end;

procedure TfPacketView.fSwitch();
var
  i, j : integer;
  end_block : string;
  switchskipcount, switchdefcount, switchvalue, casedefcount : integer;
begin
      //�������������
  addToDescr(offset, typ, name_, value + hexvalue);
  switchskipcount := strtoint(param1);
  switchdefcount := strtoint(param2);
  end_block := value;
  if value = 'range error' then
  begin
    exit;
  end;
  switchvalue := strtoint(value);
      //��������, ��� param1 > 0
  if switchskipcount > 0 then
  begin
        //������������� �������� ���� ������������ ������
    for i := 1 to switchskipcount do
    begin
      fParseAndProcess();
    end;
  end;
  for i := 1 to switchdefcount do  //��������� �� ���� case
  begin
    fParse();
    casedefcount := strtoint(param2);
    if Func = 'CASE' then
    begin
      if switchvalue = strtoint(param1) then  //id �������
      begin
              //������������� ��������
        for j := 1 to casedefcount do
        begin
          fParseAndProcess();
        end;
      end
      else
              //���������� ��������
      begin
        for j := 1 to casedefcount do
        begin
          Param0 := GetType(StrIni, PosInIni);
          inc(PosInIni);
        end;
      end;
    end
    else
    if Func = 'CASEAND' then
    begin
      if (switchvalue and strtoint(param1)) = strtoint(param1) then
      begin
              //������������� ��������
        for j := 1 to casedefcount do
        begin
          fParseAndProcess();
        end;
      end
      else
      begin
        for j := 1 to casedefcount do
        begin
          Param0 := GetType(StrIni, PosInIni);
          inc(PosInIni);
        end;
      end;
    end;
  end;
end;
//=======================================================================
procedure TfPacketView.fLoop();
var
  i, j, val : integer;
  end_block : string;
  loopdefpos, loopdefsize, loopcount : integer;
  loopstartposinini : integer;
begin
  loopdefpos := StrToInt(param1);
  loopdefsize := StrToInt(param2);

      //�������������
  addToDescr(offset, typ, name_, value + hexvalue);
  tmp_param := param2;
  tmp_value := value;
      //end_block:=value;
  if value = 'range error' then
  begin
    exit;
  end;
  loopcount := StrToInt(value);
  if loopcount = 0 then
  begin
        //���������� ������ �������� � Loop
    for i := 1 to loopdefsize do
    begin
      Param0 := GetType(StrIni, PosInIni);
      inc(PosInIni);
    end;
  end
  else
  begin
        //��������, ��� param1 > 1
    if loopdefpos > 1 then
    begin
          //������������� ��������
      for i := 1 to loopdefpos - 1 do
      begin
        fParse();
        if Func = 'GET' then
        begin
          fGet();
        end //get(param1, id, value);
            //�������������
        else
        begin
          addToDescr(offset, typ, name_, value + hexvalue);
        end;
      end;
    end;
    loopstartposinini := PosInIni;
        //PrintFuncsParams('Pck'+PacketName);
    if loopcount > 32767 then
    begin
      val := (loopcount xor $FFFF) + 1;
    end
    else
    begin
      val := loopcount;
    end;
    end_block := inttostr(val);
    for i := 1 to val do
    begin
      if i > looplimit then
      begin
        rvDescryption.AddNL('loop count > ' + inttostr(looplimit), 0, 0);
        exit;
      end;
      rvDescryption.AddNL('              ' + lang.GetTextOrDefault('startb' (* '[������ �������������� ����� ' *)), 0, 0);
      rvDescryption.AddNL(inttostr(i) + '/' + end_block, 1, -1);
      rvDescryption.AddNL(']', 0, -1);
      PosInIni := loopstartposinini;
      for j := 1 to loopdefsize do
      begin
        fParseAndProcess();
      end;
          //if value = 'range error' then break;
      rvDescryption.AddNL('              ' + lang.GetTextOrDefault('endb' (* '[����� �������������� ����� ' *)), 0, 0);
      rvDescryption.AddNL(inttostr(i) + '/' + end_block, 1, -1);
      rvDescryption.AddNL(']', 0, -1);
          //PrintFuncsParams('Item'+PacketName);
    end;
  end;
end;
//=======================================================================
//���� Loop ��� ���� � ���������� � ���� �����
procedure TfPacketView.fLoopM();
var
  i, j, val, k : integer;
  end_block : string;
begin
      //�������������
  addToDescr(offset, typ, name_, value + hexvalue);
  tmp_param := param2;
  tmp_value := value;
      //end_block:=value;
  if value = 'range error' then
  begin
    exit;
  end;
  if StrToInt(value) = 0 then
  begin
        //���������� ������ �������� � Loop
    for i := 1 to StrToInt(param2) do
    begin
      Param0 := GetType(StrIni, PosInIni);
      inc(PosInIni);
    end;
  end
  else
  begin
        //��������, ��� param1 > 1
    if strtoint(param1) > 1 then
    begin
          //������������� ��������
      for i := 1 to StrToInt(param1) - 1 do
      begin
        fParse();
        if Func = 'GET' then
        begin
          fGet();
        end //get(param1, id, value);
            //�������������
        else
        begin
          addToDescr(offset, typ, name_, value + hexvalue);
        end;
      end;
    end;
    ii := PosInIni;
    if tmp_value = 'range error' then
    begin
      exit;
    end;
        //����������� �������� ����� � �����
    k := StrToInt(tmp_value); // EquipmentMask
    val := 0;
    for i := 0 to 15 do
    begin
      val := val + ((k shr i) and 1);
    end;
    end_block := inttostr(val);
    for i := 1 to val do
    begin
      rvDescryption.AddNL('              ' + lang.GetTextOrDefault('startb' (* '[������ �������������� ����� ' *)), 0, 0);
      rvDescryption.AddNL(inttostr(i) + '/' + end_block, 1, -1);
      rvDescryption.AddNL(']', 0, -1);
      PosInIni := ii;
      for j := 1 to StrToInt(tmp_param) do
      begin
        fParseAndProcess();
      end;
          //if value = 'range error' then break;
      rvDescryption.AddNL('              ' + lang.GetTextOrDefault('endb' (* '[����� �������������� ����� ' *)), 0, 0);
      rvDescryption.AddNL(inttostr(i) + '/' + end_block, 1, -1);
      rvDescryption.AddNL(']', 0, -1);
          //PrintFuncsParams('Item'+PacketName);
    end;
  end;
end;
//=======================================================================
procedure TfPacketView.fFor();
var
  i, j : integer;
begin
      //�������������
  addToDescr(offset, typ, name_, value + hexvalue);
  tmp_param := param1;
  tmp_value := value;
  ii := PosInIni;
  if value = 'range error' then
  begin
    exit;
  end;
  if StrToInt(value) = 0 then
  begin
        //���������� ������ ��������
    for i := 1 to StrToInt(param1) do
    begin
      //��� �� ��� ���������
      // if (PosInIni<Length(StrIni))and(PosInPkt<sizze+10)

      Param0 := GetType(StrIni, PosInIni);
      inc(PosInIni);
    end;
  end
  else
  begin
        //rvDescryption.AddNL('Mask : ', 0, 0);
        //rvDescryption.AddNL(blockmask, 4, -1);
        //blockmask := '';
    for i := 1 to StrToInt(tmp_value) do
    begin
      rvDescryption.AddNL('              ' + lang.GetTextOrDefault('startb' (* '[������ �������������� ����� ' *)), 0, 0);
      rvDescryption.AddNL(inttostr(i) + '/' + tmp_value, 1, -1);
      rvDescryption.AddNL(']', 0, -1);
      PosInIni := ii;
      for j := 1 to StrToInt(tmp_param) do
      begin
        fParseAndProcess();
      end;
      rvDescryption.AddNL('              ' + lang.GetTextOrDefault('endb' (* '[����� �������������� ����� ' *)), 0, 0);
      rvDescryption.AddNL(inttostr(i) + '/' + tmp_value, 1, -1);
      rvDescryption.AddNL(']', 0, -1);
    end;
  end;
end;
//******************************************************************************
//******************************************************************************
//******************************************************************************
 //=======================================================================
procedure TfPacketView.fParseJ();
begin
  offset := PosinPkt - 11;
  oldpos := PosInPkt;
  //��������� �������� �� ������, �������� ��������� � ������������ � ����� ��������
  value := GetValue(typ, name_, PktStr, PosInPkt);
//���������� �������
  if AllowedName(name_) then
  begin
    FuncParamNames.Add(name_);
    FuncParamTypes.Add(typ);
    FuncParamNumbers.Add(inttostr(length(blockmask)));
  end;
  blockmask := blockmask + typ;
  if PosInPkt - oldpos > 0 then
  begin
    addtoHex(StringToHex(copy(pktstr, oldpos, PosInPkt - oldpos), ' '));
  end;
end;
//=======================================================================
procedure TfPacketView.InterpretJava(PacketJava : TJavaParser; SkipID : boolean; PktStr : string; var PosInPkt : integer; var typ, name_, value, hexvalue : string; size : word);
var
  strIndex, tmp : integer;
  brkLeft, brkRigth, count, index, depth : integer;
//  text: string;
  i : integer;
  isFind, isEnd : boolean;
  s, ss : string;
begin
  PacketJava.fFindProc();    //���� ��������� � ��������� �������
  isFind := false;
  isEnd := false;
  strIndex := PacketJava.GetStrIndex;
  brkLeft := 0;
  brkRigth := 0;
  count := 0;
  index := 0;
  depth := 0; //������� FOR, Switch, IF
  s := 'body=0';
  //���������� �� ����
  PacketJava.fPush(brkLeft, brkRigth, count, index);
  PacketJava.fPush1(s);
  //������� ���� ����������
  while (PacketJava.GetStrIndex < PacketJava.Count) and (PosInPkt < size + 11) do
  begin
    strIndex := PacketJava.GetStrIndex;
//    text:=PacketJava.GetString(PacketJava.GetStrIndex);
    PacketJava.ParseString;
    if PacketJava.CountToken() > 0 then
    begin
      s := PacketJava.GetString(strIndex);
      //������������ byte[]
      if PacketJava.FindToken('byte') <> -1 then
      begin
        PacketJava.fByte();
      end
      else
      //������������ ���������� � �������
      if (Pos('=', s) > 0) then
      begin
        PacketJava.fMove();
      end
      else
      //���� ����� ��� ����������� ����������� ������
      if (PacketJava.FindToken('writeimpl') <> -1) or
        (PacketJava.FindToken('readimpl') <> -1) then
      begin
        s := 'impl=0';
        //���������� �� ����
        PacketJava.fPush(brkLeft, brkRigth, count, index);
        PacketJava.fPush1(s);
        while (PacketJava.GetStrIndex < PacketJava.Count) and (not isEnd) do // and (PosInPkt<size+10) do
        begin
          s := PacketJava.GetString(strIndex);
          brkLeft := 0;
          brkRigth := 0;
          count := 0;
          index := 0;
          depth := 0; //������� FOR, Switch, IF
          if PacketJava.CountToken() > 0 then
          begin
            typ := '';
            tmp := PosInPkt;
            //������������ runImpl - �����
            if PacketJava.FindToken('runimpl') <> -1 then
            begin
              isEnd := true;
            end
            else
            //������������ byte[]
            if PacketJava.FindToken('byte') <> -1 then
            begin
              PacketJava.fByte();
            end
            else

            //==============================================================
            //������������ WRITE
            if (Pos('write', s) > 0) then
            begin
              //WRITEQ
              if PacketJava.FindToken('writeq') <> -1 then
              begin
                typ := 'q';
                PacketJava.fWriteD(PktStr, PosInPkt, typ, name_, value, hexvalue);
              end
              else
              //WRITED
              if PacketJava.FindToken('writed') <> -1 then
              begin
                typ := 'd';
                PacketJava.fWriteD(PktStr, PosInPkt, typ, name_, value, hexvalue);
              end
              else
              //WRITEH
              if PacketJava.FindToken('writeh') <> -1 then
              begin
                typ := 'h';
                PacketJava.fWriteD(PktStr, PosInPkt, typ, name_, value, hexvalue);
              end
              else
              //WRITED
              if PacketJava.FindToken('writes') <> -1 then
              begin
                typ := 's';
                PacketJava.fWriteD(PktStr, PosInPkt, typ, name_, value, hexvalue);
              end
              else
              //WRITEC
              if PacketJava.FindToken('writec') <> -1 then
              begin
                //��������� WriteC
                if SkipID then
                begin
                  SkipID := false;
                end
                else
                begin
                  typ := 'c';
                  PacketJava.fWriteD(PktStr, PosInPkt, typ, name_, value, hexvalue);
                end;
              end
              else
              //WRITEB
              if PacketJava.FindToken('writeb') <> -1 then
              begin
                typ := '-';
                PacketJava.fWriteB(PktStr, PosInPkt, typ, name_, value, hexvalue);
              end
              else
              //WRITEF
              if PacketJava.FindToken('writef') <> -1 then
              begin
                if ((GlobalProtocolVersion < CHRONICLE4)) then // ��� ����
                begin
                  typ := 'n';
                end
                else
                begin
                  typ := 'f';
                end;
                PacketJava.fWriteD(PktStr, PosInPkt, typ, name_, value, hexvalue);
              end;
//            end;
            end
            else

            //==============================================================
            //������������ READ
            if (Pos('read', s) > 0) then
            begin
              //READQ
              if PacketJava.FindToken('readq') <> -1 then
              begin
                typ := 'q';
                PacketJava.fReadD(PktStr, PosInPkt, typ, name_, value, hexvalue);
              end
              else
              //READD
              if PacketJava.FindToken('readd') <> -1 then
              begin
                typ := 'd';
                PacketJava.fReadD(PktStr, PosInPkt, typ, name_, value, hexvalue);
              end
              else
              //READH
              if PacketJava.FindToken('readh') <> -1 then
              begin
                typ := 'h';
                PacketJava.fReadD(PktStr, PosInPkt, typ, name_, value, hexvalue);
              end
              else
              //READC
              if PacketJava.FindToken('readc') <> -1 then
              begin
                typ := 'c';
                PacketJava.fReadD(PktStr, PosInPkt, typ, name_, value, hexvalue);
              end
              else
              //READS
              if PacketJava.FindToken('reads') <> -1 then
              begin
                typ := 's';
                PacketJava.fReadD(PktStr, PosInPkt, typ, name_, value, hexvalue);
              end
              else
              //READB
              if PacketJava.FindToken('readb') <> -1 then
              begin
                typ := '-';
                PacketJava.fReadB(PktStr, PosInPkt, typ, name_, value, hexvalue);
              end
              else
              //READF
              if PacketJava.FindToken('readf') <> -1 then
              begin
                if ((GlobalProtocolVersion < CHRONICLE4)) then // ��� ����
                begin
                  typ := 'n';
                end
                else
                begin
                  typ := 'f';
                end;
                PacketJava.fReadD(PktStr, PosInPkt, typ, name_, value, hexvalue);
              end;
//            end;
            end
            else
//-->
            //IF
            if PacketJava.FindToken('if') <> -1 then
            begin
              brkLeft := PacketJava.GetStrIndex; //������ ����
              brkRigth := brkLeft;           //����� ����
              if PacketJava.fIf(brkLeft, brkRigth, count) then   //��� �� ���� ������
              begin
                PacketJava.SetStrIndex(brkLeft); //������ � ������
                strIndex := PacketJava.GetStrIndex;
//                text:=PacketJava.GetString(strIndex);
                //������ IF
                inc(depth);
                s := 'if=' + inttostr(depth);
                //���������� �� ����
                PacketJava.fPush(brkLeft, brkRigth, count, index);
                PacketJava.fPush1(s);
              end
              else //������ �� ������
              begin
                PacketJava.SetStrIndex(brkRigth); //����������
                strIndex := PacketJava.GetStrIndex;
//                text:=PacketJava.GetString(strIndex);
              end;
            end
            else
//-->
            //���� ����� ����� ELSE, �� ���������� ��� �����
            if PacketJava.FindToken('else') <> -1 then
            begin
              brkLeft := PacketJava.GetStrIndex; //������ ����
              brkRigth := brkLeft;           //����� ����
//              isIf:=PacketJava.fElse(brkLeft, brkRigth, count);
              PacketJava.SetStrIndex(brkRigth); //����������
              strIndex := PacketJava.GetStrIndex;
//              text:=PacketJava.GetString(strIndex);
            end
            else
//-->
            //SWITCH
            if PacketJava.FindToken('switch') <> -1 then
            begin
              brkLeft := PacketJava.GetStrIndex; //������ ����
              brkRigth := brkLeft;           //����� ����
              PacketJava.fSwitch(brkLeft, brkRigth, count);
              PacketJava.SetStrIndex(brkLeft); //������ � ������
              strIndex := PacketJava.GetStrIndex;
//              text:=PacketJava.GetString(strIndex);
              //������ switch
              inc(depth);
              s := 'switch=' + inttostr(depth);
              //���������� �� ����
              PacketJava.fPush(brkLeft, brkRigth, count, index);
              PacketJava.fPush1(s);
            end
            else
            //CASE
            if PacketJava.FindToken('case') <> -1 then
            begin
              //����� �� �����
              PacketJava.fPop1(s);
              PacketJava.fPop(brkLeft, brkRigth, count, index);
              PacketJava.fCase(brkLeft, brkRigth, count);
              //���������� �� ����
              PacketJava.fPush(brkLeft, brkRigth, count, index);
              PacketJava.fPush1(s);
            end
            else
            //break
            if PacketJava.FindToken('break') <> -1 then
            begin
              //����� �� �����
              PacketJava.fPop1(s);
              PacketJava.fPop(brkLeft, brkRigth, count, index);
              PacketJava.SetStrIndex(brkRigth); //� ����� switch
            end
            else
//-->
            //FOR
            if PacketJava.FindToken('for') <> -1 then
            begin
              brkLeft := PacketJava.GetStrIndex; //������ ����
              brkRigth := brkLeft;           //����� ����
              PacketJava.fFor(brkLeft, brkRigth, count);
              //mask
              if count > 32767 then
//                count:=(count XOR $FFFF)+1;
              begin
                count := (-1 * count) and $FFFF;
              end;

              if (count > 0) and (not PacketJava.fEmptyFor(brkLeft, brkRigth)) then
              begin
                PacketJava.SetStrIndex(brkLeft); //������ ���� � ������
                //������ �����
                inc(depth);
                s := 'for=' + inttostr(depth);
                index := 1;
                //���������� �� ����
                PacketJava.fPush(brkLeft, brkRigth, count, index);
                PacketJava.fPush1(s);

                rvDescryption.AddNL('              ' + lang.GetTextOrDefault('startb' (* '[������ �������������� ����� ' *)), 0, 0);
                rvDescryption.AddNL(inttostr(index) + '/' + inttostr(count), 1, -1);
                rvDescryption.AddNL(']', 0, -1);
              end;
              strIndex := PacketJava.GetStrIndex;
//              text:=PacketJava.GetString(strIndex);
              //����� ��������� ����� �����
              //PacketJava.ClearKeywords; //��������
            end
            else
            //{
            if PacketJava.FindToken('{') <> -1 then
            begin
              //����� �� �����
              PacketJava.fPop1(s);
              //����� �� �����
              PacketJava.fPop(brkLeft, brkRigth, count, index);
//              if (Pos('for',s)>0) then
//              begin
//                rvDescryption.AddNL('              '+lang.GetTextOrDefault('startb' (* '[������ �������������� ����� ' *) ), 0, 0);
//                rvDescryption.AddNL(inttostr(index)+'/'+inttostr(count), 1, -1);
//                rvDescryption.AddNL(']', 0, -1);
//              end;
///              if (Pos('if',s)>0) then
///              if (Pos('switch', s)>0) then
              //���������� �� ����
              PacketJava.fPush(brkLeft, brkRigth, count, index);
              PacketJava.fPush1(s);
            end
            else
            //}
            if PacketJava.FindToken('}') <> -1 then
            begin
              //����� �� �����
              PacketJava.fPop1(s);
              i := Pos('=', s) + 1;
              ss := copy(s, i, length(s) - Pos('=', s));
              depth := strtoint(ss);
              //����� �� �����
              PacketJava.fPop(brkLeft, brkRigth, count, index);
              //============
              //FOR
              if (Pos('for', s) > 0) then
              begin
                rvDescryption.AddNL('              ' + lang.GetTextOrDefault('endb' (* '[����� �������������� ����� ' *)), 0, 0);
                rvDescryption.AddNL(inttostr(index) + '/' + inttostr(count), 1, -1);
                rvDescryption.AddNL(']', 0, -1);
                if index < count then
                begin
                  inc(index); //:=index+1;
                  PacketJava.SetStrIndex(brkLeft); //������ ���� � ������

                  rvDescryption.AddNL('              ' + lang.GetTextOrDefault('startb' (* '[������ �������������� ����� ' *)), 0, 0);
                  rvDescryption.AddNL(inttostr(index) + '/' + inttostr(count), 1, -1);
                  rvDescryption.AddNL(']', 0, -1);

                end
                else
                begin
                  dec(depth);
                end;
                s := 'for=' + inttostr(depth);
                if depth > 0 then
                begin
                  //���������� �� ����
                  PacketJava.fPush(brkLeft, brkRigth, count, index);
                  PacketJava.fPush1(s);
                end;
              end
              else
              //============
              //IF
              if (Pos('if', s) > 0) then
              begin
                dec(depth);
                s := 'if=' + inttostr(depth);
                if depth > 0 then
                begin
                  //���������� �� ����
                  PacketJava.fPush(brkLeft, brkRigth, count, index);
                  PacketJava.fPush1(s);
                end;
              end
              else
              //============
              //SWITCH
              if (Pos('switch', s) > 0) then
              begin
                dec(depth);
                s := 'switch=' + inttostr(depth);
                if depth > 0 then
                begin
                  //���������� �� ����
                  PacketJava.fPush(brkLeft, brkRigth, count, index);
                  PacketJava.fPush1(s);
                end;
              end
              else
              //============
              //Proc
              if (Pos('proc', s) > 0) then
              begin
                PacketJava.SetStrIndex(brkRigth); //RETURN
              end;
            end
            else
            begin
//-->
              //�������� �� ���������
              brkLeft := PacketJava.GetStrIndex; //������ ����
              brkRigth := brkLeft;           //����� ����
              isFind := PacketJava.fProcExec(brkLeft, brkRigth);
              if isFind then   //��� �� ���� ������
              begin
                PacketJava.SetStrIndex(brkLeft); //������ � ������
                strIndex := PacketJava.GetStrIndex;
//                text:=PacketJava.GetString(strIndex);
                s := 'proc=0';
                //���������� �� ����
                PacketJava.fPush(brkLeft, brkRigth, count, index);
                PacketJava.fPush1(s);
              end;
//-->
              //������� ����������
              s := PacketJava.GetString(strIndex);
              if (Pos('=', s) > 0) then
              begin
                PacketJava.fMove();
              end;
            end;
//-->
            if typ <> '' then
            begin
//              if (tmp>size+10) then //�������� �� ����� �� ����� ������
//              begin
//                PosInPkt:=size; //�������� �� ����� ������ � �� �����
//                fParseJ();
//                isEnd:=true;
//                PosInPkt:=tmp;
//              end else
              begin
                PosInPkt := tmp; //�������� � ������� �������
                fParseJ();
              end;
              //����� �������� Get.ItemID  � �.�. value:=GetSkill(strtoint(value))
              //...
              if (PacketJava.FindToken('skillid') <> -1) or (PacketJava.FindToken('spellid') <> -1) then
              begin
                if ((GlobalProtocolVersion < CHRONICLE4)) then // ��� ����
                begin
                  value := GetSkillAion(strtoint(value));
                end
                else
                begin
                  value := GetSkill(strtoint(value));
                end;
              end
              else
              if (PacketJava.FindToken('msgid') <> -1) or (PacketJava.FindToken('messageid') <> -1) then
              begin
                if ((GlobalProtocolVersion < CHRONICLE4)) then // ��� ����
                begin
                  s := GetMsgIDA(strtoint(value));
                  if (Pos('Unkn', s) > 0) then
                  begin
                    s := GetFuncStrAion(strtoint(value));
                  end;
                  value := s;
                end
                else
                begin
                  value := GetMsgID(strtoint(value));
                end;
              end
              else
              if (PacketJava.FindToken('classid') <> -1) or (PacketJava.FindToken('racesex') <> -1) or (PacketJava.FindToken('mapid') <> -1) then
              begin
                if ((GlobalProtocolVersion < CHRONICLE4)) then // ��� ����
                begin
                  value := GetClassIDAion(strtoint(value));
                end
                else
                begin
                  value := GetClassID(strtoint(value));
                end;
              end
              else
              if (PacketJava.FindToken('templateid') <> -1) or (PacketJava.FindToken('recipeid') <> -1) or (PacketJava.FindToken('itemid') <> -1) then
              begin
                if ((GlobalProtocolVersion < CHRONICLE4)) then // ��� ����
                begin
                  value := GetFunc01Aion(strtoint(value));
                end
                else
                begin
                  value := GetFunc01(strtoint(value));
                end;
              end
              else
              if (PacketJava.FindToken('npcid') <> -1)
                  //OR (PacketJava.FindToken('_npcid') <> -1)
              then
              begin
                if ((GlobalProtocolVersion < CHRONICLE4)) then
                begin
                end // ��� ����
                  //value:=GetNpcIDA(strtoint(value))
                else
                begin
                  value := GetNpcID(strtoint(value));
                end;
              end
              else
              if (PacketJava.FindToken('actionid') <> -1)
                  //OR (PacketJava.FindToken('actionid') <> -1)
                  //OR (PacketJava.FindToken('getactionid') <> -1)
              then
              begin
                if ((GlobalProtocolVersion < CHRONICLE4)) then
                begin
                end // ��� ����
                  //value:=GetF9(strtoint(value))
                else
                begin
                  value := GetF9(strtoint(value));
                end;
              end
              else
              if (PacketJava.FindToken('attrid') <> -1)
                  //OR (PacketJava.FindToken('_attrid') <> -1)
                  //OR (PacketJava.FindToken('getattrid') <> -1)
              then
              begin
                if ((GlobalProtocolVersion < CHRONICLE4)) then
                begin
                end // ��� ����
                  //value:=GetFsup(strtoint(value))
                else
                begin
                  value := GetFsup(strtoint(value));
                end;
              end;

//              if (PosInPkt<size+10) then
              addToDescr(offset, typ, name_, value + hexvalue);
            end;
          end;
          strIndex := PacketJava.GetStrIndex;
          text := PacketJava.GetString(PacketJava.GetStrIndex);
          PacketJava.ParseString;
          if (PosInPkt > size + 11) then
          begin
            isEnd := true;
          end;
        end;
      end;
    end;
  end;
end;
//=======================================================================
procedure TfPacketView.InterpretatorJava(PacketName, Packet : string; size : word = 0);
var
  PacketJava : TJavaParser;
  FromServer, SkipID : boolean;
  hexid : string;
begin
  //��������� packets.ini
  //�� opcode ������� PacketName
  PacketJava := TJavaParser.Create;

  FuncParamNames := TStringList.Create;
  FuncParamTypes := TStringList.Create;
  FuncParamNumbers := TStringList.Create;
  FuncNames := TStringList.Create;
  SkipId := false; //ID �� ����������
  try
    //������ ������
    PktStr := HexToString(Packet);
    if Length(PktStr) < 12 then
    begin
      Exit;
    end;
    FromServer := (PktStr[1] = #03);

    Move(PktStr[2], ptime, 8);
    if size = 0 then
    begin
      Size := word(byte(PktStr[11]) shl 8) + byte(PktStr[10]);
    end
    else
    begin
      ptime := now;
    end;
    //������ ������� �� ������� ��������
    wSize := size;
    if (GlobalProtocolVersion = AION) then // ��� ���� 2.1 - 2.6
    begin
      cID := byte(PktStr[12]); //����������� ������ ������, ID
      wSubID := 0;   //�� ���������
      wSub2ID := 0;   //�� ���������
    end
    else
    if (GlobalProtocolVersion = AION27) then // ��� ���� 2.7 ����������� ID
    begin
      cID := byte(PktStr[12]);                    //� cID - ID ������ ��� ����������� ID
      wSubID := word(byte(PktStr[13]) shl 8 + cID); //� wSubId - ID ������ ��� ����������� ID
      wSub2ID := 0;   //�� ���������
    end
    else //��� Lineage II
    begin
      if wSize = 3 then
      begin
        cID := byte(PktStr[12]); //����������� ������ ������, ID
        wSubID := 0;    //����� ����������, ����� � subid 0
        wSub2ID := 0;   //�� ���������
      end
      else
      begin
        if FromServer {PktStr[1]=#04} then
        begin      //client  04,
          cID := byte(PktStr[13]); //��������� ���� ������� ID � wSub2ID
          wSub2ID := word(cID shl 8 + byte(PktStr[14]));
          cID := byte(PktStr[12]); //����������� ������ ������, ID
          wSubID := word(cID shl 8 + byte(PktStr[13])); //��������� ���� ������� ID � wSubID
        end
        else  //������  03, ��������� ���� � ������� ������� ID
        begin
          cID := byte(PktStr[12]); //����������� ������ ������, ID
          if wSize = 3 then
          begin
            wSubID := 0;    //����� ����������, ����� � subid 0
            wSub2ID := 0;    //����� ����������, ����� � subid 0
          end
          else
          begin
            cID := byte(PktStr[14]); //����������� ������ SUB2ID
            wSub2ID := word(cID shl 8 + byte(PktStr[15])); //��������� Sub2Id
            cID := byte(PktStr[12]);                   //����������� ������ ������, ID
            wSubID := word(cID shl 8 + byte(PktStr[13])); //��������� SubId
          end;
        end;
      end;
    end;

    currentpacket := StringToHex(copy(PktStr, 12, length(PktStr) - 11), ' ');

    rvHEX.Clear;
    rvDescryption.Clear;
    rvFuncs.Clear;

    GetPacketName(cID, wSubID, wSub2ID, (PktStr[1] = #03), PacketName, isshow, hexid);
    //��������� �������� ������
    if (GlobalProtocolVersion = AION) then // ��� ���� 2.1 - 2.6
    begin
      if PktStr[1] = #03 then //server
      begin
        PacketJava.LoadFromFile(AppPath + 'settings\packets.ini\aion21\serverpackets\' + LowerCase(PacketName) + '.java');
      end
      else    //client
      begin
        PacketJava.LoadFromFile(AppPath + 'settings\packets.ini\aion21\clientpackets\' + LowerCase(PacketName) + '.java');
      end;
    end
    else
    if (GlobalProtocolVersion = AION27) then // ��� ���� 2.7
    begin
      if PktStr[1] = #03 then //server
      begin
        PacketJava.LoadFromFile(AppPath + 'settings\packets.ini\aion27\serverpackets\' + LowerCase(PacketName) + '.java');
      end
      else    //client
      begin
        PacketJava.LoadFromFile(AppPath + 'settings\packets.ini\aion27\clientpackets\' + LowerCase(PacketName) + '.java');
      end;
    end
    else
    if (GlobalProtocolVersion > Aion27) and (GlobalProtocolVersion < interlude) then // ��� C4, C5
    begin
      if PktStr[1] = #03 then   //server
      begin
        PacketJava.LoadFromFile(AppPath + '.\settings\packets.ini\c4\serverpackets\' + LowerCase(PacketName) + '.java');
      end
      else   //client
      begin
        PacketJava.LoadFromFile(AppPath + '.\settings\packets.ini\c4\clientpackets\' + LowerCase(PacketName) + '.java');
      end;
    end
    else
    if (GlobalProtocolVersion = interlude) then // ��� Interlude
    begin
      if PktStr[1] = #03 then   //server
      begin
        PacketJava.LoadFromFile(AppPath + '.\settings\packets.ini\interlude\serverpackets\' + LowerCase(PacketName) + '.java');
      end
      else   //client
      begin
        PacketJava.LoadFromFile(AppPath + '.\settings\packets.ini\interlude\clientpackets\' + LowerCase(PacketName) + '.java');
      end;
    end
    else
    if (GlobalProtocolVersion = Gracia) then // ��� Gracia
    begin
      if PktStr[1] = #03 then   //server
      begin
        PacketJava.LoadFromFile(AppPath + '.\settings\packets.ini\gracia\serverpackets\' + LowerCase(PacketName) + '.java');
      end
      else   //client
      begin
        PacketJava.LoadFromFile(AppPath + '.\settings\packets.ini\gracia\clientpackets\' + LowerCase(PacketName) + '.java');
      end;
    end
    else
    if (GlobalProtocolVersion = GraciaFinal) then // ��� GraciaFinal
    begin
      if PktStr[1] = #03 then   //server
      begin
        PacketJava.LoadFromFile(AppPath + '.\settings\packets.ini\graciafinal\serverpackets\' + LowerCase(PacketName) + '.java');
      end
      else   //client
      begin
        PacketJava.LoadFromFile(AppPath + '.\settings\packets.ini\graciafinal\clientpackets\' + LowerCase(PacketName) + '.java');
      end;
    end
    else
    if (GlobalProtocolVersion = GraciaEpilogue) then // ��� GraciaEpilogue
    begin
      if PktStr[1] = #03 then   //server
      begin
        PacketJava.LoadFromFile(AppPath + '.\settings\packets.ini\graciaepilogue\serverpackets\' + LowerCase(PacketName) + '.java');
      end
      else   //client
      begin
        PacketJava.LoadFromFile(AppPath + '.\settings\packets.ini\graciaepilogue\clientpackets\' + LowerCase(PacketName) + '.java');
      end;
    end
    else
    if (GlobalProtocolVersion = HighFive) then // ��� HighFive
    begin
      if PktStr[1] = #03 then   //server
      begin
        PacketJava.LoadFromFile(AppPath + '.\settings\packets.ini\HighFive\serverpackets\' + LowerCase(PacketName) + '.java');
      end
      else   //client
      begin
        PacketJava.LoadFromFile(AppPath + '.\settings\packets.ini\HighFive\clientpackets\' + LowerCase(PacketName) + '.java');
      end;
    end
    else
    if (GlobalProtocolVersion = GoD) then // ��� GoD
    begin
      if PktStr[1] = #03 then   //server
      begin
        PacketJava.LoadFromFile(AppPath + '.\settings\packets.ini\god\serverpackets\' + LowerCase(PacketName) + '.java');
      end
      else   //client
      begin
        PacketJava.LoadFromFile(AppPath + '.\settings\packets.ini\god\clientpackets\' + LowerCase(PacketName) + '.java');
      end;
    end;

    Label1.Caption := lang.GetTextOrDefault('IDS_109' (* '���������� �����: ��� - 0x' *)) + IntToHex(cID, 2) + ', ' + PacketName + lang.GetTextOrDefault('size' (* ', ������ - ' *)) + IntToStr(wSize);
    //�������� � pkt
    PosInPkt := 13;
    //�������� ��������� ����� �� ��������� � packets.ini �������
    //��������� ���
    rvDescryption.AddNL(lang.GetTextOrDefault('IDS_121' (* 'T��: ' *)), 11, 0);
    if ((GlobalProtocolVersion = AION27) and (wSubId <> 0)) then // ��� ���� 2.7 ����������� ID
    begin
      rvDescryption.AddNLTag('0x' + IntToHex(wSubId, 4), 0, -1, 1);
    end
    else
    begin
      rvDescryption.AddNLTag('0x' + IntToHex(cID, 2), 0, -1, 1);
    end;
    rvDescryption.AddNL(' (', 0, -1);
    rvDescryption.AddNL(PacketName, 1, -1);
    rvDescryption.AddNL(')', 0, -1);
    //��������� ������ � �����
    rvDescryption.AddNL(lang.GetTextOrDefault('size2' (* 'P�����: ' *)), 0, 0);
    rvDescryption.AddNL(IntToStr(wSize - 2), 1, -1);
    rvDescryption.AddNL('+2', 2, -1);

    rvDescryption.AddNL(lang.GetTextOrDefault('IDS_126' (* '����� �������: ' *)), 0, 0);
    rvDescryption.AddNL(FormatDateTime('hh:nn:ss:zzz', ptime), 1, -1);

    itemTag := 0;
    templateindex := 11;
    if ((GlobalProtocolVersion = AION27) and (wSubId <> 0)) then // ��� ���� 2.7 ����������� ID
    begin
      addtoHex(StringToHex(copy(pktstr, 12, 2), ' '));
      inc(PosInPkt);
    end
    else
    begin
      addtoHex(StringToHex(copy(pktstr, 12, 1), ' '));
    end;
    itemTag := 1;

    //PktStr - �����
    //PosInPkt - �������� � ������
    try
      blockmask := '';
      //� ����� �� ���� ������� ���� h(id2), �������� � ���������� ���, ������� ������� ��� ����
//      if ((GlobalProtocolVersion<CHRONICLE4))then // ��� ����
      if (GlobalProtocolVersion < CHRONICLE4) then // ��� ���� � ����������� ID
      begin
        if (wSubID = 0) then // ��� ���� � ����������� ID
        begin
          typ := 'h';
          name_ := 'id2';
          fParseJ();  //�������� HEX ������
          addToDescr(offset, typ, name_, value + hexvalue); //��������� �����������
          typ := '';
          name_ := '';
        end
        else // ����������� ID
        begin
          typ := 'c';
          name_ := 'static';
          fParseJ();  //�������� HEX ������
          addToDescr(offset, typ, name_, value + hexvalue); //��������� �����������
          typ := 'h';
          name_ := 'id2';
          fParseJ();  //�������� HEX ������
          addToDescr(offset, typ, name_, value + hexvalue); //��������� �����������
          typ := '';
          name_ := '';
        end;
      end;
      //LineageII � ��������� ������� � ��������� ���� �������� �� c(ID) ��� ���� ������������
      if (GlobalProtocolVersion > Aion27) and FromServer then // ��� LineageII
      begin
        //�������� � pkt
        SkipID := true;
      end;
//-->>
      InterpretJava(PacketJava, SkipID, PktStr, PosInPkt, typ, name_, value, hexvalue, size);
//-->>
      oldpos := PosInPkt;
      PosInPkt := wSize + 10;
      if PosInPkt - oldpos > 0 then    //������������ ������� �� ������������ ����
      begin
        addtoHex(StringToHex(copy(pktstr, oldpos, PosInPkt - oldpos), ' '));
      end;

      if blockmask <> '' then
      begin
        PrintFuncsParams('Pck' + PacketName);
      end;

      rvHEX.FormatTail;
      rvFuncs.FormatTail;
      rvDescryption.FormatTail;
    except
        //������ ��� ����������� ������
    end;
  finally
    FuncParamNames.Destroy;
    FuncParamTypes.Destroy;
    FuncParamNumbers.Destroy;
    FuncNames.Destroy;
    ////////////////////////////////////////////////////////
    PacketJava.Destroy;
  end;
end;
//******************************************************************************
//******************************************************************************
//=======================================================================
procedure TfPacketView.ParsePacket(PacketName, Packet : string; size : word = 0);
var
  hexid : string;
begin
  FuncParamNames := TStringList.Create;
  FuncParamTypes := TStringList.Create;
  FuncParamNumbers := TStringList.Create;
  FuncNames := TStringList.Create;
  //HexViewOffset := GlobalSettings.HexViewOffset;
  try
    //������ ������, sid - ����� ������, cid - ����� ����������
    PktStr := HexToString(packet);
    if Length(PktStr) < 12 then
    begin
      Exit;
    end;
    Move(PktStr[2], ptime, 8);
    if size = 0 then
    begin
      Size := word(byte(PktStr[11]) shl 8) + byte(PktStr[10]);
    end
    else
    begin
      ptime := now;
    end;
    //������ ������� �� ������� ��������
    wSize := size;

    currentpacket := StringToHex(copy(PktStr, 12, length(PktStr) - 11), ' ');

    rvHEX.Clear;
    rvDescryption.Clear;
    rvFuncs.Clear;

    cid := ord(PktStr[12 + 0]);
    if length(PktStr) - 11 >= 3 then
    begin
      wsubid := word(ord(PktStr[12 + 1]) + ord(PktStr[12 + 2]) shl 8);
    end
    else
    begin
      wsubid := 0;
    end;
    if length(PktStr) - 11 >= 5 then
    begin
      wsub2id := word(ord(PktStr[12 + 3]) + ord(PktStr[12 + 4]) shl 8);
    end
    else
    begin
      wsub2id := 0;
    end;

    GetPacketName(cID, wSubID, wSub2ID, (PktStr[1] = #03), PacketName, isshow, hexid);

    if PktStr[1] = #04 then
    begin
      StrIni := PacketsINI.ReadString('client', hexid, 'Unknown:');
    end
    else
    begin
      StrIni := PacketsINI.ReadString('server', hexid, 'Unknown:');
    end;
    Label1.Caption := lang.GetTextOrDefault('IDS_109' (* '���������� �����: ��� - 0x' *)) + copy(hexid, 1, 2) + ', ' + PacketName + lang.GetTextOrDefault('size' (* ', ������ - ' *)) + IntToStr(wSize);
    //�������� ��������� ����� �� ��������� � packets.ini �������
    //�������� � ini
    PosInIni := Pos(':', StrIni);
    //�������� � pkt
    PosInPkt := 13;
    Inc(PosInIni);
    //��������� ���
    rvDescryption.AddNL(lang.GetTextOrDefault('IDS_121' (* 'T��: ' *)), 11, 0);
    if ((GlobalProtocolVersion = AION27) and (wSubId <> 0)) then // ��� ���� 2.7 ����������� ID
    begin
      rvDescryption.AddNLTag('0x' + IntToHex(wSubId, 4), 0, -1, 1);
    end
    else
    begin
      rvDescryption.AddNLTag('0x' + IntToHex(cID, 2), 0, -1, 1);
    end;
    rvDescryption.AddNL(' (', 0, -1);
    rvDescryption.AddNL(PacketName, 1, -1);
    rvDescryption.AddNL(')', 0, -1);
    //��������� ������ � �����
    rvDescryption.AddNL(lang.GetTextOrDefault('size2' (* 'P�����: ' *)), 0, 0);
    rvDescryption.AddNL(IntToStr(wSize - 2), 1, -1);
    rvDescryption.AddNL('+2', 2, -1);

    rvDescryption.AddNL(lang.GetTextOrDefault('IDS_126' (* '����� �������: ' *)), 0, 0);
    rvDescryption.AddNL(FormatDateTime('hh:nn:ss:zzz', ptime), 1, -1);

    itemTag := 0;
    templateindex := 11;

    if ((GlobalProtocolVersion = AION27) and (wSubId <> 0)) then // ��� ���� 2.7 ����������� ID
    begin
      addtoHex(StringToHex(copy(pktstr, 12, 2), ' '));
      inc(PosInPkt);
    end
    else
    begin
      addtoHex(StringToHex(copy(pktstr, 12, 1), ' '));
    end;

    itemTag := 1;

    //GetType - ���������� ������� ���� d(Count:For.0001) �� packets.ini
    //StrIni - ������� �� packets.ini �� ID �� ������
    //PktStr - �����
    //Param0 - ������ d(Count:For.0001)
    //PosInIni - �������� � ������� �� packets.ini �� ID �� ������
    //PosInPkt - �������� � ������
    try
      blockmask := '';
      while (PosInIni > 1) and (PosInIni < Length(StrIni)) and (PosInPkt < wSize + 10) do
      begin
        fParseAndProcess();
      end;
    except
      //������ ��� ����������� ������
    end;
    oldpos := PosInPkt;
    PosInPkt := wSize + 10;
    if PosInPkt - oldpos > 0 then
    begin
      addtoHex(StringToHex(copy(pktstr, oldpos, PosInPkt - oldpos), ' '));
    end;

    if blockmask <> '' then
    begin
      PrintFuncsParams('Pck' + PacketName);
    end;

    rvHEX.FormatTail;
    rvFuncs.FormatTail;
    rvDescryption.FormatTail;
  finally
    FuncParamNames.Destroy;
    FuncParamTypes.Destroy;
    FuncParamNumbers.Destroy;
    FuncNames.Destroy;
  end;
end;
//==============================================================================
procedure TfPacketView.rvHEXMouseMove(Sender : TObject; Shift : TShiftState; X, Y : integer);
begin
//    rvHEX.SetFocusSilent;
end;

procedure TfPacketView.rvDescryptionMouseMove(Sender : TObject; Shift : TShiftState; X, Y : integer);
begin
//    rvDescryption.SetFocusSilent;
end;

procedure TfPacketView.rvDescryptionRVMouseUp(Sender : TCustomRichView; Button : TMouseButton; Shift : TShiftState; ItemNo, X, Y : integer);
begin
  if ItemNo >= 0 then
  begin
    selectitemwithtag(rvDescryption.GetItemTag(ItemNo));
  end;
end;

procedure TfPacketView.selectitemwithtag(Itemtag : integer);
var
  i : integer;
begin
  i := 0;
  while (i < rvhex.ItemCount) do
  begin
    if rvHEX.GetItemStyle(i) >= 20 then
    begin
      dec(rvHEX.GetItem(i).StyleNo, 10);
    end;

    inc(i);
  end;

  i := 0;
  while (i < rvDescryption.ItemCount) do
  begin
    if rvDescryption.GetItemStyle(i) >= 20 then
    begin
      dec(rvDescryption.GetItem(i).StyleNo, 10);
    end;

    inc(i);
  end;

  if Itemtag < 1 then
  begin
    exit;
  end;
  i := 0;
  while (i < rvHEX.ItemCount) and (rvHEX.GetItemTag(i) <> ItemTag) do
  begin
    inc(i);
  end;
  if i < rvHEX.ItemCount then
  begin
    Inc(rvHEX.GetItem(i).StyleNo, 10);
    rvHEX.Format;
  end;

  i := 0;
  while (i < rvDescryption.ItemCount) and (rvDescryption.GetItemTag(i) <> ItemTag) do
  begin
    inc(i);
  end;
  if i < rvDescryption.ItemCount then
  begin
    Inc(rvDescryption.GetItem(i).StyleNo, 10);
    rvDescryption.Format;
  end;

end;

procedure TfPacketView.rvHEXRVMouseUp(Sender : TCustomRichView; Button : TMouseButton; Shift : TShiftState; ItemNo, X, Y : integer);
begin
  if ItemNo >= 0 then
  begin
    selectitemwithtag(rvHEX.GetItemTag(ItemNo));
  end;
end;

procedure TfPacketView.rvHEXSelect(Sender : TObject);
begin
  if rvHEX.SelectionExists then
  begin
    rvHEX.CopyDef;
    rvHEX.Deselect;
    rvHEX.Invalidate;
//        rvHEX.SetFocus;
  end;
end;

procedure TfPacketView.rvDescryptionSelect(Sender : TObject);
begin
  if rvDescryption.SelectionExists then
  begin
    rvDescryption.CopyDef;
    rvDescryption.Deselect;
    rvDescryption.Invalidate;
//        rvDescryption.SetFocus;
  end;
end;

function TfPacketView.get(param1 : string; id : byte; var value : string) : boolean;
begin
  result := false;
  if StrToIntDef(value, 0) <> StrToIntDef(value, 1) then
  begin
    exit;
  end;
  if param1 = 'FUNC01' then
  begin
    value := GetFunc01(strtoint(value));
  end
  else
  if param1 = 'FUNC01A' then
  begin
    value := GetFunc01Aion(strtoint(value));
  end
  else
  if param1 = 'FUNC02' then
  begin
    value := GetFunc02(strtoint(value));
  end
  else
  if param1 = 'FUNC09' then
  begin
    value := GetFunc09(id, strtoint(value));
  end
  else
  if param1 = 'CLASSID' then
  begin
    value := GetClassID(strtoint(value));
  end
  else
  if param1 = 'CLASSIDA' then
  begin
    value := GetClassIDAion(strtoint(value));
  end
  else
  if param1 = 'FSUP' then
  begin
    value := GetFsup(strtoint(value));
  end
  else
  if param1 = 'NPCID' then
  begin
    value := GetNpcID(strtoint(value));
  end
  else
  if param1 = 'MSGID' then
  begin
    value := GetMsgID(strtoint(value));
  end
  else
  if param1 = 'MSGIDA' then
  begin
    value := GetMsgIDA(strtoint(value));
  end
  else
  if param1 = 'SKILL' then
  begin
    value := GetSkill(strtoint(value));
  end
  else
  if param1 = 'SKILLA' then
  begin
    value := GetSkillAion(strtoint(value));
  end
  else
  if param1 = 'STRINGA' then
  begin
    value := GetFuncStrAion(strtoint(value));
  end
  else
  if param1 = 'F0' then
  begin
    value := GetF0(strtoint(value));
  end
  else
  if param1 = 'F1' then
  begin
    value := GetF1(strtoint(value));
  end
  else
  if param1 = 'F3' then
  begin
    value := GetF3(strtoint(value));
  end
  else
  if param1 = 'F9' then
  begin
    value := GetF9(strtoint(value));
  end
  else
  if param1 = 'FSAY2' then
  begin
    value := GetFSay2(strtoint(value));
  end
  else
  if param1 = 'AUGMENTID' then
  begin
    value := GetAugment(strtoint(value));
  end
  else
  begin
    value := GetFromIni(strtoint(value));
  end;
  result := true;
end;

procedure TfPacketView.N1Click(Sender : TObject);
begin
  N1.Checked := not N1.Checked;
  rvDescryption.WordWrap := N1.Checked;
  rvDescryption.Format;
end;

procedure TfPacketView.N2Click(Sender : TObject);
begin
  N2.Checked := not n2.Checked;
  rvFuncs.Visible := n2.Checked;
  Splitter2.Visible := N2.Checked;
  //Splitter2.Top := 1;
end;

procedure TfPacketView.rvFuncsSelect(Sender : TObject);
begin
  if rvFuncs.SelectionExists then
  begin
    rvFuncs.CopyDef;
    rvFuncs.Deselect;
    rvFuncs.Invalidate;
    rvFuncs.SetFocus;
  end;
end;


function TfPacketView.GetFromIni(const ar1 : integer) : string;
begin
  result := getfuncini.ReadString(param1, inttostr(ar1), 'undefined');
  result := result + ' ID:' + inttostr(ar1) + ' (0x' + inttohex(ar1, 4) + ')';
end;

end.
