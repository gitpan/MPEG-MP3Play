# $Id: MP3Play.pm,v 1.16 1999/08/05 18:47:48 joern Exp $

package MPEG::MP3Play;

use strict;
use Carp;
use vars qw($VERSION @EXPORT @ISA $AUTOLOAD);

require Exporter;
require DynaLoader;

@ISA = qw(Exporter DynaLoader);

@EXPORT = qw(
	XA_MSG_UNKNOWN
	XA_MSG_COMMAND_EXIT
	XA_MSG_COMMAND_PING
	XA_MSG_COMMAND_PLAY
	XA_MSG_COMMAND_PAUSE
	XA_MSG_COMMAND_STOP
	XA_MSG_COMMAND_SEEK
	XA_MSG_COMMAND_INPUT_OPEN
	XA_MSG_COMMAND_INPUT_CLOSE
	XA_MSG_COMMAND_INPUT_SEND_MESSAGE
	XA_MSG_COMMAND_INPUT_ADD_FILTER
	XA_MSG_COMMAND_INPUT_REMOVE_FILTER
	XA_MSG_COMMAND_INPUT_FILTERS_LIST
	XA_MSG_COMMAND_INPUT_MODULE_REGISTER
	XA_MSG_COMMAND_INPUT_MODULE_QUERY
	XA_MSG_COMMAND_INPUT_MODULES_LIST
	XA_MSG_COMMAND_OUTPUT_OPEN
	XA_MSG_COMMAND_OUTPUT_CLOSE
	XA_MSG_COMMAND_OUTPUT_SEND_MESSAGE
	XA_MSG_COMMAND_OUTPUT_MUTE
	XA_MSG_COMMAND_OUTPUT_UNMUTE
	XA_MSG_COMMAND_OUTPUT_RESET
	XA_MSG_COMMAND_OUTPUT_DRAIN
	XA_MSG_COMMAND_OUTPUT_ADD_FILTER
	XA_MSG_COMMAND_OUTPUT_REMOVE_FILTER
	XA_MSG_COMMAND_OUTPUT_FILTERS_LIST
	XA_MSG_COMMAND_OUTPUT_MODULE_REGISTER
	XA_MSG_COMMAND_OUTPUT_MODULE_QUERY
	XA_MSG_COMMAND_OUTPUT_MODULES_LIST
	XA_MSG_SET_PLAYER_MODE
	XA_MSG_GET_PLAYER_MODE
	XA_MSG_SET_PLAYER_ENVIRONMENT_INTEGER
	XA_MSG_GET_PLAYER_ENVIRONMENT_INTEGER
	XA_MSG_SET_PLAYER_ENVIRONMENT_STRING
	XA_MSG_GET_PLAYER_ENVIRONMENT_STRING
	XA_MSG_UNSET_PLAYER_ENVIRONMENT
	XA_MSG_SET_INPUT_NAME
	XA_MSG_GET_INPUT_NAME
	XA_MSG_SET_INPUT_MODULE
	XA_MSG_GET_INPUT_MODULE
	XA_MSG_SET_INPUT_POSITION_RANGE
	XA_MSG_GET_INPUT_POSITION_RANGE
	XA_MSG_SET_INPUT_TIMECODE_GRANULARITY
	XA_MSG_GET_INPUT_TIMECODE_GRANULARITY
	XA_MSG_SET_OUTPUT_NAME
	XA_MSG_GET_OUTPUT_NAME
	XA_MSG_SET_OUTPUT_MODULE
	XA_MSG_GET_OUTPUT_MODULE
	XA_MSG_SET_OUTPUT_VOLUME
	XA_MSG_GET_OUTPUT_VOLUME
	XA_MSG_SET_OUTPUT_CHANNELS
	XA_MSG_GET_OUTPUT_CHANNELS
	XA_MSG_SET_OUTPUT_PORTS
	XA_MSG_GET_OUTPUT_PORTS
	XA_MSG_SET_OUTPUT_FEEDBACK_RATE
	XA_MSG_GET_OUTPUT_FEEDBACK_RATE
	XA_MSG_SET_CODEC_EQUALIZER
	XA_MSG_GET_CODEC_EQUALIZER
	XA_MSG_SET_NOTIFICATION_MASK
	XA_MSG_GET_NOTIFICATION_MASK
	XA_MSG_SET_DEBUG_LEVEL
	XA_MSG_GET_DEBUG_LEVEL
	XA_MSG_NOTIFY_READY
	XA_MSG_NOTIFY_ACK
	XA_MSG_NOTIFY_NACK
	XA_MSG_NOTIFY_PONG
	XA_MSG_NOTIFY_EXITED
	XA_MSG_NOTIFY_PLAYER_STATE
	XA_MSG_NOTIFY_PLAYER_MODE
	XA_MSG_NOTIFY_PLAYER_ENVIRONMENT_INTEGER
	XA_MSG_NOTIFY_PLAYER_ENVIRONMENT_STRING
	XA_MSG_NOTIFY_INPUT_STATE
	XA_MSG_NOTIFY_INPUT_NAME
	XA_MSG_NOTIFY_INPUT_CAPS
	XA_MSG_NOTIFY_INPUT_POSITION
	XA_MSG_NOTIFY_INPUT_POSITION_RANGE
	XA_MSG_NOTIFY_INPUT_TIMECODE
	XA_MSG_NOTIFY_INPUT_TIMECODE_GRANULARITY
	XA_MSG_NOTIFY_INPUT_DURATION
	XA_MSG_NOTIFY_INPUT_STREAM_INFO
	XA_MSG_NOTIFY_INPUT_MODULE
	XA_MSG_NOTIFY_INPUT_MODULE_INFO
	XA_MSG_NOTIFY_INPUT_DEVICE_INFO
	XA_MSG_NOTIFY_INPUT_FILTER_INFO
	XA_MSG_NOTIFY_OUTPUT_STATE
	XA_MSG_NOTIFY_OUTPUT_NAME
	XA_MSG_NOTIFY_OUTPUT_CAPS
	XA_MSG_NOTIFY_OUTPUT_VOLUME
	XA_MSG_NOTIFY_OUTPUT_BALANCE
	XA_MSG_NOTIFY_OUTPUT_PCM_LEVEL
	XA_MSG_NOTIFY_OUTPUT_MASTER_LEVEL
	XA_MSG_NOTIFY_OUTPUT_CHANNELS
	XA_MSG_NOTIFY_OUTPUT_PORTS
	XA_MSG_NOTIFY_OUTPUT_FEEDBACK_RATE
	XA_MSG_NOTIFY_OUTPUT_MODULE
	XA_MSG_NOTIFY_OUTPUT_MODULE_INFO
	XA_MSG_NOTIFY_OUTPUT_DEVICE_INFO
	XA_MSG_NOTIFY_OUTPUT_FILTER_INFO
	XA_MSG_NOTIFY_CODEC_EQUALIZER
	XA_MSG_NOTIFY_NOTIFICATION_MASK
	XA_MSG_NOTIFY_DEBUG_LEVEL
	XA_MSG_NOTIFY_PROGRESS
	XA_MSG_NOTIFY_DEBUG
	XA_MSG_NOTIFY_ERROR
	XA_MSG_COMMAND_QUEUE_FEEDBACK_EVENT
	XA_MSG_COMMAND_QUEUE_TAG_EVENT
	XA_MSG_COMMAND_FEEDBACK_PAUSE
	XA_MSG_COMMAND_FEEDBACK_RESTART
	XA_MSG_COMMAND_FEEDBACK_FLUSH
	XA_MSG_NOTIFY_FEEDBACK_EVENT
	XA_MSG_NOTIFY_TAG_EVENT
	XA_MSG_LAST
	XA_PLAYER_STATE_STOPPED
	XA_PLAYER_STATE_PLAYING
	XA_PLAYER_STATE_PAUSED
	XA_PLAYER_STATE_EOF
	XA_INPUT_STATE_OPEN
	XA_INPUT_STATE_CLOSED
	XA_OUTPUT_STATE_OPEN
	XA_OUTPUT_STATE_CLOSED
	XA_OUTPUT_CHANNELS_STEREO
	XA_OUTPUT_CHANNELS_MONO_LEFT
	XA_OUTPUT_CHANNELS_MONO_RIGHT
	XA_OUTPUT_CHANNELS_MONO_MIX
	XA_TIMEOUT_INFINITE
	XA_PLAYER_MODE_OUTPUT_AUTO_CLOSE_ON_STOP
	XA_PLAYER_MODE_OUTPUT_AUTO_CLOSE_ON_PAUSE
	XA_PLAYER_MODE_OUTPUT_AUTO_CLOSE_ON_EOF
	XA_NOTIFY_MASK_ERROR
	XA_NOTIFY_MASK_DEBUG
	XA_NOTIFY_MASK_PROGRESS
	XA_NOTIFY_MASK_ACK
	XA_NOTIFY_MASK_NACK
	XA_NOTIFY_MASK_PLAYER_STATE
	XA_NOTIFY_MASK_INPUT_STATE
	XA_NOTIFY_MASK_INPUT_NAME
	XA_NOTIFY_MASK_INPUT_CAPS
	XA_NOTIFY_MASK_INPUT_DURATION
	XA_NOTIFY_MASK_INPUT_POSITION
	XA_NOTIFY_MASK_INPUT_POSITION_RANGE
	XA_NOTIFY_MASK_INPUT_TIMECODE
	XA_NOTIFY_MASK_INPUT_TIMECODE_GRANULARITY
	XA_NOTIFY_MASK_INPUT_STREAM_INFO
	XA_NOTIFY_MASK_OUTPUT_STATE
	XA_NOTIFY_MASK_OUTPUT_NAME
	XA_NOTIFY_MASK_OUTPUT_CAPS
	XA_NOTIFY_MASK_OUTPUT_VOLUME
	XA_NOTIFY_MASK_OUTPUT_BALANCE
	XA_NOTIFY_MASK_OUTPUT_PCM_LEVEL
	XA_NOTIFY_MASK_OUTPUT_MASTER_LEVEL
	XA_NOTIFY_MASK_OUTPUT_PORTS
	XA_NOTIFY_MASK_CODEC_EQUALIZER
	XA_NOTIFY_MASK_FEEDBACK_EVENT
	XA_OUTPUT_VOLUME_IGNORE_FIELD
	XA_CMSEND
	XA_NOTIFY_PROGRESS
	XA_NOTIFY_DEBUG
	XA_NOTIFY_ERROR
	XA_EXPORT
	XA_IMPORT
	XA_EXPORT
	XA_IMPORT
	XA_API_ID_SYNC
	XA_API_ID_ASYNC
	XA_SUCCESS
	XA_FAILURE
	XA_ERROR_BASE_GENERAL
	XA_ERROR_OUT_OF_MEMORY
	XA_ERROR_INVALID_PARAMETERS
	XA_ERROR_INTERNAL
	XA_ERROR_TIMEOUT
	XA_ERROR_VERSION_EXPIRED
	XA_ERROR_BASE_NETWORK
	XA_ERROR_CONNECT_TIMEOUT
	XA_ERROR_CONNECT_FAILED
	XA_ERROR_CONNECTION_REFUSED
	XA_ERROR_ACCEPT_FAILED
	XA_ERROR_LISTEN_FAILED
	XA_ERROR_SOCKET_FAILED
	XA_ERROR_SOCKET_CLOSED
	XA_ERROR_BIND_FAILED
	XA_ERROR_HOST_UNKNOWN
	XA_ERROR_HTTP_INVALID_REPLY
	XA_ERROR_HTTP_ERROR_REPLY
	XA_ERROR_HTTP_FAILURE
	XA_ERROR_FTP_INVALID_REPLY
	XA_ERROR_FTP_ERROR_REPLY
	XA_ERROR_FTP_FAILURE
	XA_ERROR_BASE_CONTROL
	XA_ERROR_PIPE_FAILED
	XA_ERROR_FORK_FAILED
	XA_ERROR_SELECT_FAILED
	XA_ERROR_PIPE_CLOSED
	XA_ERROR_PIPE_READ_FAILED
	XA_ERROR_PIPE_WRITE_FAILED
	XA_ERROR_INVALID_MESSAGE
	XA_ERROR_CIRQ_FULL
	XA_ERROR_POST_FAILED
	XA_ERROR_BASE_URL
	XA_ERROR_URL_UNSUPPORTED_SCHEME
	XA_ERROR_URL_INVALID_SYNTAX
	XA_ERROR_BASE_IO
	XA_ERROR_OPEN_FAILED
	XA_ERROR_CLOSE_FAILED
	XA_ERROR_READ_FAILED
	XA_ERROR_WRITE_FAILED
	XA_ERROR_PERMISSION_DENIED
	XA_ERROR_NO_DEVICE
	XA_ERROR_IOCTL_FAILED
	XA_ERROR_MODULE_NOT_FOUND
	XA_ERROR_UNSUPPORTED_INPUT
	XA_ERROR_UNSUPPORTED_OUTPUT
	XA_ERROR_DEVICE_BUSY
	XA_ERROR_NO_SUCH_DEVICE
	XA_ERROR_NO_SUCH_FILE
	XA_ERROR_INPUT_EOF
	XA_ERROR_BASE_BITSTREAM
	XA_ERROR_INVALID_FRAME
	XA_ERROR_BASE_DYNLINK
	XA_ERROR_DLL_NOT_FOUND
	XA_ERROR_SYMBOL_NOT_FOUND
	XA_ERROR_BASE_ENVIRONMENT
	XA_ERROR_NO_SUCH_ENVIRONMENT
	XA_ERROR_ENVIRONMENT_TYPE_MISMATCH
);

