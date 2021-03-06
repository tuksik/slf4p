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

unit NOPLoggerTests;

interface

uses
  {$IFDEF FPC}
  fpcunit,testregistry
  {$ELSE}
  TestFramework
  {$ENDIF};

type
  TNOPLoggerTests = class(TTestCase)
  published
    procedure CreateLogger;
    procedure TestDebug;
  end;

implementation

uses
  djLogAPI, NOPLogger, SysUtils;

{ TNOPLoggerTests }

procedure TNOPLoggerTests.CreateLogger;
var
  LoggerFactory: ILoggerFactory;
  Logger: ILogger;
begin
  LoggerFactory := TNOPLoggerFactory.Create;
  Logger := LoggerFactory.GetLogger('nop');

  CheckEquals('nop', Logger.Name);
end;

procedure TNOPLoggerTests.TestDebug;
var
  LoggerFactory: ILoggerFactory;
  Logger: ILogger;
  E: EAbort;
begin
  LoggerFactory := TNOPLoggerFactory.Create;

  Logger := LoggerFactory.GetLogger('nop');

  Logger.Debug('nop msg');
  Logger.Debug('nop msg', ['a', 2, Date]);

  E := EAbort.Create('example');
  Logger.Debug('nop msg', E);
  E.Free;
end;

end.
