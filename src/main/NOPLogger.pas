(*
   Copyright 2016 Michael Justin

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*)

unit NOPLogger;

{$IFDEF FPC}{$MODE DELPHI}{$ENDIF}

interface

uses
  djLogAPI, SysUtils;

type
  TNOPLogger = class(TInterfacedObject, ILogger)
  public
    procedure Debug(const AMsg: string); overload;
    procedure Debug(const AFormat: string; AArgs: array of const); overload;
    procedure Debug(const AMsg: string; AException: Exception); overload;
  end;

  TNOPLoggerFactory = class(TInterfacedObject, ILoggerFactory)
  public
    function GetLogger(const AName: string): ILogger;
  end;

implementation

{ TNOPLogger }

procedure TNOPLogger.Debug(const AMsg: string);
begin
  //
end;

procedure TNOPLogger.Debug(const AFormat: string; AArgs: array of const);
begin
  //
end;

procedure TNOPLogger.Debug(const AMsg: string; AException: Exception);
begin
  //
end;

{ TNOPLoggerFactory }

function TNOPLoggerFactory.GetLogger(const AName: string): ILogger;
begin
  Result := TNOPLogger.Create;
end;

end.
