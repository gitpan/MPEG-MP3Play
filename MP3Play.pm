# $Id: MP3Play.pm,v 1.27 1999/08/08 12:37:55 joern Exp $

package MPEG::MP3Play;

use strict;
use Carp;
use vars qw($VERSION @EXPORT_OK %EXPORT_TAGS @ISA $AUTOLOAD);

require Exporter;
require DynaLoader;

$VERSION = '0.05';

@ISA = qw(Exporter DynaLoader);

@EXPORT_OK = qw(
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
	XA_PLAYER_MODE_OUTPUT_AUTO_CLOSE_ON_STOP
	XA_PLAYER_MODE_OUTPUT_AUTO_CLOSE_ON_PAUSE
	XA_PLAYER_MODE_OUTPUT_AUTO_CLOSE_ON_EOF
);

%EXPORT_TAGS = (
msg => [qw (
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
	XA_MSG_COMMAND_QUEUE_FEEDBACK_EVENT
	XA_MSG_COMMAND_QUEUE_TAG_EVENT
	XA_MSG_COMMAND_FEEDBACK_PAUSE
	XA_MSG_COMMAND_FEEDBACK_RESTART
	XA_MSG_COMMAND_FEEDBACK_FLUSH
	XA_MSG_NOTIFY_FEEDBACK_EVENT
	XA_MSG_NOTIFY_TAG_EVENT
	XA_MSG_LAST
	XA_TIMEOUT_INFINITE
	XA_OUTPUT_VOLUME_IGNORE_FIELD
)],
state => [qw (
	XA_PLAYER_STATE_STOPPED
	XA_PLAYER_STATE_PLAYING
	XA_PLAYER_STATE_PAUSED
	XA_PLAYER_STATE_EOF
	XA_INPUT_STATE_OPEN
	XA_INPUT_STATE_CLOSED
	XA_OUTPUT_STATE_OPEN
	XA_OUTPUT_STATE_CLOSED
	XA_PLAYER_MODE_OUTPUT_AUTO_CLOSE_ON_STOP
	XA_PLAYER_MODE_OUTPUT_AUTO_CLOSE_ON_PAUSE
	XA_PLAYER_MODE_OUTPUT_AUTO_CLOSE_ON_EOF
)],
mask => [qw (
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
)],
misc => [qw(
	XA_OUTPUT_CHANNELS_STEREO
	XA_OUTPUT_CHANNELS_MONO_LEFT
	XA_OUTPUT_CHANNELS_MONO_RIGHT
	XA_OUTPUT_CHANNELS_MONO_MIX
	XA_CMSEND
	XA_NOTIFY_PROGRESS
	XA_NOTIFY_DEBUG
	XA_NOTIFY_ERROR
	XA_EXPORT
	XA_IMPORT
	XA_API_ID_SYNC
	XA_API_ID_ASYNC
)],
error=> [qw (
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
)]);

sub AUTOLOAD {
    # This AUTOLOAD is used to 'autoload' constants from the constant()
    # XS function.  If a constant is not found then an exception will be
    # croaked. This is catched when trying to execute a message method
    # or exits the program.

    my $constname;
    ($constname = $AUTOLOAD) =~ s/.*:://;
    croak "& not defined" if $constname eq 'constant';
    my $val = constant($constname, @_ ? $_[0] : 0);
    if ($! != 0) {
        if ($! =~ /Invalid/) {
            croak "MP3Play autoload error: '$constname' unknown";
        } else {
            croak "Your vendor has not defined test macro $constname";
        }
    }
    no strict 'refs';
    *$AUTOLOAD = sub { $val };
    goto &$AUTOLOAD;
}

bootstrap MPEG::MP3Play $VERSION;

sub new {
	my $type = shift;
	my %par = @_;
	
	croak "debug => { 'err' | 'all' }"
		if $par{debug} and $par{debug} ne 'err'
			       and $par{debug} ne 'all';
	
	my $self = {
		player => new_player(),
		debug => $par{debug}
	};
	
	return bless $self, $type;
}

sub DESTROY {
	my $self = shift;
	
	destroy_player ($self->{player});
}

sub debug {
	my $self = shift;
	
	my ($debug) = @_;
	
	croak "debug => { 'err' | 'all' | 'none' | '' }"
		if $debug ne '' and $debug ne 'err' and
		   $debug ne 'all' and $debug ne 'none';
	$debug = '' if $debug eq 'none';

	$self->{debug} = $debug;

	1;
}

