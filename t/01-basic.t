use v6;
use Encode;

use Test;

plan 1;

Encode::decode("niy-encoding", buf8.new(97)); 
dies_ok { Encode::decode("niy-encoding", buf8.new(97)) }, 'dies if NIY'; 
