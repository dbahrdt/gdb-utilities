define esp_connect
	target remote :3333
end

define esp_reboot
	mon reset halt
	flushregs
	c
end

define esp_reboot_to_main
	mon reset halt
	flushregs
	thb app_main
	c
end

define esp_flash_app
	if $argc != 2
		printf "Usage: esp_flash_app <path to file> <offset>
	else
		mon reset halt
		mon program_esp $arg0 $arg1 verify
		symbol-file
		printf "Cleared symbols"
		esp_reboot
end

document esp_flash
Usage: esp_flash_app <path to file> <offset>

Flash new app file.

end

define esp_heap_trace
    thb heap_trace_start
    c
    printf "heap tracing begins"
    thb heap_trace_stop
    mon esp sysview start file:///tmp/pro-heap.svdat file:///tmp/app-heap.svdat
    c
    mon esp sysview stop
    printf "heap tracing stopped"
end

document esp_heap_trace
Usage: esp_heap_trace

Enable heap tracing and write info to file.
Analyze this file with
$IDF_PATH/tools/esp_app_trace/sysviewtrace_proc.py -p -b </path/to/program/elf
end
