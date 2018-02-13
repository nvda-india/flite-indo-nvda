; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Hear2Read Gujarati Language Add-On"
#define MyAppVersion "0.2017.11.20"
#define MyAppPublisher "Hear2Read, Inc."
#define MyAppURL "http://www.Hear2Read.org"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{FC27AF90-949F-45E8-AB4B-2164AD32E73A}
UsePreviousAppDir=yes
CreateUninstallRegKey=no
UpdateUninstallLogAppName=no
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
OutputBaseFilename=Hear2Read_Gujarati_Male_Voice_cmpt
SetupIconFile=Icon\h2r-32x32-win.ico
Compression=lzma
SolidCompression=yes
LicenseFile=Windows_Voice_Installer_License.txt
;WizardImageFile=BMP\h2r-256x256-win.bmp

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: Languages\h2r_indic_amb_guj1000cmpt.flitevox; DestDir: {app}\Languages
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Registry]     
; Gujarati_amb
root: HKLM; Subkey: "SOFTWARE\Microsoft\SPEECH\Voices\Tokens\Gujarati_amb"; ValueType: string; ValueName: ""; ValueData: "Hear2Read Gujarati Male"; Flags: uninsdeletekey;
root: HKLM; Subkey: "SOFTWARE\Microsoft\SPEECH\Voices\Tokens\Gujarati_amb"; ValueType: string; ValueName: "409"; ValueData: "Hear2Read Gujarati Male"; Flags: uninsdeletekey;
root: HKLM; Subkey: "SOFTWARE\Microsoft\SPEECH\Voices\Tokens\Gujarati_amb"; ValueType: string; ValueName: "CLSID"; ValueData: "{{435A0515-F568-4A0A-B5A3-42844348602F}"; Flags: uninsdeletekey;
root: HKLM; Subkey: "SOFTWARE\Microsoft\SPEECH\Voices\Tokens\Gujarati_amb"; ValueType: string; ValueName: "voxdir"; ValueData:{app}\Languages\h2r_indic_amb_guj1000cmpt.flitevox; Flags: uninsdeletekey;
root: HKLM; Subkey: "SOFTWARE\Microsoft\SPEECH\Voices\Tokens\Gujarati_amb\Attributes"; ValueType: string; ValueName: "Age"; ValueData: "Adult"; Flags: uninsdeletekey;
root: HKLM; Subkey: "SOFTWARE\Microsoft\SPEECH\Voices\Tokens\Gujarati_amb\Attributes"; ValueType: string; ValueName: "Gender"; ValueData: "Male"; Flags: uninsdeletekey;
root: HKLM; Subkey: "SOFTWARE\Microsoft\SPEECH\Voices\Tokens\Gujarati_amb\Attributes"; ValueType: string; ValueName: "Language"; ValueData: "447"; Flags: uninsdeletekey;
root: HKLM; Subkey: "SOFTWARE\Microsoft\SPEECH\Voices\Tokens\Gujarati_amb\Attributes"; ValueType: string; ValueName: "Name"; ValueData: "Hear2Read Gujarati Male"; Flags: uninsdeletekey;
root: HKLM; Subkey: "SOFTWARE\Microsoft\SPEECH\Voices\Tokens\Gujarati_amb\Attributes"; ValueType: string; ValueName: "Vendor"; ValueData: "Hear2Read"; Flags: uninsdeletekey;

[Run]
; Filename: "{app}\vc_redist.x86.exe"; Parameters: "/quite /norestart"
; Filename: "{tmp}\VC_redist.x86.exe"; Parameters: "/install /quiet /norestart"; StatusMsg: "Installing Microsoft Visual C++ Redistributable on x86 ...."; Check: not VCinstalled
; Filename: "{app}\Hear2Read_SAPI_Multi-language_32.reg"; Parameters: "/reg32"; Flags: shellexec waituntilterminated runascurrentuser

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
