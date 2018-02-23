

PATH="${HOME}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export PATH

# [global]
SCRIPT_PATH="$(cd "$(dirname "$0")"; pwd)"
SCRIPT_NAME="$(basename "$0")"
PARA_NUM="$#"
PROC_PID="$$"

cd "${SCRIPT_PATH}"
./checkout_salt.sh
./checkout_pillar.sh
./checkout_state.sh
