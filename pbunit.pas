unit pbunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    pb: TImage;
    m1: TImage;
    m2: TImage;
    procedure pbMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

const

  m     = 12;

procedure TForm1.pbMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if button = mbLeft then pb.Canvas.Brush.Color := clBlack
  else pb.Canvas.Brush.Color := clWhite;
  pb.Canvas.FillRect( rect( x - x mod m, y - y mod m, x - x mod m + m, y - y mod m + m ) );
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then form1.close;
end;

procedure TForm1.FormCreate(Sender: TObject);
var

  bm            : tbitmap;
  i, j, c, v    : integer;
  s             : string;
begin
  bm := tbitmap.create;
  bm.LoadFromFile( 'index5.bmp' );
  pb.width := m * bm.width;
  pb.height := m * bm.height;
  pb.canvas.brush.color := clBlack;
  m1.width := m * bm.width;
  m2.height := m * bm.height;
  m1.canvas.font := form1.font;
  m2.canvas.font := form1.font;
  form1.caption := inttostr( bm.width ) + 'x' + inttostr( bm.height );

  i := -1;
  repeat
    inc( i );
    c := 0;
    s := '';
    j := -1;
    v := 0;
    repeat
      inc( j );
      if bm.Canvas.Pixels[ i, j ] = clBlack then
        begin
          c := c + 1;
          pb.canvas.fillrect( rect( i * m, j * m, i * m + m, j * m + m ) );
        end
      else
        if c <> 0 then
          begin
            inc( v );
            m1.canvas.textout( i * m + 2, v * m + 3, inttostr( c ) );
            c := 0;
          end;
    until j >= bm.height;
  until i >= bm.width;

  for i := 0 to bm.height do begin
    c := 0;
    s := '';
    for j := 0 to bm.width do
      if bm.Canvas.Pixels[ j, i ] = clBlack then c := c + 1
      else
        if c <> 0 then
          begin
            s := s + ' ' + inttostr( c );
            c := 0;
          end;
    m2.canvas.TextOut( 1, i * m, s );
  end;
end;

end.
