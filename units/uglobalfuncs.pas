unit uGlobalFuncs;

interface

uses
  uResourceStrings,
  uSharedStructs,
  sysutils,
  windows,
  Classes,
  TlHelp32,
  PSAPI,
  advApiHook,
  inifiles,
  Controls,
  Messages,
  uencdec,
  ComCtrls;

const
  WM_Dll_Log = $04F0;               //�������� ��������� �� inject.dll
  WM_NewAction = WM_APP + 107;
  WM_AddLog = WM_APP + 108;
  WM_NewPacket = WM_APP + 109;
  WM_ProcessPacket = WM_APP + 110;
  WM_UpdAutoCompleate = WM_APP + 111;
  WM_BalloonHint = WM_APP + 112;

    //TencDec �������� �����
  TencDec_Action_LOG = 1; //������ � sLastPacket;  ���������� - PacketSend
  TencDec_Action_MSG = 2; //�a���� � sLastMessage; ���������� - Log
  TencDec_Action_GotName = 3; //������ � name; ���������� - UpdateComboBox1 (������� �������������)
  TencDec_Action_ClearPacketLog = 4; //������ ���. ������ �����; ���������� ClearPacketsLog
    //TSocketEngine �������� ���
  TSocketEngine_Action_MSG = 5; //������ � sLastMessage; ���������� - Log
  Ttunel_Action_connect_server = 6;
  Ttunel_Action_disconnect_server = 7;
  Ttunel_Action_connect_client = 8;
  Ttunel_Action_disconnect_client = 9;
  Ttulel_action_tunel_created = 10;
  Ttulel_action_tunel_destroyed = 11;
                                //Reserved 100-115!!!
type
  SendMessageParam = class
    packet : tpacket;
    FromServer : boolean;
    Id : integer;
    tunel : Tobject;
  end;

function PacketIdToHex(id, subid, sub2id, size : integer) : string;
procedure GetPFandPL(var pf : TStringList; var pl : TListView; FromServer : boolean);
function get_ws_length(s : string; index : integer) : integer;
function text2hexstring(s : string) : string;
  //�����������//
function SymbolEntersCount(s : string) : string;
function HexToString(Hex : string) : string;
function ByteArrayToHex(str1 : array of byte; size : word) : string;
function WideStringToString(const ws : widestring; codePage : word) : ansistring;
function StringToHex(str1, Separator : string) : string;
function StringToWideString(const s : ansistring; codePage : word) : widestring;
procedure FillVersion_a;
  //�����������//

function getversion : string;

function AddDateTime : string; //������� "11.12.2009 02.03.06"
function AddDateTimeNormal : string; //������� "11.12.2009 02 : 03 : 06"
function TimeStepByteStr : string;

  //��������� ���������
function LoadLibraryXor(const name : string) : boolean; //��������� ������.��� ������������ � SettingsDialog
function LoadLibraryInject(const name : string) : boolean; //��������� ������.��� ������������ SettingsDialog
procedure deltemps;
procedure GetProcessList(var sl : TStrings); //�������� ������ ��������� ������������ � dmData.timerSearchProcesses

procedure Reload;

function GetPacketName(var id : byte; var subid, sub2id : word; FromServer : boolean; var pname : string; var isshow : boolean; var hexid : string) : boolean;
function GetNamePacket(s : string) : string; // �������� �������� ������ �� ������

