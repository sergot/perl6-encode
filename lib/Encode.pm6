module Encode;

my %encodings =
    'iso-8859-2' => &latin2,
    'iso_8859-2' => &latin2,
    'latin2'     => &latin2,
    'latin-2'    => &latin2,
;

our sub decode($encoding, buf8 $buf) {
    &(%encodings{$encoding})($buf);
}

sub latin2(buf8 $buf) {
    ...
}
