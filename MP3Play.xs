/* $Id: MP3Play.xs,v 1.20 2000/09/29 16:42:03 joern Exp $ */
 
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "xaudio.h"
#include "player.h"
#include "control.h"
#include "control_pipe.h"
#include "decoder.h"

/*
 * the constants.h include is generated by gen_constant and realizes
 * autoload constants for defines and enums
 *
 */

#include "./constants.h"

/* prototype for conv_msg.c function */

SV* convert_message_to_HV (XA_Message* message);

/* h2xs stuff */

MODULE = MPEG::MP3Play		PACKAGE = MPEG::MP3Play		

PROTOTYPES: DISABLE

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

#void
#control_message_sprint(string, message)
#	char *	string
#	const XA_Message *	message
#
#void
#control_message_print(message)
#	XA_Message *	message


#---- end of h2xs generated stuff

#---------------------------------------------------------------------
# Player Constructor
#---------------------------------------------------------------------

void *
new_player()
CODE:
	void * player;
	if ( XA_SUCCESS != player_new (&player, NULL) ) {
	  player = NULL;
	}
	
	RETVAL = player;
OUTPUT:
RETVAL

#---------------------------------------------------------------------
# Player Desctructor
#---------------------------------------------------------------------

void
destroy_player(player)
	void* player
CODE:
	if ( player != NULL) {
		player_delete (player);
	}

#---------------------------------------------------------------------
# Message Handling
#---------------------------------------------------------------------

#---- control_message_wait

SV*
control_message_wait (control, timeout)
	void *	control
	int	timeout

	CODE:
	XA_Message	msg;

	if ( control_message_wait (control, &msg, timeout) == XA_SUCCESS ) {
		RETVAL = convert_message_to_HV (&msg);
	} else {
		RETVAL = newSViv(0);
	}

	OUTPUT:
	RETVAL

#---- control_message_get

SV*
control_message_get (control)
	void *	control

	CODE:
	XA_Message	msg;
	
	if ( control_message_get (control, &msg) > 0 ) {
		RETVAL = convert_message_to_HV (&msg);
	} else {
		RETVAL = newSViv(0);
	}

	OUTPUT:
	RETVAL

#---- command_read_pipe

int
command_read_pipe (control)
	void * control
	
	CODE:
	RETVAL = ((XA_PipeControl*)control)->command_read_pipe;
	
	OUTPUT:
	RETVAL

#---- set_equalizer_codec

#int
#set_equalizer_codec (control, left, right)
#	void * control
#	signed char * left
#	signed char * right
#
#	CODE:
#	XA_EqualizerInfo equalizer;
#	int	i;
#
#	for (i=0; i < 32; ++i) {
#		equalizer.left[i] = left[i];
#		equalizer.right[i] = right[i];
#	}
#	
#	RETVAL = control_message_send (
#		control,
#		XA_MSG_SET_CODEC_EQUALIZER,
#		&equalizer
#	);
#	
#	OUTPUT:
#	RETVAL


int
set_equalizer_codec (control, left, right)
	void * control
	char * left
	char * right

	CODE:
	XA_EqualizerInfo equalizer;
	int	i;

	for (i=0; i < 32; ++i) {
		printf ("%d ", (signed char) left[i]);
		equalizer.left[i] = (signed char) left[i];
		equalizer.right[i] = (signed char) right[i];
	}
	printf ("\n");

	RETVAL = control_message_send (
		control,
		XA_MSG_SET_CODEC_EQUALIZER,
		&equalizer
	);

	OUTPUT:
	RETVAL


#---- disable_equalizer_codec

int
disable_equalizer_codec (control)
	void * control;
	
	CODE:
	RETVAL = control_message_send (
		control,
		XA_MSG_SET_CODEC_EQUALIZER,
		(XA_EqualizerInfo*) NULL
	);
	
	OUTPUT:
	RETVAL

