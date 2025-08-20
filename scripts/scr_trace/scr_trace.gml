function trace() {
    var _msg = debug_get_callstack(2)[1] + ":";
    for (var _argi = 0; _argi < argument_count; _argi++) {
        _msg += " " + string(argument[_argi]);
    }
    show_debug_message(_msg);
}