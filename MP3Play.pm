# $Id: MP3Play.pm,v 1.9 1999/08/03 14:52:30 joern Exp $

package MPEG::MP3Play;

use strict;
use Carp;
use vars qw($VERSION @EXPORT @ISA $AUTOLOAD);

require Exporter;
require DynaLoader;
require AutoLoader;

@ISA = qw(Exporter DynaLoader);

@EXPORT = qw(
	XA_MSG_COMMAND_INPUT_OPEN
	XA_MSG_COMMAND_PLAY
	XA_MSG_NOTIFY_INPUT_TIMECODE
	XA_MSG_NOTIFY_PLAYER_STATE
	XA_PLAYER_STATE_STOPPED
	XA_PLAYER_STATE_EOF
);

$VERSION = '0.02';

sub AUTOLOAD {
    # This AUTOLOAD is used to 'autoload' constants from the constant()
    # XS function.  If a constant is not found then control is passed
    # to the AUTOLOAD in AutoLoader.

    my $constname;
    ($constname = $AUTOLOAD) =~ s/.*:://;
    croak "& not defined" if $constname eq 'constant';
    my $val = constant($constname, @_ ? $_[0] : 0);
    if ($! != 0) {
	if ($! =~ /Invalid/) {
	    $AutoLoader::AUTOLOAD = $AUTOLOAD;
	    goto &AutoLoader::AUTOLOAD;
	}
	else {
		croak "Your vendor has not defined MPEG::MP3Play macro $constname";
	}
    }
    no strict 'refs';
#    *$AUTOLOAD = sub () { $val };
    *$AUTOLOAD = sub { $val };
    goto &$AUTOLOAD;
}

bootstrap MPEG::MP3Play $VERSION;

# Preloaded methods go here.

sub new {
	my $type = shift;
	
	my $self = {
		player => new_player()
	};
	
#	print "player=$self->{player}\n";
	
	return bless $self, $type;
}

sub DESTROY {
	my $self = shift;
	
	destroy_player ($self->{player});
}

sub play {
	my $self = shift;
	my $player = $self->{player};

	my ($filename) = @_;
	
	control_message_send_S (
		$player,
		&XA_MSG_COMMAND_INPUT_OPEN,
		$filename
	);
	
	control_message_send_N (
		$player,
		&XA_MSG_COMMAND_PLAY
	);

	return;

	# this stuff is currently disabled...

	do {
		print "waiting for message...\n";
		my $msg = control_message_wait (
			$player,
			&XA_TIMEOUT_INFINITE
		);
#		print "msg=$msg\n";
		use Data::Dumper;
		print Dumper ($msg);
		
#		control_message_print ($msg);
	} while ( 1 );

#	die "can't open mp3 file '$filename'"
#		if $status != XA_SUCCESS();
	
#	die "can't open mp3 file '$filename'"
#		if $status != XA_SUCCESS();
}


sub get_message_wait {
	my $self = shift;

	my $msg = control_message_wait (
		$self->{player},
		&XA_TIMEOUT_INFINITE
	);

	return $msg;	
}


# Autoload methods go after =cut, and are processed by the autosplit program.

1;
__END__
# Below is the stub of documentation for your module. You better edit it!

=head1 NAME

MPEG::MP3Play - Perl extension for playing back MPEG music

=head1 SYNOPSIS

  use MPEG::MP3Play;
  my $mp3 = new MPEG::MP3Play;
  
  $mp3->play ("test.mp3");

  while ( 1 ) {
  	my $msg = $mp3->get_message_wait;
	last if ( $msg->{code}  == &XA_MSG_NOTIFY_PLAYER_STATE and
	          $msg->{state} == &XA_PLAYER_STATE_EOF )
  }

=head1 DESCRIPTION

This Perl module enables you to playback MPEG music.

=head1 PREREQUISITES

MPEG::MP3Play is build against the 3.0 version of the Xaudio SDK
and uses the async interface of the Xaudio library.

I don't know if older versions will work properly. The SDK is not
part of this distribution, so get and install it first
(http://www.xaudio.com/).

test.pl uses Term::ReadKey if it's installed.

=head1 INSTALLATION

First, generate the Makefile:

  perl Makefile.PL

You will be prompted for the location of the Xaudio SDK. The directory
must contain the include and lib subdirectories, where the Xaudio header
and library files are installed.

  make

Now copy a mp3 file called 'test.mp3' into the actual directory.
It will be played, if everything built properly.

  make test

Ok, now install it and enjoy!

  make install

=head1 METHODS

Actually not documented yet, because of frequently changes.
This will be changed very soon. Use the source, instead ;)

=head1 TODO

Oh wow, there's much to do. This is the 0.02 release of the
module, and it has actually a really poor interface ;) Also
this is my first XS module, so I want to learn much about
C/Perl glues in the near future.

I'm planning a full OO interface for playing back MPEG files, so
this module can be used by Perl MPEG players as a backend.
I'm a GTK fan, so it's possible, that I write a Perl/GTK based
MPEG player.

Ideas, code and any help are very appreciated.

=head1 AUTHOR

Joern Reder, joern@netcologne.de

=head1 COPYRIGHT

Copyright (C) 1999 by Joern Reder, All Rights Reserved

This library is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.

The Xaudio SDK is copyright by MpegTV,LLC. Please refer to the
LICENSE text published on http://www.xaudio.com/.

=head1 SEE ALSO

perl(1).

=cut
