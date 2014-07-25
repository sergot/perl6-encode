module Encode;

use Encode::Latin2;
use Encode::Windows1252;

my class X::Encode::Unknown is Exception {
    has $.encoding;

    method message {
        "Unknown encoding $.encoding."
    }
}

my %encodings =
    'iso-8859-2' => &latin2,
    'iso_8859-2' => &latin2,
    'latin2'     => &latin2,
    'latin-2'    => &latin2,

    'iso-8859-1' => &latin1,
    'iso_8859-1' => &latin1,
    'latin1'     => &latin1,
    'latin-1'    => &latin1,

    'windows-1252' => &cp1252,
    'windows1252'  => &cp1252,
    'cp-1252'      => &cp1252,
    'cp1252'       => &cp1252,

    'utf8'       => &utf8,
    'utf-8'      => &utf8,

    'ascii'      => &ascii,
;

our sub decode($encoding, Buf $buf) {
    X::Encode::Unknown.new(:encoding($encoding)).throw unless %encodings{$encoding}.defined;

    &(%encodings{$encoding})($buf);
}

sub latin2(Buf $buf) {
    $buf.list.map({ %Encode::Latin2::map{$_} // $_ })>>.chr.join;
}

sub latin1(Buf $buf) {
    $buf.decode('iso-8859-1');
}

sub utf8(Buf $buf) {
    $buf.decode('utf8');
}

sub ascii(Buf $buf) {
    $buf.decode('ascii');
}

sub cp1252(Buf $buf) {
    $buf.list.map({ %Encode::Windows1252::map{$_} // $_ })>>.chr.join;
}
