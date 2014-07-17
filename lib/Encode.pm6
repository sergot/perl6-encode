module Encode;

use Encode::Latin2;

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

    'utf8'       => &utf8,
    'utf-8'      => &utf8,
;

our sub decode($encoding, buf8 $buf) {
    X::Encode::Unknown.new(:encoding($encoding)).throw unless %encodings{$encoding}.defined;

    &(%encodings{$encoding})($buf);
}

sub latin2(buf8 $buf) {
    $buf.list.map({ %Encode::Latin2::map{$_} // $_ });
}

sub latin1(buf8 $buf) {
    $buf.decode('iso-8859-1');
}

sub utf8(buf8 $buf) {
    $buf.decode('utf8');
}