sub open {
	my $self = shift;

	my ($filename) = @_;
	
	control_message_send_S (
		$self->{player},
		&XA_MSG_COMMAND_INPUT_OPEN,
		$filename
	) == &XA_SUCCESS;
}

sub close {
	my $self = shift;

	my ($filename) = @_;
	
	control_message_send_N (
		$self->{player},
		&XA_MSG_COMMAND_INPUT_CLOSE
	) == &XA_SUCCESS;;
}

sub exit {
	my $self = shift;

	my ($filename) = @_;
	
	control_message_send_N (
		$self->{player},
		&XA_MSG_COMMAND_EXIT
	) == &XA_SUCCESS;
}

sub play {
	my $self = shift;

	control_message_send_N (
		$self->{player},
		&XA_MSG_COMMAND_PLAY
	) == &XA_SUCCESS;
}

sub stop {
	my $self = shift;

	control_message_send_N (
		$self->{player},
		&XA_MSG_COMMAND_STOP
	) == &XA_SUCCESS;
}

sub pause {
	my $self = shift;

	control_message_send_N (
		$self->{player},
		&XA_MSG_COMMAND_PAUSE
	) == &XA_SUCCESS;
}

sub seek {
	my $self = shift;
	
	my ($offset, $range) = @_;
	
	control_message_send_II (
		$self->{player},
		&XA_MSG_COMMAND_SEEK,
		$offset,
		$range
	) == &XA_SUCCESS;
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
	) == &XA_SUCCESS;
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

sub set_notification_mask {
	my $self = shift;
	
	my $mask = 0;
	
	if ( $self->{debug} ) {
		$mask  = &XA_NOTIFY_MASK_NACK;
		$mask |= &XA_NOTIFY_MASK_ACK if $self->{debug} eq 'all';
	}
	
	for (@_) { $mask |= $_ }
	
	$self->{notification_mask} = $mask;

	control_message_send_I (
		$self->{player},
		&XA_MSG_SET_NOTIFICATION_MASK,
		$mask
	) == &XA_SUCCESS;
}

sub set_player_mode {
	my $self = shift;
	
	my $mask = 0;
	for (@_) { $mask |= $_ }
	
	$self->{player_mode} = $mask;

	control_message_send_I (
		$self->{player},
		&XA_MSG_SET_PLAYER_MODE,
		$mask
	) == &XA_SUCCESS;
}

sub get_command_read_pipe {
	my $self = shift;
	
	return command_read_pipe ($self->{player});
}

sub set_user_data {
	my $self = shift;

	my ($data) = @_;

	$self->{user_data} = $data;
	
	1;
}

sub get_user_data {
	my $self = shift;

	return $self->{user_data};
}

sub message_handler {
	my $self = shift;
	
	my ($timeout) = @_;
	
	while ( 1 ) {
		my $msg = $self->get_message_wait ($timeout);
		if ( defined $msg ) {
			last if not $self->_process_message ($msg);
			last if $msg->{code} == &XA_MSG_NOTIFY_EXITED;
		}
		if ( $timeout ) {
			last if not $self->_process_message ({
				_method_name => "work"
			});
		}
	}
}

sub process_messages_nowait {
	my $self = shift;
	
	my $msg = 1;
	while ( $msg ) {
		$msg = $self->get_message;
		if ( defined $msg ) {
			last if not $self->_process_message ($msg);
			last if $msg->{code} == &XA_MSG_NOTIFY_EXITED;
		}
	}
}

sub _process_message {
	my $self = shift;
	
	my ($msg) = @_;
	my $method = $msg->{_method_name};

	my $retval = eval { $self->$method ($msg) };
	croak $@ if $@ and $@ !~ /^MP3Play autoload error/;
	$retval = 1 if $@;

	return $retval;
}

{
	# this is for caching message names
	my %MESSAGE_NAME;
	my $MESSAGE_NAME_BUILT;

	sub _message_name {
		my $self = shift;
	
		my ($code) = @_;
	
		# return message name if available
		return $MESSAGE_NAME{$code} if $MESSAGE_NAME_BUILT;
		
		# ok, first build %MESSAGE_NAME
		my $eval;
		foreach my $msg (@{$EXPORT_TAGS{msg}}) {
			$eval .= qq{\$MESSAGE_NAME{&$msg} = '$msg';\n};
		}
		eval $eval;
		
		$MESSAGE_NAME_BUILT = 1;
		
		# now return message name
		return $MESSAGE_NAME{$code};
	}
}

