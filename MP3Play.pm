package MPEG::MP3Play;

use strict;
use Carp;
use vars qw($VERSION @ISA $AUTOLOAD);

require DynaLoader;
require AutoLoader;

@ISA = qw(DynaLoader);

$VERSION = '0.01';

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
	
	my $msg;
	
	control_message_send_S (
		$player,
		XA_MSG_COMMAND_INPUT_OPEN(),
		$filename
	);
	
#	control_message_wait (
#		$player,
#		$msg,
#		100
#	);
	
#	die "can't open mp3 file '$filename'"
#		if $status != XA_SUCCESS();
	
	control_message_send_N (
		$player,
		XA_MSG_COMMAND_PLAY()
	);
#	die "can't open mp3 file '$filename'"
#		if $status != XA_SUCCESS();
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
  $mp3->play ("music.mp3");

=head1 DESCRIPTION

This Perl module enables you to playback MPEG music.

=head1 PREREQUISITES

MPEG::MP3Play is build against the 3.0 version of the Xaudio SDK.
I don't know if older versions will work properly. The SDK is not
part of this distribution, so get and install it first
(http://www.xaudio.com/).

=head1 INSTALLATION

perl Makefile.PL

You will be prompted for the location of the Xaudio SDK. The directory
must contain the include and lib subdirectories, where the Xaudio header
and library files are installed.

make

Now copy a mp3 file called 'test.mp3' into the actual directory.
It will be played, if everything build properly.

make test

Ok, now install it and enjoy!

make install

=METHODS

To be documented.

=TODO

Oh wow, there's much to do. This is the 0.01 release of the
module, and it has actually a really poor interface ;) Also
this is my first XS module, so I want to learn much about
C/Perl glues in the near future.

I'm planning a full OO interface for playing back MPEG files, so
this module can be used by Perl MPEG players as a backend.
I'm a GTK fan, so it's possible, that I write a Perl/GTK based
MPEG player.

Ideas, code and any help are very apreciated.

=head1 AUTHOR

Joern Reder, joern@netcologne.de

=head1 COPYRIGHT

Copyright (C) 1999 by Joern Reder, All Rights Reserved

This library is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.

The Xaudio SDK is Copyright by MpegTV,LLC. Please refer to the
LICENSE text published on http://www.xaudio.com/.

=head1 SEE ALSO

perl(1).

=cut