var
  AppPath : string;
  isGlobalDestroying : boolean;
  hXorLib : THandle; //����� ���������� ������. ��������������� � SettingsDialog
  pInjectDll : Pointer; //������ � ������.��� ��������������� � SettingsDialog
  CreateXorIn : function(Value : PCodingClass) : HRESULT; stdcall; //���� ���������� ������ (������)
  CreateXorOut : function(Value : PCodingClass) : HRESULT; stdcall; //��� ��������������� � ��������������� � SettingsDialog (������)

  sClientsList, //������ ��������� ���������� ��������� ��������������� � SettingsDialog
  sIgnorePorts, //�������� ������ ���������� �� ������� ������������ ��������������� � SettingsDialog
  sNewxor, //���� � ������.��� ��������������� � SettingsDialog
  sInject, //���� � ������.��� ��������������� � SettingsDialog
  sLSP : string; //���� � ��� ������. ��������������� � SettingsDialog
  LocalPort : word; //������� ����. ��������������� � SettingsDialog.
  AllowExit : boolean; //��������� �����. ��������������� � SettingsDialog

    //����� �������������� NpcID, ��������� ��� ����������� ����������� ����� ���
  kNpcID : cardinal;

  GlobalSettings : TEncDecSettings; //������� ��������� ��� ������ ��������������� � SettingsDialog
  filterS, filterC : string; //������ ��������

  //��������� (packets???.ini) �������������� ����������
type
  TProtocolVersion = (AION, AION27,
    CHRONICLE4, CHRONICLE5,
    INTERLUDE,
    GRACIA, GRACIAFINAL, GRACIAEPILOGUE,
    FREYA, HIGHFIVE, GOD, ERTHEIA, INFINITEODYSSEY, CLASSIC);

var
  GlobalProtocolVersion : TProtocolVersion = CLASSIC;

procedure AddToLog(msg : string); //��������� ������ � frmLogForm.log
procedure BalloonHint(title, msg : string);
procedure loadpos(Control : TControl);
procedure savepos(Control : TControl);

function GetModifTime(const FileName : string) : TDateTime;

function DataPckToStrPck(var pck) : string; stdcall;

var
  l2pxversion_array : array[0..3] of byte; //������ ����������� ������� FillVersion_a
  l2pxversion : longword absolute l2pxversion_array;

  MaxLinesInLog : integer; //������������ ���������� ����� � ���� ����� �������� ���� ������� � ���� � �������� ���
  MaxLinesInPktLog : integer; //������������ ���������� ����� � ���� ������� ����� �������� ���� ������� � ���� � �������� ���
  isDestroying : boolean = false;
  PacketsNames, PacketsFromS, PacketsFromC : TStringList;
    //��� Lineage II
  SysMsgIdList,  //�� ����
  ItemsList, NpcIdList, ClassIdList, AugmentList, SkillList : TStringList;
    //��� Aion
  SysMsgIdListAion, ItemsListAion, ClassIdListAion, ClientStringsAion, SkillListAion : TStringList; //� �� ���� - ������������ fPacketFilter

  GlobalRawAllowed : boolean; //���������� ��������� �� ����������� ���������� ������ ��� ������ ����������
  Options, PacketsINI : TMemIniFile;
  GetFuncINI : TMemIniFile;
  wlimit, looplimit : integer;

implementation

uses
  uMainReplacer,
  uMain,
  uFilterForm,
  forms,
  udata,
  usocketengine,
  ulogform;

function GetModifTime(const FileName : string) : TDateTime;
var
  h : THandle;
  Info1, Info2, Info3 : TFileTime;
  SysTimeStruct : SYSTEMTIME;
  TimeZoneInfo : TTimeZoneInformation;
  Bias : double;
begin
  Result := 0;
  Bias := 0;
  if not FileExists(FileName) then
  begin
    exit;
  end;
  h := FileOpen(FileName, fmOpenRead or fmShareDenyNone);
  if h > 0 then
  begin
    try
      if GetTimeZoneInformation(TimeZoneInfo) <> $FFFFFFFF then
      begin
        Bias := TimeZoneInfo.Bias / 1440;
      end; // 60x24
      GetFileTime(h, @Info1, @Info2, @Info3);
      if FileTimeToSystemTime(Info3, SysTimeStruct) then
      begin
        result := SystemTimeToDateTime(SysTimeStruct) - Bias;
      end;
    finally
      FileClose(h);
    end;
  end;
end;

procedure savepos(Control : TControl);
var
  ini : Tinifile;