{
	# this is for caching error names
	my %ERROR_NAME;
	my $ERROR_NAME_BUILT;

	sub _error_name {
		my $self = shift;
	
		my ($code) = @_;
	
		# return error name if available
		return $ERROR_NAME{$code} if $ERROR_NAME_BUILT;
		
		# ok, first build %ERROR_NAME
		my $eval;
		foreach my $err (@{$EXPORT_TAGS{error}}) {
			$eval .= qq{\$ERROR_NAME{&$err} = '$err';\n};
		}
		eval $eval;
		
		$ERROR_NAME_BUILT = 1;

		# now return error name
		return $ERROR_NAME{$code};
	}
}

# default message handlers

sub msg_notify_player_state {
	my $self = shift;
	my ($msg) = @_;
	
	# return false on EOF, so the message handler will exit
	return if $msg->{state} == &XA_PLAYER_STATE_EOF;

	# always return true in a message handler
	1;
}

sub msg_notify_ack {
	my $self = shift;

	return 1 if not $self->{debug} eq 'all';
	
	my ($msg) = @_;
	
	my $msg_name = $self->_message_name ($msg->{ack});

	carp "message '$msg_name' acknowledged";

	# always return true in a message handler
	1;
}

sub msg_notify_nack {
	my $self = shift;

	return 1 if not $self->{debug};
	
	my ($msg) = @_;
	
	my $msg_name = $self->_message_name ($msg->{nack_command});
	my $err_name = $self->_error_name ($msg->{nack_code});

	carp "message '$msg_name' error: $err_name";

	# always return true in a message handler
	1;
}

1;
__END__

=head1 NAME

MPEG::MP3Play - Perl extension for playing back MPEG music

=head1 SYNOPSIS

  use MPEG::MP3Play;
  my $mp3 = new MPEG::MP3Play;
  
  $mp3->open ("test.mp3");
  $mp3->play;
  $mp3->message_handler;

=head1 DESCRIPTION

This Perl module enables you to playback MPEG music.

=head1 PREREQUISITES

B<Xaudio SDK>

MPEG::MP3Play is build against the 3.0 version of the Xaudio SDK
and uses the async interface of the Xaudio library.

I don't know if older versions will work properly. The SDK is not
part of this distribution, so get and install it first
(http://www.xaudio.com/).

B<Perl>

I built and tested this module using Perl 5.005_03. It should
work also with Perl 5.004_04 and above, but I did not test this.
If someone builds MPEG::MP3Play successfully with other versions
of Perl, plesase drop me a note.

B<Optionally used Perl modules>

  samples/play.pl uses Term::ReadKey if it's installed.
  samples/handler.pl requires Term::ReadKey.
  samples/gtk*.pl require Gtk.

=head1 INSTALLATION

First, generate the Makefile:

  perl Makefile.PL

You will be prompted for the location of the Xaudio SDK. The directory
must contain the include and lib subdirectories, where the Xaudio header
and library files are installed.

  make
  make test
  ./runsample play.pl
  ./runsample handler.pl
  ./runsample gtk.pl
  ./runsample gtkhandler.pl
  make install

=head1 SAMPLE SCRIPTS

There are some small test scripts in the samples directory.
You can run these scripts before 'make install' with the
runsample script (or directly with 'perl', after running
'make install'). For runsample usage: see above.

All scripts expect a mp3 file 'test.mp3' in the actual
directory.

=over 8

=item B<play.pl>

Textmodus playback. Displays the timecode. Simple
volume control with '+' and '-' keys.

=item B<handler.pl>

Does generally the same as play.pl, but uses the builtin
message handler. You'll see, that this solution is much
more elegant. It I<requires> Term::ReadKey.

This script makes use of the debugging facility and
is best documented so far.

=item B<gtk.pl>

This script demonstrates the usage of MPEG::MP3Play with
the Gtk module. It produces a simple window with a
progress bar while playing back the test.mp3 file.

=item B<gtkhandler.pl>

This script does the same as gtk.pl but uses the builtin
message handler concept instead of implementing message
handling by itself. Advantage of using the builtin message
handler: no global variables are necessary anymore.

=item B<synopsis.pl>

This one proves that the usage shown in the SYNOPSIS
I<really> works ;)

=back

=head1 BASIC CONCEPT

The concept of the Xaudio async API is based on forking
an extra process (or thread) for the MPEG decoding and
playing. The parent process controls this process
by sending and recieving messages. This message passing
is asynchronous.

