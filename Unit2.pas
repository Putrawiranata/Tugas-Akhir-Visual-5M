unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection, Grids, DBGrids, StdCtrls, frxClass,
  frxDBSet;

type
  TForm2 = class(TForm)
    NIK: TLabel;
    NAMA: TLabel;
    JK: TLabel;
    USERNAME: TLabel;
    PASSWORD: TLabel;
    Label2: TLabel;
    EMAIL: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit6: TEdit;
    Edit5: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DBGrid1: TDBGrid;
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    c1: TComboBox;
    Button4: TButton;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
zqry1.SQL.Clear;
zqry1.SQL.Add('insert into account values(null,"'+edit1.Text+'","'+edit2.Text+'","'+c1.Text+'","'+edit3.Text+'","'+edit4.Text+'","'+edit5.Text+'","'+edit6.Text+'")');
zqry1.ExecSQL ;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from account');
zqry1.Open;
Showmessage('DATA BERHASIL DI SIMPAN');
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
zqry1.SQL.Clear;
  zqry1.SQL.Add('DELETE FROM account WHERE 1');
  zqry1.ExecSQL;

  zqry1.SQL.Clear;
  zqry1.SQL.Add('select * from account');
  zqry1.Open;
  ShowMessage('DATA BERHASIL DIHAPUS!');
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
zqry1.Edit;
  zqry1.FieldByName('nik').Text := edit1.Text;
  zqry1.FieldByName('nama').Text := edit2.Text;
  zqry1.FieldByName('jk').Text := c1.Text;
  zqry1.FieldByName('username').Text := edit3.Text;
  zqry1.FieldByName('password').Text := edit4.Text;
  zqry1.FieldByName('no_telp').Text := edit5.Text;
  zqry1.FieldByName('email').Text := edit6.Text;
  zqry1.Post;
end;

procedure TForm2.DBGrid1CellClick(Column: TColumn);
begin
edit1.Text:=zqry1.FieldList[1].AsString;
   edit2.Text:=zqry1.FieldList[2].AsString;
   c1.Text:=zqry1.FieldList[3].AsString;
   edit3.Text:=zqry1.FieldList[4].AsString;
   edit4.Text:=zqry1.FieldList[5].AsString;
   edit5.Text:=zqry1.FieldList[6].AsString;
   edit6.Text:=zqry1.FieldList[7].AsString;
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
frxReport1.ShowReport();
end;

end.
