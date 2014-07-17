module Encode;

my %encodings =
    'iso-8859-2' => &latin2,
    'iso_8859-2' => &latin2,
    'latin2'     => &latin2,
    'latin-2'    => &latin2,
;

our sub decode($encoding, $text) {
    &(%encodings{$encoding})($text);
}

sub latin2($text) {
    ...
}
