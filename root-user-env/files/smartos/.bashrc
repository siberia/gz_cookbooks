if [ "$PS1" ]; then
    mt_tty=$(/usr/bin/tty 2>/dev/null)
    if [[ $mt_tty =~ ^/dev/term/[abcd] ]]; then
        # If we're on the serial console, we generally won't know how
        # big our terminal is.  Attempt to ask it using control sequences
        # and resize our pty accordingly.
        mt_output=$(/usr/lib/measure_terminal 2>/dev/null)
        if [[ $? -eq 0 ]]; then
            eval "$mt_output"
        else
            # We could not read the size, but we should set a 'sane'
            # default as the dimensions of the previous user's terminal
            # persist on the tty device.
            export LINES=25
            export COLUMNS=80
        fi
        /usr/bin/stty rows ${LINES} columns ${COLUMNS} 2>/dev/null
    fi
    unset mt_output mt_tty
    shopt -s checkwinsize
    if [[ -f /.dcinfo ]]; then
        . /.dcinfo
        DC_NAME="${SDC_DATACENTER_NAME}"
        DC_HEADNODE_ID="${SDC_DATACENTER_HEADNODE_ID}"
    fi
    if [[ -n "${DC_NAME}" && -n "${DC_HEADNODE_ID}" ]]; then
       PS1="[\u@\h (${DC_NAME}:${DC_HEADNODE_ID}) \w]\\$ "
    elif [[ -n "${DC_NAME}" ]]; then
       PS1="[\u@\h (${DC_NAME}) \w]\\$ "
    else
       PS1="[\u@\h \w]\\$ "
    fi
    alias ll='ls -lF'
    [ -n "${SSH_CLIENT}" ] && export PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME} \007" && history -a'
fi

# Load bash completion
[ -f /etc/bash/bash_completion ] && . /etc/bash/bash_completion

if [ "${TERM}" == "screen" ]; then
    export TERM=xterm-color
fi

svclog() {
  if [[ -z "$PAGER" ]]; then
    PAGER=less
  fi
  $PAGER `svcs -L $1`
}

svclogf() {
  /usr/bin/tail -f `svcs -L $1`
}

alias vms='vmadm list -o uuid,type,ram,state,alias,nics.0.ip -s alias'
alias vmsi='vmadm list -o uuid,type,ram,state,alias,nics.0.ip -s nics.0.ip'

zl(){
  UUID=$(vmadm lookup -1 alias=$1)
  if [[ -z $UUID ]]; then
    UUID=$(vmadm lookup -1 alias=$1.jfk)
  fi

  if [[ -z $UUID ]]; then
    echo "ERROR: Unknown zone '$1'"
  else
    zlogin $UUID
  fi
}
