include /usr/local/share/luggage/luggage.make

TITLE=fix_mdm_cert
REVERSE_DOMAIN=org.da
PAYLOAD=\
		pack-Library-LaunchDaemons-org.da.fix_mdm_cert.plist\
		pack-usr-local-bin-fix_mdm_cert.sh\
		pack-script-postinstall\

PACKAGE_VERSION=1.0