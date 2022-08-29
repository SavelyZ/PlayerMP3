unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TListBox = class(StdCtrls.TListBox)
    constructor Create(Aowner: TComponent); override;
    destructor Destroy; override;
    procedure FilterText(ftext:string);
    procedure FilterTextReset;
    private
      templist: TStringList;
  end;

  TForm1 = class(TForm)
    ListBox1: TListBox;
    ListBox2: TListBox;
    ListBox3: TListBox;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Listbox1.FilterText(Edit1.Text);
  Listbox2.FilterText(Edit1.Text);
  Listbox3.FilterText(Edit1.Text);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 Listbox1.FilterTextReset;
 Listbox2.FilterTextReset;
 Listbox3.FilterTextReset;
end;

{ TListBox }

constructor TListBox.Create(Aowner: TComponent);
begin
  inherited;
  templist:=TStringList.Create;
end;

destructor TListBox.Destroy;
begin
  templist.free;
  inherited;
end;

procedure TListBox.FilterText(ftext: string);
var i:integer;
begin
  if templist.Count<self.Items.Count then begin
    templist.Text:=self.Items.Text;
  end;
  i:=0;
  repeat
    if pos(ftext,self.Items[i])=0 then  self.Items.Delete(i) else inc(i);
  until i>=self.Items.Count;
end;

procedure TListBox.FilterTextReset;
begin
  if templist.Count>self.Items.Count then begin
    self.Items.Text:=templist.Text;
  end;
end;



end.