begin
  ini := TIniFile.Create(AppPath + 'settings\windows.ini');
  ini.WriteInteger(Control.ClassName, 'top', Control.Top);
  ini.WriteInteger(Control.ClassName, 'left', Control.Left);
  ini.WriteInteger(Control.ClassName, 'width', Control.Width);
  ini.WriteInteger(Control.ClassName, 'height', Control.Height);
  ini.Destroy;
end;

procedure loadpos(Control : TControl);
var
  ini : Tinifile;
begin
  if not FileExists(AppPath + 'settings\windows.ini') then
  begin
    exit;
  end;
  ini := TIniFile.Create(AppPath + 'settings\windows.ini');
  if not ini.SectionExists(Control.ClassName) then
  begin
    ini.Destroy;
    exit;
  end;
  if (ini.ReadInteger(Control.ClassName, 'width', control.Width) -
    ini.ReadInteger(Control.ClassName, 'left', control.Left) >= screen.WorkAreaWidth) and
    (ini.ReadInteger(Control.ClassName, 'height', control.height) -
    ini.ReadInteger(Control.ClassName, 'top', control.Top) >= Screen.WorkAreaHeight) then
  begin
    //����� ���� ���������������...
    //�� ���������
    if TForm(Control).Visible then
    begin
      ShowWindow(TForm(Control).Handle, SW_MAXIMIZE);
    end
    else
    begin
      ShowWindow(TForm(Control).Handle, SW_MAXIMIZE);
      ShowWindow(TForm(Control).Handle, SW_HIDE);
    end;
  end
  else
  begin
    control.Top := ini.ReadInteger(Control.ClassName, 'top', control.Top);
    control.Left := ini.ReadInteger(Control.ClassName, 'left', control.Left);
    control.Width := ini.ReadInteger(Control.ClassName, 'width', control.Width);
    control.height := ini.ReadInteger(Control.ClassName, 'height', control.height);
  end;
  ini.Destroy;
end;

procedure deltemps;
var
  SearchRec : TSearchRec;
  Mask : string;
