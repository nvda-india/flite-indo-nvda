; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Hear2Read TTS"
#define MyAppVersion "0.2017.10.04"
#define MyAppPublisher "Hear2Read, Inc."
#define MyAppURL "http://Hear2Read.org"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{FC27AF90-949F-45E8-AB4B-2164AD32E73A}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
AppCopyright=Copyright (C) 2017 Hear2Read, Inc.
DefaultDirName={pf}\Hear2Read
DisableDirPage=yes
DefaultGroupName=Hear2Read
DisableProgramGroupPage=yes
OutputBaseFilename=Hear2Read_TTS_12_15
SetupIconFile=Icon\hear2read_Setup-vert-2color.ico
Compression=lzma
SolidCompression=yes
LicenseFile=Windows_DLL_Installer_License.txt
WizardImageFile=hear2read_Setup-vert-2color.bmp

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "vc_redist.x86.exe"; DestDir: "{tmp}"; Flags: ignoreversion
Source: "../sapi/win32/release/FliteCMUGenericCG_Win32.dll"; DestDir: {sys}; Flags: regserver 32bit
Source: "Languages\cmu_us_axb.flitevox"; DestDir: {app}\Languages
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Registry]     
; English_axb
root: HKLM; Subkey: "SOFTWARE\Microsoft\SPEECH\Voices\Tokens\English_axb"; ValueType: string; ValueName: ""; ValueData: "Hear2Read English Female"; Flags: uninsdeletekey;
root: HKLM; Subkey: "SOFTWARE\Microsoft\SPEECH\Voices\Tokens\English_axb"; ValueType: string; ValueName: "409"; ValueData: "Hear2Read English Female"; Flags: uninsdeletekey;
root: HKLM; Subkey: "SOFTWARE\Microsoft\SPEECH\Voices\Tokens\English_axb"; ValueType: string; ValueName: "CLSID"; ValueData: "{{435A0515-F568-4A0A-B5A3-42844348602F}"; Flags: uninsdeletekey;
root: HKLM; Subkey: "SOFTWARE\Microsoft\SPEECH\Voices\Tokens\English_axb"; ValueType: string; ValueName: "voxdir"; ValueData: {app}\Languages\cmu_us_axb.flitevox; Flags: uninsdeletekey;
root: HKLM; Subkey: "SOFTWARE\Microsoft\SPEECH\Voices\Tokens\English_axb\Attributes"; ValueType: string; ValueName: "Age"; ValueData: "Adult"; Flags: uninsdeletekey;
root: HKLM; Subkey: "SOFTWARE\Microsoft\SPEECH\Voices\Tokens\English_axb\Attributes"; ValueType: string; ValueName: "Gender"; ValueData: "Female"; Flags: uninsdeletekey;
root: HKLM; Subkey: "SOFTWARE\Microsoft\SPEECH\Voices\Tokens\English_axb\Attributes"; ValueType: string; ValueName: "Language"; ValueData: "409;9"; Flags: uninsdeletekey;
root: HKLM; Subkey: "SOFTWARE\Microsoft\SPEECH\Voices\Tokens\English_axb\Attributes"; ValueType: string; ValueName: "Name"; ValueData: "Hear2Read English Female"; Flags: uninsdeletekey;
root: HKLM; Subkey: "SOFTWARE\Microsoft\SPEECH\Voices\Tokens\English_axb\Attributes"; ValueType: string; ValueName: "Vendor"; ValueData: "Hear2Read"; Flags: uninsdeletekey;

[Run]
; Filename: "{tmp}\VC_redist.x86.exe"; Parameters: "/install /quiet /norestart"; StatusMsg: "Installing Microsoft Visual C++ Redistributable on x86 ...."; Check: not VCinstalled
Filename: "{tmp}\VC_redist.x86.exe";              

[Code]
// This has been changed for the Forum Display. Use [ and ] in InnoSetup please.
function VCinstalled: Boolean;
 // Returns True if Microsoft Visual C++ Redistributable is installed, otherwise False.
 // The programmer may set the year of redistributable to find; see below.
 var
  names: TArrayOfString;
  i: Integer;
  dName, key, year: String;
 begin
  // Year of redistributable to find; leave null to find installation for any year.
  year := '';
  Result := False;
  key := 'Software\Microsoft\Windows\CurrentVersion\Uninstall';
  // Get an array of all of the uninstall subkey names.
  if RegGetSubkeyNames(HKEY_LOCAL_MACHINE, key, names) then
   // Uninstall subkey names were found.
   begin
    i := 0
    while ((i < GetArrayLength(names)) and (Result = False)) do
     // The loop will end as soon as one instance of a Visual C++ redistributable is found.
     begin
      // For each uninstall subkey, look for a DisplayName value.
      // If not found, then the subkey name will be used instead.
      if not RegQueryStringValue(HKEY_LOCAL_MACHINE, key + '\' + names[i], 'DisplayName', dName) then
       dName := names[i];
      // See if the value contains both of the strings below.
      Result := (Pos(Trim('Visual C++ ' + year),dName) * Pos('Redistributable',dName) <> 0)
      i := i + 1;
     end;
   end;
end;

[UninstallRun]