$VERSION = '0.03';

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
            croak "constant '$constname' unknown";
        } else {
            croak "Your vendor has not defined test macro $constname";
        }
    }
    no strict 'refs';
    *$AUTOLOAD = sub { $val };
    goto &$AUTOLOAD;
}

#sub AUTOLOAD {
    # This AUTOLOAD is used to 'autoload' constants from the constant()
    # XS function.  If a constant is not found then control is passed
    # to the AUTOLOAD in AutoLoader.

#    my $constname;
#    ($constname = $AUTOLOAD) =~ s/.*:://;
#    croak "& not defined" if $constname eq 'constant';
#    my $val = constant($constname, @_ ? $_[0] : 0);
    
#    if ($! != 0) {
#	if ($! =~ /Invalid/) {
#	    croak "constant $constname unknown";
#	} else {
#	    croak "Your vendor has not defined MPEG::MP3Play macro $constname";
#	}
#    }

#    no strict 'refs';
#    *$AUTOLOAD = sub { $val };

#    goto &$AUTOLOAD;
#}

bootstrap MPEG::MP3Play $VERSION;

# Preloaded methods go here.

sub new {
	my $type = shift;
	
	my $self = {
		player => new_player()
	};
	
	return bless $self, $type;
}

sub DESTROY {
	my $self = shift;
	
	destroy_player ($self->{player});
}