This module interface provides methods for sending common messages
to the MPEG process, eg. play, pause, stop. Also
it implements a message handler to process the messages sent
back. Eg. every message sent to the subprocess will be
acknowledged by sending back an XA_MSG_NOTIFY_ACK message (or
XA_MSG_NOTIFY_NACK on error). Error handling must be set up
by handling this messages.

=head1 CONSTRUCTOR / DEBUGGING

=over 8

=item B<new>

$mp3 = new MPEG::MP3Play (
    [ debug => 'err' | 'all' ]
 );

This is the constructor of this class. It optionally takes
the argument 'debug' to set a debugging level. If debugging
is set to 'err', XA_MSG_NOTIFY_NACK messages will be carp'ed.
Additionally XA_MSG_NOTIFY_ACK messages will be carp'ed if
debugging is set to 'all'.

The debugging is implemented by the methods B<msg_notify_ack>
and B<msg_notify_nack> and works only if you use the builtin
message handler. You can overload them to set up a private error
handling (see chapter USING THE BUILTIN MESSAGE HANDLER for
details)

=item B<debug>

$mp3->debug (
    'err' | 'all' | 'none' | ''
 );

With this method you can set the debugging level at any time.
If you pass an empty string or 'none' debugging will be disabled.

=back

=head1 CONTROL METHODS

The following methods control the audio playback. Internally
they send messages to the Xaudio subsystem. This message passing
is asynchronous. The result value of these methods indicates
only if the message was sent, but not if it was successfully
processed. Instead the Xaudio subsystem sends back acknowledge
messages. See the chapter MESSAGE HANDLING for details and refer
to the Xaudio documentation.

=over 8

=item B<open>

$sent = $mp3->open ($filename);

Opens the MPEG file $filename. No playback is started at this time.

=item B<close>

$sent = $mp3->close;

Closes an opened file.

=item B<exit>

$sent = $mp3->exit;

The Xaudio thread or process will be canceled.
Use this with care. If you attempt to read or
send messages after using this, you'll get
a broken pipe error.

Generally you need not to use $mp3->exit. The DESTROY
method of MPEG::MP3play cleans up everything well.

=item B<play>

$sent = $mp3->play;

Starts playing back an opened file. Must be called B<after>
$mp3->open.

=item B<stop>

$sent = $mp3->stop;

Stops playing back a playing file. The player rewinds
to the beginning.

=item B<pause>

$sent = $mp3->pause;

Pauses. $mp3->play will go further at the actual position.

=item B<seek>

$sent = $mp3->seek ($offset, $range);

Sets the play position to a specific value. $offset is the
position relative to $range. If $range is 100 and $offset is 50,
it will be positioned in the middle of the song.

=item B<volume>

$sent = $mp3->volume ($pcm_level, $master_level, $balance);

Sets volume parameters. Works only if playing is active.
$pcm_level is the level of the actual MPEG audio stream.
$master_level is the master level of the sound subsystem.
Both values must be set between 0 (silence) and 100
(ear breaking loud).

A $balance of 50 is the middle, smaller is more left, higher
is more right.

You can supply undef for any parameter above and the corresponding
value will not change.

=item B<set_player_mode>

$sent = $mp3->set_player_mode ( $flag, ... )

This method sets flags that modify the player's behavior.
It expects a list of XA_PLAYER_MODE_* constants. Currently
supported constants are:

  XA_PLAYER_MODE_OUTPUT_AUTO_CLOSE_ON_STOP
  XA_PLAYER_MODE_OUTPUT_AUTO_CLOSE_ON_PAUSE
  XA_PLAYER_MODE_OUTPUT_AUTO_CLOSE_ON_EOF

Refer to the Xaudio documentation for details about this flags.

You can import this constants to your namespace using the ':state' tag
(see CONSTANTS section below).

=back

=head1 SIMPLE MESSAGE HANDLING

There are two methods to retrieve messages from
the Xaudio subsystem. You can use them to implement
your own message handler. Alternatively you can use
the builtin message handler, described in the next chapter.

=over 8

=item B<get_message>

$msg_href = $mp3->get_message;

If there is a message in the players message queue, it will
be returned as a hash reference immediately. This method will
B<not> block if there is no message. It will return undef
instead.

=item B<get_message_wait>

$msg_href = $mp3->get_message_wait ( [$timeout] );

This method will wait max. $timeout microseconds, if there
is no method in the queue. If $timeout is omitted it will
block until the next message appears. The message will be
returned as a hash reference.

B<The message hash>

The returned messages are references to hashes. Please refer
to the Xaudio SDK documentation for details. The message
hashes are build 1:1 out of the structs (in fact a union)
documented there, using _ as a seperator for nested structs.

