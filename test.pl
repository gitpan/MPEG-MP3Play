# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..1\n"; }
END {print "not ok 1\n" unless $loaded;}
use MPEG::MP3Play;
$loaded = 1;
print "ok 1\n";

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

use strict;

my $has_readkey;
BEGIN {
	eval qq{
		use Term::ReadKey;
		\$has_readkey = 1;
		print "Fine - Term::ReadKey loaded OK!\n";
	}
}

print "Term::ReadKey missing! ReadKey features disabled!\n" unless $has_readkey;

my $mp3 = new MPEG::MP3Play;

my $filename = "test.mp3";

if ( -f $filename ) {
	if ( $has_readkey ) {
		print "playing $filename (press any key to stop)...\n";
	} else {
		print "playing $filename (press Ctrl+C to stop)...\n";
	}
	$mp3->play ("$filename");
	print_status ($mp3);
} else {
	print "Please copy a mp3 file called 'test.mp3' to this directory.\n";
	print "It will be played if you run 'make test' again.\n";
}


sub print_status {
	my ($mp3) = @_;

	$has_readkey and ReadMode(4);
	
	my $finish = 0;
	do {
		my $msg = $mp3->get_message_wait;
		my $code = $msg->{code};
		
		if ( $code == &XA_MSG_NOTIFY_INPUT_TIMECODE ) {
			print "\r";
			printf "TIMECODE: %02d:%02d:%02d",
				$msg->{timecode_h},
				$msg->{timecode_m},
				$msg->{timecode_s}
		} elsif ( $code == &XA_MSG_NOTIFY_PLAYER_STATE ) {
			$finish = 1 if $msg->{state} == &XA_PLAYER_STATE_EOF;
		}
		
		if ( $has_readkey ) {
			my $key = ReadKey(-1);
			$finish = 1 if defined $key;
		}
	} while ( not $finish );

	$has_readkey and ReadMode(0);

	print "\n\n";
}
