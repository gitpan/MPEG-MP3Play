/*
 * ATTENTION: This file was genenerated by gen_constant, part
 *            of the MPEG::MP3Play distribution.
 *            Do not edit this file, edit gen_constant instead.
 *
 *            ANY CHANGES MADE HERE WILL BE LOST!
 */

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
    switch (name[strlen(name)-1]) {

	case 'A':
		if (strEQ(name, "XA_MSG_NOTIFY_PRIVATE_DATA"))
			return XA_MSG_NOTIFY_PRIVATE_DATA;
		if (strEQ(name, "XA_NOTIFY_MASK_PRIVATE_DATA"))
#ifdef XA_NOTIFY_MASK_PRIVATE_DATA
			return XA_NOTIFY_MASK_PRIVATE_DATA;
#else
			goto not_there;
#endif

		break;

	case 'C':
		if (strEQ(name, "XA_MSG_COMMAND_SYNC"))
			return XA_MSG_COMMAND_SYNC;
		if (strEQ(name, "XA_ERROR_BASE_CODEC"))
#ifdef XA_ERROR_BASE_CODEC
			return XA_ERROR_BASE_CODEC;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_NO_CODEC"))
#ifdef XA_ERROR_NO_CODEC
			return XA_ERROR_NO_CODEC;
#else
			goto not_there;
#endif

		break;

	case 'D':
		if (strEQ(name, "XA_MSG_NOTIFY_EXITED"))
			return XA_MSG_NOTIFY_EXITED;
		if (strEQ(name, "XA_PLAYER_STATE_STOPPED"))
			return XA_PLAYER_STATE_STOPPED;
		if (strEQ(name, "XA_PLAYER_STATE_PAUSED"))
			return XA_PLAYER_STATE_PAUSED;
		if (strEQ(name, "XA_INPUT_STATE_CLOSED"))
			return XA_INPUT_STATE_CLOSED;
		if (strEQ(name, "XA_OUTPUT_STATE_CLOSED"))
			return XA_OUTPUT_STATE_CLOSED;
		if (strEQ(name, "XA_FEEDBACK_HANDLER_STATE_STARTED"))
			return XA_FEEDBACK_HANDLER_STATE_STARTED;
		if (strEQ(name, "XA_FEEDBACK_HANDLER_STATE_STOPPED"))
			return XA_FEEDBACK_HANDLER_STATE_STOPPED;
		if (strEQ(name, "XA_OUTPUT_VOLUME_IGNORE_FIELD"))
#ifdef XA_OUTPUT_VOLUME_IGNORE_FIELD
			return XA_OUTPUT_VOLUME_IGNORE_FIELD;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_CMSEND"))
#ifdef XA_CMSEND
			return XA_CMSEND;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_VERSION_EXPIRED"))
#ifdef XA_ERROR_VERSION_EXPIRED
			return XA_ERROR_VERSION_EXPIRED;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_CONNECT_FAILED"))
#ifdef XA_ERROR_CONNECT_FAILED
			return XA_ERROR_CONNECT_FAILED;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_CONNECTION_REFUSED"))
#ifdef XA_ERROR_CONNECTION_REFUSED
			return XA_ERROR_CONNECTION_REFUSED;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_ACCEPT_FAILED"))
#ifdef XA_ERROR_ACCEPT_FAILED
			return XA_ERROR_ACCEPT_FAILED;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_LISTEN_FAILED"))
#ifdef XA_ERROR_LISTEN_FAILED
			return XA_ERROR_LISTEN_FAILED;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_SOCKET_FAILED"))
#ifdef XA_ERROR_SOCKET_FAILED
			return XA_ERROR_SOCKET_FAILED;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_SOCKET_CLOSED"))
#ifdef XA_ERROR_SOCKET_CLOSED
			return XA_ERROR_SOCKET_CLOSED;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_BIND_FAILED"))
#ifdef XA_ERROR_BIND_FAILED
			return XA_ERROR_BIND_FAILED;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_PIPE_FAILED"))
#ifdef XA_ERROR_PIPE_FAILED
			return XA_ERROR_PIPE_FAILED;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_FORK_FAILED"))
#ifdef XA_ERROR_FORK_FAILED
			return XA_ERROR_FORK_FAILED;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_SELECT_FAILED"))
#ifdef XA_ERROR_SELECT_FAILED
			return XA_ERROR_SELECT_FAILED;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_PIPE_CLOSED"))
#ifdef XA_ERROR_PIPE_CLOSED
			return XA_ERROR_PIPE_CLOSED;
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
		if (strEQ(name, "XA_ERROR_OPEN_FAILED"))
#ifdef XA_ERROR_OPEN_FAILED
			return XA_ERROR_OPEN_FAILED;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_CLOSE_FAILED"))
#ifdef XA_ERROR_CLOSE_FAILED
			return XA_ERROR_CLOSE_FAILED;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_READ_FAILED"))
#ifdef XA_ERROR_READ_FAILED
			return XA_ERROR_READ_FAILED;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_WRITE_FAILED"))
#ifdef XA_ERROR_WRITE_FAILED
			return XA_ERROR_WRITE_FAILED;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_PERMISSION_DENIED"))
#ifdef XA_ERROR_PERMISSION_DENIED
			return XA_ERROR_PERMISSION_DENIED;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_IOCTL_FAILED"))
#ifdef XA_ERROR_IOCTL_FAILED
			return XA_ERROR_IOCTL_FAILED;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_MODULE_NOT_FOUND"))
#ifdef XA_ERROR_MODULE_NOT_FOUND
			return XA_ERROR_MODULE_NOT_FOUND;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_DLL_NOT_FOUND"))
#ifdef XA_ERROR_DLL_NOT_FOUND
			return XA_ERROR_DLL_NOT_FOUND;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_SYMBOL_NOT_FOUND"))
#ifdef XA_ERROR_SYMBOL_NOT_FOUND
			return XA_ERROR_SYMBOL_NOT_FOUND;
#else
			goto not_there;
#endif

		break;

	case 'E':
		if (strEQ(name, "XA_MSG_COMMAND_PAUSE"))
			return XA_MSG_COMMAND_PAUSE;
		if (strEQ(name, "XA_MSG_COMMAND_INPUT_CLOSE"))
			return XA_MSG_COMMAND_INPUT_CLOSE;
		if (strEQ(name, "XA_MSG_COMMAND_INPUT_SEND_MESSAGE"))
			return XA_MSG_COMMAND_INPUT_SEND_MESSAGE;
		if (strEQ(name, "XA_MSG_COMMAND_OUTPUT_CLOSE"))
			return XA_MSG_COMMAND_OUTPUT_CLOSE;
		if (strEQ(name, "XA_MSG_COMMAND_OUTPUT_SEND_MESSAGE"))
			return XA_MSG_COMMAND_OUTPUT_SEND_MESSAGE;
		if (strEQ(name, "XA_MSG_COMMAND_OUTPUT_MUTE"))
			return XA_MSG_COMMAND_OUTPUT_MUTE;
		if (strEQ(name, "XA_MSG_COMMAND_OUTPUT_UNMUTE"))
			return XA_MSG_COMMAND_OUTPUT_UNMUTE;
		if (strEQ(name, "XA_MSG_SET_PLAYER_MODE"))
			return XA_MSG_SET_PLAYER_MODE;
		if (strEQ(name, "XA_MSG_GET_PLAYER_MODE"))
			return XA_MSG_GET_PLAYER_MODE;
		if (strEQ(name, "XA_MSG_SET_INPUT_NAME"))
			return XA_MSG_SET_INPUT_NAME;
		if (strEQ(name, "XA_MSG_GET_INPUT_NAME"))
			return XA_MSG_GET_INPUT_NAME;
		if (strEQ(name, "XA_MSG_SET_INPUT_MODULE"))
			return XA_MSG_SET_INPUT_MODULE;
		if (strEQ(name, "XA_MSG_GET_INPUT_MODULE"))
			return XA_MSG_GET_INPUT_MODULE;
		if (strEQ(name, "XA_MSG_SET_INPUT_POSITION_RANGE"))
			return XA_MSG_SET_INPUT_POSITION_RANGE;
		if (strEQ(name, "XA_MSG_GET_INPUT_POSITION_RANGE"))
			return XA_MSG_GET_INPUT_POSITION_RANGE;
		if (strEQ(name, "XA_MSG_SET_OUTPUT_NAME"))
			return XA_MSG_SET_OUTPUT_NAME;
		if (strEQ(name, "XA_MSG_GET_OUTPUT_NAME"))
			return XA_MSG_GET_OUTPUT_NAME;
		if (strEQ(name, "XA_MSG_SET_OUTPUT_MODULE"))
			return XA_MSG_SET_OUTPUT_MODULE;
		if (strEQ(name, "XA_MSG_GET_OUTPUT_MODULE"))
			return XA_MSG_GET_OUTPUT_MODULE;
		if (strEQ(name, "XA_MSG_SET_OUTPUT_POSITION_RANGE"))
			return XA_MSG_SET_OUTPUT_POSITION_RANGE;
		if (strEQ(name, "XA_MSG_GET_OUTPUT_POSITION_RANGE"))
			return XA_MSG_GET_OUTPUT_POSITION_RANGE;
		if (strEQ(name, "XA_MSG_SET_OUTPUT_VOLUME"))
			return XA_MSG_SET_OUTPUT_VOLUME;
		if (strEQ(name, "XA_MSG_GET_OUTPUT_VOLUME"))
			return XA_MSG_GET_OUTPUT_VOLUME;
		if (strEQ(name, "XA_MSG_NOTIFY_PLAYER_STATE"))
			return XA_MSG_NOTIFY_PLAYER_STATE;
		if (strEQ(name, "XA_MSG_NOTIFY_PLAYER_MODE"))
			return XA_MSG_NOTIFY_PLAYER_MODE;
		if (strEQ(name, "XA_MSG_NOTIFY_INPUT_STATE"))
			return XA_MSG_NOTIFY_INPUT_STATE;
		if (strEQ(name, "XA_MSG_NOTIFY_INPUT_NAME"))
			return XA_MSG_NOTIFY_INPUT_NAME;
		if (strEQ(name, "XA_MSG_NOTIFY_INPUT_POSITION_RANGE"))
			return XA_MSG_NOTIFY_INPUT_POSITION_RANGE;
		if (strEQ(name, "XA_MSG_NOTIFY_INPUT_TIMECODE"))
			return XA_MSG_NOTIFY_INPUT_TIMECODE;
		if (strEQ(name, "XA_MSG_NOTIFY_INPUT_MODULE"))
			return XA_MSG_NOTIFY_INPUT_MODULE;
		if (strEQ(name, "XA_MSG_NOTIFY_OUTPUT_STATE"))
			return XA_MSG_NOTIFY_OUTPUT_STATE;
		if (strEQ(name, "XA_MSG_NOTIFY_OUTPUT_NAME"))
			return XA_MSG_NOTIFY_OUTPUT_NAME;
		if (strEQ(name, "XA_MSG_NOTIFY_OUTPUT_POSITION_RANGE"))
			return XA_MSG_NOTIFY_OUTPUT_POSITION_RANGE;
		if (strEQ(name, "XA_MSG_NOTIFY_OUTPUT_TIMECODE"))
			return XA_MSG_NOTIFY_OUTPUT_TIMECODE;
		if (strEQ(name, "XA_MSG_NOTIFY_OUTPUT_VOLUME"))
			return XA_MSG_NOTIFY_OUTPUT_VOLUME;
		if (strEQ(name, "XA_MSG_NOTIFY_OUTPUT_BALANCE"))
			return XA_MSG_NOTIFY_OUTPUT_BALANCE;
		if (strEQ(name, "XA_MSG_NOTIFY_OUTPUT_MODULE"))
			return XA_MSG_NOTIFY_OUTPUT_MODULE;
		if (strEQ(name, "XA_MSG_NOTIFY_STREAM_MIME_TYPE"))
			return XA_MSG_NOTIFY_STREAM_MIME_TYPE;
		if (strEQ(name, "XA_MSG_COMMAND_FEEDBACK_HANDLER_PAUSE"))
			return XA_MSG_COMMAND_FEEDBACK_HANDLER_PAUSE;
		if (strEQ(name, "XA_MSG_COMMAND_FEEDBACK_HANDLER_SEND_MESSAGE"))
			return XA_MSG_COMMAND_FEEDBACK_HANDLER_SEND_MESSAGE;
		if (strEQ(name, "XA_MSG_SET_FEEDBACK_AUDIO_EVENT_RATE"))
			return XA_MSG_SET_FEEDBACK_AUDIO_EVENT_RATE;
		if (strEQ(name, "XA_MSG_GET_FEEDBACK_AUDIO_EVENT_RATE"))
			return XA_MSG_GET_FEEDBACK_AUDIO_EVENT_RATE;
		if (strEQ(name, "XA_MSG_SET_FEEDBACK_HANDLER_NAME"))
			return XA_MSG_SET_FEEDBACK_HANDLER_NAME;
		if (strEQ(name, "XA_MSG_GET_FEEDBACK_HANDLER_NAME"))
			return XA_MSG_GET_FEEDBACK_HANDLER_NAME;
		if (strEQ(name, "XA_MSG_SET_FEEDBACK_HANDLER_MODULE"))
			return XA_MSG_SET_FEEDBACK_HANDLER_MODULE;
		if (strEQ(name, "XA_MSG_GET_FEEDBACK_HANDLER_MODULE"))
			return XA_MSG_GET_FEEDBACK_HANDLER_MODULE;
		if (strEQ(name, "XA_MSG_NOTIFY_FEEDBACK_AUDIO_EVENT_RATE"))
			return XA_MSG_NOTIFY_FEEDBACK_AUDIO_EVENT_RATE;
		if (strEQ(name, "XA_MSG_NOTIFY_FEEDBACK_HANDLER_STATE"))
			return XA_MSG_NOTIFY_FEEDBACK_HANDLER_STATE;
		if (strEQ(name, "XA_MSG_NOTIFY_FEEDBACK_HANDLER_MODULE"))
			return XA_MSG_NOTIFY_FEEDBACK_HANDLER_MODULE;
		if (strEQ(name, "XA_MSG_NOTIFY_FEEDBACK_HANDLER_NAME"))
			return XA_MSG_NOTIFY_FEEDBACK_HANDLER_NAME;
		if (strEQ(name, "XA_TIMEOUT_INFINITE"))
#ifdef XA_TIMEOUT_INFINITE
			return XA_TIMEOUT_INFINITE;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_PLAYER_MODE_OUTPUT_AUTO_CLOSE_ON_PAUSE"))
#ifdef XA_PLAYER_MODE_OUTPUT_AUTO_CLOSE_ON_PAUSE
			return XA_PLAYER_MODE_OUTPUT_AUTO_CLOSE_ON_PAUSE;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_NOTIFY_MASK_PLAYER_STATE"))
#ifdef XA_NOTIFY_MASK_PLAYER_STATE
			return XA_NOTIFY_MASK_PLAYER_STATE;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_NOTIFY_MASK_INPUT_STATE"))
#ifdef XA_NOTIFY_MASK_INPUT_STATE
			return XA_NOTIFY_MASK_INPUT_STATE;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_NOTIFY_MASK_INPUT_NAME"))
#ifdef XA_NOTIFY_MASK_INPUT_NAME
			return XA_NOTIFY_MASK_INPUT_NAME;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_NOTIFY_MASK_INPUT_TIMECODE"))
#ifdef XA_NOTIFY_MASK_INPUT_TIMECODE
			return XA_NOTIFY_MASK_INPUT_TIMECODE;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_NOTIFY_MASK_OUTPUT_STATE"))
#ifdef XA_NOTIFY_MASK_OUTPUT_STATE
			return XA_NOTIFY_MASK_OUTPUT_STATE;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_NOTIFY_MASK_OUTPUT_NAME"))
#ifdef XA_NOTIFY_MASK_OUTPUT_NAME
			return XA_NOTIFY_MASK_OUTPUT_NAME;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_NOTIFY_MASK_OUTPUT_TIMECODE"))
#ifdef XA_NOTIFY_MASK_OUTPUT_TIMECODE
			return XA_NOTIFY_MASK_OUTPUT_TIMECODE;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_NOTIFY_MASK_OUTPUT_VOLUME"))
#ifdef XA_NOTIFY_MASK_OUTPUT_VOLUME
			return XA_NOTIFY_MASK_OUTPUT_VOLUME;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_NOTIFY_MASK_OUTPUT_BALANCE"))
#ifdef XA_NOTIFY_MASK_OUTPUT_BALANCE
			return XA_NOTIFY_MASK_OUTPUT_BALANCE;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_NOTIFY_MASK_STREAM_MIME_TYPE"))
#ifdef XA_NOTIFY_MASK_STREAM_MIME_TYPE
			return XA_NOTIFY_MASK_STREAM_MIME_TYPE;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_FAILURE"))
#ifdef XA_FAILURE
			return XA_FAILURE;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_HTTP_FAILURE"))
#ifdef XA_ERROR_HTTP_FAILURE
			return XA_ERROR_HTTP_FAILURE;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_FTP_FAILURE"))
#ifdef XA_ERROR_FTP_FAILURE
			return XA_ERROR_FTP_FAILURE;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_INVALID_MESSAGE"))
#ifdef XA_ERROR_INVALID_MESSAGE
			return XA_ERROR_INVALID_MESSAGE;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_URL_UNSUPPORTED_SCHEME"))
#ifdef XA_ERROR_URL_UNSUPPORTED_SCHEME
			return XA_ERROR_URL_UNSUPPORTED_SCHEME;
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
		if (strEQ(name, "XA_ERROR_NO_SUCH_FILE"))
#ifdef XA_ERROR_NO_SUCH_FILE
			return XA_ERROR_NO_SUCH_FILE;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_INVALID_FRAME"))
#ifdef XA_ERROR_INVALID_FRAME
			return XA_ERROR_INVALID_FRAME;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_NO_SUCH_INTERFACE"))
#ifdef XA_ERROR_NO_SUCH_INTERFACE
			return XA_ERROR_NO_SUCH_INTERFACE;
#else
			goto not_there;
#endif

		break;
	case 'F' :
		if (strEQ(name, "XA_PLAYER_STATE_EOF"))
			return XA_PLAYER_STATE_EOS;
		break;
	case 'G':
		if (strEQ(name, "XA_MSG_COMMAND_PING"))
			return XA_MSG_COMMAND_PING;
		if (strEQ(name, "XA_MSG_SET_PLAYER_ENVIRONMENT_STRING"))
			return XA_MSG_SET_PLAYER_ENVIRONMENT_STRING;
		if (strEQ(name, "XA_MSG_GET_PLAYER_ENVIRONMENT_STRING"))
			return XA_MSG_GET_PLAYER_ENVIRONMENT_STRING;
		if (strEQ(name, "XA_MSG_NOTIFY_PONG"))
			return XA_MSG_NOTIFY_PONG;
		if (strEQ(name, "XA_MSG_NOTIFY_PLAYER_ENVIRONMENT_STRING"))
			return XA_MSG_NOTIFY_PLAYER_ENVIRONMENT_STRING;
		if (strEQ(name, "XA_MSG_NOTIFY_DEBUG"))
			return XA_MSG_NOTIFY_DEBUG;
		if (strEQ(name, "XA_MSG_SET_FEEDBACK_HANDLER_ENVIRONMENT_STRING"))
			return XA_MSG_SET_FEEDBACK_HANDLER_ENVIRONMENT_STRING;
		if (strEQ(name, "XA_MSG_GET_FEEDBACK_HANDLER_ENVIRONMENT_STRING"))
			return XA_MSG_GET_FEEDBACK_HANDLER_ENVIRONMENT_STRING;
		if (strEQ(name, "XA_MSG_NOTIFY_FEEDBACK_HANDLER_ENVIRONMENT_STRING"))
			return XA_MSG_NOTIFY_FEEDBACK_HANDLER_ENVIRONMENT_STRING;
		if (strEQ(name, "XA_PLAYER_STATE_PLAYING"))
			return XA_PLAYER_STATE_PLAYING;
		if (strEQ(name, "XA_NOTIFY_MASK_DEBUG"))
#ifdef XA_NOTIFY_MASK_DEBUG
			return XA_NOTIFY_MASK_DEBUG;
#else
			goto not_there;
#endif

		break;

	case 'H':
		if (strEQ(name, "XA_MSG_COMMAND_FEEDBACK_HANDLER_FLUSH"))
			return XA_MSG_COMMAND_FEEDBACK_HANDLER_FLUSH;
		if (strEQ(name, "XA_CONTROL_PRIORITY_HIGH"))
#ifdef XA_CONTROL_PRIORITY_HIGH
			return XA_CONTROL_PRIORITY_HIGH;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_VERSION_MISMATCH"))
#ifdef XA_ERROR_VERSION_MISMATCH
			return XA_ERROR_VERSION_MISMATCH;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_ENVIRONMENT_TYPE_MISMATCH"))
#ifdef XA_ERROR_ENVIRONMENT_TYPE_MISMATCH
			return XA_ERROR_ENVIRONMENT_TYPE_MISMATCH;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_PROPERTY_TYPE_MISMATCH"))
#ifdef XA_ERROR_PROPERTY_TYPE_MISMATCH
			return XA_ERROR_PROPERTY_TYPE_MISMATCH;
#else
			goto not_there;
#endif

		break;

	case 'I':
		if (strEQ(name, "XA_VERSION_ID_SYNC_API"))
#ifdef XA_VERSION_ID_SYNC_API
			return XA_VERSION_ID_SYNC_API;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_VERSION_ID_ASYNC_API"))
#ifdef XA_VERSION_ID_ASYNC_API
			return XA_VERSION_ID_ASYNC_API;
#else
			goto not_there;
#endif

		break;

	case 'K':
		if (strEQ(name, "XA_MSG_COMMAND_SEEK"))
			return XA_MSG_COMMAND_SEEK;
		if (strEQ(name, "XA_MSG_SET_NOTIFICATION_MASK"))
			return XA_MSG_SET_NOTIFICATION_MASK;
		if (strEQ(name, "XA_MSG_GET_NOTIFICATION_MASK"))
			return XA_MSG_GET_NOTIFICATION_MASK;
		if (strEQ(name, "XA_MSG_NOTIFY_ACK"))
			return XA_MSG_NOTIFY_ACK;
		if (strEQ(name, "XA_MSG_NOTIFY_NACK"))
			return XA_MSG_NOTIFY_NACK;
		if (strEQ(name, "XA_MSG_NOTIFY_NOTIFICATION_MASK"))
			return XA_MSG_NOTIFY_NOTIFICATION_MASK;
		if (strEQ(name, "XA_NOTIFY_MASK_ACK"))
#ifdef XA_NOTIFY_MASK_ACK
			return XA_NOTIFY_MASK_ACK;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_NOTIFY_MASK_NACK"))
#ifdef XA_NOTIFY_MASK_NACK
			return XA_NOTIFY_MASK_NACK;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_VERSION_ID_MAJOR_MINOR_MASK"))
#ifdef XA_VERSION_ID_MAJOR_MINOR_MASK
			return XA_VERSION_ID_MAJOR_MINOR_MASK;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_BASE_NETWORK"))
#ifdef XA_ERROR_BASE_NETWORK
			return XA_ERROR_BASE_NETWORK;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_BASE_DYNLINK"))
#ifdef XA_ERROR_BASE_DYNLINK
			return XA_ERROR_BASE_DYNLINK;
#else
			goto not_there;
#endif

		break;

	case 'L':
		if (strEQ(name, "XA_MSG_SET_DEBUG_LEVEL"))
			return XA_MSG_SET_DEBUG_LEVEL;
		if (strEQ(name, "XA_MSG_GET_DEBUG_LEVEL"))
			return XA_MSG_GET_DEBUG_LEVEL;
		if (strEQ(name, "XA_MSG_NOTIFY_OUTPUT_PCM_LEVEL"))
			return XA_MSG_NOTIFY_OUTPUT_PCM_LEVEL;
		if (strEQ(name, "XA_MSG_NOTIFY_OUTPUT_MASTER_LEVEL"))
			return XA_MSG_NOTIFY_OUTPUT_MASTER_LEVEL;
		if (strEQ(name, "XA_MSG_NOTIFY_DEBUG_LEVEL"))
			return XA_MSG_NOTIFY_DEBUG_LEVEL;
		if (strEQ(name, "XA_CONTROL_PRIORITY_NORMAL"))
#ifdef XA_CONTROL_PRIORITY_NORMAL
			return XA_CONTROL_PRIORITY_NORMAL;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_NOTIFY_MASK_OUTPUT_PCM_LEVEL"))
#ifdef XA_NOTIFY_MASK_OUTPUT_PCM_LEVEL
			return XA_NOTIFY_MASK_OUTPUT_PCM_LEVEL;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_NOTIFY_MASK_OUTPUT_MASTER_LEVEL"))
#ifdef XA_NOTIFY_MASK_OUTPUT_MASTER_LEVEL
			return XA_NOTIFY_MASK_OUTPUT_MASTER_LEVEL;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_BASE_GENERAL"))
#ifdef XA_ERROR_BASE_GENERAL
			return XA_ERROR_BASE_GENERAL;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_INTERNAL"))
#ifdef XA_ERROR_INTERNAL
			return XA_ERROR_INTERNAL;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_BASE_CONTROL"))
#ifdef XA_ERROR_BASE_CONTROL
			return XA_ERROR_BASE_CONTROL;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_CIRQ_FULL"))
#ifdef XA_ERROR_CIRQ_FULL
			return XA_ERROR_CIRQ_FULL;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_BASE_URL"))
#ifdef XA_ERROR_BASE_URL
			return XA_ERROR_BASE_URL;
#else
			goto not_there;
#endif

		break;

	case 'M':
		if (strEQ(name, "XA_ERROR_BASE_BITSTREAM"))
#ifdef XA_ERROR_BASE_BITSTREAM
			return XA_ERROR_BASE_BITSTREAM;
#else
			goto not_there;
#endif

		break;

	case 'N':
		if (strEQ(name, "XA_MSG_UNKNOWN"))
			return XA_MSG_UNKNOWN;
		if (strEQ(name, "XA_MSG_COMMAND_INPUT_OPEN"))
			return XA_MSG_COMMAND_INPUT_OPEN;
		if (strEQ(name, "XA_MSG_COMMAND_OUTPUT_OPEN"))
			return XA_MSG_COMMAND_OUTPUT_OPEN;
		if (strEQ(name, "XA_MSG_COMMAND_OUTPUT_DRAIN"))
			return XA_MSG_COMMAND_OUTPUT_DRAIN;
		if (strEQ(name, "XA_MSG_NOTIFY_INPUT_POSITION"))
			return XA_MSG_NOTIFY_INPUT_POSITION;
		if (strEQ(name, "XA_MSG_NOTIFY_OUTPUT_POSITION"))
			return XA_MSG_NOTIFY_OUTPUT_POSITION;
		if (strEQ(name, "XA_MSG_NOTIFY_STREAM_DURATION"))
			return XA_MSG_NOTIFY_STREAM_DURATION;
		if (strEQ(name, "XA_INPUT_STATE_OPEN"))
			return XA_INPUT_STATE_OPEN;
		if (strEQ(name, "XA_OUTPUT_STATE_OPEN"))
			return XA_OUTPUT_STATE_OPEN;
		if (strEQ(name, "XA_ASYNC_API_REVISION"))
#ifdef XA_ASYNC_API_REVISION
			return XA_ASYNC_API_REVISION;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ASYNC_API_VERSION"))
#ifdef XA_ASYNC_API_VERSION
			return XA_ASYNC_API_VERSION;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_NOTIFY_MASK_INPUT_POSITION"))
#ifdef XA_NOTIFY_MASK_INPUT_POSITION
			return XA_NOTIFY_MASK_INPUT_POSITION;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_NOTIFY_MASK_OUTPUT_POSITION"))
#ifdef XA_NOTIFY_MASK_OUTPUT_POSITION
			return XA_NOTIFY_MASK_OUTPUT_POSITION;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_NOTIFY_MASK_STREAM_DURATION"))
#ifdef XA_NOTIFY_MASK_STREAM_DURATION
			return XA_NOTIFY_MASK_STREAM_DURATION;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_VERSION_ID_IMPLEMENTATION"))
#ifdef XA_VERSION_ID_IMPLEMENTATION
			return XA_VERSION_ID_IMPLEMENTATION;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_IMPLEMENTATION_REVISION"))
#ifdef XA_IMPLEMENTATION_REVISION
			return XA_IMPLEMENTATION_REVISION;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_IMPLEMENTATION_VERSION"))
#ifdef XA_IMPLEMENTATION_VERSION
			return XA_IMPLEMENTATION_VERSION;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_HOST_UNKNOWN"))
#ifdef XA_ERROR_HOST_UNKNOWN
			return XA_ERROR_HOST_UNKNOWN;
#else
			goto not_there;
#endif

		break;

	case 'O':
		if (strEQ(name, "XA_MSG_NOTIFY_INPUT_MODULE_INFO"))
			return XA_MSG_NOTIFY_INPUT_MODULE_INFO;
		if (strEQ(name, "XA_MSG_NOTIFY_INPUT_DEVICE_INFO"))
			return XA_MSG_NOTIFY_INPUT_DEVICE_INFO;
		if (strEQ(name, "XA_MSG_NOTIFY_INPUT_FILTER_INFO"))
			return XA_MSG_NOTIFY_INPUT_FILTER_INFO;
		if (strEQ(name, "XA_MSG_NOTIFY_OUTPUT_MODULE_INFO"))
			return XA_MSG_NOTIFY_OUTPUT_MODULE_INFO;
		if (strEQ(name, "XA_MSG_NOTIFY_OUTPUT_DEVICE_INFO"))
			return XA_MSG_NOTIFY_OUTPUT_DEVICE_INFO;
		if (strEQ(name, "XA_MSG_NOTIFY_OUTPUT_FILTER_INFO"))
			return XA_MSG_NOTIFY_OUTPUT_FILTER_INFO;
		if (strEQ(name, "XA_MSG_NOTIFY_FEEDBACK_HANDLER_MODULE_INFO"))
			return XA_MSG_NOTIFY_FEEDBACK_HANDLER_MODULE_INFO;
		if (strEQ(name, "XA_MSG_NOTIFY_FEEDBACK_HANDLER_INFO"))
			return XA_MSG_NOTIFY_FEEDBACK_HANDLER_INFO;
		if (strEQ(name, "XA_OUTPUT_CHANNELS_STEREO"))
			return XA_OUTPUT_CHANNELS_STEREO;
		if (strEQ(name, "XA_ERROR_BASE_IO"))
#ifdef XA_ERROR_BASE_IO
			return XA_ERROR_BASE_IO;
#else
			goto not_there;
#endif

		break;

	case 'P':
		if (strEQ(name, "XA_MSG_COMMAND_STOP"))
			return XA_MSG_COMMAND_STOP;
		if (strEQ(name, "XA_MSG_COMMAND_FEEDBACK_HANDLER_STOP"))
			return XA_MSG_COMMAND_FEEDBACK_HANDLER_STOP;
		if (strEQ(name, "XA_PLAYER_MODE_OUTPUT_AUTO_CLOSE_ON_STOP"))
#ifdef XA_PLAYER_MODE_OUTPUT_AUTO_CLOSE_ON_STOP
			return XA_PLAYER_MODE_OUTPUT_AUTO_CLOSE_ON_STOP;
#else
			goto not_there;
#endif

		break;

	case 'R':
		if (strEQ(name, "XA_MSG_COMMAND_INPUT_ADD_FILTER"))
			return XA_MSG_COMMAND_INPUT_ADD_FILTER;
		if (strEQ(name, "XA_MSG_COMMAND_INPUT_REMOVE_FILTER"))
			return XA_MSG_COMMAND_INPUT_REMOVE_FILTER;
		if (strEQ(name, "XA_MSG_COMMAND_INPUT_MODULE_REGISTER"))
			return XA_MSG_COMMAND_INPUT_MODULE_REGISTER;
		if (strEQ(name, "XA_MSG_COMMAND_OUTPUT_ADD_FILTER"))
			return XA_MSG_COMMAND_OUTPUT_ADD_FILTER;
		if (strEQ(name, "XA_MSG_COMMAND_OUTPUT_REMOVE_FILTER"))
			return XA_MSG_COMMAND_OUTPUT_REMOVE_FILTER;
		if (strEQ(name, "XA_MSG_COMMAND_OUTPUT_MODULE_REGISTER"))
			return XA_MSG_COMMAND_OUTPUT_MODULE_REGISTER;
		if (strEQ(name, "XA_MSG_COMMAND_CODEC_MODULE_REGISTER"))
			return XA_MSG_COMMAND_CODEC_MODULE_REGISTER;
		if (strEQ(name, "XA_MSG_SET_PLAYER_ENVIRONMENT_INTEGER"))
			return XA_MSG_SET_PLAYER_ENVIRONMENT_INTEGER;
		if (strEQ(name, "XA_MSG_GET_PLAYER_ENVIRONMENT_INTEGER"))
			return XA_MSG_GET_PLAYER_ENVIRONMENT_INTEGER;
		if (strEQ(name, "XA_MSG_SET_CODEC_EQUALIZER"))
			return XA_MSG_SET_CODEC_EQUALIZER;
		if (strEQ(name, "XA_MSG_GET_CODEC_EQUALIZER"))
			return XA_MSG_GET_CODEC_EQUALIZER;
		if (strEQ(name, "XA_MSG_NOTIFY_PLAYER_ENVIRONMENT_INTEGER"))
			return XA_MSG_NOTIFY_PLAYER_ENVIRONMENT_INTEGER;
		if (strEQ(name, "XA_MSG_NOTIFY_CODEC_EQUALIZER"))
			return XA_MSG_NOTIFY_CODEC_EQUALIZER;
		if (strEQ(name, "XA_MSG_NOTIFY_ERROR"))
			return XA_MSG_NOTIFY_ERROR;
		if (strEQ(name, "XA_MSG_COMMAND_FEEDBACK_HANDLER_MODULE_REGISTER"))
			return XA_MSG_COMMAND_FEEDBACK_HANDLER_MODULE_REGISTER;
		if (strEQ(name, "XA_MSG_SET_FEEDBACK_HANDLER_ENVIRONMENT_INTEGER"))
			return XA_MSG_SET_FEEDBACK_HANDLER_ENVIRONMENT_INTEGER;
		if (strEQ(name, "XA_MSG_GET_FEEDBACK_HANDLER_ENVIRONMENT_INTEGER"))
			return XA_MSG_GET_FEEDBACK_HANDLER_ENVIRONMENT_INTEGER;
		if (strEQ(name, "XA_MSG_NOTIFY_FEEDBACK_HANDLER_ENVIRONMENT_INTEGER"))
			return XA_MSG_NOTIFY_FEEDBACK_HANDLER_ENVIRONMENT_INTEGER;
		if (strEQ(name, "XA_ASYNC_API_MAJOR"))
#ifdef XA_ASYNC_API_MAJOR
			return XA_ASYNC_API_MAJOR;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ASYNC_API_MINOR"))
#ifdef XA_ASYNC_API_MINOR
			return XA_ASYNC_API_MINOR;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_NOTIFY_MASK_ERROR"))
#ifdef XA_NOTIFY_MASK_ERROR
			return XA_NOTIFY_MASK_ERROR;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_IMPLEMENTATION_MAJOR"))
#ifdef XA_IMPLEMENTATION_MAJOR
			return XA_IMPLEMENTATION_MAJOR;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_IMPLEMENTATION_MINOR"))
#ifdef XA_IMPLEMENTATION_MINOR
			return XA_IMPLEMENTATION_MINOR;
#else
			goto not_there;
#endif

		break;

	case 'S':
		if (strEQ(name, "XA_MSG_SET_OUTPUT_CHANNELS"))
			return XA_MSG_SET_OUTPUT_CHANNELS;
		if (strEQ(name, "XA_MSG_GET_OUTPUT_CHANNELS"))
			return XA_MSG_GET_OUTPUT_CHANNELS;
		if (strEQ(name, "XA_MSG_SET_OUTPUT_PORTS"))
			return XA_MSG_SET_OUTPUT_PORTS;
		if (strEQ(name, "XA_MSG_GET_OUTPUT_PORTS"))
			return XA_MSG_GET_OUTPUT_PORTS;
		if (strEQ(name, "XA_MSG_NOTIFY_INPUT_CAPS"))
			return XA_MSG_NOTIFY_INPUT_CAPS;
		if (strEQ(name, "XA_MSG_NOTIFY_OUTPUT_CAPS"))
			return XA_MSG_NOTIFY_OUTPUT_CAPS;
		if (strEQ(name, "XA_MSG_NOTIFY_OUTPUT_CHANNELS"))
			return XA_MSG_NOTIFY_OUTPUT_CHANNELS;
		if (strEQ(name, "XA_MSG_NOTIFY_OUTPUT_PORTS"))
			return XA_MSG_NOTIFY_OUTPUT_PORTS;
		if (strEQ(name, "XA_MSG_NOTIFY_STREAM_PARAMETERS"))
			return XA_MSG_NOTIFY_STREAM_PARAMETERS;
		if (strEQ(name, "XA_MSG_NOTIFY_STREAM_PROPERTIES"))
			return XA_MSG_NOTIFY_STREAM_PROPERTIES;
		if (strEQ(name, "XA_MSG_NOTIFY_PROGRESS"))
			return XA_MSG_NOTIFY_PROGRESS;
		if (strEQ(name, "XA_PLAYER_STATE_EOS"))
			return XA_PLAYER_STATE_EOS;
		if (strEQ(name, "XA_PLAYER_MODE_OUTPUT_AUTO_CLOSE_ON_EOS"))
#ifdef XA_PLAYER_MODE_OUTPUT_AUTO_CLOSE_ON_EOS
			return XA_PLAYER_MODE_OUTPUT_AUTO_CLOSE_ON_EOS;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_NOTIFY_MASK_PROGRESS"))
#ifdef XA_NOTIFY_MASK_PROGRESS
			return XA_NOTIFY_MASK_PROGRESS;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_NOTIFY_MASK_INPUT_CAPS"))
#ifdef XA_NOTIFY_MASK_INPUT_CAPS
			return XA_NOTIFY_MASK_INPUT_CAPS;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_NOTIFY_MASK_OUTPUT_CAPS"))
#ifdef XA_NOTIFY_MASK_OUTPUT_CAPS
			return XA_NOTIFY_MASK_OUTPUT_CAPS;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_NOTIFY_MASK_OUTPUT_PORTS"))
#ifdef XA_NOTIFY_MASK_OUTPUT_PORTS
			return XA_NOTIFY_MASK_OUTPUT_PORTS;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_NOTIFY_MASK_STREAM_PARAMETERS"))
#ifdef XA_NOTIFY_MASK_STREAM_PARAMETERS
			return XA_NOTIFY_MASK_STREAM_PARAMETERS;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_NOTIFY_MASK_STREAM_PROPERTIES"))
#ifdef XA_NOTIFY_MASK_STREAM_PROPERTIES
			return XA_NOTIFY_MASK_STREAM_PROPERTIES;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_SUCCESS"))
#ifdef XA_SUCCESS
			return XA_SUCCESS;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_OUT_OF_RESOURCES"))
#ifdef XA_ERROR_OUT_OF_RESOURCES
			return XA_ERROR_OUT_OF_RESOURCES;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_INVALID_PARAMETERS"))
#ifdef XA_ERROR_INVALID_PARAMETERS
			return XA_ERROR_INVALID_PARAMETERS;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_INPUT_EOS"))
#ifdef XA_ERROR_INPUT_EOS
			return XA_ERROR_INPUT_EOS;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_BASE_MODULES"))
#ifdef XA_ERROR_BASE_MODULES
			return XA_ERROR_BASE_MODULES;
#else
			goto not_there;
#endif

		break;

	case 'T':
		if (strEQ(name, "XA_MSG_COMMAND_EXIT"))
			return XA_MSG_COMMAND_EXIT;
		if (strEQ(name, "XA_MSG_COMMAND_INPUT_FILTERS_LIST"))
			return XA_MSG_COMMAND_INPUT_FILTERS_LIST;
		if (strEQ(name, "XA_MSG_COMMAND_INPUT_MODULES_LIST"))
			return XA_MSG_COMMAND_INPUT_MODULES_LIST;
		if (strEQ(name, "XA_MSG_COMMAND_OUTPUT_RESET"))
			return XA_MSG_COMMAND_OUTPUT_RESET;
		if (strEQ(name, "XA_MSG_COMMAND_OUTPUT_FILTERS_LIST"))
			return XA_MSG_COMMAND_OUTPUT_FILTERS_LIST;
		if (strEQ(name, "XA_MSG_COMMAND_OUTPUT_MODULES_LIST"))
			return XA_MSG_COMMAND_OUTPUT_MODULES_LIST;
		if (strEQ(name, "XA_MSG_UNSET_PLAYER_ENVIRONMENT"))
			return XA_MSG_UNSET_PLAYER_ENVIRONMENT;
		if (strEQ(name, "XA_MSG_COMMAND_FEEDBACK_HANDLER_MODULES_LIST"))
			return XA_MSG_COMMAND_FEEDBACK_HANDLER_MODULES_LIST;
		if (strEQ(name, "XA_MSG_COMMAND_FEEDBACK_HANDLER_EXIT"))
			return XA_MSG_COMMAND_FEEDBACK_HANDLER_EXIT;
		if (strEQ(name, "XA_MSG_COMMAND_FEEDBACK_HANDLER_START"))
			return XA_MSG_COMMAND_FEEDBACK_HANDLER_START;
		if (strEQ(name, "XA_MSG_COMMAND_FEEDBACK_HANDLER_RESTART"))
			return XA_MSG_COMMAND_FEEDBACK_HANDLER_RESTART;
		if (strEQ(name, "XA_MSG_COMMAND_FEEDBACK_HANDLER_QUEUE_AUDIO_EVENT"))
			return XA_MSG_COMMAND_FEEDBACK_HANDLER_QUEUE_AUDIO_EVENT;
		if (strEQ(name, "XA_MSG_COMMAND_FEEDBACK_HANDLER_QUEUE_TAG_EVENT"))
			return XA_MSG_COMMAND_FEEDBACK_HANDLER_QUEUE_TAG_EVENT;
		if (strEQ(name, "XA_MSG_COMMAND_FEEDBACK_HANDLER_QUEUE_TIMECODE_EVENT"))
			return XA_MSG_COMMAND_FEEDBACK_HANDLER_QUEUE_TIMECODE_EVENT;
		if (strEQ(name, "XA_MSG_COMMAND_FEEDBACK_HANDLER_QUEUE_POSITION_EVENT"))
			return XA_MSG_COMMAND_FEEDBACK_HANDLER_QUEUE_POSITION_EVENT;
		if (strEQ(name, "XA_MSG_UNSET_FEEDBACK_HANDLER_ENVIRONMENT"))
			return XA_MSG_UNSET_FEEDBACK_HANDLER_ENVIRONMENT;
		if (strEQ(name, "XA_MSG_NOTIFY_FEEDBACK_AUDIO_EVENT"))
			return XA_MSG_NOTIFY_FEEDBACK_AUDIO_EVENT;
		if (strEQ(name, "XA_MSG_NOTIFY_FEEDBACK_TAG_EVENT"))
			return XA_MSG_NOTIFY_FEEDBACK_TAG_EVENT;
		if (strEQ(name, "XA_MSG_LAST"))
			return XA_MSG_LAST;
		if (strEQ(name, "XA_OUTPUT_CHANNELS_MONO_LEFT"))
			return XA_OUTPUT_CHANNELS_MONO_LEFT;
		if (strEQ(name, "XA_OUTPUT_CHANNELS_MONO_RIGHT"))
			return XA_OUTPUT_CHANNELS_MONO_RIGHT;
		if (strEQ(name, "XA_CONTROL_PRIORITY_LOWEST"))
#ifdef XA_CONTROL_PRIORITY_LOWEST
			return XA_CONTROL_PRIORITY_LOWEST;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_CONTROL_PRIORITY_HIGHEST"))
#ifdef XA_CONTROL_PRIORITY_HIGHEST
			return XA_CONTROL_PRIORITY_HIGHEST;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_NOTIFY_MASK_FEEDBACK_AUDIO_EVENT"))
#ifdef XA_NOTIFY_MASK_FEEDBACK_AUDIO_EVENT
			return XA_NOTIFY_MASK_FEEDBACK_AUDIO_EVENT;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_NOTIFY_MASK_FEEDBACK_TAG_EVENT"))
#ifdef XA_NOTIFY_MASK_FEEDBACK_TAG_EVENT
			return XA_NOTIFY_MASK_FEEDBACK_TAG_EVENT;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_EXPORT"))
#ifdef XA_EXPORT
			return XA_EXPORT;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_IMPORT"))
#ifdef XA_IMPORT
			return XA_IMPORT;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_EXPORT"))
#ifdef XA_EXPORT
			return XA_EXPORT;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_IMPORT"))
#ifdef XA_IMPORT
			return XA_IMPORT;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_EXPORT"))
#ifdef XA_EXPORT
			return XA_EXPORT;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_IMPORT"))
#ifdef XA_IMPORT
			return XA_IMPORT;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_TIMEOUT"))
#ifdef XA_ERROR_TIMEOUT
			return XA_ERROR_TIMEOUT;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_CONNECT_TIMEOUT"))
#ifdef XA_ERROR_CONNECT_TIMEOUT
			return XA_ERROR_CONNECT_TIMEOUT;
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
		if (strEQ(name, "XA_ERROR_UNSUPPORTED_FORMAT"))
#ifdef XA_ERROR_UNSUPPORTED_FORMAT
			return XA_ERROR_UNSUPPORTED_FORMAT;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_BASE_ENVIRONMENT"))
#ifdef XA_ERROR_BASE_ENVIRONMENT
			return XA_ERROR_BASE_ENVIRONMENT;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_NO_SUCH_ENVIRONMENT"))
#ifdef XA_ERROR_NO_SUCH_ENVIRONMENT
			return XA_ERROR_NO_SUCH_ENVIRONMENT;
#else
			goto not_there;
#endif

		break;

	case 'W':
		if (strEQ(name, "XA_CONTROL_PRIORITY_LOW"))
#ifdef XA_CONTROL_PRIORITY_LOW
			return XA_CONTROL_PRIORITY_LOW;
#else
			goto not_there;
#endif

		break;

	case 'X':
		if (strEQ(name, "XA_OUTPUT_CHANNELS_MONO_MIX"))
			return XA_OUTPUT_CHANNELS_MONO_MIX;
		if (strEQ(name, "XA_ERROR_URL_INVALID_SYNTAX"))
#ifdef XA_ERROR_URL_INVALID_SYNTAX
			return XA_ERROR_URL_INVALID_SYNTAX;
#else
			goto not_there;
#endif

		break;

	case 'Y':
		if (strEQ(name, "XA_MSG_COMMAND_PLAY"))
			return XA_MSG_COMMAND_PLAY;
		if (strEQ(name, "XA_MSG_COMMAND_INPUT_MODULE_QUERY"))
			return XA_MSG_COMMAND_INPUT_MODULE_QUERY;
		if (strEQ(name, "XA_MSG_COMMAND_OUTPUT_MODULE_QUERY"))
			return XA_MSG_COMMAND_OUTPUT_MODULE_QUERY;
		if (strEQ(name, "XA_MSG_SET_INPUT_TIMECODE_GRANULARITY"))
			return XA_MSG_SET_INPUT_TIMECODE_GRANULARITY;
		if (strEQ(name, "XA_MSG_GET_INPUT_TIMECODE_GRANULARITY"))
			return XA_MSG_GET_INPUT_TIMECODE_GRANULARITY;
		if (strEQ(name, "XA_MSG_SET_OUTPUT_TIMECODE_GRANULARITY"))
			return XA_MSG_SET_OUTPUT_TIMECODE_GRANULARITY;
		if (strEQ(name, "XA_MSG_GET_OUTPUT_TIMECODE_GRANULARITY"))
			return XA_MSG_GET_OUTPUT_TIMECODE_GRANULARITY;
		if (strEQ(name, "XA_MSG_SET_CODEC_QUALITY"))
			return XA_MSG_SET_CODEC_QUALITY;
		if (strEQ(name, "XA_MSG_GET_CODEC_QUALITY"))
			return XA_MSG_GET_CODEC_QUALITY;
		if (strEQ(name, "XA_MSG_NOTIFY_READY"))
			return XA_MSG_NOTIFY_READY;
		if (strEQ(name, "XA_MSG_NOTIFY_INPUT_TIMECODE_GRANULARITY"))
			return XA_MSG_NOTIFY_INPUT_TIMECODE_GRANULARITY;
		if (strEQ(name, "XA_MSG_NOTIFY_OUTPUT_TIMECODE_GRANULARITY"))
			return XA_MSG_NOTIFY_OUTPUT_TIMECODE_GRANULARITY;
		if (strEQ(name, "XA_MSG_NOTIFY_CODEC_QUALITY"))
			return XA_MSG_NOTIFY_CODEC_QUALITY;
		if (strEQ(name, "XA_MSG_COMMAND_FEEDBACK_HANDLER_MODULE_QUERY"))
			return XA_MSG_COMMAND_FEEDBACK_HANDLER_MODULE_QUERY;
		if (strEQ(name, "XA_ERROR_OUT_OF_MEMORY"))
#ifdef XA_ERROR_OUT_OF_MEMORY
			return XA_ERROR_OUT_OF_MEMORY;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_HTTP_INVALID_REPLY"))
#ifdef XA_ERROR_HTTP_INVALID_REPLY
			return XA_ERROR_HTTP_INVALID_REPLY;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_HTTP_ERROR_REPLY"))
#ifdef XA_ERROR_HTTP_ERROR_REPLY
			return XA_ERROR_HTTP_ERROR_REPLY;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_FTP_INVALID_REPLY"))
#ifdef XA_ERROR_FTP_INVALID_REPLY
			return XA_ERROR_FTP_INVALID_REPLY;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_FTP_ERROR_REPLY"))
#ifdef XA_ERROR_FTP_ERROR_REPLY
			return XA_ERROR_FTP_ERROR_REPLY;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_DEVICE_BUSY"))
#ifdef XA_ERROR_DEVICE_BUSY
			return XA_ERROR_DEVICE_BUSY;
#else
			goto not_there;
#endif
		if (strEQ(name, "XA_ERROR_NO_SUCH_PROPERTY"))
#ifdef XA_ERROR_NO_SUCH_PROPERTY
			return XA_ERROR_NO_SUCH_PROPERTY;
#else
			goto not_there;
#endif

		break;
	default:
		break;
    }
    errno = EINVAL;
    return 0;

not_there:
    errno = ENOENT;
    return 0;
}
