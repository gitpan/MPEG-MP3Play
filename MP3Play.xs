#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include </usr/local/xaudiosdk/include/player.h>
#include </usr/local/xaudiosdk/include/control.h>

static int
not_here(char *s)
{
    croak("%s not implemented on this architecture", s);
    return -1;
}

static double
constant(char *name, int arg)
{
    errno = 0;
    switch (*name) {
    case 'A':
	break;
    case 'B':
	break;
    case 'C':
	break;
    case 'D':
	break;
    case 'E':
	break;
    case 'F':
	break;
    case 'G':
	break;
    case 'H':
	break;
    case 'I':
	break;
    case 'J':
	break;
    case 'K':
	break;
    case 'L':
	break;
    case 'M':
	break;
    case 'N':
	break;
    case 'O':
	break;
    case 'P':
	break;
    case 'Q':
	break;
    case 'R':
	break;
    case 'S':
	break;
    case 'T':
	break;
    case 'U':
	break;
    case 'V':
	break;
    case 'W':
	break;
    case 'X':
	if (strEQ(name, "XA_MSG_COMMAND_INPUT_OPEN"))
	    return XA_MSG_COMMAND_INPUT_OPEN;
	if (strEQ(name, "XA_MSG_COMMAND_PLAY"))
	    return XA_MSG_COMMAND_PLAY;

	if (strEQ(name, "XA_CMSEND"))
#ifdef XA_CMSEND
	    return XA_CMSEND;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_NOTIFY_MASK_ACK"))
#ifdef XA_NOTIFY_MASK_ACK
	    return XA_NOTIFY_MASK_ACK;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_NOTIFY_MASK_CODEC_EQUALIZER"))
#ifdef XA_NOTIFY_MASK_CODEC_EQUALIZER
	    return XA_NOTIFY_MASK_CODEC_EQUALIZER;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_NOTIFY_MASK_DEBUG"))
#ifdef XA_NOTIFY_MASK_DEBUG
	    return XA_NOTIFY_MASK_DEBUG;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_NOTIFY_MASK_ERROR"))
#ifdef XA_NOTIFY_MASK_ERROR
	    return XA_NOTIFY_MASK_ERROR;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_NOTIFY_MASK_FEEDBACK_EVENT"))
#ifdef XA_NOTIFY_MASK_FEEDBACK_EVENT
	    return XA_NOTIFY_MASK_FEEDBACK_EVENT;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_NOTIFY_MASK_INPUT_CAPS"))
#ifdef XA_NOTIFY_MASK_INPUT_CAPS
	    return XA_NOTIFY_MASK_INPUT_CAPS;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_NOTIFY_MASK_INPUT_DURATION"))
#ifdef XA_NOTIFY_MASK_INPUT_DURATION
	    return XA_NOTIFY_MASK_INPUT_DURATION;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_NOTIFY_MASK_INPUT_NAME"))
#ifdef XA_NOTIFY_MASK_INPUT_NAME
	    return XA_NOTIFY_MASK_INPUT_NAME;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_NOTIFY_MASK_INPUT_POSITION"))
#ifdef XA_NOTIFY_MASK_INPUT_POSITION
	    return XA_NOTIFY_MASK_INPUT_POSITION;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_NOTIFY_MASK_INPUT_POSITION_RANGE"))
#ifdef XA_NOTIFY_MASK_INPUT_POSITION_RANGE
	    return XA_NOTIFY_MASK_INPUT_POSITION_RANGE;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_NOTIFY_MASK_INPUT_STATE"))
#ifdef XA_NOTIFY_MASK_INPUT_STATE
	    return XA_NOTIFY_MASK_INPUT_STATE;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_NOTIFY_MASK_INPUT_STREAM_INFO"))
#ifdef XA_NOTIFY_MASK_INPUT_STREAM_INFO
	    return XA_NOTIFY_MASK_INPUT_STREAM_INFO;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_NOTIFY_MASK_INPUT_TIMECODE"))
#ifdef XA_NOTIFY_MASK_INPUT_TIMECODE
	    return XA_NOTIFY_MASK_INPUT_TIMECODE;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_NOTIFY_MASK_INPUT_TIMECODE_GRANULARITY"))
#ifdef XA_NOTIFY_MASK_INPUT_TIMECODE_GRANULARITY
	    return XA_NOTIFY_MASK_INPUT_TIMECODE_GRANULARITY;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_NOTIFY_MASK_NACK"))
#ifdef XA_NOTIFY_MASK_NACK
	    return XA_NOTIFY_MASK_NACK;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_NOTIFY_MASK_OUTPUT_BALANCE"))
#ifdef XA_NOTIFY_MASK_OUTPUT_BALANCE
	    return XA_NOTIFY_MASK_OUTPUT_BALANCE;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_NOTIFY_MASK_OUTPUT_CAPS"))
#ifdef XA_NOTIFY_MASK_OUTPUT_CAPS
	    return XA_NOTIFY_MASK_OUTPUT_CAPS;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_NOTIFY_MASK_OUTPUT_MASTER_LEVEL"))
#ifdef XA_NOTIFY_MASK_OUTPUT_MASTER_LEVEL
	    return XA_NOTIFY_MASK_OUTPUT_MASTER_LEVEL;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_NOTIFY_MASK_OUTPUT_NAME"))
#ifdef XA_NOTIFY_MASK_OUTPUT_NAME
	    return XA_NOTIFY_MASK_OUTPUT_NAME;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_NOTIFY_MASK_OUTPUT_PCM_LEVEL"))
#ifdef XA_NOTIFY_MASK_OUTPUT_PCM_LEVEL
	    return XA_NOTIFY_MASK_OUTPUT_PCM_LEVEL;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_NOTIFY_MASK_OUTPUT_PORTS"))
#ifdef XA_NOTIFY_MASK_OUTPUT_PORTS
	    return XA_NOTIFY_MASK_OUTPUT_PORTS;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_NOTIFY_MASK_OUTPUT_STATE"))
#ifdef XA_NOTIFY_MASK_OUTPUT_STATE
	    return XA_NOTIFY_MASK_OUTPUT_STATE;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_NOTIFY_MASK_OUTPUT_VOLUME"))
#ifdef XA_NOTIFY_MASK_OUTPUT_VOLUME
	    return XA_NOTIFY_MASK_OUTPUT_VOLUME;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_NOTIFY_MASK_PLAYER_STATE"))
#ifdef XA_NOTIFY_MASK_PLAYER_STATE
	    return XA_NOTIFY_MASK_PLAYER_STATE;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_NOTIFY_MASK_PROGRESS"))
#ifdef XA_NOTIFY_MASK_PROGRESS
	    return XA_NOTIFY_MASK_PROGRESS;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_OUTPUT_VOLUME_IGNORE_FIELD"))
#ifdef XA_OUTPUT_VOLUME_IGNORE_FIELD
	    return XA_OUTPUT_VOLUME_IGNORE_FIELD;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_PLAYER_MODE_OUTPUT_AUTO_CLOSE_ON_EOF"))
#ifdef XA_PLAYER_MODE_OUTPUT_AUTO_CLOSE_ON_EOF
	    return XA_PLAYER_MODE_OUTPUT_AUTO_CLOSE_ON_EOF;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_PLAYER_MODE_OUTPUT_AUTO_CLOSE_ON_PAUSE"))
#ifdef XA_PLAYER_MODE_OUTPUT_AUTO_CLOSE_ON_PAUSE
	    return XA_PLAYER_MODE_OUTPUT_AUTO_CLOSE_ON_PAUSE;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_PLAYER_MODE_OUTPUT_AUTO_CLOSE_ON_STOP"))
#ifdef XA_PLAYER_MODE_OUTPUT_AUTO_CLOSE_ON_STOP
	    return XA_PLAYER_MODE_OUTPUT_AUTO_CLOSE_ON_STOP;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_TIMEOUT_INFINITE"))
#ifdef XA_TIMEOUT_INFINITE
	    return XA_TIMEOUT_INFINITE;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_API_ID_ASYNC"))
#ifdef XA_API_ID_ASYNC
	    return XA_API_ID_ASYNC;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_API_ID_SYNC"))
#ifdef XA_API_ID_SYNC
	    return XA_API_ID_SYNC;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_ACCEPT_FAILED"))
#ifdef XA_ERROR_ACCEPT_FAILED
	    return XA_ERROR_ACCEPT_FAILED;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_BASE_BITSTREAM"))
#ifdef XA_ERROR_BASE_BITSTREAM
	    return XA_ERROR_BASE_BITSTREAM;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_BASE_CONTROL"))
#ifdef XA_ERROR_BASE_CONTROL
	    return XA_ERROR_BASE_CONTROL;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_BASE_DYNLINK"))
#ifdef XA_ERROR_BASE_DYNLINK
	    return XA_ERROR_BASE_DYNLINK;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_BASE_ENVIRONMENT"))
#ifdef XA_ERROR_BASE_ENVIRONMENT
	    return XA_ERROR_BASE_ENVIRONMENT;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_BASE_GENERAL"))
#ifdef XA_ERROR_BASE_GENERAL
	    return XA_ERROR_BASE_GENERAL;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_BASE_IO"))
#ifdef XA_ERROR_BASE_IO
	    return XA_ERROR_BASE_IO;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_BASE_NETWORK"))
#ifdef XA_ERROR_BASE_NETWORK
	    return XA_ERROR_BASE_NETWORK;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_BASE_URL"))
#ifdef XA_ERROR_BASE_URL
	    return XA_ERROR_BASE_URL;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_BIND_FAILED"))
#ifdef XA_ERROR_BIND_FAILED
	    return XA_ERROR_BIND_FAILED;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_CIRQ_FULL"))
#ifdef XA_ERROR_CIRQ_FULL
	    return XA_ERROR_CIRQ_FULL;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_CLOSE_FAILED"))
#ifdef XA_ERROR_CLOSE_FAILED
	    return XA_ERROR_CLOSE_FAILED;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_CONNECTION_REFUSED"))
#ifdef XA_ERROR_CONNECTION_REFUSED
	    return XA_ERROR_CONNECTION_REFUSED;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_CONNECT_FAILED"))
#ifdef XA_ERROR_CONNECT_FAILED
	    return XA_ERROR_CONNECT_FAILED;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_CONNECT_TIMEOUT"))
#ifdef XA_ERROR_CONNECT_TIMEOUT
	    return XA_ERROR_CONNECT_TIMEOUT;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_DEVICE_BUSY"))
#ifdef XA_ERROR_DEVICE_BUSY
	    return XA_ERROR_DEVICE_BUSY;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_DLL_NOT_FOUND"))
#ifdef XA_ERROR_DLL_NOT_FOUND
	    return XA_ERROR_DLL_NOT_FOUND;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_ENVIRONMENT_TYPE_MISMATCH"))
#ifdef XA_ERROR_ENVIRONMENT_TYPE_MISMATCH
	    return XA_ERROR_ENVIRONMENT_TYPE_MISMATCH;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_FORK_FAILED"))
#ifdef XA_ERROR_FORK_FAILED
	    return XA_ERROR_FORK_FAILED;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_FTP_ERROR_REPLY"))
#ifdef XA_ERROR_FTP_ERROR_REPLY
	    return XA_ERROR_FTP_ERROR_REPLY;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_FTP_FAILURE"))
#ifdef XA_ERROR_FTP_FAILURE
	    return XA_ERROR_FTP_FAILURE;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_FTP_INVALID_REPLY"))
#ifdef XA_ERROR_FTP_INVALID_REPLY
	    return XA_ERROR_FTP_INVALID_REPLY;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_HOST_UNKNOWN"))
#ifdef XA_ERROR_HOST_UNKNOWN
	    return XA_ERROR_HOST_UNKNOWN;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_HTTP_ERROR_REPLY"))
#ifdef XA_ERROR_HTTP_ERROR_REPLY
	    return XA_ERROR_HTTP_ERROR_REPLY;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_HTTP_FAILURE"))
#ifdef XA_ERROR_HTTP_FAILURE
	    return XA_ERROR_HTTP_FAILURE;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_HTTP_INVALID_REPLY"))
#ifdef XA_ERROR_HTTP_INVALID_REPLY
	    return XA_ERROR_HTTP_INVALID_REPLY;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_INPUT_EOF"))
#ifdef XA_ERROR_INPUT_EOF
	    return XA_ERROR_INPUT_EOF;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_INTERNAL"))
#ifdef XA_ERROR_INTERNAL
	    return XA_ERROR_INTERNAL;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_INVALID_FRAME"))
#ifdef XA_ERROR_INVALID_FRAME
	    return XA_ERROR_INVALID_FRAME;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_INVALID_MESSAGE"))
#ifdef XA_ERROR_INVALID_MESSAGE
	    return XA_ERROR_INVALID_MESSAGE;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_INVALID_PARAMETERS"))
#ifdef XA_ERROR_INVALID_PARAMETERS
	    return XA_ERROR_INVALID_PARAMETERS;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_IOCTL_FAILED"))
#ifdef XA_ERROR_IOCTL_FAILED
	    return XA_ERROR_IOCTL_FAILED;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_LISTEN_FAILED"))
#ifdef XA_ERROR_LISTEN_FAILED
	    return XA_ERROR_LISTEN_FAILED;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_MODULE_NOT_FOUND"))
#ifdef XA_ERROR_MODULE_NOT_FOUND
	    return XA_ERROR_MODULE_NOT_FOUND;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_NO_DEVICE"))
#ifdef XA_ERROR_NO_DEVICE
	    return XA_ERROR_NO_DEVICE;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_NO_SUCH_DEVICE"))
#ifdef XA_ERROR_NO_SUCH_DEVICE
	    return XA_ERROR_NO_SUCH_DEVICE;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_NO_SUCH_ENVIRONMENT"))
#ifdef XA_ERROR_NO_SUCH_ENVIRONMENT
	    return XA_ERROR_NO_SUCH_ENVIRONMENT;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_NO_SUCH_FILE"))
#ifdef XA_ERROR_NO_SUCH_FILE
	    return XA_ERROR_NO_SUCH_FILE;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_OPEN_FAILED"))
#ifdef XA_ERROR_OPEN_FAILED
	    return XA_ERROR_OPEN_FAILED;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_OUT_OF_MEMORY"))
#ifdef XA_ERROR_OUT_OF_MEMORY
	    return XA_ERROR_OUT_OF_MEMORY;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_PERMISSION_DENIED"))
#ifdef XA_ERROR_PERMISSION_DENIED
	    return XA_ERROR_PERMISSION_DENIED;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_PIPE_CLOSED"))
#ifdef XA_ERROR_PIPE_CLOSED
	    return XA_ERROR_PIPE_CLOSED;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_PIPE_FAILED"))
#ifdef XA_ERROR_PIPE_FAILED
	    return XA_ERROR_PIPE_FAILED;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_PIPE_READ_FAILED"))
#ifdef XA_ERROR_PIPE_READ_FAILED
	    return XA_ERROR_PIPE_READ_FAILED;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_PIPE_WRITE_FAILED"))
#ifdef XA_ERROR_PIPE_WRITE_FAILED
	    return XA_ERROR_PIPE_WRITE_FAILED;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_POST_FAILED"))
#ifdef XA_ERROR_POST_FAILED
	    return XA_ERROR_POST_FAILED;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_READ_FAILED"))
#ifdef XA_ERROR_READ_FAILED
	    return XA_ERROR_READ_FAILED;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_SELECT_FAILED"))
#ifdef XA_ERROR_SELECT_FAILED
	    return XA_ERROR_SELECT_FAILED;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_SOCKET_CLOSED"))
#ifdef XA_ERROR_SOCKET_CLOSED
	    return XA_ERROR_SOCKET_CLOSED;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_SOCKET_FAILED"))
#ifdef XA_ERROR_SOCKET_FAILED
	    return XA_ERROR_SOCKET_FAILED;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_SYMBOL_NOT_FOUND"))
#ifdef XA_ERROR_SYMBOL_NOT_FOUND
	    return XA_ERROR_SYMBOL_NOT_FOUND;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_TIMEOUT"))
#ifdef XA_ERROR_TIMEOUT
	    return XA_ERROR_TIMEOUT;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_UNSUPPORTED_INPUT"))
#ifdef XA_ERROR_UNSUPPORTED_INPUT
	    return XA_ERROR_UNSUPPORTED_INPUT;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_UNSUPPORTED_OUTPUT"))
#ifdef XA_ERROR_UNSUPPORTED_OUTPUT
	    return XA_ERROR_UNSUPPORTED_OUTPUT;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_URL_INVALID_SYNTAX"))
#ifdef XA_ERROR_URL_INVALID_SYNTAX
	    return XA_ERROR_URL_INVALID_SYNTAX;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_URL_UNSUPPORTED_SCHEME"))
#ifdef XA_ERROR_URL_UNSUPPORTED_SCHEME
	    return XA_ERROR_URL_UNSUPPORTED_SCHEME;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_VERSION_EXPIRED"))
#ifdef XA_ERROR_VERSION_EXPIRED
	    return XA_ERROR_VERSION_EXPIRED;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_ERROR_WRITE_FAILED"))
#ifdef XA_ERROR_WRITE_FAILED
	    return XA_ERROR_WRITE_FAILED;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_EXPORT"))
#ifdef XA_EXPORT
	    return XA_EXPORT;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_FAILURE"))
#ifdef XA_FAILURE
	    return XA_FAILURE;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_IMPORT"))
#ifdef XA_IMPORT
	    return XA_IMPORT;
#else
	    goto not_there;
#endif
	if (strEQ(name, "XA_SUCCESS"))
#ifdef XA_SUCCESS
	    return XA_SUCCESS;
#else
	    goto not_there;
#endif
	break;
    case 'Y':
	break;
    case 'Z':
	break;
    }
    errno = EINVAL;
    return 0;

not_there:
    errno = ENOENT;
    return 0;
}

