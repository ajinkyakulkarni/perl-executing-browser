#!/usr/bin/perl

use strict;
use warnings;

print "<!DOCTYPE html>
<html>

	<head>
		<title>Perl Executing Browser - GET and POST Test</title>
		<meta name='viewport' content='width=device-width, initial-scale=1'>
		<meta charset='utf-8'>
		<link rel='stylesheet' type='text/css' href='http://local-pseudodomain/bootstrap/css/themes/darkly-theme.css' media='all'>
		<style type='text/css'>
			body {
				text-align: center;
				font-size: 22px;
				-webkit-text-size-adjust: 100%;
			}
			pre {
				text-align: left;
				font-size: 14px;
				font-family: monospace;
			}
		</style>
	</head>

	<body>
		<p>
			GET and POST Test
		</p>
<pre>
FORM DATA:\n";

my $input = "";
my (@pairs, $pair, $name, $value);

# Read input:
if ($ENV{'REQUEST_METHOD'}) {
	$ENV{'REQUEST_METHOD'} =~ tr/a-z/A-Z/;
	if ($ENV{'REQUEST_METHOD'} eq "POST") {
		read (STDIN, $input, $ENV{'CONTENT_LENGTH'});
	} else {
		$input = $ENV{'QUERY_STRING'};
	}
}

if ($ARGV[0] and length($ARGV[0]) > 0) {
	$input = $ARGV[0];
}

# Split information into name/value pairs:
@pairs = split(/&/, $input);
foreach $pair (@pairs) {
	($name, $value) = split(/=/, $pair);
	$value =~ tr/+/ /;
	$value =~ s/%(..)/pack("C", hex($1))/eg;
	print "$name = $value\n";
}

print "</pre>
	</body>

</html>\n";
