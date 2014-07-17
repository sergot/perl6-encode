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
;

our sub decode($encoding, buf8 $buf) {
    X::Encode::Unknown.new(:encoding($encoding)).throw unless %encodings{$encoding}.defined;

    &(%encodings{$encoding})($buf);
}

sub latin2(buf8 $buf) {
    $buf.list.map({ %Encode::Latin2::map{$_} // $_ });
}