MODULE = MPEG::MP3Play		PACKAGE = MPEG::MP3Play		

PROTOTYPES: ENABLE

double
constant(name,arg)
	char *		name
	int		arg


const char *
xaudio_error_string(code)
	int	code

unsigned int
xaudio_get_api_version(api_id)
	unsigned int	api_id

int
control_procedure_new(control, control_driver_args, procedure, procedure_args, forwarder, forwarder_args)
	void **	control
	void *	control_driver_args
	XA_ControlProcedure	procedure
	void *	procedure_args
	XA_EventForwarderProcedure	forwarder
	void *	forwarder_args

int
control_procedure_delete(control)
	void *	control

int
control_message_to_bytes(message, buffer, max_size)
	const XA_Message *	message
	unsigned char *	buffer
	int	max_size

int
control_message_from_bytes(message, buffer)
	XA_Message *	message
	const unsigned char *	buffer

int
control_message_send(control, code, ...)
	void *	control
	int	code

int
control_event_send(control, code, ...)
	void *	control
	int	code

int
control_message_send_N(control, code)
	void *	control
	int	code

int
control_message_send_P(control, code, ptr1)
	void *	control
	int	code
	const void *	ptr1

int
control_message_send_S(control, code, str1)
	void *	control
	int	code
#	const char *	str1
	char *	str1

