use strict;
use MPEG::MP3Play qw(:mask :state);
use Term::ReadKey;

END { ReadMode(0) }

main: {
	# no output buffering
	$| = 1;

	# non blocking input
	ReadMode(4);
	
	# creation of a new player
	my $mp3 = new MPEG::MP3Play;
	
	# setting user data: our volume state
	$mp3->set_user_data ({
		volume => 50
	});

	# open and play the file
	$mp3->open ("test.mp3");
	$mp3->play;

	# setting volume to our default values
	$mp3->volume (50, 100, 50);

	# this is optional (and for testing):
	# => we want to recieve this two messages only
	# (the PLAYER_STATE message will be processed by
	#  the default message handler: so the handler will
	#  exit on EOF)
	$mp3->set_notification_mask (
		&XA_NOTIFY_MASK_INPUT_TIMECODE,
		&XA_NOTIFY_MASK_PLAYER_STATE
	);

	# this is optional (and for testing):
	# => output should be closed on eof

	$mp3->set_player_mode (
		&XA_PLAYER_MODE_OUTPUT_AUTO_CLOSE_ON_EOF
	);

	# the message handler with 50000 usec timeout,
	# so our work method will be invoked

	$mp3->message_handler (50000);

	print "\n";
}

package MPEG::MP3Play;

sub work {
	my ($mp3) = @_;
	
	# this method is called after message timeouts or
	# message processing

	# read a key, non blocking
	my $key = Term::ReadKey::ReadKey(-1);

	# return false if 'q' is pressed. The builtin message
	# exits on false.
	return if $key eq 'q';

	# volume control
	my $data = $mp3->get_user_data;
	my $volume = $data->{volume};

	if ( $key eq '+' ) {
		$volume += 5;
		$volume = 100 if $volume > 100;
		$mp3->volume ($volume);
	} elsif ( $key eq '-' ) {
		$volume -= 5;
		$volume = 0 if $volume < 0;
		$mp3->volume ($volume);
	}
	
	$data->{volume} = $volume;

	# always return true in a message handler
	1;
}

sub msg_notify_input_timecode {
	my ($mp3, $msg) = @_;
	
	# display some nice timecode
	
	print "\r";
	printf "TIMECODE: %02d:%02d:%02d",
		$msg->{timecode_h},
		$msg->{timecode_m},
		$msg->{timecode_s};

	# always return true in a message handler
	1;
}

