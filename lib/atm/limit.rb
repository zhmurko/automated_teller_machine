class Limit
    STATE_LIMIT     =  30 # Timeout between succesfull changes of terminal's state
    SESSION_TIMEOUT = 120 # Total session time limit
    BAD_COMMAND     =   5 # For all session user cannot enter more bad command than this limit
    BAD_PIN         =   3 # Attempts to enter correct PIN
    BAD_SUM         =   3 # Attempts to enter an amount of cash
    COMMAND_LIMIT   = 100 # Total commands limit for a session
end