int
control_message_send_SS(control, code, str1, str2)
	void *	control
	int	code
	const char *	str1
	const char *	str2

int
control_message_send_SI(control, code, str1, int1)
	void *	control
	int	code
	const char *	str1
	int	int1

int
control_message_send_I(control, code, int1)
	void *	control
	int	code
	int	int1

int
control_message_send_II(control, code, int1, int2)
	void *	control
	int	code
	int	int1
	int	int2

int
control_message_send_III(control, code, int1, int2, int3)
	void *	control
	int	code
	int	int1
	int	int2
	int	int3

int
control_message_send_IIII(control, code, int1, int2, int3, int4)
	void *	control
	int	code
	int	int1
	int	int2
	int	int3
	int	int4

int
control_message_send_IPI(control, code, int1, ptr1, int2)
	void *	control
	int	code
	int	int1
	const void *	ptr1
	int	int2

int
control_message_post_to_command_queue(control, message)
	void *	control
	const XA_Message *	message

int
control_message_post_to_event_queue(control, message)
	void *	control
	const XA_Message *	message

int
control_message_get(control, message)
	void *	control
	XA_Message *	message

int
control_message_wait(control, message, timeout)
	void *	control
	XA_Message *	message
	int	timeout

void
control_message_print(message)
	const XA_Message *	message

void
control_message_sprint(string, message)
	char *	string
	const XA_Message *	message

# end of h2xs generated stuff

void *
new_player()
CODE:
	void * player;
	if ( XA_SUCCESS != player_new (&player, NULL) ) {
#	  printf ("error creating player\n");
	  player = NULL;
	} else {
#	  printf ("player created\n");
	}
	
	RETVAL = player;
OUTPUT:
RETVAL

void
destroy_player(player)
	void* player
CODE:
	if ( player != NULL) {
		player_delete (player);
#		printf ("player destroyed\n");
	}
