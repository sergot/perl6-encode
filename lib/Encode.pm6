module Encode;

my %encodings_map =
    'iso-8859-2' => 'iso-8859-2',
    'iso_8859-2' => 'iso-8859-2',
    'latin2'     => 'iso-8859-2',
    'latin-2'    => 'iso-8859-2',
;

my %encodings =
    'iso-8859-2' => &latin2;
;

our sub decode($encoding, $text) {
    &(%encodings{%encodings_map{$encoding}})($text);
}

sub latin2($text) {
    ...
}