sub open {
	my $self = shift;

	my ($filename) = @_;
	
	control_message_send_S (
		$self->{player},
		&XA_MSG_COMMAND_INPUT_OPEN,
		$filename
	);

	return;
}

sub close {
	my $self = shift;

	my ($filename) = @_;
	
	control_message_send_N (
		$self->{player},
		&XA_MSG_COMMAND_INPUT_CLOSE
	);

	return;
}

sub exit {
	my $self = shift;

	my ($filename) = @_;
	
	control_message_send_N (
		$self->{player},
		&XA_MSG_COMMAND_EXIT
	);

	return;
}

sub play {
	my $self = shift;

	control_message_send_N (
		$self->{player},
		&XA_MSG_COMMAND_PLAY
	);

	return;
}

sub stop {
	my $self = shift;

	control_message_send_N (
		$self->{player},
		&XA_MSG_COMMAND_STOP
	);

	return;
}

sub pause {
	my $self = shift;

	control_message_send_N (
		$self->{player},
		&XA_MSG_COMMAND_PAUSE
	);

	return;
}

sub seek {
	my $self = shift;
	
	my ($offset, $range) = @_;
	
	control_message_send_II (
		$self->{player},
		&XA_MSG_COMMAND_SEEK,
		$offset,
		$range
	);

	return;
}

