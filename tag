#!/bin/bash

cmd="$1"

case "$cmd" in
	"init")
		taginit ${@:2}
		;;
	"add")
		tagadd ${@:2}
		;;
	"ls"|"list")
		tagls ${@:2}
		;;
	"mod"|"tags")
		tagmod ${@:2}
		;;
	"filter"|"search")
		tagfilter ${@:2}
		;;
	"rm"|"remove")
		tagrm ${@:2}
		;;
	*)
		echo "Unknown command '$1'."
		;;
esac


