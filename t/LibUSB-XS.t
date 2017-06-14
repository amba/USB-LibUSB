#!perl -T
# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl LibUSB.t'

#########################

# change 'tests => 2' to 'tests => last_test_to_print';

use strict;
use warnings;

use Test::More tests => 2;
BEGIN { use_ok('LibUSB::XS') };


my $fail = 0;
foreach my $constname (qw(
	LIBUSBX_API_VERSION LIBUSB_API_VERSION LIBUSB_BM_LPM_SUPPORT
	LIBUSB_BM_LTM_SUPPORT LIBUSB_BT_CONTAINER_ID
	LIBUSB_BT_CONTAINER_ID_SIZE LIBUSB_BT_SS_USB_DEVICE_CAPABILITY
	LIBUSB_BT_SS_USB_DEVICE_CAPABILITY_SIZE LIBUSB_BT_USB_2_0_EXTENSION
	LIBUSB_BT_USB_2_0_EXTENSION_SIZE
	LIBUSB_BT_WIRELESS_USB_DEVICE_CAPABILITY
	LIBUSB_CAP_HAS_CAPABILITY LIBUSB_CAP_HAS_HID_ACCESS
	LIBUSB_CAP_HAS_HOTPLUG LIBUSB_CAP_SUPPORTS_DETACH_KERNEL_DRIVER
	LIBUSB_CLASS_APPLICATION LIBUSB_CLASS_AUDIO LIBUSB_CLASS_COMM
	LIBUSB_CLASS_CONTENT_SECURITY LIBUSB_CLASS_DATA
	LIBUSB_CLASS_DIAGNOSTIC_DEVICE LIBUSB_CLASS_HID LIBUSB_CLASS_HUB
	LIBUSB_CLASS_IMAGE LIBUSB_CLASS_MASS_STORAGE
	LIBUSB_CLASS_PERSONAL_HEALTHCARE LIBUSB_CLASS_PER_INTERFACE
	LIBUSB_CLASS_PHYSICAL LIBUSB_CLASS_PRINTER LIBUSB_CLASS_PTP
	LIBUSB_CLASS_SMART_CARD LIBUSB_CLASS_VENDOR_SPEC LIBUSB_CLASS_VIDEO
	LIBUSB_CLASS_WIRELESS LIBUSB_CONTROL_SETUP_SIZE LIBUSB_DT_BOS
	LIBUSB_DT_BOS_MAX_SIZE LIBUSB_DT_BOS_SIZE LIBUSB_DT_CONFIG
	LIBUSB_DT_CONFIG_SIZE LIBUSB_DT_DEVICE LIBUSB_DT_DEVICE_CAPABILITY
	LIBUSB_DT_DEVICE_CAPABILITY_SIZE LIBUSB_DT_DEVICE_SIZE
	LIBUSB_DT_ENDPOINT LIBUSB_DT_ENDPOINT_AUDIO_SIZE
	LIBUSB_DT_ENDPOINT_SIZE LIBUSB_DT_HID LIBUSB_DT_HUB
	LIBUSB_DT_HUB_NONVAR_SIZE LIBUSB_DT_INTERFACE LIBUSB_DT_INTERFACE_SIZE
	LIBUSB_DT_PHYSICAL LIBUSB_DT_REPORT LIBUSB_DT_SS_ENDPOINT_COMPANION
	LIBUSB_DT_SS_ENDPOINT_COMPANION_SIZE LIBUSB_DT_STRING
	LIBUSB_DT_SUPERSPEED_HUB LIBUSB_ENDPOINT_ADDRESS_MASK
	LIBUSB_ENDPOINT_DIR_MASK LIBUSB_ENDPOINT_IN LIBUSB_ENDPOINT_OUT
	LIBUSB_ERROR_ACCESS LIBUSB_ERROR_BUSY LIBUSB_ERROR_COUNT
	LIBUSB_ERROR_INTERRUPTED LIBUSB_ERROR_INVALID_PARAM LIBUSB_ERROR_IO
	LIBUSB_ERROR_NOT_FOUND LIBUSB_ERROR_NOT_SUPPORTED
	LIBUSB_ERROR_NO_DEVICE LIBUSB_ERROR_NO_MEM LIBUSB_ERROR_OTHER
	LIBUSB_ERROR_OVERFLOW LIBUSB_ERROR_PIPE LIBUSB_ERROR_TIMEOUT
	LIBUSB_FULL_SPEED_OPERATION LIBUSB_HIGH_SPEED_OPERATION
	LIBUSB_HOTPLUG_ENUMERATE LIBUSB_HOTPLUG_EVENT_DEVICE_ARRIVED
	LIBUSB_HOTPLUG_EVENT_DEVICE_LEFT LIBUSB_HOTPLUG_MATCH_ANY
	LIBUSB_ISO_SYNC_TYPE_ADAPTIVE LIBUSB_ISO_SYNC_TYPE_ASYNC
	LIBUSB_ISO_SYNC_TYPE_MASK LIBUSB_ISO_SYNC_TYPE_NONE
	LIBUSB_ISO_SYNC_TYPE_SYNC LIBUSB_ISO_USAGE_TYPE_DATA
	LIBUSB_ISO_USAGE_TYPE_FEEDBACK LIBUSB_ISO_USAGE_TYPE_IMPLICIT
	LIBUSB_ISO_USAGE_TYPE_MASK LIBUSB_LOG_LEVEL_DEBUG
	LIBUSB_LOG_LEVEL_ERROR LIBUSB_LOG_LEVEL_INFO LIBUSB_LOG_LEVEL_NONE
	LIBUSB_LOG_LEVEL_WARNING LIBUSB_LOW_SPEED_OPERATION
	LIBUSB_RECIPIENT_DEVICE LIBUSB_RECIPIENT_ENDPOINT
	LIBUSB_RECIPIENT_INTERFACE LIBUSB_RECIPIENT_OTHER
	LIBUSB_REQUEST_CLEAR_FEATURE LIBUSB_REQUEST_GET_CONFIGURATION
	LIBUSB_REQUEST_GET_DESCRIPTOR LIBUSB_REQUEST_GET_INTERFACE
	LIBUSB_REQUEST_GET_STATUS LIBUSB_REQUEST_SET_ADDRESS
	LIBUSB_REQUEST_SET_CONFIGURATION LIBUSB_REQUEST_SET_DESCRIPTOR
	LIBUSB_REQUEST_SET_FEATURE LIBUSB_REQUEST_SET_INTERFACE
	LIBUSB_REQUEST_SET_SEL LIBUSB_REQUEST_SYNCH_FRAME
	LIBUSB_REQUEST_TYPE_CLASS LIBUSB_REQUEST_TYPE_RESERVED
	LIBUSB_REQUEST_TYPE_STANDARD LIBUSB_REQUEST_TYPE_VENDOR
	LIBUSB_SET_ISOCH_DELAY LIBUSB_SPEED_FULL LIBUSB_SPEED_HIGH
	LIBUSB_SPEED_LOW LIBUSB_SPEED_SUPER LIBUSB_SPEED_UNKNOWN LIBUSB_SUCCESS
	LIBUSB_SUPER_SPEED_OPERATION LIBUSB_TRANSFER_ADD_ZERO_PACKET
	LIBUSB_TRANSFER_CANCELLED LIBUSB_TRANSFER_COMPLETED
	LIBUSB_TRANSFER_ERROR LIBUSB_TRANSFER_FREE_BUFFER
	LIBUSB_TRANSFER_FREE_TRANSFER LIBUSB_TRANSFER_NO_DEVICE
	LIBUSB_TRANSFER_OVERFLOW LIBUSB_TRANSFER_SHORT_NOT_OK
	LIBUSB_TRANSFER_STALL LIBUSB_TRANSFER_TIMED_OUT
	LIBUSB_TRANSFER_TYPE_BULK
	LIBUSB_TRANSFER_TYPE_CONTROL LIBUSB_TRANSFER_TYPE_INTERRUPT
	LIBUSB_TRANSFER_TYPE_ISOCHRONOUS LIBUSB_TRANSFER_TYPE_MASK
	)) {
  next if (eval "my \$a = $constname; 1");
  if ($@ =~ /^Your vendor has not defined LibUSB::XS macro $constname/) {
    print "# pass: $@";
  } else {
    print "# fail: $@";
    $fail = 1;
  }

}

ok( $fail == 0 , 'Constants' );
#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