(Simply use Data::Dumper to learn more about the message
hashes, e.g. that the name of the internal message handler
is stored as $msg_href->{_method_name} ;)

=item B<set_notification_mask>

$sent = $mp3->set_notification_mask ($flag, ...);

By default all messages generated by the Xaudio subsystem
are sent to you. This method sends a message to block or unblock certain
types of notification messages. It expects a list of XA_NOTIFY_MASK_*
constants corresponding to the messages you want to recieve. You
can import this constants to your namespace using the ':mask' tag
(see CONSTANTS section below).

Valid notification mask flags are:

  XA_NOTIFY_MASK_ERROR 
  XA_NOTIFY_MASK_DEBUG 
  XA_NOTIFY_MASK_PROGRESS 
  XA_NOTIFY_MASK_ACK 
  XA_NOTIFY_MASK_NACK 
  XA_NOTIFY_MASK_PLAYER_STATE 
  XA_NOTIFY_MASK_INPUT_STATE 
  XA_NOTIFY_MASK_INPUT_CAPS 
  XA_NOTIFY_MASK_INPUT_NAME 
  XA_NOTIFY_MASK_INPUT_DURATION 
  XA_NOTIFY_MASK_INPUT_POSITION_RANGE 
  XA_NOTIFY_MASK_INPUT_POSITION 
  XA_NOTIFY_MASK_INPUT_TIMECODE_GRANULARITY 
  XA_NOTIFY_MASK_INPUT_TIMECODE 
  XA_NOTIFY_MASK_INPUT_STREAM_INFO 
  XA_NOTIFY_MASK_OUTPUT_STATE 
  XA_NOTIFY_MASK_OUTPUT_NAME 
  XA_NOTIFY_MASK_OUTPUT_VOLUME 
  XA_NOTIFY_MASK_OUTPUT_BALANCE 
  XA_NOTIFY_MASK_OUTPUT_PCM_LEVEL 
  XA_NOTIFY_MASK_OUTPUT_MASTER_LEVEL 
  XA_NOTIFY_MASK_OUTPUT_PORTS 
  XA_NOTIFY_MASK_OUTPUT_CAPS 
  XA_NOTIFY_MASK_CODEC_EQUALIZER 
  XA_NOTIFY_MASK_FEEDBACK_EVENT 

B<Note:>

If debugging is set to 'err' you cannot unset the XA_NOTIFY_MASK_NACK
flag. If debugging ist set to 'all' also unsetting XA_NOTIFY_MASK_NACK
is impossible.

=item B<get_command_read_pipe>

$read_fd = $mp3->get_command_read_pipe;

This method returns the file descriptor of the internal
message pipe as an integer. You can use this to monitor
the message pipe for incoming messages, e.g. through
Gdk in a Gtk application. See samples/gtk*.pl for an
example about using this feature.

=back

=head1 USING THE BUILTIN MESSAGE HANDLER

You can implement your own message handler based upon the
methods described above. In many cases its easier to use
the builtin message handler.

=over 8

=item B<message_handler>

$mp3->message_handler ( [$timeout] );

This method implements a message handler for all
messages the Xaudio subsystem sends. It infinitely calls
$mp3->get_message_wait and checks if a method according
to the recieved message exists. If the method exists
it will be invoked with the object instance and the
recieved message as parameters. If no method exists, the
message will be ignored.

The infinite message loop exits, if a message method
returns false. B<So, all your message methods must
return true, otherwise the message_handler will
exit very soon ;)>

The names of the message methods are derived from
message names (a complete list of messages is part of
the Xaudio SDK documentation).
The prefix XA_ will be removed, the rest of the name
will be converted to lower case.

B<Example:>
the message handler method for

  XA_MSG_INPUT_POSITION

is

  $mp3->msg_input_position ($msg_href)

The message handler is called with two parameters:
the object instance $mp3 and the $msg_href returned by
the get_message_wait method.

B<Hint>

It's implicitly said above, but I want to mention it
explicitly: you must define your message handlers
in the MPEG::MP3Play package, because they are methods
of the MPEG::MP3Play class. So say 'B<package MPEG::MP3Play>'
before writing your handlers.

Naturally you can subclass the MPEG::MP3Play module and
implement your message handlers this way. It's up to you.

B<Doing some work>

