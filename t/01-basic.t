use v6;
use Encode;

use Test;

plan 1;

ok Encode::decode('iso-8859-2', "something here");