begin
  Mask := AppPath + '\*.temp';
  if FindFirst(Mask, faAnyFile, SearchRec) = 0 then
  begin
    repeat
      if (SearchRec.Attr and faDirectory) <> faDirectory then
      begin
        DeleteFile(pchar(AppPath + '\' + SearchRec.Name));
      end;
    until FindNext(SearchRec) <> 0;
    SysUtils.FindClose(SearchRec);
  end;
end;

function DataPckToStrPck(var pck) : string; stdcall;
var
  tpck : packed record
    size : word;
    id : byte;
  end
  absolute pck;
begin
  SetLength(Result, tpck.size - 2);
  Move(tpck.id, Result[1], Length(Result));
end;

procedure Reload;
begin
  if getfuncini <> nil then
  begin
    getfuncini.free;
  end;
  getfuncini := TMemIniFile.Create(AppPath + 'settings\get.ini');
  // ��� Lineage II
  SysMsgIdList.Clear;
  AugmentList.Clear;
  SkillList.Clear;
  ClassIdList.Clear;
  NpcIdList.Clear;
  ItemsList.Clear;
  // ��� ����
  SysMsgIdListAion.Clear;
  SkillListAion.Clear;
  ClassIdListAion.Clear;
  ClientStringsAion.Clear;
  ItemsListAion.Clear;
  //��������� ������ ������ �����
  if ((GlobalProtocolVersion < CHRONICLE4)) then // ��� ���� 2.1 - 2.7
  begin  //��� ����
    if fMain.lang.Language = 'Eng' then
    begin   //���������� ������
      SysMsgIdListAion.LoadFromFile(AppPath + 'settings\en\SysMsgidAion.ini');
      ItemsListAion.LoadFromFile(AppPath + 'settings\en\ItemsIdAion.ini');
      ClassIdListAion.LoadFromFile(AppPath + 'settings\en\classidAion.ini');
      SkillListAion.LoadFromFile(AppPath + 'settings\en\SkillsIdAion.ini');
      ClientStringsAion.LoadFromFile(AppPath + 'settings\en\ClientStringsAion.ini');
    end
    else
    begin   //������� ������
      SysMsgIdListAion.LoadFromFile(AppPath + 'settings\ru\SysMsgidAion.ini');
      ItemsListAion.LoadFromFile(AppPath + 'settings\ru\ItemsIdAion.ini');
      ClassIdListAion.LoadFromFile(AppPath + 'settings\ru\classidAion.ini');
      SkillListAion.LoadFromFile(AppPath + 'settings\ru\SkillsIdAion.ini');
      ClientStringsAion.LoadFromFile(AppPath + 'settings\ru\ClientStringsAion.ini');
    end;
  end
  else  //��� Lineage II
  begin
    if fMain.lang.Language = 'Eng' then
    begin //���������� ������
      SysMsgIdList.LoadFromFile(AppPath + 'settings\en\sysmsgid.ini');
      ItemsList.LoadFromFile(AppPath + 'settings\en\itemsid.ini');
      NpcIdList.LoadFromFile(AppPath + 'settings\en\npcsid.ini');
      ClassIdList.LoadFromFile(AppPath + 'settings\en\classid.ini');
      SkillList.LoadFromFile(AppPath + 'settings\en\skillsid.ini');
      AugmentList.LoadFromFile(AppPath + 'settings\en\augmentsid.ini');
    end
    else  //������� ������
    begin
      SysMsgIdList.LoadFromFile(AppPath + 'settings\ru\sysmsgid.ini');
      ItemsList.LoadFromFile(AppPath + 'settings\ru\itemsid.ini');
      NpcIdList.LoadFromFile(AppPath + 'settings\ru\npcsid.ini');
      ClassIdList.LoadFromFile(AppPath + 'settings\ru\classid.ini');
      SkillList.LoadFromFile(AppPath + 'settings\ru\skillsid.ini');
      AugmentList.LoadFromFile(AppPath + 'settings\ru\augmentsid.ini');
    end;
  end;
end;

function TimeStepByteStr : string;
var
  TimeStep : TDateTime;
  TimeStepB : array [0..7] of byte;
begin
  TimeStep := Time;
  Move(TimeStep, TimeStepB, 8);
  result := ByteArrayToHex(TimeStepB, 8);
end;

function GetNamePacket(s : string) : string;
var
  ik : word;
begin
  // ���� ����� ����� ������
  ik := Pos(':', s);
  if ik = 0 then
  begin
    Result := s;
  end
  else
  begin
    Result := copy(s, 1, ik - 1);
  end;
end;

function StringToWideString(const s : ansistring; codePage : word) : widestring;
var
  l : integer;
begin
  if s = '' then
  begin
    Result := '';
    exit;
  end
  else
  begin
    l := MultiByteToWideChar(codePage, MB_PRECOMPOSED, pchar(@s[1]), -1, nil, 0);
    if l > 1 then
    begin
      SetLength(Result, l - 1);
      MultiByteToWideChar(CodePage, MB_PRECOMPOSED, pchar(@s[1]), -1, PWideChar(@Result[1]), l - 1);
    end;
  end;
end;

function StringToHex(str1, Separator : string) : string;
var
  buf : string;
  i : integer;
begin
  buf := '';
  for i := 1 to Length(str1) do
  begin
    buf := buf + IntToHex(byte(str1[i]), 2) + Separator;
  end;
  Result := buf;
end;

function SymbolEntersCount(s : string) : string;
var
  i : integer;
begin
  Result := '';
  for i := 1 to Length(s) do
  begin
    if not (s[i] in [' ', #10, #13]) then
    begin
      Result := Result + s[i];
    end;
  end;
end;

//���������� HEX ������ �������� � ����� ����
function HexToString(Hex : string) : string;
var
  buf : string;
  bt : byte;
  i : integer;
begin
  buf := '';
  Hex := SymbolEntersCount(UpperCase(Hex));
  for i := 0 to (Length(Hex) div 2) - 1 do
  begin
    bt := 0;
    if (byte(hex[i * 2 + 1]) > $2F) and (byte(hex[i * 2 + 1]) < $3A) then
    begin
      bt := byte(hex[i * 2 + 1]) - $30;
    end;
    if (byte(hex[i * 2 + 1]) > $40) and (byte(hex[i * 2 + 1]) < $47) then
    begin
      bt := byte(hex[i * 2 + 1]) - $37;
    end;
    if (byte(hex[i * 2 + 2]) > $2F) and (byte(hex[i * 2 + 2]) < $3A) then
    begin
      bt := bt * 16 + byte(hex[i * 2 + 2]) - $30;
    end;
    if (byte(hex[i * 2 + 2]) > $40) and (byte(hex[i * 2 + 2]) < $47) then
    begin
      bt := bt * 16 + byte(hex[i * 2 + 2]) - $37;
    end;
    buf := buf + char(bt);
  end;
  HexToString := buf;
end;

procedure GetProcessList(var sl : TStrings);
var
  pe : TProcessEntry32;
  ph, snap : THandle; //����������� �������� � ������
  mh : hmodule; //���������� ������
  procs : array[0..$FFF] of dword; //������ ��� �������� ������������ ���������
  count, cm : cardinal; //���������� ���������
  i : integer;
  ModName : array[0..max_path] of char; //��� ������
  tmp : string;
begin
  sl.Clear;
  if Win32Platform = VER_PLATFORM_WIN32_WINDOWS then
  begin //���� ��� Win9x
    snap := CreateToolhelp32Snapshot(th32cs_snapprocess, 0);
    if integer(snap) = -1 then
    begin
      exit;
    end
    else
    begin
      pe.dwSize := sizeof(pe);
      if Process32First(snap, pe) then
      begin
        repeat
          sl.Add(string(pe.szExeFile));
        until not Process32Next(snap, pe);
      end;
    end;
  end
  else
  begin //���� WinNT/2000/XP
    if not EnumProcesses(@procs, sizeof(procs), count) then
    begin
      exit;
    end;
    try
      for i := 0 to (count div 4) - 1 do
      begin
        if procs[i] <> 4 then
        begin
          EnablePrivilegeEx(INVALID_HANDLE_VALUE, 'SeDebugPrivilege');
          ph := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ, false, procs[i]);
          if ph > 0 then
          begin
            EnumProcessModules(ph, @mh, 4, cm);
            GetModuleFileNameEx(ph, mh, ModName, sizeof(ModName));
            tmp := LowerCase(ExtractFileName(string(ModName)));
            sl.Add(IntToStr(procs[i]) + '=' + tmp);
            CloseHandle(ph);
          end;
        end;
      end;
    except

    end;
  end;
end;

procedure BalloonHint(title, msg : string);
begin
  //+++
  if not isDestroying then
  begin
    SendMessage(fMainReplacer.Handle, WM_BalloonHint, integer(msg), integer(title));
  end;
end;

procedure AddToLog(msg : string);
begin
//  if isDestroying then exit;
//  if assigned(fLog) then
//    if not isDestroying then
//      if fLog.IsExists then
//        SendMessage(fLog.Handle, WM_AddLog, integer(msg), 0);
  //+++
  if (assigned(fLog) and (not isDestroying) and (fLog.IsExists)) then
  begin
    SendMessage(fLog.Handle, WM_AddLog, integer(msg), 0);
  end;
end;

function LoadLibraryInject(const name : string) : boolean;
var
  sFile, Size : THandle;
  ee : OFSTRUCT;
  tmp : pchar;
begin
  if pInjectDll <> nil then
  begin
    FreeMem(pInjectDll);
    AddToLog(format(rsUnLoadDllSuccessfully, [name]));
  end;
  tmp := pchar(name);
  if fileExists(tmp) then
  begin
    sFile := OpenFile(tmp, ee, OF_READ);
    Result := true;
    AddToLog(format(rsLoadDllSuccessfully, [name]));
    Size := GetFileSize(sFile, nil);
    GetMem(pInjectDll, Size);
    ReadFile(sFile, pInjectDll^, Size, Size, nil);
    CloseHandle(sFile);
  end
  else
  begin
    result := false;
    AddToLog(format(rsLoadDllUnSuccessful, [name]));
  end;
end;

function LoadLibraryXor(const name : string) : boolean;
begin
  // ��������� XOR dll
  if hXorLib <> 0 then
  begin
    FreeLibrary(hXorLib);
    AddToLog(format(rsUnLoadDllSuccessfully, [name]));
  end;
  hXorLib := LoadLibrary(pchar(name));
  if hXorLib > 0 then
  begin
    AddToLog(format(rsLoadDllSuccessfully, [name]));
    result := true;
    @CreateXorIn := GetProcAddress(hXorLib, 'CreateCoding');
    @CreateXorOut := GetProcAddress(hXorLib, 'CreateCodingOut');
    if @CreateXorOut = nil then
    begin
      CreateXorOut := CreateXorIn;
    end;
  end
  else
  begin
    Result := false;
    AddToLog(format(rsLoadDllUnSuccessful, [name]));
  end;
end;

function WideStringToString(const ws : widestring; codePage : word) : ansistring;
var
  l : integer;
begin
  if ws = '' then
  begin
    Result := '';
    exit;
  end
  else
  begin
    codePage := 0;
    l := WideCharToMultiByte(codePage, WC_COMPOSITECHECK or WC_DISCARDNS or WC_SEPCHARS or WC_DEFAULTCHAR, @ws[1], -1, nil, 0, nil, nil);
    if l > 1 then
    begin
      SetLength(Result, l - 1);
      WideCharToMultiByte(codePage, WC_COMPOSITECHECK or WC_DISCARDNS or WC_SEPCHARS or WC_DEFAULTCHAR, @ws[1], -1, @Result[1], l - 1, nil, nil);
    end;
  end;
end;

function AddDateTime : string;
begin
  result := FormatDateTime('dd.mm.yyy hh.nn.ss', now);
end;

function AddDateTimeNormal : string;
begin
  result := FormatDateTime('dd.mm.yyy hh:nn:ss', now);
end;

function ByteArrayToHex(str1 : array of byte; size : word) : string;
var
  buf : string;
  i : integer;
begin
  buf := '';
  for i := 0 to size - 1 do
  begin
    buf := buf + IntToHex(str1[i], 2);
  end;
  Result := buf;
end;

procedure FillVersion_a; //���������� ������������ ? ... � ����!
var
  ver : string;
begin
  ver := getversion;
  l2pxversion_array[0] := StrToIntDef(copy(ver, 1, pos('.', ver) - 1), 0);
  delete(ver, 1, pos('.', ver));
  l2pxversion_array[1] := StrToIntDef(copy(ver, 1, pos('.', ver) - 1), 0);
  delete(ver, 1, pos('.', ver));
  l2pxversion_array[2] := StrToIntDef(copy(ver, 1, pos('.', ver) - 1), 0);
  delete(ver, 1, pos('.', ver));
  l2pxversion_array[3] := StrToIntDef(ver, 0);
end;

function getversion : string;
type
  LANGANDCODEPAGE = record
    wLanguage : word;
    wCodePage : word;
  end;
var
  dwHandle, cbTranslate, lenBuf : cardinal;
  sizeVers : DWord;
  lpData, langData : Pointer;
  lpTranslate : ^LANGANDCODEPAGE;
  i : integer;
  s : string;
  buf : pchar;
begin
  result := '';
  sizeVers := GetFileVersionInfoSize(pchar(ExtractFileName(ParamStr(0))), dwHandle);
  if sizeVers = 0 then
  begin
    exit;
  end;
  GetMem(lpData, sizeVers);
  try
    ZeroMemory(lpData, sizeVers);
    GetFileVersionInfo(pchar(ExtractFileName(ParamStr(0))), 0, sizeVers, lpData);
    if not VerQueryValue(lpData, '\VarFileInfo\Translation', langData, cbTranslate) then
    begin
      exit;
    end;
    for i := 0 to (cbTranslate div sizeof(LANGANDCODEPAGE)) do
    begin
      lpTranslate := Pointer(integer(langData) + sizeof(LANGANDCODEPAGE) * i);
      s := Format('\StringFileInfo\%.4x%.4x\FileVersion', [lpTranslate^.wLanguage, lpTranslate^.wCodePage]);
      if VerQueryValue(lpData, pchar(s), Pointer(buf), lenBuf) then
      begin
        Result := buf;
        break;
      end;
    end;
  finally
    FreeMem(lpData);
  end;
end;

procedure GetPFandPL(var pf : TStringList; var pl : TListView; FromServer : boolean);
begin
  if FromServer then
  begin
    pf := PacketsFromS;
    pl := fPacketFilter.ListView1;
  end
  else
  begin
    pf := PacketsFromC;
    pl := fPacketFilter.ListView2;
  end;
end;

function PacketIdToHex(id, subid, sub2id, size : integer) : string;
begin
  result := '';
  if size > 0 then
  begin
    result := result + inttohex(id, 2);
  end;
  if size > 1 then
  begin
    result := result + inttohex(subid and $ff, 2);
  end;
  if size > 2 then
  begin
    result := result + inttohex(subid shr 8, 2);
  end;
  if size > 3 then
  begin
    result := result + inttohex(sub2id and $ff, 2);
  end;
  if size > 4 then
  begin
    result := result + inttohex(sub2id shr 8, 2);
  end;
end;

function GetPacketName(var id : byte; var subid, sub2id : word; FromServer : boolean; var pname : string; var isshow : boolean; var hexid : string) : boolean;
var
  i : integer;
  pl : TListView;
  pf : TStringList;
begin
  result := false; //�� ���� unknown ����� ��� �������
  isshow := true;
  GetPFandPL(pf, pl, FromServer);
  hexid := PacketIdToHex(id, subid, sub2id, 1);
  i := pf.IndexOfName(hexid);
  if i = -1 then
  begin
    hexid := PacketIdToHex(id, subid, sub2id, 2);
    i := pf.IndexOfName(hexid);
  end;
  if i = -1 then
  begin
    hexid := PacketIdToHex(id, subid, sub2id, 3);
    i := pf.IndexOfName(hexid);
  end;
  if i = -1 then
  begin
    hexid := PacketIdToHex(id, subid, sub2id, 4);
    i := pf.IndexOfName(hexid);
  end;
  if i = -1 then
  begin
    hexid := PacketIdToHex(id, subid, sub2id, 5);
    i := pf.IndexOfName(hexid);
  end;
  if i = -1 then
  begin
    pname := 'Unknown' + PacketIdToHex(id, subid, sub2id, 1);
  end
  else
  begin
    pname := pl.Items.Item[i].SubItems[0];
    isshow := pl.Items.Item[i].Checked;
    result := true;
  end;
end;

function get_ws_length(s : string; index : integer) : integer;
var
  end_index : integer;
begin
  end_index := index;
  while
    (Length(s) - (end_index - index) >= 2) and not ((s[end_index] = #0) and (s[end_index + 1] = #0)) do
  begin
    Inc(end_index, 2);
  end;
  result := end_index - index;
end;

function text2hexstring(s : string) : string;
var
  i : integer;
begin
  for i := 1 to Length(s) do
  begin
    result := result + inttohex(ord(s[i]), 2);
  end;
end;


end.