sub volume {
	my $self = shift;
	
	my ($pcm_level, $master_level, $balance) = @_;
	
	$pcm_level    = &XA_OUTPUT_VOLUME_IGNORE_FIELD
			unless defined $pcm_level;
	$master_level = &XA_OUTPUT_VOLUME_IGNORE_FIELD
			unless defined $master_level;
	$balance      = &XA_OUTPUT_VOLUME_IGNORE_FIELD
			unless defined $balance;
	
	control_message_send_III (
		$self->{player},
		&XA_MSG_SET_OUTPUT_VOLUME,
		$balance,
		$pcm_level,
		$master_level
	);

	return;
}

sub get_message {
	my $self = shift;

	my $msg = control_message_get (
		$self->{player}
	);

	return $msg;	
}

sub get_message_wait {
	my $self = shift;
	my ($timeout) = @_;

	$timeout ||= &XA_TIMEOUT_INFINITE;

	my $msg = control_message_wait (
		$self->{player},
		$timeout
	);

	return $msg;	
}

sub get_command_read_pipe {
	my $self = shift;
	
	return command_read_pipe ($self->{player});
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
  
  $mp3->open ("test.mp3");
  $mp3->play;

  while ( 1 ) {
  	my $msg = $mp3->get_message_wait;
	last if ( $msg->{code}  == &XA_MSG_NOTIFY_PLAYER_STATE and
	          $msg->{state} == &XA_PLAYER_STATE_EOF )
  }

  $mp3->close;
  $mp3->exit;

=head1 DESCRIPTION

This Perl module enables you to playback MPEG music.

=head1 PREREQUISITES

MPEG::MP3Play is build against the 3.0 version of the Xaudio SDK
and uses the async interface of the Xaudio library.

I don't know if older versions will work properly. The SDK is not
part of this distribution, so get and install it first
(http://www.xaudio.com/).

samples/play.pl uses Term::ReadKey if it's installed.
samples/gtk.pl depends on Gtk.

=head1 INSTALLATION

First, generate the Makefile:

  perl Makefile.PL

You will be prompted for the location of the Xaudio SDK. The directory
must contain the include and lib subdirectories, where the Xaudio header
and library files are installed.

  make
  make test
  ./runsample play.pl
  ./runsample gtk.pl  
  make install

=head1 SAMPLE SCRIPTS

There are two small scripts in the samples directory
You can run these script before 'make install' with the
runsample script (usage: see above).

Both scripts expect a mp3 file 'test.mp3' in the actual
directory.

=over 8

=item B<play.pl>

Textmodus playback. Displays the timecode. Simple
volume control with '+' and '-' keys.

=item B<gtk.pl>

This script demonstrates the usage of MPEG::MP3Play with
the Gtk module. It produces a simple window with a
progress bar while playing back the test.mp3 file.

=back

=head1 CONSTRUCTOR

=over 8

=item B<new>

my $mp3 = new MPEG::MP3Play;

This is the constructor of this class and takes no arguments.

=back

=head1 CONTROL METHODS

The following methods control the audio playback. Internally
they send messages to the Xaudio subsystem. This message passing
is completely asynchronyous, so no result values (e.g. sucess)
are given back by this methods.

Instead the Xaudio subsystem sends back acknowledge messages.
See the chapter MESSAGE HANDLING for details.

=over 8

=item B<open>

$mp3->open ($filename);

Opens the MPEG file $filename. No playback is started at this time.

=item B<close>

$mp3->close ($filename);

Closes an opened file.

=item B<exit>

$mp3->exit

The Xaudio thread or process will be canceled.

=item B<play>

$mp3->play

Starts playing back an opened file. Must be called B<after>
$mp3->open.

=item B<stop>

$mp3->stop

Stops playing back a playing file. The play position rewinds
to the beginning.

=item B<pause>

$mp3->pause

Pauses. $mp3->play will go further at the actual position.

=item B<seek>

$mp3->seek ($offset, $range)

Sets the play position to a specific value. $offset is the
position relative to $range. If $range is 100 and $offset is 50,
it will be positioned in the middle of the song.

=item B<volume>

$mp3->volume ($pcm_level, $master_level, $balance)

Sets volume parameters. $pcm_level is the level of the actual
MPEG audio stream. $master_level is the master level of the
sound subsystem. Both values must be set between 0 (silence)
and 100 (ear breaking loud).

A $balance of 50 is the middle, smaller is more left, higher
is more right.

=back

=head1 MESSAGE HANDLING

Currently there are two methods to get messages from
the Xaudio subsystem. So it is up to you to set up the
message handler by using this methods.

In the near future MPEG::MP3Play will provide a default
message handler which you can customize by overloading
the message handler methods.

=over 8

=item B<get_message>

$msg_href = $mp3->get_message

If there is a message in the players message queue, it will
be returned as a hash reference immediately. This method will
B<not> block, if there is no message. It will return undef
instead.

=item B<get_message_wait>

$msg_href = $mp3->get_message_wait ( [$timeout] )

This method will wait max. $timeout microseconds, if there
is no method in the queue. If $timeout is omitted it will
block until the next message appears. The message will be
returned as a hash reference.

=back

=head2 The message hash

The returned messages are references to hashes. Please refer
to the Xaudio SDK documentation for details. The message
hashes are build 1:1 out of the structs documented there,
using _ as a seperator for nested structs.

(Simply use Data::Dumper to learn more about the message
hashes ;)

=head1 TODO

  - Testing of all methods.
  - implementation of a simple message handler
  - OO interface for message handling, with the possibility
    of overloading the message handlers
  - full documentation of all handled messages
  - more details about the messages hashes
  - support of the full Xaudio API, with input/output
    modules, etc.

Ideas, code and any help are very appreciated.

=head1 BUGS

  - samples/gtk.pl throws some Gdk messages on exit.
    (not really a MPEG::MP3Play bug ;)

=head1 AUTHOR

Joern Reder, joern@netcologne.de

=head1 COPYRIGHT

Copyright (C) 1999 by Joern Reder, All Rights Reserved.

This library is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.

The Xaudio SDK is copyright by MpegTV,LLC. Please refer to the
LICENSE text published on http://www.xaudio.com/.

=head1 SEE ALSO

perl(1).

=cut