If the parameter $timeout is set when calling
$mp3->method_handler, $mp3->get_message_wait
is called with this timeout value. Additionally the method
B<$mp3-E<gt>work> ist invoked after waiting or processing
messages, so you can implement some logic
here to control the module. The work method should not
spend much time, because it blocks the rest of the
control process (not the MPEG audio stream, its processed
in its own thread, respectively process).

If the work method returns false, the method handler
exits.

=item B<work>

$mp3->work;

See explantation in the paragraph above.

=item B<process_messages_nowait>

$mp3->process_messages_nowait;

This method processes all messages in the queue using
the invocation mechanism described above. It returns
immediately when there are no messages to process.
You can use this as an input handler for the
Gtk::Gdk->input_add call, see samples/gtkhandler.pl
for an example of this.

=back

=head2 User data for the message handlers

Often it is necessary that the message handlers can
access some user data, e.g. to manipulate a Gtk widget.
There are two methods to set and get user data. The
user data will be stored in the MPEG::MP3Play object
instance, so it can easily accessed where the instance
handle is available.

=over 8

=item B<set_user_data>

$mp3->set_user_data ( $data );

This sets the user data of the $mp3 handle to $data. It
is a good idea to set $data to a hash reference, so you
can easily store a handful parameters.

B<Example:>

  $mp3->set_user_data ( {
  	pbar_widget   => $pbar,
	win_widget    => $window,
	gdk_input_tag => $input_tag
  } );

=item B<get_user_data>

$data = $mp3->get_user_data;

This returns the data previously set with $mp3->set_user_data
or undef, if no user data was set before.

=back

=head1 DEFAULT MESSAGE HANDLERS

The module provides simple message handlers for some default
behavior. You can overload them, if want to implement your
own functionality.

=over 8

=item B<msg_notify_player_state>

If the current file reaches EOF this handler returns false,
so the message handler will exit.

=item B<msg_notify_ack>

If debugging is set to 'all' this handler will print the
acknowledged message using carp.

=item B<msg_notify_nack>

If debugging is set to 'err' or 'all' this handler will
print the not acknowledged message plus an error string
using carp.

=back

=head1 CONSTANTS

There are many, many constants defined in the Xaudio header
files. E.g. the message codes are defined there as constants.
MPEG::MP3Play knows all defined constants, but does not
export them to the callers namespace by default.

MPEG::MP3Play uses the standard Exporter mechanisms to export
symbols to your namespace. There are defined some tags to
group the symbols (see Exporter manpage on how to use them):

=over 8

=item B<msg>

This exports all symbols you need to do message handling on
your own, particularly all message codes are exported here.
Refer to the source code for a complete listing.

=item B<state>

XA_PLAYER_STATE_*, XA_INPUT_STATE_* and XA_OUTPUT_STATE_*.
Use this to check the actual player state in a
XA_MSG_NOTIFY_PLAYER_STATE message handler.

=item B<mask>

This are all notify mask constants. The're needed to specify
a notification mask. (see B<set_notification_mask>)

=item B<error>

All symbols for Xaudio error handling, incl. success code. I
never needed them so far.

=item B<misc>

Some symbols cannot be assigned to the tags above. They're
collected here (look into the source for a complete list).

=back

=head2 Note:

If you use the builtin message handler mechanism, B<you need not
to import message symbols to your namespace>. Alle message handlers
are methods of the MPEG::MP3Play class, so they can access all
symbols directly.

No import to your namespace at all is needed unless you want to
use $mp3->set_notification_mask or $mp3->set_player_mode!

=head1 TODO

  - Testing of all methods.
  - Testing under Win32
  - support of the full Xaudio API, with input/output
    modules, etc.
  - documentation: more details about the messages
    hashes
  - runsample.bat for Win32

Ideas, code and any help are very appreciated.

=head1 BUGS

  - samples/gtk*.pl throw some Gdk messages on exit.
    (not really a MPEG::MP3Play bug, I fear it documents
     that I'm a beginner in coding Gtk+ applications ;)
  - the runsample script currently works only under
    Unix, it will fail under Win32

If you find a bug please send me a report. I will fix
this as soon as possible. Also I'm very interested to know,
if someone write applications based on this module. So
don't hesitate to send me an email, if you like (or not like ;)
this module.

=head1 AUTHOR

Joern Reder, joern@netcologne.de

=head1 COPYRIGHT

Copyright (C) 1999 by Joern Reder, All Rights Reserved.

This library is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.

The Xaudio SDK is copyright by MpegTV,LLC. Please refer to the
LICENSE text published on http://www.xaudio.com/.

=head1 SEE ALSO

perl(1), MPEG::MP3Info.

=cut
