from ctypes import *
import os
import inspect

class Boinc:
	def __init__( self ):
			# do init
			loc = os.path.dirname( inspect.getfile( Boinc )) 
			lib = os.path.join( loc, "libboinc.so" )
			self._lib = cdll.LoadLibrary( lib )
			if not self._lib:
				raise ValueError( "Could not load BOINC DSO" )
			self._init               = self._lib.boinc_init
			self._resolve_filename   = self._lib.boinc_resolve_filename
			self._time_to_checkpoint = self._lib.boinc_time_to_checkpoint
			self._checkpoint_completed = self._lib.boinc_checkpoint_completed
			self._begin_critical_section = self._lib.boinc_begin_critical_section
			self._end_critical_section = self._lib.boinc_end_critical_section
			self._fraction_done        = self._lib.boinc_fraction_done
			self._is_standalone        = self._lib.boinc_is_standalone
#			self._temporary_exit       = self._lib.boinc_temporary_exit
#			self._finish_message       = self._lib.boinc_finish_message
			self._finish               = self._lib.boinc_finish
			self._init()       

	def finish( self, status=0 ):
		self._finish( c_int(status) )

	def resolve_filname( self, logical ):
		c = create_string_buffer( 1025 )
		self._resolve_filename( c_char_p(logical), c, c_int(1024) )
		return str(c.value)

	def time_to_checkpoint( self ):
		ret = self._time_to_checkpoint()
		return (ret[0]!=0)


	def checkpoint_completed( self ):
		self._checkpoint_completed()

	def begin_critical_section( self ):
		self._begin_critical_section()

	def end_critical_section( self ):
		self._end_critical_section()

	def fraction_done( self, fraction, maximum=1.0 ):
		if max: fraction = fraction/maximum
		self._fraction_done( c_double( fraction ) )

	def is_standalone( self ):
		ret = self._is_standalone()
		return (ret[0]!=0)

#	def temporary_exit( self, delay=0, reason=None, is_notice=False ):
#		self._temporary_exit( c_int(delay), c_char_p(reason), c_bool(is_notice) )
#		pass

#	def finish( self, status, reason=None, is_notice=False ):
#		self._finish_message( c_int(status), c_char_p( reason ), c_bool( is_notice ) )
